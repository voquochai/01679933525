<!Doctype html>
<html lang="<?php echo e(app()->getLocale()); ?>">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="robots" content="index" />
    <!-- CSRF Token -->
    <meta name="csrf-token" content="<?php echo e(csrf_token()); ?>">
    <title><?php echo e(@$meta_seo->title); ?></title>
    <meta name="keywords" content="<?php echo e(@$meta_seo->keywords); ?>">
    <meta name="description" content="<?php echo e(@$meta_seo->description); ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Schema.org markup for Google+ -->
    <meta itemprop="name" content="<?php echo e(@$meta_seo->title); ?>">
    <meta itemprop="description" content="<?php echo e(@$meta_seo->description); ?>">
    <meta itemprop="image" content="<?php echo e(@$meta_seo->image); ?>">
    <!-- Twitter Card data -->
    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:site" content="<?php echo e(config('settings.site_name')); ?>">
    <meta name="twitter:title" content="<?php echo e(@$meta_seo->title); ?>">
    <meta name="twitter:description" content="<?php echo e(@$meta_seo->description); ?>">
    <meta name="twitter:image:src" content="<?php echo e(@$meta_seo->image); ?>">
    <!-- Open Graph data -->
    <meta property="og:title" content="<?php echo e(@$meta_seo->title); ?>" />
    <meta property="og:type" content="article" />
    <meta property="og:url" content="<?php echo e(url()->current()); ?>" />
    <meta property="og:image" content="<?php echo e(@$meta_seo->image); ?>" />
    <meta property="og:description" content="<?php echo e(@$meta_seo->description); ?>" />
    <meta property="og:site_name" content="<?php echo e(config('settings.site_name')); ?>" />
    <meta property="fb:admins" content="Facebook numberic ID" />
    <!-- Geo data -->
    <meta name="geo.placename" content="Viet Nam" />
    <meta name="geo.position" content="x;x" />
    <meta name="geo.region" content="VN" />
    <meta name="ICBM" content="" />

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="<?php echo e(asset('public/uploads/photos/'.config('settings.favicon'))); ?>">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900">
    <link rel="stylesheet" href="<?php echo e(asset('public/themes/default/assets/css/bootstrap.min.css')); ?>">
    <link rel="stylesheet" href="<?php echo e(asset('public/packages/bootstrap-toastr/toastr.min.css')); ?>">
    <link rel="stylesheet" href="<?php echo e(asset('public/themes/default/assets/css/font-awesome.min.css')); ?>">
    <link rel="stylesheet" href="<?php echo e(asset('public/themes/default/assets/css/pe-icon-7-stroke.css')); ?>">
    <link rel="stylesheet" href="<?php echo e(asset('public/themes/default/assets/css/plugins.css')); ?>">
    <link rel="stylesheet" href="<?php echo e(asset('public/css/app.css')); ?>">
    <link rel="stylesheet" href="<?php echo e(asset('public/themes/default/assets/css/style.css')); ?>">
    <link rel="stylesheet" href="<?php echo e(asset('public/themes/default/assets/css/responsive.css')); ?>">
    <?php echo $__env->yieldContent('custom_css'); ?>

    <?php echo e(config('settings.script_head')); ?>


</head>
<body>
    <div id="fb-root"></div>
    <script async defer>(function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = 'https://connect.facebook.net/<?php echo e(config('siteconfig.social.'.app()->getLocale())); ?>/sdk.js#xfbml=1&version=v2.12&autoLogAppEvents=1';
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));</script>
    
	<!-- Body main wrapper start -->
	<div class="wrapper">
		<!-- START HEADER SECTION -->
		<?php echo $__env->make('frontend.default.layouts.header', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
		<!-- END HEADER SECTION -->

		<!-- Search Modal -->
		<?php echo $__env->make('frontend.default.layouts.search', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>

		<?php if(Route::currentRouteName() == 'frontend.home.index'): ?>
			<?php echo $__env->make('frontend.default.layouts.slideshow', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
		<?php else: ?>
			<?php echo $__env->make('frontend.default.layouts.breadcrumb', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
		<?php endif; ?>
		
		<?php echo $__env->yieldContent('content'); ?>
	    
		<!-- SERVICE SECTION START -->
		<?php echo $__env->make('frontend.default.layouts.brand', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
		<!-- SERVICE SECTION END -->
	    
		<?php echo $__env->make('frontend.default.layouts.footer', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>

	</div>
	<!-- Body main wrapper end -->
    
    <script>
        window.Laravel = <?php echo json_encode([
            'csrfToken' =>  csrf_token(),
            'baseUrl'   =>  url('/'),
        ]); ?>

    </script>
    <script src="<?php echo e(asset('public/json/province.json')); ?>"></script>
    <script src="<?php echo e(asset('public/json/district.json')); ?>"></script>
    <script src="<?php echo e(asset('public/themes/default/assets/js/modernizr-2.8.3.min.js')); ?>"></script>
	<script src="<?php echo e(asset('public/themes/default/assets/js/jquery-3.1.1.min.js')); ?>"></script>
    <script src="<?php echo e(asset('public/themes/default/assets/js/bootstrap.min.js')); ?>"></script>
	<script src="<?php echo e(asset('public/packages/bootstrap-toastr/toastr.min.js')); ?>"></script>
	<script src="<?php echo e(asset('public/themes/default/assets/js/plugins.js')); ?>"></script>
	<script src="<?php echo e(asset('public/js/app.js')); ?>"></script>
	<script src="<?php echo e(asset('public/themes/default/assets/js/main.js')); ?>"></script>
	<?php echo $__env->yieldContent('custom_script'); ?>

    <?php echo e(config('settings.script_body')); ?>

</body>

</html>