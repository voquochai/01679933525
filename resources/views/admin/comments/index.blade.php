@extends('admin.app')
@section('breadcrumb')
<li>
    <span> {{ $pageTitle }} </span>
</li>
@endsection
@section('content')
<div class="row">
	@include('admin.blocks.messages')
	<div class="col-md-12">
        <div class="profile-sidebar">
            <div class="portlet light profile-sidebar-portlet">
                <div class="profile-usertitle">
                    <div class="profile-usertitle-name"> Bình luận </div>
                </div>
                <div class="profile-userbuttons">
                    <button type="button" class="btn btn-circle green btn-sm">Mới nhất</button>
                    <button type="button" class="btn btn-circle default btn-sm">Chưa duyệt</button>
                </div>
                <div class="profile-usermenu">
                    <ul class="nav">
                        @forelse($items as $item)
                        <li id="record-{{ $item->product_id }}">
                            <a href="#">{{ $item->title }} <span class="badge badge-success">{{ $item->sum }}</span></a>
                        </li>
                        @empty
                        <li> <a href="#">Không có bản dữ liệu trong bảng</a> </li>
                        @endforelse
                    </ul>
                </div>
            </div>
        </div>
        <div class="profile-content">
            <div class="portlet light portlet-fit ">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="icon-bubble font-green"></i>
                        <span class="caption-subject bold font-green uppercase"> Bình luận</span>
                    </div>
                    <div class="actions">
                        <button type="button" class="btn btn-sm btn-circle red"> <i class="icon-trash"></i> Xóa </button>
                    </div>
                </div>
                <div class="portlet-body">
                </div>
            </div>
        </div>
    </div>
</div>
@endsection