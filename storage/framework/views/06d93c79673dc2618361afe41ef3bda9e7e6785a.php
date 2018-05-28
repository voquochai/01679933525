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
                <div class="sidebar" id="app-cart">
                    <input type="hidden" name="product_price" :value="form.product_price">
                    
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
                        <div class="product-hosting">
                            <h5 class="title"> Gói hosting </h5>
                            <div class="mt-radio-list">
                                <?php $__empty_1 = true; $__currentLoopData = $hosting; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $host): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                                <label class="mt-radio">
                                    <input type="radio" name="hosting" data-id="<?php echo e($host->id); ?>" v-model="form.product_hosting"  value="<?php echo e($host->regular_price); ?>" <?php echo e($host->regular_price == 0 ? 'checked' : ''); ?> ><?php echo e($host->title); ?>

                                    <span></span>
                                    <div class="float-right">
                                        <?php if( $host->regular_price > 0 ): ?>
                                        <?php echo e(get_currency_vn($host->regular_price)); ?>

                                        <?php else: ?>
                                        Mặc định
                                        <?php endif; ?>
                                    </div>
                                </label>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                                <?php endif; ?>
                            </div>
                        </div>
                        <hr>
                        <div class="product-license">
                            <div class="float-left"> <label> Thời gian </label> </div>
                            <div class="float-right">
                                <select class="selectpicker" name="license" v-model="form.product_license" >
                                    <?php for($i=1; $i<=5; $i++): ?>
                                    <option value="<?php echo e($i); ?>"> <?php echo e($i.' năm'); ?> </option>
                                    <?php endfor; ?>
                                </select>
                            </div>
                        </div>
                        <hr>
                        <div class="product-total">
                            <div class="float-left"><label> Tổng tiền </label></div>
                            <div class="float-right"> <b class="font-red font-hg">{{ formatPrice(total) }} đ</b> </div>
                        </div>
                        <button id="add-to-cart" class="btn btn-block btn-lg uppercase" data-ajax="id=<?php echo e($product->id); ?>">Thuê ngay</button>
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
            <?php $__empty_1 = true; $__currentLoopData = $products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                <?php echo get_template_product($item,$type,3); ?>

            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
            <?php endif; ?>
        </div>
    </div>
</section>
<!-- PRODUCT SECTION END --> 
<?php $__env->stopSection(); ?>

<?php $__env->startSection('custom_script'); ?>
<script src="<?php echo e(asset('public/packages/vue.js')); ?>" type="text/javascript"></script>
<script type="text/javascript">
    new Vue({
        el: '#app-cart',
        data: function () {
            return {
                form: {
                    <?php 
                    if($product->regular_price > 0 && $product->sale_price == 0){
                        echo 'product_price: '.$product->regular_price.',';
                    }else if($product->sale_price > 0){
                        echo 'product_price: '.$product->sale_price.',';
                    }else{
                        echo 'product_price: 0,';
                    }
                     ?>
                    product_hosting: 0,
                    product_license: 1
                }
            }
        },
        computed: {
            total() {
                return ( Number(this.form.product_price) + Number(this.form.product_hosting) ) * Number(this.form.product_license);
            }
        },
        methods: {
            formatPrice(value) {
                let val = (value/1).toFixed(0).replace('.', ',')
                return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".")
            }
        }
    });
</script>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('frontend.default.master', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>