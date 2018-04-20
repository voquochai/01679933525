@extends('frontend.default.master')
@section('content')
<!-- PAGE SECTION START -->
<div class="page-section section pt-100 pb-60">
    <div class="container">
        <div class="row">
            <div class="col-lg-9 col-md-8 col-xs-12">
                <div class="row">
                    @forelse($posts as $post)
                        {!! get_template_post($post,$type,2) !!}
                    @empty
                    @endforelse
                </div>
                <div class="page-pagination text-center col-xs-12 fix mb-40">
                	{{ $posts->links('frontend.default.blocks.paginate') }}
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