@extends('admin.app')
@section('breadcrumb')
<li>
    <a href="{{ route('order.index', ['type'=>$type]) }}"> {{ $pageTitle }} </a>
    <i class="fa fa-circle"></i>
</li>
<li>
    <span>Chỉnh sửa</span>
</li>
@endsection
@section('content')
<div class="row">
    @include('admin.blocks.messages')
    <!-- BEGIN FORM-->
    <form role="form" method="POST" action="{{ route('order.update',['id'=>$item->id,'type'=>$type]) }}" >
        {{ csrf_field() }}
        {{ method_field('put') }}
        <input type="hidden" name="redirects_to" value="{{ (old('redirects_to')) ? old('redirects_to') : url()->previous() }}" />
        <div class="col-lg-9 col-xs-12"> 
            <div class="portlet box green">
                <div class="portlet-title">
                    <div class="caption"> Chi tiết đơn hàng </div>
                </div>
                <div class="portlet-body">
                    <div class="table-responsive">
                        <table class="table table-bordered table-striped table-condensed">
                            <thead>
                                <tr class="active">
                                    <th class="pro-id">ID</th>
                                    <th class="pro-title">SẢN PHẨM</th>
                                    <th class="pro-price">GIÁ BÁN (VND)</th>
                                    <th class="pro-quantity">SỐ LƯỢNG</th>
                                    <th class="pro-subtotal">TỔNG (VND)</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($product_id as $key => $id)
                                <tr class="pro-{{ $id }}">
                                    <td align="center">{{ $product_name[$key]->product_id }} </td>
                                    <td align="left">{{ $product_name[$key]->title }} </td>
                                    <td align="center">{{ number_format($product_price[$key],0,',','.') }}</td>
                                    <td align="center">{{ $product_qty[$key] }}</td>
                                    <td align="center">{{ number_format($product_price[$key]*$product_qty[$key],0,',','.') }}</td>
                                </tr>
                                @empty
                                <tr> <td colspan="30"> Hiện không có sản phẩm trong giỏ hàng </td> </tr>
                                @endforelse
                                <tr class="info">
                                    <td align="right" colspan="3"> Tổng tiền </td>
                                    <td align="center"> {{ number_format($item->total,0,',','.') }} </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="portlet box green">
                <div class="portlet-title">
                    <div class="caption"> Khách hàng </div>
                </div>
                <div class="portlet-body">
                    <div class="form-group">
                        <label class="control-label">Họ và tên</label>
                        <div>
                            <input type="text" name="data[name]" class="form-control" value="{{ $item->name }}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Email</label>
                        <div>
                            <input type="text" name="data[email]" class="form-control" value="{{ $item->email }}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Điện thoại</label>
                        <div>
                            <input type="text" name="data[phone]" class="form-control" value="{{ $item->phone }}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Địa chỉ</label>
                        <div>
                            <input type="text" name="data[address]" class="form-control" value="{{ $item->address }}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Tỉnh / Thành phố</label>
                        <div>
                            <select class="form-control province" name="data[province_id]">
                                <option value="{{ $item->province_id }}" selected ></option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Quận / Huyện</label>
                        <div>
                            <select class="form-control district" name="data[district_id]">
                                <option value="{{ $item->district_id }}" selected ></option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-xs-12">
            <div class="portlet box green">
                <div class="portlet-title">
                    <div class="caption">Thông tin chung </div>
                </div>
                <div class="portlet-body">

                    <div class="form-group">
                        <label class="control-label">Mã đơn hàng</label>
                        <div>
                            <input type="text" name="data[code]" class="form-control" value="{{ $item->code }}" disabled>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label">Ghi chú</label>
                        <div>
                            <textarea name="data[note]" class="form-control" rows="5"> {{ $item->note }} </textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label">Phí vận chuyển</label>
                        <div class="input-group">
                            <input type="text" name="shipping" class="form-control priceFormat" value="{{ $item->shipping }}">
                            <span class="input-group-addon"> VNĐ </span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label">Tổng tiền</label>
                        <div class="input-group">
                            <input type="text" name="total" class="form-control priceFormat" value="{{ $item->total }}" disabled>
                            <span class="input-group-addon"> VNĐ </span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label">Tình trạng</label>
                        <div>
                            <select class="selectpicker show-tick show-menu-arrow form-control" name="data[status_id]">
                                @foreach( config('siteconfig.order_site_status') as $key => $val)
                                <option value="{{ $key }}" {{ ($item->status_id == $key) ? 'selected' : '' }} > {{ $val }} </option>
                                @endforeach
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label">Thứ tự</label>
                        <div>
                            <input type="text" name="priority" value="{{ $item->priority }}" class="form-control priceFormat">
                        </div>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn green"> <i class="fa fa-check"></i> Lưu</button>
                        <a href="{{ url()->previous() }}" class="btn default" > Thoát </a>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
@endsection