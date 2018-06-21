<?php $__env->startSection('breadcrumb'); ?>
<li>
    <a href="<?php echo e(route('admin.wms_export.index', ['type'=>$type])); ?>"> <?php echo e($pageTitle); ?> </a>
    <i class="fa fa-circle"></i>
</li>
<li>
    <span>Chỉnh sửa</span>
</li>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('content'); ?>
<div class="row">
    <?php echo $__env->make('admin.blocks.messages', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
    <!-- BEGIN FORM-->
    <form role="form" method="POST" action="<?php echo e(route('admin.wms_export.update',['id'=>$item->id,'type'=>$type])); ?>" class="form-validation">
        <?php echo e(csrf_field()); ?>

        <?php echo e(method_field('put')); ?>

        <input type="hidden" name="redirects_to" value="<?php echo e((old('redirects_to')) ? old('redirects_to') : url()->previous()); ?>" />

        <div class="col-lg-9 col-xs-12" id="qh-app"> 
            <div class="portlet box green">
                <div class="portlet-title">
                    <div class="caption"> Chỉnh sửa </div>
                </div>
                <div class="portlet-body">
                    
                    <div class="table-responsive">
                        <table class="table table-bordered table-condensed">
                            <thead>
                                <tr>
                                    <th width="7%"> Mã SP </th>
                                    <th width="15%"> Tên sản phẩm </th>
                                    <th width="7%"> Màu sắc </th>
                                    <th width="7%"> Kích cỡ </th>
                                    <th width="8%"> Giá bán </th>
                                    <th width="6%"> Số lượng </th>
                                    <th width="10%"> Thành tiền </th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $__empty_1 = true; $__currentLoopData = $products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                                <tr>
                                    <td align="center"><?php echo e($product->product_code); ?></td>
                                    <td><?php echo e($product->product_title); ?></td>
                                    <td align="center"><?php echo e($product->color_title); ?></td>
                                    <td align="center"><?php echo e($product->size_title); ?></td>
                                    <td align="center"><?php echo e(get_currency_vn($product->product_price,'')); ?></td>
                                    <td align="center"><?php echo e($product->product_qty); ?></td>
                                    <td align="center"><?php echo e(get_currency_vn($product->product_price*$product->product_qty,'')); ?></td>
                                </tr>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                                <?php endif; ?>
                                <tr>
                                    <td align="right" colspan="30"> Tổng: <span class="font-red-mint font-md bold"><?php echo e(get_currency_vn($item->export_price)); ?></span> </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-xs-12">
            <div class="portlet box green">
                <div class="portlet-title">
                    <div class="caption">Thông tin chung </div>
                </div>
                <div class="portlet-body">
                    
                    <div class="form-group">
                        <label class="control-label">Mã Phiếu</label>
                        <div>
                            <input type="text" name="data[code]" class="form-control" value="<?php echo e($item->code); ?>" readonly="">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label">Tình trạng</label>
                        <div>
                            <select class="selectpicker show-tick show-menu-arrow form-control" name="status[]">
                                <optgroup >
                                    <?php $__currentLoopData = $siteconfig[$type]['status']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $val): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <option value="<?php echo e($key); ?>" <?php echo e((strpos($item->status,$key) !== false)?'selected':''); ?> > <?php echo e($val); ?> </option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </optgroup>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Thứ tự</label>
                        <div>
                            <input type="text" name="priority" value="<?php echo e($item->priority); ?>" class="form-control priceFormat">
                        </div>
                    </div>
                    <div class="form-group">
                        
                        <a href="<?php echo e(url()->previous()); ?>" class="btn default" > Thoát </a>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.app', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>