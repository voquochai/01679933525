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
                        <img src="{{ asset('public/uploads/product/'.$product->image) }}" alt="$product->alt" />
                    </div>
                    @forelse($images as $key=> $image)
                    <div class="pro-large-img tab-pane" id="pro-large-img-{{ ++$key }}">
                        <img src="{{ asset('public/uploads/product/'.$image->image) }}" alt="$image->alt" />
                    </div>
                    @empty
                    @endforelse
                </div>
                <!-- Nav tabs -->
                <div class="pro-thumb-img-slider">
                    <div><a href="#pro-large-img-0" data-toggle="tab"><img src="{{ asset('public/uploads/product/'.get_thumbnail($product->image,'_small')) }}" alt="" /></a></div>
                    @forelse($images as $key=> $image)
                    <div><a href="#pro-large-img-{{ ++$key }}" data-toggle="tab"><img src="{{ asset('public/uploads/product/'.$image->image) }}" alt="$image->alt" /></a></div>
                    @empty
                    @endforelse
                </div>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-8 mb-40">
                <div class="product-details">
                    <h2 class="title">{{ $product->title }}</h2>
                    <span class="price section">{!! get_template_product_price($product->regular_price,$product->sale_price) !!}</span>
                    <span class="availability section"> <strong>Mã sản phẩm:</strong> {{ $product->code }}</span>
                    <!--<span class="availability section"><strong>available:</strong> <span class="in"><i class="fa fa-check"></i> In Stock</span><span class="out"><i class="fa fa-times"></i> Out of Stock</span></span>-->
                    @forelse($attributes as $attribute)
                    <span class="availability section"> <strong>{{ $attribute['name'] }}:</strong> {{ $attribute['value'] }}</span>
                    @empty
                    @endforelse
                    <div class="short-desc section">
                        {{ $product->description }}
                    </div>
                    <div class="color-list section">
                        @forelse($product_colors as $key => $color)
                        <button {!! ($key == 0) ? 'class="active"' : '' !!} style="background-color: {{ $color->value }};"><i class="fa fa-check"></i></button>
                        @empty
                        @endforelse
                    </div>
                    <ul class="usefull-link section">
                        <li><a href="#"><i class="pe-7s-mail"></i> Email to a Friend</a></li>
                        <li><a href="#"><i class="pe-7s-like"></i> Wishlist</a></li>
                        <li><a href="#"><i class="pe-7s-repeat"></i> Compare</a></li>
                    </ul>
                    <div class="quantity-cart section">
                        <div class="product-quantity">
                            <input type="text" value="1">
                        </div>
                        <button class="add-to-cart" data-ajax="id={{ $product->id }}">add to cart</button>
                    </div>
                    <div class="share-icons section">
                        <a class="twitter" href="#"><i class="fa fa-facebook"></i>  facebook</a>
                        <a class="facebook" href="#"><i class="fa fa-twitter"></i>  twitter</a>
                        <a class="google" href="#"><i class="fa fa-google-plus"></i>  linkedin</a>
                        <a class="pinterest" href="#"><i class="fa fa-pinterest"></i>  facebook</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <!-- Nav tabs -->
            <div class="col-xs-12">
                <ul class="pro-info-tab-list section">
                    <li class="active"><a href="#more-info" data-toggle="tab">More info</a></li>
                    <li><a href="#data-sheet" data-toggle="tab">Data sheet</a></li>
                    <li><a href="#reviews" data-toggle="tab">Reviews</a></li>
                </ul>
            </div>
            <!-- Tab panes -->
            <div class="tab-content col-xs-12">
                <div class="pro-info-tab tab-pane active" id="more-info">
                    {!! $product->contents !!}
                </div>
                <div class="pro-info-tab tab-pane" id="data-sheet">
                    <table class="table-data-sheet">
                        <tbody>
                            <tr class="odd">
                                <td>Compositions</td>
                                <td>Cotton</td>
                            </tr>
                            <tr class="even">
                                <td>Styles</td>
                                <td>Casual</td>
                            </tr>
                            <tr class="odd">
                                <td>Properties</td>
                                <td>Short Sleeve</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="pro-info-tab tab-pane" id="reviews">
                    <a href="#">Be the first to write your review!</a>
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
                <h2>related products</h2>
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