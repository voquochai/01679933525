@component('mail::message')

@component('mail::panel')
Hello! Bạn nhận được email liên hệ từ {{ config('app.name') }}
@endcomponent
<hr>
<p> Thông tin liên hệ bao gồm nội dung sau đây:</p>

<table>
	<tr>
		<th style="width:150px; text-align: left;">Họ và Tên</th>
		<td>{{ $contact['name'] }}</td>
	</tr>
	<tr>
		<th style="width:150px; text-align: left;">Email</th>
		<td>{{ $contact['email'] }}</td>
	</tr>
	<tr>
		<th style="width:150px; text-align: left;">Chủ đề</th>
		<td>{{ $contact['title'] }}</td>
	</tr>
	<tr>
		<th style="width:150px; text-align: left;">Tin nhắn</th>
		<td>{{ $contact['description'] }}</td>
	</tr>
</table>

Thanks,<br>
{{ config('app.name') }}

@endcomponent