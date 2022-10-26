<div
    class="field-query-builder"
    data-control="query-builder"
    data-value='<?php echo json_encode($value, 15, 512) ?>'
    data-filters='<?php echo json_encode($filters, 15, 512) ?>'
    <?php echo $field->getAttributes(); ?>>

    <div class="control selectlist">
        <select
            id="<?php echo e($field->getId('type')); ?>"
            class="form-control querybuilder-options-select"
        >
            <?php $__currentLoopData = $filters; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $value => $option): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <option value="<?php echo e($value); ?>"><?php echo e($option['label']); ?></option>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </select>
    </div>

    <div class="control">
        <div class="w-100 querybuilder"></div>
    </div>
    
    <textarea name="<?php echo e($field->getName()); ?>" class="d-none"></textarea>
    
</div>
<?php /**PATH C:\xampp\htdocs\testigniter/extensions/thoughtco/reports/formwidgets/querybuilder/querybuilder.blade.php ENDPATH**/ ?>