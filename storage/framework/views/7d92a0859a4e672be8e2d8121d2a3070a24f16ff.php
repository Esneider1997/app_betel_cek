	<div class="card-title">
		<h1 class="h4"><i class="stat-icon <?php echo e($chartIcon); ?>"></i> <?php echo app('translator')->get($chartLabel); ?></h1>
	</div>				
    <div
        class="chart-container"
        data-control="thoughtco-reports-chart"
    >
        <div class="chart-canvas">
			<textarea style="display:none;"><?php echo json_encode($chartData); ?></textarea>
            <canvas
				style="width: 100%; height: 200px"
            ></canvas>
        </div>
    </div>	
<?php /**PATH C:\xampp\htdocs\testigniter/extensions/thoughtco/reports/widgets/piechart/piechart.blade.php ENDPATH**/ ?>