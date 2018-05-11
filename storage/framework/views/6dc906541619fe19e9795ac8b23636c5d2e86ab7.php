<?php $__env->startSection('content'); ?>
<!-- CRITERIA SECTION START -->
<div class="criteria-section section ptb-60">
    <div class="container">
        <div class="row">
            <div class="section-title text-center col-xs-12 mb-70">
                <h2> Tại sao chọn <span> Kho Web Online ?</span> </h2>
            </div>
        </div>
        <div class="row display-flex">
            <?php $__empty_1 = true; $__currentLoopData = $criteria; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $val): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                <?php echo get_template_single_post($val,'bai-viet',3); ?>

            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
            <?php endif; ?>
        </div>
    </div>
</div>
<!-- CRITERIA SECTION END -->

<?php $__env->stopSection(); ?>
<?php echo $__env->make('frontend.default.master', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>