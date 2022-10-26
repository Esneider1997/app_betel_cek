<div class="row-fluid">
    <?php echo form_open(current_url(),
        [
            'id'     => 'edit-form',
            'role'   => 'form',
            'method' => 'PATCH',
        ]
    ); ?>


    <?php echo $this->renderForm(); ?>


    <?php echo form_close(); ?>

</div>
<?php /**PATH C:\xampp\htdocs\testigniter/extensions/thoughtco/reports/views/builder/edit.blade.php ENDPATH**/ ?>