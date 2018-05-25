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
                <div class="sidebar">
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
                                    <input type="radio" name="hosting" {{ $host->regular_price == 0 ? 'checked' : '' }} >{{ $host->title }}
                                    <span></span>
                                    <div class="float-right">
                                        @if( $host->regular_price > 0 )
                                        {{ get_currency_vn($host->regular_price) }}
                                        @else
                                        Mặc định
                                        @endif
                                    </div>
                                </label>
                                @empty
                                @endforelse
                            </div>
                        </div>
                        <hr>
                        <div class="product-license">
                            <div class="float-left"> <label> Thời gian </label> </div>
                            <div class="float-right">
                                <select class="selectpicker">
                                    @for($i=1; $i<=5; $i++)
                                    <option value="{{ $i }}"> {{ $i.' năm' }} </option>
                                    @endfor
                                </select>
                            </div>
                        </div>
                        <hr>
                        <div class="product-total">
                            <div class="float-left"><label> Tổng tiền </label></div>
                            <div class="float-right"></div>
                        </div>
                        <button id="add-to-cart" class="btn btn-block btn-lg" data-ajax="id={{ $product->id }}">{{ __('cart.buy_now') }}</button>
                    </div>
                    {{--
                    <div class="sidebar-widget mb-40">
                        <div class="share-icons section">
                            <a target="_blank" class="facebook" href="https://www.facebook.com/sharer/sharer.php?u={{ url()->current() }}"><i class="fa fa-facebook"></i></a>
                            <a target="_blank" class="twitter" href="https://twitter.com/home?status={{ url()->current() }}"><i class="fa fa-twitter"></i></a>
                            <a target="_blank" class="google" href="https://plus.google.com/share?url={{ url()->current() }}"><i class="fa fa-google-plus"></i></a>
                            <a target="_blank" class="pinterest" href="https://pinterest.com/pin/create/button/?url={{ url()->current() }}&media={{ asset('public/uploads/products/'.$product->image) }}&description={{ $product->description }}"><i class="fa fa-pinterest"></i></a>
                        </div>
                    </div>--}}
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
            @forelse($products as $product)
                {!! get_template_product($product,$type,3) !!}
            @empty
            @endforelse
        </div>
    </div>
</section>
<!-- PRODUCT SECTION END --> 
@endsection