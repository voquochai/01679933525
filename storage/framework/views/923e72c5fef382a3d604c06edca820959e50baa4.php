<?php $__env->startSection('content'); ?>
<!-- PAGE SECTION START -->
<div class="row display-flex">
    <?php $__empty_1 = true; $__currentLoopData = $products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
        <?php echo get_template_product($product,$type,3); ?>

    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
    <div class="col-xs-12"><p> Sản phẩm chưa cập nhật </p></div>
    <?php endif; ?>
</div>
<div class="page-pagination text-center col-xs-12 fix mb-40">
    <?php echo e($products->links('frontend.default.layouts.paginate')); ?>

</div>
<!-- PAGE SECTION END -->
<?php $__env->stopSection(); ?>
<?php echo $__env->make('frontend.member.master', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>