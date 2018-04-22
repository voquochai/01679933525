<?php 
    $socials = get_links('social',$lang);
    $banks = get_photos('bank',$lang);
    $footer = get_pages('footer',$lang);
    $tags = get_attributes('product_tags',$lang);
 ?>
<!-- FOOTER TOP SECTION START -->
<div class="footer-top-section section pb-60 pt-100">
    <div class="container">
        <div class="row">
            <!-- Footer Widget -->
            <div class="footer-widget col-md-3 col-sm-6 col-xs-12 mb-40">
                <h4 class="widget-title"> <?php echo e(@$footer->title); ?> </h4>
                <?php echo @$footer->contents; ?>

                <!-- Footer Social -->
                <div class="footer-social fix">
                    <?php $__empty_1 = true; $__currentLoopData = $socials; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $link): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                    <a href="<?php echo e($link->link); ?>"> <?php echo $link->icon; ?> </a>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                    <?php endif; ?>
                </div>
            </div>
            <!-- Footer Widget -->
            <div class="footer-widget col-md-3 col-sm-6 col-xs-12 mb-40">
                <h4 class="widget-title">tags</h4>
                <div class="tag-cloud fix">
                    <?php $__empty_1 = true; $__currentLoopData = $tags; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $tag): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                    <a href="<?php echo e(route('frontend.home.archive', ['type'=>'san-pham','tag'=>$tag->slug] )); ?>"> <?php echo $tag->title; ?> </a>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                    <?php endif; ?>
                </div>
            </div>
            <!-- Footer Widget -->
            <div class="footer-widget col-md-3 col-sm-6 col-xs-12 mb-40">
                <h4 class="widget-title"><?php echo e(__('site.newsletter')); ?></h4>
                <?php echo $__env->make('frontend.default.layouts.newsletter', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
            </div>
            <!-- Footer Widget -->
            <div class="footer-widget col-md-3 col-sm-6 col-xs-12 mb-40">
                <div class="fb-page" data-href="<?php echo e(config('settings.fanpage')); ?>" data-small-header="true" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><blockquote cite="<?php echo e(config('settings.fanpage')); ?>" class="fb-xfbml-parse-ignore"><a href="<?php echo e(config('settings.fanpage')); ?>"><?php echo e(config('settings.site_name')); ?></a></blockquote></div>
            </div>
        </div>
    </div>
</div>
<!-- FOOTER TOP SECTION END -->  

<!-- FOOTER BOTTOM SECTION START -->
<div class="footer-bottom-section section pb-20 pt-20">
    <div class="container">
        <div class="row">
            <!-- Copyright -->
            <div class="copyright text-left col-sm-6 col-xs-12">
                <p><?php echo e(config('settings.site_copyright')); ?></p>
            </div>
            <!-- Payment Method -->
            <div class="payment-method text-right col-sm-6 col-xs-12">
                <?php $__empty_1 = true; $__currentLoopData = $banks; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $bank): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                <img src="<?php echo e(asset('public/uploads/photos/'.get_thumbnail($bank->image))); ?>" alt="<?php echo e($bank->alt); ?>" />
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                <?php endif; ?>
            </div>
        </div>
    </div>
</div>
<!-- FOOTER BOTTOM SECTION END -->