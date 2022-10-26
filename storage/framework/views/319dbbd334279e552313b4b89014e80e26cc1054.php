<div class="row-fluid">
    <?= form_open(current_url(),
        [
            'id'     => 'edit-form',
            'role'   => 'form',
            'method' => 'POST',
        ]
    ); ?>

    <?= $this->renderForm(); ?>

    <?= form_close(); ?>
</div>
<?php /**PATH C:\xampp\htdocs\testigniter/app/admin/views/allergens/create.blade.php ENDPATH**/ ?>