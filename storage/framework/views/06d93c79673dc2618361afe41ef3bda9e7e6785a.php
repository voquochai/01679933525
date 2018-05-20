<?php $__env->startSection('content'); ?>
<!-- PAGE SECTION START -->
<section class="page-section section pt-60 pb-60 wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
    <div class="container">
        <div class="row mb-40">
            <div class="col-md-8 col-sm-12 col-xs-12 mb-40">
                <div class="product-detail">
                    <h1 class="title"><?php echo e($product->title); ?></h1>
                    <div class="image">
                        <img src="<?php echo e(( $product->image && file_exists(public_path('/uploads/products/'.$product->image)) ? asset( 'public/uploads/products/'.$product->image ) : asset('noimage/600x600') )); ?>" alt="<?php echo e($product->alt); ?>" />
                    </div>
                    <div class="content">
                        <?php echo $product->contents; ?>

                    </div>
                    <!-- Comments Wrapper -->
                    <?php echo $__env->make('frontend.default.blocks.comment', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
                </div>
            </div>
            <div class="col-md-4 col-sm-12 col-xs-12 mb-40">
                <div class="sidebar">
                    <div class="sidebar-widget mb-40">
                        <div class="product-attributes">
                            <ul>
                            <?php $__empty_1 = true; $__currentLoopData = $attributes; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $attribute): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                                <?php if( $attribute['name'] !== null && $attribute['value'] !== null ): ?>
                                <li> <?php echo $attribute['name'].$attribute['value']; ?> </li>
                                <?php endif; ?>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                            <?php endif; ?>
                            </ul>
                        </div>
                    </div>
                    <div class="sidebar-widget mb-40">
                        <div class="product-price">
                            <div class="float-left"><label><?php echo e(__('site.product_price')); ?></label></div>
                            <div class="float-right"><?php echo get_template_product_price($product->regular_price,$product->sale_price); ?></div>
                        </div>
                        <hr>
                        <div class="product-license">
                            <div class="float-left"> <label> Hình thức </label> </div>
                            <div class="float-right">
                                <select class="selectpicker">
                                    <option value=""> Thuê web </option>
                                    <option value=""> Mua đứt </option>
                                </select>
                            </div>
                        </div>
                        <hr>
                        <div class="service-hosting">
                            <h3 class="title"> Gói dịch vụ kèm theo </h3>
                            <div class="mt-radio-list">
                                <label class="mt-radio">
                                    <input type="radio">1GB Hosting
                                    <span></span>
                                </label>
                                <label class="mt-radio">
                                    <input type="radio">2GB Hosting
                                    <span></span>
                                </label>
                            </div>
                        </div>
                        <hr>
                        <div class="product-total">
                            <div class="float-left"> <label> Tổng tiền </label> </div>
                            <div class="float-right"></div>
                        </div>
                        <button id="add-to-cart" class="btn btn-block btn-lg" data-ajax="id=<?php echo e($product->id); ?>"><?php echo e(__('cart.buy_now')); ?></button>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
</section>
<!-- PAGE SECTION END -->
    
<!-- PRODUCT SECTION START -->
<section class="page-section section pb-60 wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
    <div class="container">
        <div class="row">
            <div class="section-title text-center col-xs-12 mb-70">
                <h2><?php echo e(__('site.product_other')); ?></h2>
            </div>
        </div>
        <div class="row display-flex">
            <?php $__empty_1 = true; $__currentLoopData = $products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                <?php echo get_template_product($product,$type,3); ?>

            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
            <?php endif; ?>
        </div>
    </div>
</section>
<!-- PRODUCT SECTION END --> 
<?php $__env->stopSection(); ?>
<?php echo $__env->make('frontend.default.master', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>