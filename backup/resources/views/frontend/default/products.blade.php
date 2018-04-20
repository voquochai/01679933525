@extends('frontend.default.master')
@section('content')
<!-- PAGE SECTION START -->
<div class="page-section section pt-100 pb-60">
    <div class="container">
        <div class="row">
            <div class="col-lg-9 col-md-8 col-xs-12 float-right">
                <div class="row display-flex">
                    @forelse($products as $product)
                        {!! get_template_product($product,$type,3) !!}
                    @empty
                    <div class="col-xs-12"><p> Sản phẩm chưa cập nhật </p></div>
                    @endforelse
                </div>
                <div class="page-pagination text-center col-xs-12 fix mb-40">
                	{{ $products->links('frontend.default.layouts.paginate') }}
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-xs-12">
                @include('frontend.default.layouts.sidebar')
            </div>
        </div>
    </div>
</div>
<!-- PAGE SECTION END -->
@endsection