<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="<?php echo e(asset('public/css/excel-default.css')); ?>" rel="stylesheet" type="text/css">
	
</head>
<body>
<table>
	<tr class="row-title">
		<td class="col-title"> Mã SP </td>
		<td class="col-title"> Tên sản phẩm </td>
		<td class="col-title"> Giá gốc </td>
		<td class="col-title"> Giá bán </td>
		<td class="col-title"> Giá khuyến mãi </td>
		<td class="col-title"> Trọng lượng(Gram) </td>
	</tr>
	<?php $__empty_1 = true; $__currentLoopData = $data; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $val): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
	<tr class="row">
		<td class="col"> <?php echo e($val->code); ?> </td>
		<td class="col"> <?php echo e($val->title); ?> </td>
		<td class="col"> <?php echo e((int)$val->original_price); ?> </td>
		<td class="col"> <?php echo e((int)$val->regular_price); ?> </td>
		<td class="col"> <?php echo e((int)$val->sale_price); ?> </td>
		<td class="col"> <?php echo e((int)$val->weight); ?> </td>
	</tr>
	<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
	<?php endif; ?>
</table>
</body>
</html>