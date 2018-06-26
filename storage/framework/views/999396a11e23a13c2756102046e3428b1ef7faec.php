<?php $__env->startComponent('mail::message'); ?>

<?php $__env->startComponent('mail::panel'); ?>
Cám ơn bạn đã đặt hàng tại website chúng tôi
<?php echo $__env->renderComponent(); ?>

<hr>
<p> Đơn hàng #<?php echo e($order->code); ?> của bạn bao gồm các sản phẩm sau đây:</p>

<div class="table">
	<table>
		<tr>
			<th colspan="2"><?php echo e($product['product_title']); ?></th>
		</tr>
		<tr>
			<td style="width:150px; text-align: left;">Mã số</td>
			<td><?php echo e($product['product_code']); ?></td>
		</tr>
		<tr>
			<td style="width:150px; text-align: left;">Giá thuê</td>
			<td><?php echo e(number_format($product['product_price'],0,',','.')); ?></td>
		</tr>
		<?php if($product['size_title']): ?>
		<tr>
			<td style="width:150px; text-align: left;">Domain</td>
			<td><?php echo e($product['size_title']); ?></td>
		</tr>
		<?php endif; ?>
		<tr>
			<td style="width:150px; text-align: left;">Hosting</td>
			<td><?php echo e($product['color_title']); ?></td>
		</tr>
		<tr>
			<td style="width:150px; text-align: left;">Thời hạn</td>
			<td><?php echo e($product['product_qty']); ?> năm</td>
		</tr>
	</table>
</div>
<?php $__env->startComponent('mail::panel'); ?>
<p style="text-align: center;">Tổng đơn hàng: <b><?php echo e(number_format($order->order_price, 0, ',', '.')); ?> đ</b></p>
<?php echo $__env->renderComponent(); ?>

Thanks,<br>
<?php echo e(config('app.name')); ?>


<?php echo $__env->renderComponent(); ?>