<?php $__env->startSection('breadcrumb'); ?>
<li>
    <span> <?php echo e($pageTitle); ?> </span>
</li>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('content'); ?>
<div class="row">
	<?php echo $__env->make('admin.blocks.messages', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
	<div class="col-md-12">
        <div class="profile-sidebar">
            <div class="portlet light profile-sidebar-portlet">
                <div class="profile-usertitle">
                    <div class="profile-usertitle-name"> Bình luận </div>
                </div>
                <div class="profile-userbuttons">
                    <button type="button" class="btn btn-circle green btn-sm">Mới nhất</button>
                    <button type="button" class="btn btn-circle default btn-sm">Chưa duyệt</button>
                </div>
                <div class="profile-usermenu">
                    <ul class="nav">
                        <li class="active">
                            <a href="page_user_profile_1.html">
                                <i class="icon-home"></i> Overview </a>
                        </li>
                        <li>
                            <a href="page_user_profile_1_account.html">
                                <i class="icon-settings"></i> Account Settings </a>
                        </li>
                        <li>
                            <a href="page_user_profile_1_help.html">
                                <i class="icon-info"></i> Help </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="profile-content">
            <div class="portlet light portlet-fit ">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="icon-bubble font-green"></i>
                        <span class="caption-subject bold font-green uppercase"> Bình luận</span>
                    </div>
                    <div class="actions">
                        <button type="button" class="btn btn-sm btn-circle red"> <i class="icon-trash"></i> Xóa </button>
                    </div>
                </div>
                <div class="portlet-body">
                    <?php echo get_comments($items); ?>

                </div>
            </div>
        </div>
    </div>
</div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.app', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>