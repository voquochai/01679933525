@php $slideshow = get_photos('slideshow',$lang); @endphp
<!-- START SLIDER SECTION -->
<div class="home-slider-section section">
    <div id="home-slider" class="slides">
        @forelse($slideshow as $key => $slide)
        <img src="{{ ($slide->image && file_exists(public_path('/uploads/photos/'.$slide->image)) ) ? asset('public/uploads/photos/'.$slide->image) : asset('noimage/1920x900') }}" alt="" title="#slider-caption-{{ $key }}"  />
        @empty
        @endforelse
    </div>
    @forelse($slideshow as $key => $slide)
    <div id="slider-caption-{{ $key }}" class="nivo-html-caption">
        <div class="container">
            <div class="row">
                <div class="hero-slider-content col-md-6 col-md-offset-6 col-sm-7 col-sm-offset-5 col-xs-12">
                    @if($slide->title) <h2 class="wow fadeInUp" data-wow-duration="1s" data-wow-delay="1s">{{ $slide->title }}</h2> @endif
                    @if($slide->description) <p class="wow fadeInUp" data-wow-duration="1s" data-wow-delay="1.5s">{{ $slide->description }}</p> @endif
                    @if($slide->link) <a href="{{ $slide->link }}" class="wow fadeInUp" data-wow-duration="1s" data-wow-delay="2s">Buy now</a> @endif
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
                    <a href="{{ $banner->link }}"><img src="{{ ($banner->image && file_exists(public_path('/uploads/photos/'.$banner->image)) ) ? asset('public/uploads/photos/'.$banner->image) : asset('noimage/570x285') }}" alt=""></a>
                </div>
            </div>
            <!-- Banner Item End -->
            @empty
            @endforelse
        </div>
    </div>
</div> 
<!-- BANNER-SECTION END -->