<tr class="<?php echo e(!$checkedValue ? 'text-muted' : ''); ?>">
    <td role="button" data-toggle="permission">
        <span><?php echo app('translator')->get($permission->label); ?></span>&nbsp;-&nbsp;
        <em class="small">[<?php echo e($permission->code); ?>]</em>&nbsp;&nbsp;
        <span><?php echo e($permission->description); ?></span>
    </td>
    <td class="text-center">
        <div class="form-check d-inline-block">
            <input
                type="checkbox"
                class="form-check-input"
                id="checkbox-<?php echo e(str_replace('.', '-', $permission->code)); ?>"
                value="1"
                name="<?php echo e($field->getName()); ?>[<?php echo e($permission->code); ?>]"
                data-permission-group="<?php echo e(str_slug($permission->group)); ?>"
                <?php if($checkedValue == 1): ?> checked="checked" <?php endif; ?>
                <?php if($this->previewMode): ?> disabled="disabled" <?php endif; ?>
            />
            <label class="form-check-label" for="checkbox-<?php echo e(str_replace('.', '-', $permission->code)); ?>"></label>
        </div>
    </td>
</tr>
<?php /**PATH C:\xampp\htdocs\testigniter/app/admin/formwidgets/permissioneditor/permission.blade.php ENDPATH**/ ?>