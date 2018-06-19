<?php $__env->startComponent('mail::message'); ?>

<?php $__env->startComponent('mail::panel'); ?>
Hello! Bạn nhận được email liên hệ từ <?php echo e(config('app.name')); ?>

<?php echo $__env->renderComponent(); ?>
<hr>
<p> Thông tin liên hệ bao gồm nội dung sau đây:</p>
<div class="table">
	<table>
		<tr>
			<td style="width:150px; text-align: left;">Họ và Tên</td>
			<td><?php echo e($contact['name']); ?></td>
		</tr>
		<tr>
			<td style="width:150px; text-align: left;">Email</td>
			<td><?php echo e($contact['email']); ?></td>
		</tr>
		<tr>
			<td style="width:150px; text-align: left;">Chủ đề</td>
			<td><?php echo e($contact['title']); ?></td>
		</tr>
		<tr>
			<td style="width:150px; text-align: left;">Tin nhắn</td>
			<td><?php echo e($contact['description']); ?></td>
		</tr>
	</table>
</div>
Thanks,<br>
<?php echo e(config('app.name')); ?>


<?php echo $__env->renderComponent(); ?>