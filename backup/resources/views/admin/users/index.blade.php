@extends('admin.app')
@section('title') Thành viên @endsection
@section('content')
<div class="row">
	@include('admin.blocks.messages')
	<div class="col-md-12">
		<div class="portlet box green">
			<div class="portlet-title">
                <div class="caption">
                    <i class="icon-layers"></i>Danh sách
                </div>
                <div class="actions">
                    <a href="{{ route('user.create') }}" class="btn btn-sm btn-default"> Thêm mới </a>
                </div>
            </div>

            <div class="portlet-body">
            	<div class="table-responsive">
					<table class="table table-bordered table-condensed">
						<thead>
							<tr>
								<th width="1%">
                                    <label class="mt-checkbox mt-checkbox-single">
                                        <input type="checkbox" name="select" class="group-checkable">
                                        <span></span>
                                    </label>
                                </th>
								<th width="5%"> ID </th>
								<th width="30%">Họ tên</th>
								<th width="20%">Email</th>
								<th width="15%">Ngày tạo</th>
								<th width="15%">Ngày cập nhật</th>
								<th width="15%">Thực thi</th>
							</tr>
						</thead>
						<tbody>
							@forelse($items as $item)
							<tr>
								<td align="center">
                                    <label class="mt-checkbox mt-checkbox-single">
                                        <input type="checkbox" name="id[]" class="checkable">
                                        <span></span>
                                    </label>
                                </td>
								<td align="center">{{ $item->id }}</td>
								<td> <a href="{{ route('user.edit',['id'=>$item->id]) }}" title="Chỉnh sửa"> {{ $item->name }} </a> </td>
								<td align="center">{{ $item->email }}</td>
								<td align="center">{{ $item->created_at }}</td>
								<td align="center">{{ $item->updated_at }}</td>
								<td align="center">
									<a href="{{ route('user.edit',['id'=>$item->id]) }}" class="btn btn-sm blue" title="Chỉnh sửa"> <i class="fa fa-edit"></i> </a>
		                            <form action="{{ route('user.delete',['id'=>$item->id]) }} " method="post">
		                                {{ csrf_field() }}
		                                {{ method_field('DELETE')}}
		                                <button type="button" class="btn btn-sm btn-delete red" title="Xóa"> <i class="fa fa-times"></i> </button>
		                            </form>
								</td>
							</tr>
							@empty
							<tr>
								<td colspan="30" align="center"> Không có bản dữ liệu trong bảng </td>
							</tr>
							@endforelse
						</tbody>
					</table>
				</div>
				<div class="text-center"> {{ $items->links() }} </div>
            </div>
		</div>
	</div>
</div>
@endsection