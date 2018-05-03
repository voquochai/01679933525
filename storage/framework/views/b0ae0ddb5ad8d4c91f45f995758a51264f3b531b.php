<?php $__env->startComponent('mail::message'); ?>

<?php $__env->startComponent('mail::panel'); ?>
Hello! Bạn nhận được email liên hệ từ <?php echo e(config('app.name')); ?>

<?php echo $__env->renderComponent(); ?>
<hr>
<p> Thông tin liên hệ bao gồm nội dung sau đây:</p>

<table>
	<tr>
		<th style="width:150px; text-align: left;">Họ và Tên</th>
		<td><?php echo e($contact['name']); ?></td>
	</tr>
	<tr>
		<th style="width:150px; text-align: left;">Email</th>
		<td><?php echo e($contact['email']); ?></td>
	</tr>
	<tr>
		<th style="width:150px; text-align: left;">Chủ đề</th>
		<td><?php echo e($contact['title']); ?></td>
	</tr>
	<tr>
		<th style="width:150px; text-align: left;">Tin nhắn</th>
		<td><?php echo e($contact['description']); ?></td>
	</tr>
</table>

Thanks,<br>
<?php echo e(config('app.name')); ?>


<?php echo $__env->renderComponent(); ?>