<?php $__env->startComponent('mail::message'); ?>

<?php $__env->startComponent('mail::panel'); ?>
Hello! Bạn nhận được email liên hệ từ <?php echo e(config('app.name')); ?>

<?php echo $__env->renderComponent(); ?>

<hr>

<div> Thông tin liên hệ bao gồm nội dung sau đây:</div>

<div> Họ và Tên: <?php echo e($contact['name']); ?> </div>

<div> Email: <?php echo e($contact['email']); ?> </div>

<div> Chủ đề: <?php echo e($contact['title']); ?> </div>

<div> Tin nhắn: <?php echo e($contact['description']); ?> </div>

Thanks,<br>
<?php echo e(config('app.name')); ?>


<?php echo $__env->renderComponent(); ?>