@extends('frontend.default.master')
@section('content')
<!-- PAGE SECTION START -->
<div class="page-section section pt-100 pb-60">
    <div class="container">
        <div class="row mb-40">
            <div class="col-xs-12 col-sm-6 col-md-4 mb-40">	
                <!-- Tab panes -->
                <div class="tab-content mb-10">
                    <div class="pro-large-img tab-pane active" id="pro-large-img-0">
                        <img src="{{ asset('public/uploads/products/'.$product->image) }}" alt="{{ $product->alt }}" />
                    </div>
                    @forelse($images as $key=> $image)
                    <div class="pro-large-img tab-pane" id="pro-large-img-{{ ++$key }}">
                        <img src="{{ asset('public/uploads/products/'.$image->image) }}" alt="{{ $image->alt }}" />
                    </div>
                    @empty
                    @endforelse
                </div>
                <!-- Nav tabs -->
                <div class="pro-thumb-img-slider">
                    <div><a href="#pro-large-img-0" data-toggle="tab"><img src="{{ asset('public/uploads/products/'.get_thumbnail($product->image,'_small')) }}" alt="{{ $product->alt }}" /></a></div>
                    @forelse($images as $key=> $image)
                    <div><a href="#pro-large-img-{{ ++$key }}" data-toggle="tab"><img src="{{ asset('public/uploads/products/'.$image->image) }}" alt="{{ $image->alt }}" /></a></div>
                    @empty
                    @endforelse
                </div>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-8 mb-40">
                <div class="product-details">
                    <h2 class="title">{{ $product->title }}</h2>
                    <span class="price section">{!! get_template_product_price($product->regular_price,$product->sale_price) !!}</span>
                    <span class="availability section"> <strong>{{ __('site.product_code') }}:</strong> {{ $product->code }}</span>
                    <!--<span class="availability section"><strong>available:</strong> <span class="in"><i class="fa fa-check"></i> In Stock</span><span class="out"><i class="fa fa-times"></i> Out of Stock</span></span>-->
                    @forelse($attributes as $attribute)
                        @if( $attribute['name'] !== null && $attribute['value'] !== null )
                        <span class="availability section"> <strong>{{ $attribute['name'] }}:</strong> {{ $attribute['value'] }}</span>
                        @endif
                    @empty
                    @endforelse
                    <div class="short-desc section">
                        {{ $product->description }}
                    </div>
                    <div class="color-list section">
                        @forelse($colors as $key => $color)
                        <button {!! ($key == 0) ? 'class="active"' : '' !!} style="background-color: {{ $color->value }};" data-id="{{ $color->id }}" ><i class="fa fa-check"></i></button>
                        @empty
                        @endforelse
                    </div>
                    <div class="size-list section">
                        @forelse($sizes as $key => $size)
                        <button {!! ($key == 0) ? 'class="active"' : '' !!} data-id="{{ $size->id }}" ><i class="fa fa-check"></i> {{ $size->title }} </button>
                        @empty
                        @endforelse
                    </div>
                    <div class="quantity-cart section">
                        <div class="product-quantity">
                            <input type="text" value="1">
                        </div>
                        <button id="add-to-cart" data-ajax="id={{ $product->id }}">{{ __('cart.add_to_cart') }}</button>
                    </div>
                    <div class="share-icons section">
                        <a target="_blank" class="facebook" href="https://www.facebook.com/sharer/sharer.php?u={{ url()->current() }}"><i class="fa fa-facebook"></i>  facebook</a>
                        <a target="_blank" class="twitter" href="https://twitter.com/home?status={{ url()->current() }}"><i class="fa fa-twitter"></i>  twitter</a>
                        <a target="_blank" class="google" href="https://plus.google.com/share?url={{ url()->current() }}"><i class="fa fa-google-plus"></i>  google</a>
                        <a target="_blank" class="pinterest" href="https://pinterest.com/pin/create/button/?url={{ url()->current() }}&media={{ asset('public/uploads/products/'.$product->image) }}&description={{ $product->description }}"><i class="fa fa-pinterest"></i>  pinterest</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <!-- Nav tabs -->
            <div class="col-xs-12">
                <ul class="pro-info-tab-list section">
                    <li class="active"><a href="#more-info" data-toggle="tab">{{ __('site.product_detail') }}</a></li>
                    <li><a href="#reviews" data-toggle="tab">{{ __('site.comment') }}</a></li>
                </ul>
            </div>
            <!-- Tab panes -->
            <div class="tab-content col-xs-12">
                <div class="pro-info-tab tab-pane active" id="more-info">
                    {!! $product->contents !!}
                </div>
                <div class="pro-info-tab tab-pane" id="reviews">
                    <!-- Comments Wrapper -->
                    @include('frontend.default.blocks.comment')
                </div>
            </div>		
        </div>
    </div>
</div>
<!-- PAGE SECTION END -->
    
<!-- PRODUCT SECTION START -->
<div class="product-section section pb-100">
    <div class="container">
        <div class="row">
            <div class="section-title text-center col-xs-12 mb-70">
                <h2>{{ __('site.product_other') }}</h2>
            </div>
        </div>
        <div class="row">
            <div class="product-slider product-slider-4">
                @forelse($products as $product)
                    {!! get_template_product($product,$type,1) !!}
                @empty
                @endforelse
            </div>
        </div>
    </div>
</div>
<!-- PRODUCT SECTION END --> 
@endsection