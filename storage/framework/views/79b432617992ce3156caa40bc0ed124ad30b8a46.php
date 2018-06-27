<?php $__env->startSection('content'); ?>
<!-- PAGE SECTION START -->
<div class="page-section section pt-100 pb-60">
    <div class="container">
        <div class="row">
            <?php if( $item !== null ): ?>
            <div class="col-md-12 mb-40 mt-element-step">
                <div class="row step-thin">
                    <?php $__empty_1 = true; $__currentLoopData = config('siteconfig.order_site_status'); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $val): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                    <div class="col-lg-3 col-md-6 bg-grey mt-step-col <?php echo e($item->status_id == $key ? 'active' : ''); ?> ">
                        <div class="mt-step-number bg-white font-grey"><?php echo e($key); ?></div>
                        <div class="mt-step-title uppercase font-grey-cascade"><?php echo e($val); ?></div>
                    </div>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                    <?php endif; ?>
                </div>
            </div>
            <div class="col-md-12">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-xs-12 mb-40">
                        <h3 class="mb-15 uppercase"> <?php echo e(__('cart.billing_details')); ?> </h3>
                        <div class="row">
                            <div class="col-xs-12 mb-15">
                                <label><?php echo e(__('cart.name')); ?>:</label> <?php echo e($item->name); ?>

                            </div>
                            <div class="col-xs-12 mb-15">
                                <label><?php echo e(__('cart.address')); ?>:</label> <?php echo e($item->address); ?>

                            </div>
                            <div class="col-xs-12 mb-15">
                                <label>Emai</label> <?php echo e($item->email); ?>

                            </div>
                            <div class="col-xs-12 mb-15">
                                <label><?php echo e(__('cart.phone')); ?>:</label> <?php echo e($item->phone); ?>

                            </div>
                            <div class="col-xs-12 mb-15">
                                <label><?php echo e(__('cart.province')); ?>:</label> <span class="simple-province" data-key="<?php echo e($item->province_id); ?>"></span>
                            </div>
                            <div class="col-xs-12 mb-15">
                                <label><?php echo e(__('cart.district')); ?>:</label> <span class="simple-district" data-key="<?php echo e($item->district_id); ?>"></span>
                            </div>
                            <div class="col-xs-12 mb-15">
                                <label><?php echo e(__('cart.notes')); ?>:</label> <?php echo e($item->note); ?>

                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-xs-12 mb-40">
                        <?php if( $item->coupon_code ): ?>
                        <h3 class="mb-15 uppercase"> Coupon </h3>
                        <div class="custom-alerts alert alert-success fade in">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
                            <i class="fa-lg fa fa-check"></i> <?php echo e(__('cart.sale',['attribute'=>get_currency_vn($item->coupon_amount)])); ?>

                        </div>
                        <?php endif; ?>
                        <h3 class="mb-15 uppercase"> <?php echo e(__('cart.your_order')); ?> </h3>
                        <div class="order-table table-responsive mb-30">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th class="product-name"><?php echo e(__('cart.product_name')); ?></th>
                                        <th class="product-total"><?php echo e(__('cart.total')); ?> (Đ)</th>
                                    </tr>                           
                                </thead>
                                <tbody>
                                    <?php $__empty_1 = true; $__currentLoopData = $products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $val): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                                        <tr>
                                            <td class="product-name">
                                                <?php echo e($val['product_title'].($val['color_title'] ? ' - '.$val['color_title'] : '').($val['size_title'] ? ' - '.$val['size_title'] : '')); ?> <strong class="product-qty"> × <?php echo e($val['product_qty']); ?> </strong>
                                            </td>
                                            <td class="product-total">
                                                <span class="amount"><?php echo e(get_currency_vn($val['product_price']*$val['product_qty'],'')); ?></span>
                                            </td>
                                        </tr>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                                    <tr> <td colspan="10"> <?php echo e(__('cart.no_item')); ?> </td> </tr>
                                    <?php endif; ?>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th><?php echo e(__('cart.cart_total')); ?></th>
                                        <td><span class="sumCartPrice"><?php echo e(get_currency_vn($item->subtotal,'')); ?></span></td>
                                    </tr>
                                    <tr>
                                        <th><?php echo e(__('cart.order_total')); ?></th>
                                        <td><strong class="sumOrderPrice"><?php echo e(get_currency_vn($item->order_price,'')); ?></strong>
                                        </td>
                                    </tr>                               
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            
            <?php else: ?>
            <div class="col-md-12" id="alert-container">
                <div class="alert alert-danger alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <p> <?php echo e(__('site.no_data')); ?> </p>
                </div>
            </div>
            <?php endif; ?>
            
        </div>
    </div>
</div>
<!-- PAGE SECTION END --> 
<?php $__env->stopSection(); ?>
<?php echo $__env->make('frontend.default.master', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>