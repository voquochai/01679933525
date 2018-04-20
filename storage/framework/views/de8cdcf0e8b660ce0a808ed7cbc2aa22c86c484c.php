<?php $__env->startSection('content'); ?>
<!-- PAGE SECTION START -->
<div class="page-section section pt-100 pb-60">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <h3 class="page-header">Cảm ơn bạn đã đặt hàng tại Website</h3>
                <div class="alert alert-success">
                    Mã đơn hàng #<?php echo e(session('orderCode')); ?> đã được đặt hàng thành công.
                </div>
            </div>
        </div>
    </div>
</div>
<!-- PAGE SECTION END -->
<?php $__env->stopSection(); ?>
<?php echo $__env->make('frontend.default.master', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>