<?php  $slideshow = get_photos('slideshow',$lang);  ?>
<!-- START SLIDER SECTION -->
<div class="home-slider-section section">
    <div id="home-slider" class="slides">
        <?php $__empty_1 = true; $__currentLoopData = $slideshow; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $slide): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
        <img src="<?php echo e(($slide->image && file_exists(public_path('/uploads/photos/'.$slide->image)) ) ? asset('public/uploads/photos/'.$slide->image) : asset('noimage/1920x900')); ?>" alt="" title="#slider-caption-<?php echo e($key); ?>"  />
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
        <?php endif; ?>
    </div>
    <?php $__empty_1 = true; $__currentLoopData = $slideshow; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $slide): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
    <div id="slider-caption-<?php echo e($key); ?>" class="nivo-html-caption">
        <div class="container">
            <div class="row">
                <div class="hero-slider-content col-md-6 col-md-offset-6 col-sm-7 col-sm-offset-5 col-xs-12">
                    <?php if($slide->title): ?> <h2 class="wow fadeInUp" data-wow-duration="1s" data-wow-delay="1s"><?php echo e($slide->title); ?></h2> <?php endif; ?>
                    <?php if($slide->description): ?> <p class="wow fadeInUp" data-wow-duration="1s" data-wow-delay="1.5s"><?php echo e($slide->description); ?></p> <?php endif; ?>
                    <?php if($slide->link): ?> <a href="<?php echo e($slide->link); ?>" class="wow fadeInUp" data-wow-duration="1s" data-wow-delay="2s">Buy now</a> <?php endif; ?>
                </div>
            </div>
        </div>
    </div>
    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
        <?php endif; ?>
</div>
<!-- END SLIDER SECTION -->

<?php  $banners = get_photos('banner',$lang);  ?>

<!-- BANNER-SECTION START -->
<div class="banner-section section pt-100 pb-70">
    <div class="container">
        <div class="row">
            <?php $__empty_1 = true; $__currentLoopData = $banners; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $banner): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
            <!-- Banner Item Start -->
            <div class="col-sm-6 col-xs-12 mb-30">
                <div class="single-banner">
                    <a href="<?php echo e($banner->link); ?>"><img src="<?php echo e(($banner->image && file_exists(public_path('/uploads/photos/'.$banner->image)) ) ? asset('public/uploads/photos/'.$banner->image) : asset('noimage/570x285')); ?>" alt=""></a>
                </div>
            </div>
            <!-- Banner Item End -->
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
            <?php endif; ?>
        </div>
    </div>
</div> 
<!-- BANNER-SECTION END -->