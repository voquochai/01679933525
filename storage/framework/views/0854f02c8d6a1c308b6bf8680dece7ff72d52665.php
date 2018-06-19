<?php $__env->startComponent('mail::message'); ?>

<?php $__env->startComponent('mail::panel'); ?>
Cám ơn bạn đã đặt hàng tại website chúng tôi
<?php echo $__env->renderComponent(); ?>

<hr>
<p> Đơn hàng #<?php echo e($order->code); ?> của bạn bao gồm các sản phẩm sau đây:</p>

<div class="table">
	<table>
		<tr>
			<th colspan="2"><?php echo e($product['title']); ?></th>
		</tr>
		<tr>
			<td style="width:150px; text-align: left;">Mã số</td>
			<td><?php echo e($product['code']); ?></td>
		</tr>
		<tr>
			<td style="width:150px; text-align: left;">Giá thuê</td>
			<td><?php echo e(number_format($product['price'],0,',','.')); ?></td>
		</tr>
		<?php if($product['domain']): ?>
		<tr>
			<td style="width:150px; text-align: left;">Domain</td>
			<td><?php echo e($product['domain']); ?></td>
		</tr>
		<?php endif; ?>
		<tr>
			<td style="width:150px; text-align: left;">Hosting</td>
			<td><?php echo e($product['hosting']); ?></td>
		</tr>
		<tr>
			<td style="width:150px; text-align: left;">Thời hạn</td>
			<td><?php echo e($product['qty']); ?> năm</td>
		</tr>
	</table>
</div>
<?php $__env->startComponent('mail::panel'); ?>
<p style="text-align: center;">Tổng đơn hàng: <b><?php echo e(number_format($order->total, 0, ',', '.')); ?> đ</b></p>
<?php echo $__env->renderComponent(); ?>

Thanks,<br>
<?php echo e(config('app.name')); ?>


<?php echo $__env->renderComponent(); ?>