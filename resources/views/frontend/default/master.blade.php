<!Doctype html>
<html lang="{{ app()->getLocale() }}">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="robots" content="index" />
    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>{{ @$meta_seo->title }}</title>
    <meta name="keywords" content="{{ @$meta_seo->keywords }}">
    <meta name="description" content="{{ @$meta_seo->description }}">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Schema.org markup for Google+ -->
    <meta itemprop="name" content="{{ @$meta_seo->title }}">
    <meta itemprop="description" content="{{ @$meta_seo->description }}">
    <meta itemprop="image" content="{{ @$meta_seo->image }}">
    <!-- Twitter Card data -->
    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:site" content="{{ config('settings.site_name') }}">
    <meta name="twitter:title" content="{{ @$meta_seo->title }}">
    <meta name="twitter:description" content="{{ @$meta_seo->description }}">
    <meta name="twitter:image:src" content="{{ @$meta_seo->image }}">
    <!-- Open Graph data -->
    <meta property="og:title" content="{{ @$meta_seo->title }}" />
    <meta property="og:type" content="article" />
    <meta property="og:url" content="{{ url()->current() }}" />
    <meta property="og:image" content="{{ @$meta_seo->image }}" />
    <meta property="og:description" content="{{ @$meta_seo->description }}" />
    <meta property="og:site_name" content="{{ config('settings.site_name') }}" />
    <meta property="fb:admins" content="Facebook numberic ID" />
    <!-- Geo data -->
    <meta name="geo.placename" content="Viet Nam" />
    <meta name="geo.position" content="x;x" />
    <meta name="geo.region" content="VN" />
    <meta name="ICBM" content="" />

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="{{ asset('public/uploads/photos/'.config('settings.favicon')) }}">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900">
    <link rel="stylesheet" href="{{ asset('public/themes/default/assets/css/bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ asset('public/packages/bootstrap-toastr/toastr.min.css') }}">
    <link rel="stylesheet" href="{{ asset('public/themes/default/assets/css/font-awesome.min.css') }}">
    <link rel="stylesheet" href="{{ asset('public/themes/default/assets/css/pe-icon-7-stroke.css') }}">
    <link rel="stylesheet" href="{{ asset('public/themes/default/assets/css/plugins.css') }}">
    <link rel="stylesheet" href="{{ asset('public/css/app.css') }}">
    <link rel="stylesheet" href="{{ asset('public/themes/default/assets/css/style.css') }}">
    <link rel="stylesheet" href="{{ asset('public/themes/default/assets/css/responsive.css') }}">
    @yield('custom_css')

    {{ config('settings.script_head') }}

</head>
<body>
    <div id="fb-root"></div>
    <script async defer>(function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = 'https://connect.facebook.net/{{ config('siteconfig.social.'.app()->getLocale()) }}/sdk.js#xfbml=1&version=v2.12&autoLogAppEvents=1';
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));</script>
    
	<!-- Body main wrapper start -->
	<div class="wrapper">
		<!-- START HEADER SECTION -->
		@include('frontend.default.layouts.header')
		<!-- END HEADER SECTION -->

		<!-- Search Modal -->
		@include('frontend.default.layouts.search')

		@if(Route::currentRouteName() == 'frontend.home.index')
			@include('frontend.default.layouts.slideshow')
		@else
			@include('frontend.default.layouts.breadcrumb')
		@endif
		
		@yield('content')
	    
		<!-- SERVICE SECTION START -->
		@include('frontend.default.layouts.brand')
		<!-- SERVICE SECTION END -->
	    
		@include('frontend.default.layouts.footer')

	</div>
	<!-- Body main wrapper end -->
    
    <script>
        window.Laravel = {!! json_encode([
            'csrfToken' =>  csrf_token(),
            'baseUrl'   =>  url('/'),
        ]) !!}
    </script>
    <script src="{{ asset('public/jsons/province.json') }}"></script>
    <script src="{{ asset('public/jsons/district.json') }}"></script>
    <script src="{{ asset('public/themes/default/assets/js/modernizr-2.8.3.min.js') }}"></script>
	<script src="{{ asset('public/themes/default/assets/js/jquery-3.1.1.min.js') }}"></script>
    <script src="{{ asset('public/themes/default/assets/js/bootstrap.min.js') }}"></script>
	<script src="{{ asset('public/packages/bootstrap-toastr/toastr.min.js') }}"></script>
	<script src="{{ asset('public/themes/default/assets/js/plugins.js') }}"></script>
	<script src="{{ asset('public/js/app.js') }}"></script>
	<script src="{{ asset('public/themes/default/assets/js/main.js') }}"></script>
	@yield('custom_script')

    {{ config('settings.script_body') }}
</body>

</html>