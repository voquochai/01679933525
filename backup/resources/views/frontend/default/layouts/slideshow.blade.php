@php $slideshow = get_photos('slideshow',$lang); @endphp
<!-- START SLIDER SECTION -->
<div class="home-slider-section section">
    <div id="home-slider" class="slides">
        @forelse($slideshow as $key => $slide)
        <img src="{{ asset('public/uploads/photo/'.$slide->image) }}" alt="" title="#slider-caption-{{ $key }}"  />
        @empty
        @endforelse
    </div>
    @forelse($slideshow as $key => $slide)
    <div id="slider-caption-{{ $key }}" class="nivo-html-caption">
        <div class="container">
            <div class="row">
                <div class="hero-slider-content col-md-6 col-md-offset-6 col-sm-7 col-sm-offset-5 col-xs-12">
                    <h4 class="wow rotateInDownLeft" data-wow-duration="1s" data-wow-delay="0.5s">welcome to our</h4>
                    <h1 class="wow fadeInUp" data-wow-duration="1s" data-wow-delay="1s">{{ $slide->title }}</h1>
                    <p class="wow fadeInUp" data-wow-duration="1s" data-wow-delay="1.5s">{{ $slide->description }}</p>
                    <a href="{{ $slide->link }}" class="wow fadeInUp" data-wow-duration="1s" data-wow-delay="2s">Buy now</a>
                </div>
            </div>
        </div>
    </div>
    @empty
        @endforelse
</div>
<!-- END SLIDER SECTION -->

@php $banners = get_photos('banner',$lang); @endphp

<!-- BANNER-SECTION START -->
<div class="banner-section section pt-100 pb-70">
    <div class="container">
        <div class="row">
            @forelse($banners as $key => $banner)
            <!-- Banner Item Start -->
            <div class="col-sm-6 col-xs-12 mb-30">
                <div class="single-banner">
                    <a href="{{ $banner->link }}"><img src="{{ asset('public/uploads/photo/'.$banner->image) }}" alt=""></a>
                </div>
            </div>
            <!-- Banner Item End -->
            @empty
            @endforelse
        </div>
    </div>
</div> 
<!-- BANNER-SECTION END -->