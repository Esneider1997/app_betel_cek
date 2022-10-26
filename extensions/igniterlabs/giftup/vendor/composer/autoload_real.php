<?php

// autoload_real.php @generated by Composer

class ComposerAutoloaderInitd55516ced5eb67c9b3295b8e7f6eed51
{
    private static $loader;

    public static function loadClassLoader($class)
    {
        if ('Composer\Autoload\ClassLoader' === $class) {
            require __DIR__ . '/ClassLoader.php';
        }
    }

    /**
     * @return \Composer\Autoload\ClassLoader
     */
    public static function getLoader()
    {
        if (null !== self::$loader) {
            return self::$loader;
        }

        spl_autoload_register(array('ComposerAutoloaderInitd55516ced5eb67c9b3295b8e7f6eed51', 'loadClassLoader'), true, true);
        self::$loader = $loader = new \Composer\Autoload\ClassLoader(\dirname(__DIR__));
        spl_autoload_unregister(array('ComposerAutoloaderInitd55516ced5eb67c9b3295b8e7f6eed51', 'loadClassLoader'));

        require __DIR__ . '/autoload_static.php';
        call_user_func(\Composer\Autoload\ComposerStaticInitd55516ced5eb67c9b3295b8e7f6eed51::getInitializer($loader));

        $loader->register(true);

        return $loader;
    }
}
