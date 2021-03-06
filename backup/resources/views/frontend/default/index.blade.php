@extends('frontend.default.master')
@section('content')
<!-- PRODUCT SECTION START -->
<div class="product-section section pb-60">
    <div class="container">
        <div class="row">
            <div class="section-title text-center col-xs-12 mb-70">
                <h2>Sản phẩm mới</h2>
            </div>
        </div>
        <div class="row display-flex">
            @forelse($new_products as $product)
                {!! get_template_product($product,'san-pham',4) !!}
            @empty
            @endforelse
        </div>
    </div>
</div>
<!-- PRODUCT SECTION END -->

<!-- TESTIMONIAL SECTION START -->
<div class="testimonial-section section pt-100 pb-100">
    <div class="container">
        <div class="row">
            <div class="col-md-10 col-md-offset-1 col-xs-12">
                <!-- Testimonial Slider -->
                <div class="testimonial-slider text-center">
                    @forelse($customers as $customer)
                    <div class="single-testimonial">
                        <img src="{{ asset('public/uploads/post/'.get_thumbnail($customer->image)) }}" alt="{{ $customer->alt }}">
                        <p>“ {{ substr($customer->description,0,150) }} ”</p>
                        <i class="pe-7s-way"></i>
                        <h5>{{ $customer->title }}</h5>
                    </div>
                    @empty
                    @endforelse
                </div>
            </div>
        </div>
    </div>
</div>
<!-- TESTIMONIAL SECTION END -->

<!-- BLOG SECTION START -->
<div class="blog-section section pt-100 pb-60">
    <div class="container">
        <div class="row">
            <div class="section-title text-center col-xs-12 mb-70">
                <h2>Tin tức & Sự kiện</h2>
            </div>
        </div>
        <div class="row display-flex">
            @forelse($new_posts as $post)
                {!! get_template_post($post,'tin-tuc',3) !!}
            @empty
            @endforelse
        </div>
    </div>
</div>
<!-- BLOG SECTION END -->
@endsection