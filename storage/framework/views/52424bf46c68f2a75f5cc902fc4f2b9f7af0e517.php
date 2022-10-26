<div class="permission-editor" <?php echo $field->getAttributes(); ?>>
    <div class="table-responsive">
        <table class="table table-border mb-0">
            <?php $__currentLoopData = $groupedPermissions; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $group => $permissions): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <thead>
                <tr>
                    <th class="<?php echo e($loop->first ? '' : 'pt-4'); ?>">
                        <h5 class="panel-title"><?php echo app('translator')->get($group); ?></h5>
                    </th>
                    <th class="<?php echo e($loop->first ? '' : 'pt-4 '); ?>text-center">
                        <a
                            role="button"
                            data-toggle="permission-group"
                            data-permission-group="<?php echo e(str_slug($group)); ?>"
                        ><?php echo e(lang('admin::lang.text_allow')); ?></a>
                    </th>
                </tr>
                </thead>
                <tbody>
                <?php $__currentLoopData = $permissions; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $permission): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <?php echo $this->makePartial('permissioneditor/permission', [
                        'permission' => $permission,
                        'checkedValue' => (int)(array_key_exists($permission->code, $checkedPermissions) ? $checkedPermissions[$permission->code] : 0),
                    ]); ?>

                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </tbody>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </table>
    </div>
</div>
<?php /**PATH C:\xampp\htdocs\testigniter/app/admin/formwidgets/permissioneditor/permissioneditor.blade.php ENDPATH**/ ?>