<div class="row mx-auto px-3 my-3">
    <?php $__currentLoopData = ['quality', 'service', 'delivery']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $ratingType): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
        <div class="<?php echo \Illuminate\Support\Arr::toCssClasses(['col-md-4', 'ps-md-0' => $loop->first, 'pe-md-0' => $loop->last]) ?>"">
        <div class="card bg-light shadow-sm">
            <div class="card-body">
                <h5 class="text-muted"><?php echo app('translator')->get('igniter.local::default.reviews.label_'.$ratingType); ?></h5>
                <div
                    class="chart-container pt-3"
                    data-control="review-chart"
                    data-data='<?php echo json_encode($this->getController()->makeAverageRatingDataset($ratingType, $this->records), 512) ?>'
                >
                    <div class="chart-canvas">
                        <canvas
                            style="width: 100%; height: 128px"
                        ></canvas>
                    </div>
                </div>
            </div>
        </div>
</div>
<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
</div>
<?php /**PATH C:\xampp\htdocs\testigniter/extensions/igniter/local/views/reviews/lists/averages.blade.php ENDPATH**/ ?>