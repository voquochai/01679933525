<?php $__env->startSection('breadcrumb'); ?>
<li>
    <a href="<?php echo e(route('admin.group.index')); ?>"> Nhóm quản trị </a>
    <i class="fa fa-circle"></i>
</li>
<li>
    <span> Thêm mới</span>
</li>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('content'); ?>
<div class="row">
    <?php echo $__env->make('admin.blocks.messages', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
    <!-- BEGIN FORM-->
    <form role="form" method="POST" action="<?php echo e(route('admin.group.store')); ?>" enctype="multipart/form-data" >
        <?php echo e(csrf_field()); ?>

        <div class="col-lg-9 col-xs-12"> 
            <div class="portlet box green">
                <div class="portlet-title">
                    <div class="caption"> Thêm mới </div>
                </div>
                <div class="portlet-body">
                    <div class="form-group">
                        <label for="name" class="control-label">Tên</label>
                        <div>
                            <input type="text" class="form-control title" name="display_name" value="<?php echo e(old('display_name')); ?>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="description" class="control-label">Mô tả</label>
                        <div>
                            <textarea name="description" class="form-control" rows="6"><?php echo e(old('description')); ?></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Quyền hạn</label>
                        <div class="table-responsive">
                            <table class="table table-bordered table-condensed">
                                <thead>
                                    <tr>
                                        <th> Chức năng </th>
                                        <th> Tất cả</th>
                                        <th> Xem </th>
                                        <th> Thêm </th>
                                        <th> Sửa </th>
                                        <th> Xóa </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php $__empty_1 = true; $__currentLoopData = $roles; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $role): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                                    <tr>
                                        <td align="left"> <?php echo e($role->display_name); ?> </td>
                                        <td align="center">
                                            <label class="mt-checkbox mt-checkbox-single">
                                                <input type="checkbox" class="group-checkable-role">
                                                <span></span>
                                            </label>
                                        </td>
                                        <td align="center">
                                            <label class="mt-checkbox mt-checkbox-single">
                                                <input type="checkbox" name="roles[<?php echo e($role->name); ?>][]" class="checkable" value="view">
                                                <span></span>
                                            </label>
                                        </td>
                                        <td align="center">
                                            <label class="mt-checkbox mt-checkbox-single">
                                                <input type="checkbox" name="roles[<?php echo e($role->name); ?>][]" class="checkable" value="create">
                                                <span></span>
                                            </label>
                                        </td>
                                        <td align="center">
                                            <label class="mt-checkbox mt-checkbox-single">
                                                <input type="checkbox" name="roles[<?php echo e($role->name); ?>][]" class="checkable" value="edit">
                                                <span></span>
                                            </label>
                                        </td>
                                        <td align="center">
                                            <label class="mt-checkbox mt-checkbox-single">
                                                <input type="checkbox" name="roles[<?php echo e($role->name); ?>][]" class="checkable" value="delete">
                                                <span></span>
                                            </label>
                                        </td>
                                    </tr>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                                    <?php endif; ?>
                                </tbody>
                            </table>
                        </div>
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
                        <label class="control-label">Slug</label>
                        <div>
                            <input type="text" name="name" class="form-control slug" value="<?php echo e(old('name')); ?>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Tình trạng</label>
                        <div>
                            <select class="selectpicker show-tick show-menu-arrow form-control" name="status[]" multiple>
                                <option value="publish" selected> Hiển thị </option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label">Thứ tự</label>
                        <div>
                            <input type="text" name="priority" class="form-control priceFormat" value="<?php echo e((old('priority')) ? old('priority') : 1); ?>">
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