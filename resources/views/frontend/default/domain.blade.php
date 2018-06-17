@extends('frontend.default.master')
@section('content')
<!-- PAGE SECTION START -->
<section class="page-section section pt-60 pb-60 wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
    <div class="container">
        <div class="row">
            @include('frontend.default.blocks.messages')
            <div class="col-lg-9 col-md-8 col-xs-12 pull-right">
                <div class="note-wrapper">{!! $domain_result !!}</div>
            </div>
            <div class="col-lg-3 col-md-4 col-xs-12">
                @include('frontend.default.layouts.sidebar')
            </div>
        </div>
    </div>
</section>
<!-- PAGE SECTION END -->
@endsection

@section('custom_script')
<script type="text/javascript" src="{{ asset('public/js/axios.min.js') }}"></script>
<script type="text/javascript">
    async function getJSONAsync(domain) {

        // The await keyword saves us from having to write a .then() block.
        let json = await axios.post( Laravel.baseUrl + '/ajax', { 'act': 'whois', 'domain': domain, '_token=': Laravel.csrfToken } );

        // The result of the GET request is available in the json variable.
        // We return it just like in a regular synchronous function.
        return json;
    }
    $(document).ready(function(){
        @forelse($domain_search as $domain)
            getJSONAsync('{{ $domain }}').then( function(result) {
                $('div[data-domain="{{ $domain }}"]').addClass('note-'+result.data.class);
                if( result.data.class === 'danger' || result.data.class === 'warning' ){
                    $('div[data-domain="{{ $domain }}"] button').removeClass('btn-buy-domain').addClass('disabled');
                }
                $('div[data-domain="{{ $domain }}"] button').addClass('btn-'+result.data.class).text(result.data.text);
            });
        @empty
        @endforelse
    })
</script>
@endsection