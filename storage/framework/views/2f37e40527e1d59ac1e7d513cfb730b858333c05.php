<?php $__env->startSection('breadcrumb'); ?>
<li>
    <a href="<?php echo e(route('admin.attribute.index', ['type'=>$type])); ?>"> <?php echo e($pageTitle); ?> </a>
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
    <form role="form" method="POST" action="<?php echo e(route('admin.attribute.update',['id'=>$item->id,'type'=>$type])); ?>" enctype="multipart/form-data" >
        <?php echo e(csrf_field()); ?>

        <?php echo e(method_field('put')); ?>

        <input type="hidden" name="redirects_to" value="<?php echo e((old('redirects_to')) ? old('redirects_to') : url()->previous()); ?>" />
        <div class="col-lg-9 col-xs-12"> 
            <div class="portlet box green">
                <div class="portlet-title">
                    <div class="caption"> Chỉnh sửa </div>
                    <ul class="nav nav-tabs">
                        <?php $__currentLoopData = $languages; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $lang): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <li <?php echo (( $key==$default_language )?'class="active"':''); ?>>
                            <a href="#tab_<?php echo e($key); ?>" data-toggle="tab" aria-expanded="false"> <?php echo e($lang); ?> </a>
                        </li>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </ul>
                </div>
                <div class="portlet-body">
                    <div class="tab-content">
                        <?php  $i=0;  ?>
                        <?php $__currentLoopData = $languages; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $lang): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <div class="tab-pane <?php echo (( $key==$default_language ) ? 'active' : ''); ?>" id="tab_<?php echo e($key); ?>">
                            <div class="form-group">
                                <label for="name" class="control-label">Tên</label>
                                <div>
                                    <input type="text" class="form-control <?php echo (( $key==$default_language )?'title':''); ?>" name="dataL[<?php echo e($key); ?>][title]" value="<?php echo e(isset( $item->languages[$i] ) ? $item->languages[$i]['title'] : ''); ?>">
                                </div>
                            </div>

                        </div>
                        <?php  $i++  ?>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
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
                    <?php if($siteconfig[$type]['colorpicker']): ?>
                    <div class="form-group">
                        <label class="control-label">Mã màu</label>
                        <div class="input-group colorpicker-component" data-color="<?php echo e($item->value ? $item->value : '#ffffff'); ?>">
                            <input type="text" name="data[value]" value="<?php echo e($item->value); ?>" class="form-control"/>
                            <span class="input-group-addon"><i></i></span>
                        </div>
                    </div>
                    <?php endif; ?>

                    <?php if($siteconfig[$type]['price']): ?>
                    <div class="form-group">
                        <label class="control-label">Giá bán</label>
                        <div class="input-group">
                            <input type="text" name="regular_price" class="form-control priceFormat" value="<?php echo e($item->regular_price); ?>" />
                            <span class="input-group-addon">Đ</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Giá khuyến mãi</label>
                        <div class="input-group">
                            <input type="text" name="sale_price" class="form-control priceFormat" value="<?php echo e($item->sale_price); ?>" />
                            <span class="input-group-addon">Đ</span>
                        </div>
                    </div>
                    <?php endif; ?>

                    <div class="form-group">
                        <label class="control-label">Tình trạng</label>
                        <div>
                            <select class="selectpicker show-tick show-menu-arrow form-control" name="status[]" multiple>
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
                        <button type="submit" class="btn green"> <i class="fa fa-check"></i> Lưu</button>
                        <a href="<?php echo e(url()->previous()); ?>" class="btn default" > Thoát </a>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.app', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>