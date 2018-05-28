<?php $__env->startSection('content'); ?>
<!-- PAGE SECTION START -->
<div class="page-section section pt-100 pb-60">
    <div class="container">
        <div class="row">
            <form action="#">               
                <div class="col-xs-12">
                    <div class="cart-table table-responsive mb-40">
                        <table>
                            <thead>
                                <tr>
                                    <th class="pro-thumbnail"> <?php echo e(__('cart.photo')); ?> </th>
                                    <th class="pro-title"> <?php echo e(__('cart.product_name')); ?> </th>
                                    <th class="pro-price"> Hosting </th>
                                    <th class="pro-quantity"> <?php echo e(__('cart.quantity')); ?> </th>
                                    <th class="pro-subtotal"> <?php echo e(__('cart.total')); ?> (Đ)</th>
                                    <th class="pro-remove"> <?php echo e(__('cart.delete')); ?> </th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $__empty_1 = true; $__currentLoopData = $cart; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $val): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                                <tr id="pro-key-<?php echo e($key); ?>">
                                    <td class="pro-thumbnail"><a href="#"><img src="<?php echo e($val['pimage']); ?>" alt="" /></a></td>
                                    <td class="pro-title"><a href="#"><?php echo e($val['pname']); ?></a>
                                        <span class="amount"><?php echo e($val['price']); ?></span>
                                    </td>
                                    <td class="pro-price">
                                        <select name="hosting" class="selectpicker">
                                            
                                        </select>
                                    </td>
                                    <td class="pro-quantity"><div class="product-quantity"><input type="text" value="<?php echo e($val['license']); ?>" class="update-cart" data-ajax="key=<?php echo e($key); ?>" /></div></td>
                                    <td class="pro-subtotal sumProPrice"><?php echo e($val['sumProPrice']); ?></td>
                                    <td class="pro-remove"><a href="#" class="delete-cart" data-ajax="key=<?php echo e($key); ?>" >×</a></td>
                                </tr>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                                <tr> <td colspan="30"> <?php echo e(__('cart.no_item')); ?> </td> </tr>
                                <?php endif; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-md-8 col-sm-7 col-xs-12">
                    <div class="cart-buttons mb-30">
                        <a href="<?php echo e(url('/san-pham')); ?>"> <?php echo e(__('cart.continue_shopping')); ?> </a>
                    </div>
                    <div class="cart-coupon mb-40">
                        <h4>Coupon</h4>
                        <p> <?php echo e(__('cart.enter_coupon')); ?> </p>
                        <input type="text" placeholder="<?php echo e(__('cart.coupon_code')); ?>" value="<?php echo e(@$coupon['code']); ?>" />
                        <button type="button" ><?php echo e(__('cart.use')); ?></button>
                    </div>
                    <div id="result-coupon">
                        <?php if( $coupon ): ?>
                        <div class="custom-alerts alert alert-success fade in">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
                            <i class="fa-lg fa fa-check"></i> <?php echo e(__('cart.sale',['attribute'=>$coupon['coupon_amount_text']])); ?>

                        </div>
                        <?php endif; ?>
                    </div>
                </div>
                <div class="col-md-4 col-sm-5 col-xs-12">
                    <div class="cart-total mb-40">
                        <h3> <?php echo e(__('cart.cart_total')); ?> </h3>
                        <table>
                            <tbody>
                                <tr class="cart-subtotal">
                                    <th> <?php echo e(__('cart.total')); ?> </th>
                                    <td><span class="amount sumCartPrice"><?php echo e($sumCartPrice); ?></span></td>
                                </tr>
                                <tr class="order-total">
                                    <th> <?php echo e(__('cart.order_total')); ?> </th>
                                    <td>
                                        <strong><span class="amount sumOrderPrice"><?php echo e($sumOrderPrice); ?></span></strong>
                                    </td>
                                </tr>                                           
                            </tbody>
                        </table>
                        <div class="proceed-to-checkout section mt-30">
                            <a href="<?php echo e(route('frontend.cart.checkout')); ?>"> <?php echo e(__('cart.checkout')); ?> </a>
                        </div>
                    </div>
                </div>
            </form> 
        </div>
    </div>
</div>
<!-- PAGE SECTION END --> 
<?php $__env->stopSection(); ?>
<?php echo $__env->make('frontend.default.master', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>