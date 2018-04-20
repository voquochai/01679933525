<?php $__env->startSection('content'); ?>
<!-- PAGE SECTION START -->
<div class="page-section section pt-100 pb-60">
    <div class="container">
        <div class="row">
            <?php if( $item !== null ): ?>
            <div class="col-md-12 mt-element-step">
                <div class="row step-thin">
                    <div class="col-md-4 bg-grey mt-step-col">
                        <div class="mt-step-number bg-white font-grey">1</div>
                        <div class="mt-step-title uppercase font-grey-cascade">Purchase</div>
                        <div class="mt-step-content font-grey-cascade">Purchasing the item</div>
                    </div>
                    <div class="col-md-4 bg-grey mt-step-col">
                        <div class="mt-step-number bg-white font-grey">2</div>
                        <div class="mt-step-title uppercase font-grey-cascade">Payment</div>
                        <div class="mt-step-content font-grey-cascade">Complete your payment</div>
                    </div>
                    <div class="col-md-4 bg-grey done mt-step-col active">
                        <div class="mt-step-number bg-white font-grey">3</div>
                        <div class="mt-step-title uppercase font-grey-cascade">Deploy</div>
                        <div class="mt-step-content font-grey-cascade">Receive item integration</div>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-xs-12 mb-40">
                        <h3> <?php echo e(__('cart.billing_details')); ?> </h3>
                        <div class="row">
                            <div class="col-xs-12 mb-30">
                                <label><?php echo e(__('cart.name')); ?>:</label> <?php echo e($item->name); ?>

                            </div>
                            <div class="col-xs-12 mb-30">
                                <label><?php echo e(__('cart.address')); ?>:</label> <?php echo e($item->address); ?>

                            </div>
                            <div class="col-xs-12 mb-30">
                                <label>Emai</label> <?php echo e($item->email); ?>

                            </div>
                            <div class="col-xs-12 mb-30">
                                <label><?php echo e(__('cart.phone')); ?>:</label> <?php echo e($item->phone); ?>

                            </div>
                            <div class="col-sm-6 col-xs-12 mb-30">
                                <label><?php echo e(__('cart.province')); ?>:</label> <?php echo e($item->province); ?>

                            </div>
                            <div class="col-sm-6 col-xs-12 mb-30">
                                <label><?php echo e(__('cart.district')); ?>:</label> <?php echo e($item->district); ?>

                            </div>
                            <div class="col-sm-6 col-xs-12 mb-30">
                                <label><?php echo e(__('cart.notes')); ?>:</label> <?php echo e($item->notes); ?>

                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-xs-12 mb-40">
                        <h3> <?php echo e(__('cart.your_order')); ?> </h3>
                        <div class="order-table table-responsive mb-30">
                            <table>
                                <thead>
                                    <tr>
                                        <th class="product-name"><?php echo e(__('cart.product_name')); ?></th>
                                        <th class="product-total"><?php echo e(__('cart.total')); ?></th>
                                    </tr>                           
                                </thead>
                                <tbody>
                                    <?php $__empty_1 = true; $__currentLoopData = $products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $val): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                                        <tr>
                                            <td class="product-name">
                                                <?php echo e($val['pname'].($val['pcolor'] ? ' - '.$val['pcolor'] : '').($val['psize'] ? ' - '.$val['psize'] : '')); ?> <strong class="product-qty"> × <?php echo e($val['qty']); ?> </strong>
                                            </td>
                                            <td class="product-total">
                                                <span class="amount"><?php echo e($val['sumProPrice']); ?></span>
                                            </td>
                                        </tr>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                                    <tr> <td colspan="10"> <?php echo e(__('cart.no_item')); ?> </td> </tr>
                                    <?php endif; ?>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th><?php echo e(__('cart.cart_total')); ?></th>
                                        <td><span class="sumCartPrice"><?php echo e($item->subtotal); ?></span></td>
                                    </tr>
                                    <tr>
                                        <th><?php echo e(__('cart.order_total')); ?></th>
                                        <td><strong class="sumOrderPrice"><?php echo e($item->total); ?></strong>
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