@inject('setting', 'App\Setting')
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
    <meta name="twitter:site" content="{{ $setting->getValueByName('site_name') }}">
    <meta name="twitter:title" content="{{ @$meta_seo->title }}">
    <meta name="twitter:description" content="{{ @$meta_seo->description }}">
    <meta name="twitter:image:src" content="{{ @$meta_seo->image }}">
    <!-- Open Graph data -->
    <meta property="og:title" content="{{ @$meta_seo->title }}" />
    <meta property="og:type" content="article" />
    <meta property="og:url" content="{{ url()->current() }}" />
    <meta property="og:image" content="{{ @$meta_seo->image }}" />
    <meta property="og:description" content="{{ @$meta_seo->description }}" />
    <meta property="og:site_name" content="{{ $setting->getValueByName('site_name') }}" />
    <meta property="fb:admins" content="Facebook numberic ID" />
    <!-- Geo data -->
    <meta name="geo.placename" content="Viet Nam" />
    <meta name="geo.position" content="x;x" />
    <meta name="geo.region" content="VN" />
    <meta name="ICBM" content="" />

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="{{ asset('public/uploads/photo/'.$setting->getValueByName('favicon')) }}">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900">
    <link rel="stylesheet" href="{{ asset('public/themes/default/assets/css/bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ asset('public/packages/bootstrap-toastr/toastr.min.css') }}">
    <link rel="stylesheet" href="{{ asset('public/themes/default/assets/css/font-awesome.min.css') }}">
    <link rel="stylesheet" href="{{ asset('public/themes/default/assets/css/pe-icon-7-stroke.css') }}">
    <link rel="stylesheet" href="{{ asset('public/themes/default/assets/css/plugins.css') }}">
    <link rel="stylesheet" href="{{ asset('public/css/app.css') }}">
    <link rel="stylesheet" href="{{ asset('public/themes/default/assets/css/style.css') }}">
    <link rel="stylesheet" href="{{ asset('public/themes/default/assets/css/responsive.css') }}">
    @yield('css_head')
</head>
<body>
	<!-- Body main wrapper start -->
	<div class="wrapper">
		<!-- START HEADER SECTION -->
		@include('frontend.default.layouts.header')
		<!-- END HEADER SECTION -->

		<!-- Search Modal -->
		@include('frontend.default.layouts.search')

		@if(Route::currentRouteName() == 'home.index')
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
    <script src="{{ asset('public/json/province.json') }}"></script>
    <script src="{{ asset('public/json/district.json') }}"></script>
    <script src="{{ asset('public/themes/default/assets/js/modernizr-2.8.3.min.js') }}"></script>
	<script src="{{ asset('public/themes/default/assets/js/jquery-3.1.1.min.js') }}"></script>
    <script src="{{ asset('public/themes/default/assets/js/bootstrap.min.js') }}"></script>
	<script src="{{ asset('public/packages/bootstrap-toastr/toastr.min.js') }}"></script>
	<script src="{{ asset('public/themes/default/assets/js/plugins.js') }}"></script>
	<script src="{{ asset('public/js/app.js') }}"></script>
	<script src="{{ asset('public/themes/default/assets/js/main.js') }}"></script>
	@yield('script_bottom')
</body>

</html>