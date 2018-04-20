<?php $__env->startSection('content'); ?>
<!-- PRODUCT SECTION START -->
<div class="product-section section pb-60">
    <div class="container">
        <div class="row">
            <div class="section-title text-center col-xs-12 mb-70">
                <h2> <?php echo e(__('site.new_products')); ?> </h2>
            </div>
        </div>
        <div class="row display-flex">
            <?php $__empty_1 = true; $__currentLoopData = $new_products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                <?php echo get_template_product($product,'san-pham',4); ?>

            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
            <?php endif; ?>
        </div>
    </div>
</div>
<!-- PRODUCT SECTION END -->

<!-- TESTIMONIAL SECTION START -->
<div class="testimonial-section section pt-100 pb-100">
    <div class="container">
        <div class="row">
            <div class="col-md-10 col-md-offset-1 col-xs-12">
                <!-- Testimonial Slider -->
                <div class="testimonial-slider text-center">
                    <?php $__empty_1 = true; $__currentLoopData = $customers; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $customer): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                    <div class="single-testimonial">

                        <img src="<?php echo e(( $customer->image && file_exists(public_path('/uploads/posts/'.$customer->image)) ? asset( 'public/uploads/posts/'.get_thumbnail($customer->image) ) : asset('noimage/200x200') )); ?>" alt="<?php echo e($customer->alt); ?>" class="img-circle">
                        <p>“ <?php echo e(substr($customer->description,0,150)); ?> ”</p>
                        <i class="pe-7s-way"></i>
                        <h5><?php echo e($customer->title); ?></h5>
                    </div>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- TESTIMONIAL SECTION END -->

<!-- BLOG SECTION START -->
<div class="blog-section section pt-100 pb-60">
    <div class="container">
        <div class="row">
            <div class="section-title text-center col-xs-12 mb-70">
                <h2> <?php echo e(__('site.news_events')); ?> </h2>
            </div>
        </div>
        <div class="row display-flex">
            <?php $__empty_1 = true; $__currentLoopData = $new_posts; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $post): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                <?php echo get_template_post($post,'tin-tuc',3); ?>

            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
            <?php endif; ?>
        </div>
    </div>
</div>
<!-- BLOG SECTION END -->
<?php $__env->stopSection(); ?>
<?php echo $__env->make('frontend.default.master', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>