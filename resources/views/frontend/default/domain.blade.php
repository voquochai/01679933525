@extends('frontend.default.master')
@section('content')
<!-- PAGE SECTION START -->
<section class="page-section section pt-60 pb-60 wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
    <div class="container">
        <div class="row">
            @include('frontend.default.blocks.messages')
            <div class="col-lg-9 col-md-8 col-xs-12 pull-right">
                <ul>
                    <li>abc</li>
                </ul>
            </div>
            <div class="col-lg-3 col-md-4 col-xs-12">
                @include('frontend.default.layouts.sidebar')
            </div>
        </div>
    </div>
</section>
<!-- PAGE SECTION END -->
@endsection