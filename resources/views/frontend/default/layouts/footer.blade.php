@php
    $socials = get_links('social',$lang);
    $banks = get_photos('bank',$lang);
    $footer = get_pages('footer',$lang);
    $tags = get_attributes('product_tags',$lang);
@endphp
<!-- FOOTER TOP SECTION START -->
<div class="footer-top-section section pb-60 pt-100">
    <div class="container">
        <div class="row">
            <!-- Footer Widget -->
            <div class="footer-widget col-md-3 col-sm-6 col-xs-12 mb-40">
                <h4 class="widget-title"> {{ @$footer->title }} </h4>
                {!! @$footer->contents !!}
                <!-- Footer Social -->
                <div class="footer-social fix">
                    @forelse($socials as $link)
                    <a href="{{ $link->link }}"> {!! $link->icon !!} </a>
                    @empty
                    @endforelse
                </div>
            </div>
            <!-- Footer Widget -->
            <div class="footer-widget col-md-3 col-sm-6 col-xs-12 mb-40">
                <h4 class="widget-title">tags</h4>
                <div class="tag-cloud fix">
                    @forelse($tags as $tag)
                    <a href="{{ route('frontend.home.archive', ['type'=>'san-pham','tag'=>$tag->slug] ) }}"> {!! $tag->title !!} </a>
                    @empty
                    @endforelse
                </div>
            </div>
            <!-- Footer Widget -->
            <div class="footer-widget col-md-3 col-sm-6 col-xs-12 mb-40">
                <h4 class="widget-title">{{ __('site.newsletter') }}</h4>
                @include('frontend.default.layouts.newsletter')
            </div>
            <!-- Footer Widget -->
            <div class="footer-widget col-md-3 col-sm-6 col-xs-12 mb-40">
                <div class="fb-page" data-href="{{ config('settings.fanpage') }}" data-small-header="true" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><blockquote cite="{{ config('settings.fanpage') }}" class="fb-xfbml-parse-ignore"><a href="{{ config('settings.fanpage') }}">{{ config('settings.site_name') }}</a></blockquote></div>
            </div>
        </div>
    </div>
</div>
<!-- FOOTER TOP SECTION END -->  

<!-- FOOTER BOTTOM SECTION START -->
<div class="footer-bottom-section section pb-20 pt-20">
    <div class="container">
        <div class="row">
            <!-- Copyright -->
            <div class="copyright text-left col-sm-6 col-xs-12">
                <p>{{ config('settings.site_copyright') }}</p>
            </div>
            <!-- Payment Method -->
            <div class="payment-method text-right col-sm-6 col-xs-12">
                @forelse($banks as $bank)
                <img src="{{ asset('public/uploads/photos/'.get_thumbnail($bank->image)) }}" alt="{{ $bank->alt }}" />
                @empty
                @endforelse
            </div>
        </div>
    </div>
</div>
<!-- FOOTER BOTTOM SECTION END -->