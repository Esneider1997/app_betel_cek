<?php

namespace Igniter\Flame\Traits;

use BadMethodCallException;
use Exception;
use Igniter\Flame\Support\ClassLoader;
use Illuminate\Support\Facades\App;
use ReflectionClass;
use ReflectionMethod;

/**
 * Extendable Trait
 * Allows for "Private traits"
 *
 * Adapted from the October ExtendableTrait
 * @link https://github.com/octobercms/library/tree/master/src/Extension/ExtendableTrait.php
 */
trait ExtendableTrait
{
    /**
     * @var array Class reflection information, including behaviors.
     */
    protected $extensionData = [
        'extensions' => [],
        'methods' => [],
        'dynamicMethods' => [],
        'dynamicProperties' => [],
    ];

    /**
     * @var array Used to extend the constructor of an extendable class.
     * Eg: Class::extend(function($obj) { })
     */
    protected static $extendableCallbacks = [];

    /**
     * @var array Collection of static methods used by behaviors.
     */
    protected static $extendableStaticMethods = [];

    /**
     * @var bool Indicates if dynamic properties can be created.
     */
    protected static $extendableGuardProperties = true;

    /**
     * @var ClassLoader Class loader instance.
     */
    protected static $extendableClassLoader = null;

    /**
     * Constructor.
     */
    public function extendableConstruct()
    {
        // Apply init callbacks
        $classes = array_merge([get_class($this)], class_parents($this));
        foreach ($classes as $class) {
            if (isset(self::$extendableCallbacks[$class]) && is_array(self::$extendableCallbacks[$class])) {
                foreach (self::$extendableCallbacks[$class] as $callback) {
                    call_user_func($callback, $this);
                }
            }
        }

        // Apply extensions
        if (!$this->implement)
            return;

        if (is_string($this->implement)) {
            $uses = explode(',', $this->implement);
        }
        elseif (is_array($this->implement)) {
            $uses = $this->implement;
        }
        else {
            throw new Exception(sprintf('Class %s contains an invalid $implement value', get_class($this)));
        }

        foreach ($uses as $use) {
            $useClass = $this->extensionNormalizeClassName($use);

            // Soft implement
            if (substr($useClass, 0, 1) == '?') {
                $useClass = substr($useClass, 1);
                if (!class_exists($useClass)) {
                    continue;
                }
            }

            $this->extendClassWith($useClass);
        }
    }

    /**
     * Helper method for ::extend() static method
     *
     * @param callable $callback
     *
     * @return void
     */
    public static function extendableExtendCallback($callback)
    {
        $class = get_called_class();
        if (
            !isset(self::$extendableCallbacks[$class]) ||
            !is_array(self::$extendableCallbacks[$class])
        ) {
            self::$extendableCallbacks[$class] = [];
        }

        self::$extendableCallbacks[$class][] = $callback;
    }

    /**
     * Clear the list of extended classes so they will be re-extended.
     * @return void
     */
    public static function clearExtendedClasses()
    {
        self::$extendableCallbacks = [];
    }

    /**
     * Normalizes the provided extension name allowing for the ClassLoader to inject aliased classes
     *
     * @param string $name
     * @return string
     */
    protected function extensionNormalizeClassName(string $name): string
    {
        $name = str_replace('.', '\\', trim($name));
        if (!is_null($this->extensionGetClassLoader()) && ($alias = $this->extensionGetClassLoader()->getAlias($name))) {
            $name = $alias;
        }

        return $name;
    }

    /**
     * Dynamically extend a class with a specified behavior
     *
     * @param string $extensionName
     *
     * @return void|self
     * @throws \Exception
     */
    public function extendClassWith($extensionName)
    {
        if (!strlen($extensionName))
            return $this;

        $extensionName = $this->extensionNormalizeClassName($extensionName);

        if (isset($this->extensionData['extensions'][$extensionName])) {
            throw new Exception(sprintf(
                'Class %s has already been extended with %s',
                get_class($this),
                $extensionName
            ));
        }

        $this->extensionData['extensions'][$extensionName] = $extensionObject = new $extensionName($this);
        $this->extensionExtractMethods($extensionName, $extensionObject);
        $extensionObject->extensionApplyInitCallbacks();
    }

    /**
     * Extracts the available methods from a behavior and adds it to the
     * list of callable methods.
     *
     * @param string $extensionName
     * @param object $extensionObject
     *
     * @return void
     */
    protected function extensionExtractMethods($extensionName, $extensionObject)
    {
        if (!method_exists($extensionObject, 'extensionIsHiddenMethod')) {
            throw new Exception(sprintf(
                'Extension %s should implement Igniter\Flame\Traits\ExtensionTrait.',
                $extensionName
            ));
        }

        $extensionMethods = get_class_methods($extensionName);
        foreach ($extensionMethods as $methodName) {
            if ($methodName == '__construct' || $methodName == '__remap'
                || $extensionObject->extensionIsHiddenMethod($methodName)
            ) {
                continue;
            }

            $this->extensionData['methods'][$methodName] = $extensionName;
        }
    }

    /**
     * Programmatically adds a method to the extendable class
     *
     * @param string $dynamicName
     * @param callable $method
     * @param string $extension
     */
    public function addDynamicMethod($dynamicName, $method, $extension = null)
    {
        if (
            is_string($method) &&
            $extension &&
            ($extensionObj = $this->getClassExtension($extension))
        ) {
            $method = [$extensionObj, $method];
        }

        $this->extensionData['dynamicMethods'][$dynamicName] = $method;
    }

    /**
     * Programatically adds a property to the extendable class
     *
     * @param string $dynamicName
     * @param string $value
     */
    public function addDynamicProperty($dynamicName, $value = null)
    {
        if (array_key_exists($dynamicName, $this->getDynamicProperties())) {
            return;
        }

        self::$extendableGuardProperties = false;

        if (!property_exists($this, $dynamicName)) {
            $this->{$dynamicName} = $value;
        }

        $this->extensionData['dynamicProperties'][] = $dynamicName;

        self::$extendableGuardProperties = true;
    }

    /**
     * Check if extendable class is extended with a behavior object
     *
     * @param string $name Fully qualified behavior name
     *
     * @return bool
     */
    public function isClassExtendedWith($name)
    {
        $name = str_replace('.', '\\', trim($name));

        return isset($this->extensionData['extensions'][$name]);
    }

    /**
     * Returns a behavior object from an extendable class, example:
     *
     *   $this->getClassExtension('Admin.Actions.FormController')
     *
     * @param string $name Fully qualified behavior name
     *
     * @return mixed
     */
    public function getClassExtension($name)
    {
        return $this->extensionData['extensions'][$this->extensionNormalizeClassName($name)] ?? null;
    }

    /**
     * Short hand for getClassExtension() method, except takes the short
     * extension name, example:
     *
     *   $this->asExtension('FormController')
     *
     * @param string $shortName
     *
     * @return mixed
     */
    public function asExtension($shortName)
    {
        foreach ($this->extensionData['extensions'] as $class => $obj) {
            if (
                preg_match('@\\\\([\w]+)$@', $class, $matches) &&
                $matches[1] == $shortName
            ) {
                return $obj;
            }
        }

        return $this->getClassExtension($shortName);
    }

    /**
     * Checks if a method exists, extension equivalent of method_exists()
     *
     * @param string $name
     *
     * @return bool
     */
    public function methodExists($name)
    {
        return
            method_exists($this, $name) ||
            isset($this->extensionData['methods'][$name]) ||
            isset($this->extensionData['dynamicMethods'][$name]);
    }

    /**
     * Get a list of class methods, extension equivalent of get_class_methods()
     * @return array
     */
    public function getClassMethods()
    {
        return array_values(array_unique(array_merge(
            get_class_methods($this),
            array_keys($this->extensionData['methods']),
            array_keys($this->extensionData['dynamicMethods'])
        )));
    }

    /**
     * Returns all dynamic properties and their values
     * @return array ['property' => 'value']
     */
    public function getDynamicProperties()
    {
        $result = [];
        $propertyNames = $this->extensionData['dynamicProperties'];
        foreach ($propertyNames as $propName) {
            $result[$propName] = $this->{$propName};
        }

        return $result;
    }

    /**
     * Checks if a property exists, extension equivalent of property_exists()
     *
     * @param string $name
     *
     * @return bool
     */
    public function propertyExists($name)
    {
        if (property_exists($this, $name)) {
            return true;
        }

        foreach ($this->extensionData['extensions'] as $extensionObject) {
            if (
                property_exists($extensionObject, $name) &&
                $this->extendableIsAccessible($extensionObject, $name)
            ) {
                return true;
            }
        }

        return array_key_exists($name, $this->getDynamicProperties());
    }

    /**
     * Checks if a property is accessible, property equivalent of is_callabe()
     *
     * @param mixed $class
     * @param string $propertyName
     *
     * @return bool
     */
    protected function extendableIsAccessible($class, $propertyName)
    {
        $reflector = new ReflectionClass($class);
        $property = $reflector->getProperty($propertyName);

        return $property->isPublic();
    }

    /**
     * Magic method for __get()
     *
     * @param string $name
     *
     * @return string
     */
    public function extendableGet($name)
    {
        foreach ($this->extensionData['extensions'] as $extensionObject) {
            if (
                property_exists($extensionObject, $name) &&
                $this->extendableIsAccessible($extensionObject, $name)
            ) {
                return $extensionObject->{$name};
            }
        }

        $parent = get_parent_class();
        if ($parent !== false && method_exists($parent, '__get')) {
            return parent::__get($name);
        }
    }

    /**
     * Magic method for __set()
     *
     * @param string $name
     * @param string $value
     *
     * @return string
     */
    public function extendableSet($name, $value)
    {
        foreach ($this->extensionData['extensions'] as $extensionObject) {
            if (!property_exists($extensionObject, $name)) {
                continue;
            }

            $extensionObject->{$name} = $value;
        }

        /*
         * This targets trait usage in particular
         */
        $parent = get_parent_class();
        if ($parent !== false && method_exists($parent, '__set')) {
            parent::__set($name, $value);
        }

        /*
         * Setting an undefined property
         */
        if (!self::$extendableGuardProperties) {
            $this->{$name} = $value;
        }
    }

    /**
     * Magic method for __call()
     *
     * @param string $name
     * @param array $params
     *
     * @return mixed
     */
    public function extendableCall($name, $params = null)
    {
        if (isset($this->extensionData['methods'][$name])) {
            $extension = $this->extensionData['methods'][$name];
            $extensionObject = $this->extensionData['extensions'][$extension];

            if (method_exists($extension, $name)) {
                return call_user_func_array([$extensionObject, $name], array_values($params));
            }
        }

        if (isset($this->extensionData['dynamicMethods'][$name])) {
            $dynamicCallable = $this->extensionData['dynamicMethods'][$name];

            if (is_callable($dynamicCallable)) {
                return call_user_func_array($dynamicCallable, array_values($params));
            }
        }

        $parent = get_parent_class();
        if ($parent !== false && method_exists($parent, '__call')) {
            return parent::__call($name, $params);
        }

        throw new BadMethodCallException(sprintf(
            'Call to undefined method %s::%s()',
            get_class($this),
            $name
        ));
    }

    /**
     * Magic method for __callStatic()
     *
     * @param string $name
     * @param array $params
     *
     * @return mixed
     */
    public static function extendableCallStatic($name, $params = null)
    {
        $className = get_called_class();

        if (!array_key_exists($className, self::$extendableStaticMethods)) {
            self::$extendableStaticMethods[$className] = [];

            $class = new ReflectionClass($className);
            $defaultProperties = $class->getDefaultProperties();
            if (
                array_key_exists('implement', $defaultProperties) &&
                ($implement = $defaultProperties['implement'])
            ) {
                /*
                 * Apply extensions
                 */
                if (is_string($implement)) {
                    $uses = explode(',', $implement);
                }
                elseif (is_array($implement)) {
                    $uses = $implement;
                }
                else {
                    throw new Exception(sprintf('Class %s contains an invalid $implement value', $className));
                }

                foreach ($uses as $use) {
                    // Class alias checks not required here as the current name of the extension class doesn't
                    // matter because as long as $useClassName is able to be instantiated the method will resolve
                    $useClassName = str_replace('.', '\\', trim($use));

                    $useClass = new ReflectionClass($useClassName);
                    $staticMethods = $useClass->getMethods(ReflectionMethod::IS_STATIC);
                    foreach ($staticMethods as $method) {
                        self::$extendableStaticMethods[$className][$method->getName()] = $useClassName;
                    }
                }
            }
        }

        if (isset(self::$extendableStaticMethods[$className][$name])) {
            $extension = self::$extendableStaticMethods[$className][$name];

            if (method_exists($extension, $name) && is_callable([$extension, $name])) {
                $extension::$extendableStaticCalledClass = $className;
                $result = forward_static_call_array([$extension, $name], $params);
                $extension::$extendableStaticCalledClass = null;

                return $result;
            }
        }

        // $parent = get_parent_class($className);
        // if ($parent !== false && method_exists($parent, '__callStatic')) {
        //    return parent::__callStatic($name, $params);
        // }

        throw new BadMethodCallException(sprintf(
            'Call to undefined method %s::%s()',
            $className,
            $name
        ));
    }

    /**
     * Gets the class loader
     *
     * @return ClassLoader|null
     */
    protected function extensionGetClassLoader(): ?ClassLoader
    {
        if (!is_null(self::$extendableClassLoader)) {
            return self::$extendableClassLoader;
        }

        if (!class_exists('App')) {
            return null;
        }

        return self::$extendableClassLoader = App::make(ClassLoader::class);
    }
}
