@extends('frontend.default.master')
@section('content')
<!-- CRITERIA SECTION START -->
<div class="criteria-section section ptb-60">
    <div class="container">
        <div class="row">
            <div class="section-title text-center col-xs-12 mb-70">
                <h2> Tại sao chọn <span> Kho Web Online ?</span> </h2>
            </div>
        </div>
        <div class="row display-flex">
            @forelse($criteria as $val)
                {!! get_template_single_post($val,'bai-viet',3) !!}
            @empty
            @endforelse
        </div>
    </div>
</div>
<!-- CRITERIA SECTION END -->

@endsection