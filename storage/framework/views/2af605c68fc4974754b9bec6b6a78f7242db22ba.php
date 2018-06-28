<?php $__env->startSection('content'); ?>
<!-- PAGE SECTION START -->
<section class="page-section section pt-60 pb-60 wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
    <div class="container">
        <div class="row">
            <?php if( $item !== null ): ?>
            <div class="col-lg-9 col-md-8 col-xs-12 pull-right">
                <?php if( $item->status_id == 1 ): ?>
                <div id="alert-container">
                    <div class="alert alert-success" role="alert">
                        <p>Đăng ký hoàn tất! Vui lòng chuyển khoản theo cú pháp dưới đây:</p>
                        <p>
                            <b>Chủ tài khoản:</b> Võ Quốc Hải<br/>
                            <b>Số tài khoản:</b> 0441000721604<br/>
                            <b>Ngân hàng:</b> Vietcombank - Chi nhánh Tân Bình - TP. HCM<br/>
                            <b>Nội dung:</b> Thanh toán hợp đồng #<?php echo e($item->code); ?>

                        </p>
                    </div>
                </div>
                <?php endif; ?>
                <div class="pb-20">
                    <p class="text-right font-sm">Hợp đồng #<?php echo e($item->code); ?> được tạo ngày <?php echo e(date('d/m/Y', strtotime($item->created_at) )); ?> </p>
                    <p class="text-right"><button class="btn btn-lg btn-<?php echo e(config('siteconfig.order_site_labels.'.$item->status_id)); ?>"> <?php echo e(config('siteconfig.order_site_status.'.$item->status_id)); ?> </button></p>
                </div>
                <div class="alert alert-info mb-40">
                    <h4 class="text-center uppercase bold pt-10">Thông tin hợp đồng</h4>
                </div>
                <div>
                    <p> <b> Kính gửi (Ông/Bà):</b> <?php echo e($item->name); ?></p>
                    <p> Chúng tôi xin chân thành cảm ơn Quý khách đã tín nhiệm sử dụng dịch vụ của <?php echo e(config('app.name')); ?>. Dưới đây là thông tin các dịch vụ Quý khách đã đăng ký.</p>
                </div>
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead>
                            <tr class="active">
                                <th> Số hợp đồng </th>
                                <th> Ngày tạo </th>
                                <th> Ngày thanh toán </th>
                                <th> Hình thức thanh toán </th>
                                <th> Thành tiền </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td> <?php echo e($item->code); ?> </td>
                                <td> <?php echo e(date('d/m/Y', strtotime($item->created_at) )); ?> </td>
                                <td> <?php echo e(date('d/m/Y', strtotime($item->created_at)+($item->order_qty*31556926) )); ?> </td>
                                <td> <?php echo e(config('siteconfig.payment_method.3')); ?> </td>
                                <td> <?php echo e(get_currency_vn($item->order_price)); ?> </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="pt-60 pb-20">
                    <h4 class="uppercase font-red bold">Dịch vụ đăng ký trong hợp đồng</h4>
                </div>
                <?php 
                    $hosting = $domain = '';
                    if($product->size_title !== null){
                        $domain = explode(' - ',$product->size_title);
                    }
                    if($product->color_title !== null){
                        $hosting = explode(' - ',$product->color_title);
                    }
                 ?>
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead>
                            <tr class="active">
                                <th> Stt </th>
                                <th> Chi tiết dịch vụ </th>
                                <th> Thành tiền </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td> 1 </td>
                                <td> Website: <?php echo e($product->product_title); ?> </td>
                                <td> <?php echo e(get_currency_vn($product->product_price)); ?> </td>
                            </tr>
                            <?php if($domain): ?>
                            <tr>
                                <td> 2 </td>
                                <td> Domain: <?php echo e($domain[0]); ?> </td>
                                <td> <?php echo e($domain[1]); ?> đ </td>
                            </tr>
                            <?php endif; ?>

                            <?php if($hosting): ?>
                            <tr>
                                <td> 3 </td>
                                <td> Hosting: <?php echo e($hosting[0]); ?> </td>
                                <td> <?php echo e($hosting[1]); ?> đ </td>
                            </tr>
                            <?php endif; ?>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-xs-12">
                <div class="sidebar">
                    <div class="sidebar-widget mb-20">
                        <h4 class="title">Đơn hàng của bạn</h4>
                        <ul class="category">
                            <li> <a href="#" class="active"> <?php echo e($item->code); ?> </a> </li>
                        </ul>
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
</section>
<!-- PAGE SECTION END --> 
<?php $__env->stopSection(); ?>
<?php echo $__env->make('frontend.default.master', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>