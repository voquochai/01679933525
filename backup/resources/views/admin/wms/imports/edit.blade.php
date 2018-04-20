@extends('admin.app')
@section('breadcrumb')
<li>
    <a href="{{ route('wms_import.index', ['type'=>$type]) }}"> {{ $pageTitle }} </a>
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
    <form role="form" method="POST" action="{{ route('wms_import.update',['id'=>$item->id,'type'=>$type]) }}" class="form-validation">
        {{ csrf_field() }}
        {{ method_field('put') }}
        <input type="hidden" name="redirects_to" value="{{ (old('redirects_to')) ? old('redirects_to') : url()->previous() }}" />
        <div class="col-lg-9 col-xs-12" id="qh-app"> 
            <div class="portlet box green">
                <div class="portlet-title">
                    <div class="caption"> Chỉnh sửa </div>
                </div>
                <div class="portlet-body">
                    <div class="form-group">
                        <div class="input-group select2-bootstrap-append">
                            <select id="select2-button-addons-single-input-group-sm" class="form-control select2-data-ajax"  multiple="" data-url="{{ route('product.ajax',['type'=>'san-pham']) }}">
                            </select>
                            <span class="input-group-btn"> <button v-on:click="addProduct" type="button" id="btn-select" class="btn btn-info"> Chọn </button> </span>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <qh-products></qh-products>
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
                    {{--
                    <div class="form-group">
                        <label class="control-label"> Kho hàng </label>
                        <div>
                            <select name="data[store_code]" class="selectpicker show-tick show-menu-arrow form-control">
                                <option value=""> -- Chọn kho hàng -- </option>
                                @forelse($warehouses as $warehouse)
                                <option value="{{ $warehouse->code }}" {{ (($warehouse->code == $item->store_code) ? 'selected' : '') }} > {{ $warehouse->name }} </option>
                                @empty
                                @endforelse
                            </select>
                        </div>
                    </div>
                    --}}
                    <div class="form-group">
                        <label class="control-label">Mã Phiếu</label>
                        <div>
                            <input type="text" name="data[code]" class="form-control" value="{{ $item->code }}" readonly="">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label">Tình trạng</label>
                        <div>
                            <select class="selectpicker show-tick show-menu-arrow form-control" name="status[]" multiple>
                                <optgroup >
                                    @foreach($siteconfig[$type]['status'] as $key => $val)
                                    <option value="{{ $key }}" {{ (strpos($item->status,$key) !== false)?'selected':'' }} > {{ $val }} </option>
                                    @endforeach
                                </optgroup>
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


@section('script_bottom')
<script type="text/x-template" id="select2-data-template">
    <table class="table table-bordered table-condensed">
        <thead>
            <tr>
                <th width="15%"> Sản phẩm </th>
                <th width="7%"> Màu sắc </th>
                <th width="7%"> Kích cỡ </th>
                <th width="8%"> Giá vốn </th>
                <th width="6%"> Số lượng </th>
                <th width="10%"> Thành tiền </th>
                <th width="3%"> Xóa </th>
            </tr>
        </thead>
        <tbody>
            <tr v-for="(item, key) in products" >
                <td>
                    <input type="hidden" :name="'products['+ key +'][id]'" v-model="item.id">
                    <input type="hidden" :name="'products['+ key +'][code]'" v-model="item.code">
                    @{{ item.title }}
                </td>
                <td align="center">
                    <select v-if="item.colors" :name="'products['+ key +'][color]'" class="form-control">
                        <option v-for="(color, keyC) in item.colors" :value="'' + color.id + ''" :selected="item.color && item.color == color.id" > @{{ color.title }} </option>
                    </select>
                </td>
                <td align="center">
                    <select v-if="item.sizes" :name="'products['+ key +'][size]'" class="form-control">
                        <option v-for="(size, keyS) in item.sizes" :value="'' + size.id + ''"> @{{ size.title }} </option>
                    </select>
                </td>
                <td align="center"> <input type="text" :name="'products['+ key +'][price]'" class="form-control validate[required,min[1]]" v-model.number="item.price"> </td>
                <td align="center"> <input type="text" :name="'products['+ key +'][qty]'" class="form-control validate[required,min[1]]" v-model.number="item.qty"> </td>
                <td align="center"> <span> @{{ formatPrice(subtotal[key]) }} </span> </td>
                <td align="center"> <button type="button" v-on:click="deleteProduct(item)" class="btn btn-sm btn-danger"><i class="fa fa-close"></i></button> </td>
            </tr>
            <tr>
                <td align="right" colspan="30"> Tổng: <span class="font-red-mint font-md bold"> @{{ formatPrice(total) }} </span> </td>
            </tr>
        </tbody>
    </table>
</script>
<script type="text/javascript">
    @php
    $products = $products ? json_encode($products) : null;
    @endphp
    new Vue({
        el: '#qh-app',
        data: function () {
            var products = [];
            @if($products)
                products = {!! $products !!};
            @endif
            return {
                products: products
            };
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
                            return Number( item.qty * item.price )
                        });
                    },
                    total() {
                        return this.products.reduce((total, item) => {
                            return total + item.qty * item.price;
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
            addProduct: function () {
                var select2data = $(".select2-data-ajax").select2("data");
                for (var i = 0; i < select2data.length; i++) {
                    this.products.push({
                        "id": select2data[i].id,
                        "code": select2data[i].code,
                        "price": select2data[i].price,
                        "title": select2data[i].title,
                        "qty": select2data[i].qty,
                        "colors": select2data[i].colors,
                        "sizes": select2data[i].sizes
                    });
                }
            }
        }
    });
</script>
@endsection