<?php $__env->startSection('content'); ?>
<!-- PAGE SECTION START -->
<div class="page-section section pt-60 pb-60 wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
    <div class="container">
        <div class="row">
            <div class="col-lg-9 col-md-8 col-xs-12">
                <div class="post-detail">
                    <h3 class="title"><?php echo e($post->title); ?></h3>
                    <div class="meta">
                        <span><a href="#"><i class="fa fa-user"></i> <?php echo e(@$author->name); ?> </a></span>
                        <span><a href="<?php echo e(url('/'.$type.'/'.$category->slug)); ?>"><i class="fa fa-tags"></i> <?php echo e(@$category->title); ?> </a></span>
                        <span><a href="#"><i class="fa fa-eye"></i> <?php echo e(__('site.view')); ?> (<?php echo e($post->viewed); ?>)</a></span>
                    </div>
                    <div class="desc">
                        <?php echo e($post->description); ?>

                    </div>
                    <div class="image">
                        <img alt="" src="<?php echo e(asset('public/uploads/posts/'.$post->image)); ?>">
                    </div>
                    <div class="content mb40"><?php echo $post->contents; ?></div>
                </div>
                <!-- Comments Wrapper -->
                <?php echo $__env->make('frontend.default.blocks.comment', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
            </div>
            <div class="col-lg-3 col-md-4 col-xs-12">
                <?php echo $__env->make('frontend.default.layouts.sidebar', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
            </div>
        </div>
    </div>
</div>
<!-- PAGE SECTION END -->
<?php $__env->stopSection(); ?>
<?php echo $__env->make('frontend.default.master', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>