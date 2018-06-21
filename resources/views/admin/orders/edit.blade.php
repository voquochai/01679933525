@extends('admin.app')
@section('breadcrumb')
<li>
    <a href="{{ route('admin.order.index', ['type'=>$type]) }}"> {{ $pageTitle }} </a>
    <i class="fa fa-circle"></i>
</li>
<li>
    <span>Chỉnh sửa</span>
</li>
@endsection
@section('content')
<div class="row" id="qh-app">
    @include('admin.blocks.messages')
    <!-- BEGIN FORM-->
    <form role="form" method="POST" action="{{ route('admin.order.update',['id'=>$item->id,'type'=>$type]) }}">
        {{ csrf_field() }}
        {{ method_field('put') }}
        <input type="hidden" name="redirects_to" value="{{ (old('redirects_to')) ? old('redirects_to') : url()->previous() }}" />
        <div class="col-lg-9 col-xs-12"> 
            <div class="portlet box green">
                <div class="portlet-title">
                    <div class="caption"> Chỉnh sửa </div>
                </div>
                <div class="portlet-body">
                    <div class="form-group">
                        <div class="input-group select2-bootstrap-append">
                            <select id="select2-button-addons-single-input-group-sm" class="form-control select2-data-ajax"  multiple="" data-url="{{ route('admin.wms_import.ajax',['type'=>'default']) }}">
                            </select>
                            <span class="input-group-btn"> <button v-on:click="addProduct" type="button" id="btn-select" class="btn btn-info"> Chọn </button> </span>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <qh-products></qh-products>
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
                            <input type="text" class="form-control" value="{{ $item->code }}" disabled>
                        </div>
                    </div>
                    @if($item->coupon_code !== null)
                    <div class="form-group">
                        <label class="control-label">Mã coupon</label>
                        <div>
                            <input type="text" class="form-control" value="{{ $item->coupon_code }}" disabled>
                        </div>
                    </div>
                    @endif

                    <div class="form-group">
                        <label class="control-label">Giảm giá</label>
                        <div class="input-group">
                            <input type="text" name="coupon_amount" class="form-control" v-model.number="coupon_amount">
                            <span class="input-group-addon"> Đ </span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label">Phí vận chuyển</label>
                        <div class="input-group">
                            <input type="text" name="shipping" class="form-control" v-model.number="shipping">
                            <span class="input-group-addon"> Đ </span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label">Tổng đơn hàng</label>
                        <div class="input-group">
                            <input type="text" name="total" class="form-control" v-model="formatPrice(total)" disabled>
                            <span class="input-group-addon"> Đ </span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label">Hình thức thanh toán</label>
                        <input type="text" name="data[payment]" class="form-control" value="{{ $item->payment }}" disabled>
                    </div>

                    <div class="form-group">
                        <label class="control-label">Ghi chú</label>
                        <div>
                            <textarea name="data[note]" class="form-control" rows="5">{{ $item->note }}</textarea>
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

@section('custom_script')
<script type="text/x-template" id="select2-data-template">
    <table class="table table-bordered table-condensed">
        <thead>
            <tr>
                <th width="7%"> Mã SP </th>
                <th width="15%"> Tên sản phẩm </th>
                <th width="7%"> Màu sắc </th>
                <th width="7%"> Kích cỡ </th>
                <th width="8%"> Giá bán </th>
                <th width="6%"> Số lượng </th>
                <th width="10%"> Thành tiền </th>
                <th width="3%"> Xóa </th>
            </tr>
        </thead>
        <tbody>
            <tr v-for="(item, key) in products" >
                <td align="center">
                    <input type="hidden" :name="'products['+ key +'][id]'" v-model="item.product_id">
                    <input type="hidden" :name="'products['+ key +'][code]'" v-model="item.product_code">
                    <input type="hidden" :name="'products['+ key +'][title]'" v-model="item.product_title">
                    <input type="hidden" :name="'products['+ key +'][price]'" v-model="item.product_price">
                    <input type="hidden" :name="'products['+ key +'][color_id]'" v-model="item.color_id">
                    <input type="hidden" :name="'products['+ key +'][size_id]'" v-model="item.size_id">
                    <input type="hidden" :name="'products['+ key +'][color_title]'" v-model="item.color_title">
                    <input type="hidden" :name="'products['+ key +'][size_title]'" v-model="item.size_title">
                    @{{ item.product_code }}
                </td>
                <td>@{{ item.product_title }}</td>
                <td align="center">@{{ item.color_title }}</td>
                <td align="center">@{{ item.size_title }}</td>
                <td align="center"> @{{ formatPrice(item.product_price) }} </td>
                <td align="center"> <input type="text" :name="'products['+ key +'][qty]'" :class="'form-control validate[required,min[1]]'" v-model.number="item.product_qty"> </td>
                <td align="center"> <span> @{{ formatPrice(subtotal[key]) }} </span> </td>
                <td align="center"> <button type="button" v-on:click="deleteProduct(item)" class="btn btn-sm btn-danger"><i class="fa fa-close"></i></button> </td>
            </tr>
            <tr>
                <td align="right" colspan="30"> Tổng: <span class="font-red-mint font-md bold"> @{{ formatPrice(total) }} đ</span> </td>
            </tr>
        </tbody>
    </table>
</script>
@php
    $products = $products ? json_encode($products) : null;
@endphp
<script type="text/javascript">
    
    new Vue({
        el: '#qh-app',
        data: function () {
            var products = [];
            @if($products)
                products = {!! $products !!};
            @endif
            return {
                coupon_amount: {{ $item->coupon_amount }},
                shipping: {{ $item->shipping }},
                products: products
            };
        },
        computed: {
            total() {
                return this.products.reduce((total, item) => {
                    return total + (item.product_qty * item.product_price);
                }, 0) + this.shipping - this.coupon_amount;
            }
        },
        components: {
            'qh-products': {
                template: '#select2-data-template',
                data: function () {
                    return {
                        products: this.$parent.products
                    };
                },
                computed: {
                    subtotal() {
                        return this.products.map((item) => {
                            return Number( item.product_qty * item.product_price )
                        });
                    },
                    total() {
                        return this.products.reduce((total, item) => {
                            return total + (item.product_qty * item.product_price);
                        }, 0);
                    }
                },
                methods: {
                    deleteProduct: function (item) {
                        this.products.splice(this.products.indexOf(item) ,1);
                    },
                    formatPrice(value) {
                        let val = (value/1).toFixed(0).replace('.', ',')
                        return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".")
                    }
                    
                }
            }
        },
        methods: {
            formatPrice(value) {
                let val = (value/1).toFixed(0).replace('.', ',')
                return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".")
            },
            addProduct: function () {
                var select2data = $(".select2-data-ajax").select2("data");
                for (var i = 0; i < select2data.length; i++) {
                    var flag = false;
                    for (var j = 0; j < this.products.length; j++) {
                        if( this.products[j].product_id == select2data[i].product_id && this.products[j].color_id == select2data[i].color_id && this.products[j].size_id == select2data[i].size_id ){
                            flag = true;
                            break;
                        }
                    }
                    if(!flag){
                        this.products.push({
                            "id": select2data[i].id,
                            "product_id": select2data[i].product_id,
                            "product_code": select2data[i].product_code,
                            "product_price": select2data[i].product_price,
                            "product_title": select2data[i].title,
                            "product_qty": select2data[i].product_qty,
                            "color_id": select2data[i].color_id,
                            "size_id": select2data[i].size_id,
                            "color_title": select2data[i].color_title,
                            "size_title": select2data[i].size_title
                        });
                    }
                }
            }
        }
    });
</script>
@endsection