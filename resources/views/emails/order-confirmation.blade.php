@component('mail::message')

@component('mail::panel')
Cám ơn bạn đã đặt hàng tại website chúng tôi
@endcomponent

<hr>
<p> Đơn hàng #{{ $order->code }} của bạn bao gồm các sản phẩm sau đây:</p>

<div class="table">
	<table>
		<tr>
			<th colspan="2">{{ $product['product_title'] }}</th>
		</tr>
		<tr>
			<td style="width:150px; text-align: left;">Mã số</td>
			<td>{{ $product['product_code'] }}</td>
		</tr>
		<tr>
			<td style="width:150px; text-align: left;">Giá thuê</td>
			<td>{{ number_format($product['product_price'],0,',','.') }}</td>
		</tr>
		@if($product['size_title'])
		<tr>
			<td style="width:150px; text-align: left;">Domain</td>
			<td>{{ $product['size_title'] }}</td>
		</tr>
		@endif
		<tr>
			<td style="width:150px; text-align: left;">Hosting</td>
			<td>{{ $product['color_title'] }}</td>
		</tr>
		<tr>
			<td style="width:150px; text-align: left;">Thời hạn</td>
			<td>{{ $product['product_qty'] }} năm</td>
		</tr>
	</table>
</div>
@component('mail::panel')
<p style="text-align: center;">Tổng đơn hàng: <b>{{ number_format($order->order_price, 0, ',', '.') }} đ</b></p>
@endcomponent

Thanks,<br>
{{ config('app.name') }}

@endcomponent