@extends('frontend.default.master')
@section('content')
<!-- PAGE SECTION START -->
<section class="page-section section pt-60 pb-60 wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
    <div class="container">
        <div class="row mb-40">
            <div class="col-md-8 col-sm-12 col-xs-12 mb-40">
                <div class="product-detail">
                    <h1 class="title">{{ $product->title }}</h1>
                    <div class="image">
                        <img src="{{ ( $product->image && file_exists(public_path('/uploads/products/'.$product->image)) ? asset( 'public/uploads/products/'.$product->image ) : asset('noimage/600x600') ) }}" alt="{{ $product->alt }}" />
                    </div>
                    <div class="content">
                        {!! $product->contents !!}
                    </div>
                    <!-- Comments Wrapper -->
                    @include('frontend.default.blocks.comment')
                </div>
            </div>
            <div class="col-md-4 col-sm-12 col-xs-12 mb-40">
                <div class="sidebar" id="app-cart">
                    <input type="hidden" name="product_price" :value="form.product_price">
                    
                    <div class="sidebar-widget mb-40">
                        <div class="product-attributes">
                            <ul>
                            @forelse($attributes as $attribute)
                                @if( $attribute['name'] !== null && $attribute['value'] !== null )
                                <li> {!! $attribute['name'].$attribute['value'] !!} </li>
                                @endif
                            @empty
                            @endforelse
                            </ul>
                        </div>
                    </div>
                    <div class="sidebar-widget mb-40">
                        <div class="product-price">
                            <div class="float-left"><label>{{ __('site.product_price') }}</label></div>
                            <div class="float-right">{!! get_template_product_price($product->regular_price,$product->sale_price) !!}</div>
                        </div>
                        <hr>
                        <div class="product-hosting">
                            <h5 class="title"> Gói hosting </h5>
                            <div class="mt-radio-list">
                                @forelse( $hosting as $host )
                                <label class="mt-radio">
                                    <input type="radio" name="hosting" v-model="form.product_hosting"  value="{{ $host->regular_price }}">{{ $host->title }}
                                    <span></span>
                                    <div class="float-right">{{ get_currency_vn($host->regular_price) }}</div>
                                </label>
                                @empty
                                @endforelse
                            </div>
                        </div>
                        <hr>
                        <div class="product-license">
                            <div class="float-left"> <label> Thời hạn </label> </div>
                            <div class="float-right">
                                <select class="selectpicker show-tick" name="license" v-model="form.product_license" >
                                    @for($i=1; $i<=5; $i++)
                                    <option value="{{ $i }}"> {{ $i.' năm' }} </option>
                                    @endfor
                                </select>
                            </div>
                        </div>
                        <hr>
                        <div class="product-total">
                            <div class="float-left"><label> Tổng tiền </label></div>
                            <div class="float-right"> <b class="font-red font-hg">@{{ formatPrice(total) }}</b> </div>
                        </div>
                        <button data-toggle="modal" data-target="#modal-product-detail" class="btn btn-block btn-lg uppercase" data-ajax="id={{ $product->id }}">Đăng ký</button>
                    </div>
                    <div id="modal-product-detail" class="modal fade" tabindex="-1" role="dialog">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                                    <h4 class="modal-title uppercase">{{ $product->title }}</h4>
                                </div>
                                <div class="modal-body">
                                    <div class="alert alert-success">
                                        Mã số: {{ $product->code }}</br>
                                        Giá thuê: @{{ formatPrice(form.product_price) }}</br>
                                        Gói hosting: @{{ formatPrice(form.product_hosting) }}</br>
                                        Thời hạn: @{{ form.product_license }} năm</br>
                                        <p class="text-right bold">Tổng tiền: <span class="font-red font-hg">@{{ formatPrice(total) }}</span></p>
                                    </div>
                                    <form>
                                        <input type="hidden" name="product_id" value="{{ $product->id }}">
                                        <input type="hidden" name="product_hosting" v-model="form.product_hosting">
                                        <input type="hidden" name="product_license" v-model="form.product_license">
                                        <input type="hidden" name="product_total" v-model="total">
                                        <h5 class="bold uppercase underline"> Thông tin khách hàng</h5>
                                        <div class="form-group">
                                            <label class="normal">Họ tên</label>
                                            <input type="text" name="name" class="form-control">
                                        </div>
                                        <div class="form-group no-margin">
                                            <div class="row">
                                                <div class="col-sm-5 col-xs-12 mb-15">
                                                    <label class="normal">Điện thoại</label>
                                                    <input type="text" name="phone" class="form-control">
                                                </div>
                                                <div class="col-sm-7 col-xs-12 mb-15">
                                                    <label class="normal">Email</label>
                                                    <input type="email" name="email" class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="normal">Ghi chú</label>
                                            <textarea name="note" class="form-control" rows="5" placeholder="Yêu cầu thêm"></textarea>
                                        </div>
                                        <div class="form-group no-margin text-right">
                                            <button type="button" class="btn" data-dismiss="modal">Thoát</button>
                                            <button type="button" class="btn btn-info btn-ajax" data-ajax="act=order|type=online">Thuê ngay</button>
                                        </div>
                                    </form>
                                </div>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal-dialog -->
                    </div><!-- /.modal -->
                </div>
            </div>
        </div>
    </div>
</section>
<!-- PAGE SECTION END -->
    
<!-- PRODUCT SECTION START -->
<section class="page-section section pb-60 wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
    <div class="container">
        <div class="row">
            <div class="section-title text-center col-xs-12 mb-70">
                <h2>{{ __('site.product_other') }}</h2>
            </div>
        </div>
        <div class="row display-flex">
            @forelse($products as $item)
                {!! get_template_product($item,$type,3) !!}
            @empty
            @endforelse
        </div>
    </div>
</section>
<!-- PRODUCT SECTION END --> 
@endsection

@section('custom_script')
<script src="{{ asset('public/packages/vue.js') }}" type="text/javascript"></script>
<script type="text/javascript">
    new Vue({
        el: '#app-cart',
        data: function () {
            return {
                form: {
                    @php
                    if($product->regular_price > 0 && $product->sale_price == 0){
                        echo 'product_price: '.$product->regular_price.',';
                    }else if($product->sale_price > 0){
                        echo 'product_price: '.$product->sale_price.',';
                    }else{
                        echo 'product_price: 0,';
                    }
                    @endphp
                    product_hosting: 0,
                    product_license: 1
                }
            }
        },
        computed: {
            total() {
                return ( Number(this.form.product_price) + Number(this.form.product_hosting) ) * Number(this.form.product_license);
            }
        },
        methods: {
            formatPrice(value) {
                let val = (value/1).toFixed(0).replace('.', ',');
                return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".") + ' đ';
            }
        }
    });
</script>
@endsection