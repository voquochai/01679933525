@component('mail::message')

@component('mail::panel')
Cám ơn bạn đã đặt hàng tại website chúng tôi
@endcomponent

<hr>
<p> Đơn hàng #{{ $order->code }} của bạn bao gồm các sản phẩm sau đây:</p>

<div class="table">
	<table>
		<tr>
			<th colspan="2">{{ $product['title'] }}</th>
		</tr>
		<tr>
			<td style="width:150px; text-align: left;">Mã số</td>
			<td>{{ $product['code'] }}</td>
		</tr>
		<tr>
			<td style="width:150px; text-align: left;">Giá thuê</td>
			<td>{{ number_format($product['price'],0,',','.') }}</td>
		</tr>
		@if($product['domain'])
		<tr>
			<td style="width:150px; text-align: left;">Domain</td>
			<td>{{ $product['domain'] }}</td>
		</tr>
		@endif
		<tr>
			<td style="width:150px; text-align: left;">Hosting</td>
			<td>{{ $product['hosting'] }}</td>
		</tr>
		<tr>
			<td style="width:150px; text-align: left;">Thời hạn</td>
			<td>{{ $product['qty'] }} năm</td>
		</tr>
	</table>
</div>
@component('mail::panel')
<p style="text-align: center;">Tổng đơn hàng: <b>{{ number_format($order->total, 0, ',', '.') }} đ</b></p>
@endcomponent

Thanks,<br>
{{ config('app.name') }}

@endcomponent