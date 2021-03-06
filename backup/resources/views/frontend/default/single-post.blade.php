@extends('frontend.default.master')
@section('content')
<!-- PAGE SECTION START -->
<div class="page-section section pt-100 pb-60">
    <div class="container">
        <div class="row">
            <div class="col-lg-9 col-md-8 col-xs-12">
                <!-- Single Blog Post -->
                <div class="single-blog-post">
                    <div class="blog-img">
                        <img alt="" src="{{ asset('public/uploads/post/'.$post->image) }}">
                    </div>
                    <div class="blog-info">
                        <h3 class="title">{{ $post->title }}</h3>
                        <div class="blog-meta">
                            <span><a href="#"><i class="fa fa-user"></i> {{ $author }} </a></span>
                            <span><a href="#"><i class="fa fa-tags"></i> {{ $category }} </a></span>
                            <span><a href="#"><i class="fa fa-comments"></i> 4 Comments</a></span>
                            <span><a href="#"><i class="fa fa-eye"></i> views ({{ $post->viewed+1 }})</a></span>
                        </div>
                        {!! $post->contents !!}						
                    </div>
                </div>
                <!-- Comments Wrapper -->
                @include('frontend.default.layouts.comment')
            </div>
            <div class="col-lg-3 col-md-4 col-xs-12">
                @include('frontend.default.layouts.sidebar')
            </div>
        </div>
    </div>
</div>
<!-- PAGE SECTION END -->
@endsection