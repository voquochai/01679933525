<?php $__env->startSection('content'); ?>
<!-- PAGE SECTION START -->
<div class="page-section section pt-100 pb-60">
    <div class="container">
        <div class="row mb-40">
            <div class="col-xs-12 col-sm-6 col-md-4 mb-40">	
                <!-- Tab panes -->
                <div class="tab-content mb-10">
                    <div class="pro-large-img tab-pane active" id="pro-large-img-0">
                        <img src="<?php echo e(asset('public/uploads/products/'.$product->image)); ?>" alt="<?php echo e($product->alt); ?>" />
                    </div>
                    <?php $__empty_1 = true; $__currentLoopData = $images; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=> $image): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                    <div class="pro-large-img tab-pane" id="pro-large-img-<?php echo e(++$key); ?>">
                        <img src="<?php echo e(asset('public/uploads/products/'.$image->image)); ?>" alt="<?php echo e($image->alt); ?>" />
                    </div>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                    <?php endif; ?>
                </div>
                <!-- Nav tabs -->
                <div class="pro-thumb-img-slider">
                    <div><a href="#pro-large-img-0" data-toggle="tab"><img src="<?php echo e(asset('public/uploads/products/'.get_thumbnail($product->image,'_small'))); ?>" alt="<?php echo e($product->alt); ?>" /></a></div>
                    <?php $__empty_1 = true; $__currentLoopData = $images; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=> $image): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                    <div><a href="#pro-large-img-<?php echo e(++$key); ?>" data-toggle="tab"><img src="<?php echo e(asset('public/uploads/products/'.$image->image)); ?>" alt="<?php echo e($image->alt); ?>" /></a></div>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                    <?php endif; ?>
                </div>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-8 mb-40">
                <div class="product-details">
                    <h2 class="title"><?php echo e($product->title); ?></h2>
                    <span class="price section"><?php echo get_template_product_price($product->regular_price,$product->sale_price); ?></span>
                    <span class="availability section"> <strong><?php echo e(__('site.product_code')); ?>:</strong> <?php echo e($product->code); ?></span>
                    <!--<span class="availability section"><strong>available:</strong> <span class="in"><i class="fa fa-check"></i> In Stock</span><span class="out"><i class="fa fa-times"></i> Out of Stock</span></span>-->
                    <?php $__empty_1 = true; $__currentLoopData = $attributes; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $attribute): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                        <?php if( $attribute['name'] !== null && $attribute['value'] !== null ): ?>
                        <span class="availability section"> <strong><?php echo e($attribute['name']); ?>:</strong> <?php echo e($attribute['value']); ?></span>
                        <?php endif; ?>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                    <?php endif; ?>
                    <div class="short-desc section">
                        <?php echo e($product->description); ?>

                    </div>
                    <div class="color-list section">
                        <?php $__empty_1 = true; $__currentLoopData = $colors; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $color): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                        <button <?php echo ($key == 0) ? 'class="active"' : ''; ?> style="background-color: <?php echo e($color->value); ?>;" data-id="<?php echo e($color->id); ?>" ><i class="fa fa-check"></i></button>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                        <?php endif; ?>
                    </div>
                    <div class="size-list section">
                        <?php $__empty_1 = true; $__currentLoopData = $sizes; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $size): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                        <button <?php echo ($key == 0) ? 'class="active"' : ''; ?> data-id="<?php echo e($size->id); ?>" ><i class="fa fa-check"></i> <?php echo e($size->title); ?> </button>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                        <?php endif; ?>
                    </div>
                    <div class="quantity-cart section">
                        <div class="product-quantity">
                            <input type="text" value="1">
                        </div>
                        <button id="add-to-cart" data-ajax="id=<?php echo e($product->id); ?>"><?php echo e(__('cart.add_to_cart')); ?></button>
                    </div>
                    <div class="share-icons section">
                        <a target="_blank" class="facebook" href="https://www.facebook.com/sharer/sharer.php?u=<?php echo e(url()->current()); ?>"><i class="fa fa-facebook"></i>  facebook</a>
                        <a target="_blank" class="twitter" href="https://twitter.com/home?status=<?php echo e(url()->current()); ?>"><i class="fa fa-twitter"></i>  twitter</a>
                        <a target="_blank" class="google" href="https://plus.google.com/share?url=<?php echo e(url()->current()); ?>"><i class="fa fa-google-plus"></i>  google</a>
                        <a target="_blank" class="pinterest" href="https://pinterest.com/pin/create/button/?url=<?php echo e(url()->current()); ?>&media=<?php echo e(asset('public/uploads/products/'.$product->image)); ?>&description=<?php echo e($product->description); ?>"><i class="fa fa-pinterest"></i>  pinterest</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <!-- Nav tabs -->
            <div class="col-xs-12">
                <ul class="pro-info-tab-list section">
                    <li class="active"><a href="#more-info" data-toggle="tab"><?php echo e(__('site.product_detail')); ?></a></li>
                    <li><a href="#reviews" data-toggle="tab"><?php echo e(__('site.comment')); ?></a></li>
                </ul>
            </div>
            <!-- Tab panes -->
            <div class="tab-content col-xs-12">
                <div class="pro-info-tab tab-pane active" id="more-info">
                    <?php echo $product->contents; ?>

                </div>
                <div class="pro-info-tab tab-pane" id="reviews">
                    <!-- Comments Wrapper -->
                    <?php echo $__env->make('frontend.default.layouts.comment', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
                </div>
            </div>		
        </div>
    </div>
</div>
<!-- PAGE SECTION END -->
    
<!-- PRODUCT SECTION START -->
<div class="product-section section pb-100">
    <div class="container">
        <div class="row">
            <div class="section-title text-center col-xs-12 mb-70">
                <h2><?php echo e(__('site.product_other')); ?></h2>
            </div>
        </div>
        <div class="row">
            <div class="product-slider product-slider-4">
                <?php $__empty_1 = true; $__currentLoopData = $products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                    <?php echo get_template_product($product,$type,1); ?>

                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                <?php endif; ?>
            </div>
        </div>
    </div>
</div>
<!-- PRODUCT SECTION END --> 
<?php $__env->stopSection(); ?>
<?php echo $__env->make('frontend.default.master', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>