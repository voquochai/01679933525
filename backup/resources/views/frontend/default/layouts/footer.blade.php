@php
    $socials = get_links('social',$lang);
    $banks = get_photos('bank',$lang);
    $footer = get_single('footer',$lang);
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
            <div class="footer-widget link-widget col-md-3 col-sm-6 col-xs-12 mb-40">
                <h4 class="widget-title">accounts</h4>
                <ul>
                    <li><a href="#">My Account</a></li>
                    <li><a href="#">My Wishlist</a></li>
                    <li><a href="#">My Cart</a></li>
                    <li><a href="#">Sign In</a></li>
                    <li><a href="#">Check out</a></li>
                </ul>
            </div>
            <!-- Footer Widget -->
            <div class="footer-widget col-md-3 col-sm-6 col-xs-12 mb-40">
                <h4 class="widget-title">tags</h4>
                <div class="tag-cloud fix">
                    @forelse($tags as $tag)
                    <a href="#"> {!! $tag->title !!} </a>
                    @empty
                    @endforelse
                </div>
            </div>
            <!-- Footer Widget -->
            <div class="footer-widget col-md-3 col-sm-6 col-xs-12 mb-40">
                <h4 class="widget-title">Newsletters</h4>
                @include('frontend.default.layouts.newsletter')
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
                <p>{{ $setting->getValueByName('site_copyright') }}. All Right Reserved.</p>
            </div>
            <!-- Payment Method -->
            <div class="payment-method text-right col-sm-6 col-xs-12">
                @forelse($banks as $bank)
                <img src="{{ asset('public/uploads/photo/'.get_thumbnail($bank->image)) }}" alt="{{ $bank->alt }}" />
                @empty
                @endforelse
            </div>
        </div>
    </div>
</div>
<!-- FOOTER BOTTOM SECTION END -->