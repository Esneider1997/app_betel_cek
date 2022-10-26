	<div class="card-title">
		<h1 class="h4"><i class="stat-icon <?php echo e($listIcon); ?>"></i> <?php echo app('translator')->get($listLabel); ?></h1>
	</div>				
	<div class="list-group list-group-flush">
	<?php $__currentLoopData = $listItems; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
		<div class="list-group-item bg-transparent">
			<b><?php echo e($item->name); ?></b> <em class="pull-right"><?php echo e($item->value); ?></em>
		</div>
	<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
	</div>
<?php /**PATH C:\xampp\htdocs\testigniter/extensions/thoughtco/reports/widgets/lists/lists.blade.php ENDPATH**/ ?>