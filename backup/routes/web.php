<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Auth::routes();

Route::group(['middleware' => 'auth'], function(){
	Route::group(['prefix'=>'admin', 'namespace'=>'Admin'], function(){
		
		Route::get('/', function () {
		    return view('admin.layouts.dashboard');
		})->name('dashboard');

		// Users
		Route::get('/users', 'UserController@index')->name('user.index');
		Route::get('/users/create', 'UserController@create')->name('user.create');
		Route::post('/users', 'UserController@store')->name('user.store');
		Route::get('/users/{id}', 'UserController@edit')->where('id','[0-9]+')->name('user.edit');
		Route::put('/users/{id}', 'UserController@update')->name('user.update');
		Route::delete('/users/{id}', 'UserController@delete')->name('user.delete');

		// Categories
		Route::get('/categories', 'CategoryController@index')->name('category.index');
		Route::get('/categories/create', 'CategoryController@create')->name('category.create');
		Route::post('/categories', 'CategoryController@store')->name('category.store');
		Route::get('/categories/{id}', 'CategoryController@edit')->where('id','[0-9]+')->name('category.edit');
		Route::put('/categories/{id}', 'CategoryController@update')->name('category.update');
		Route::delete('/categories/{id}', 'CategoryController@delete')->name('category.delete');

		// Products
		Route::get('/products', 'ProductController@index')->name('product.index');
		Route::get('/products/ajax', 'ProductController@ajax')->name('product.ajax');
		Route::get('/products/create', 'ProductController@create')->name('product.create');
		Route::post('/products', 'ProductController@store')->name('product.store');
		Route::get('/products/{id}', 'ProductController@edit')->where('id','[0-9]+')->name('product.edit');
		Route::put('/products/{id}', 'ProductController@update')->name('product.update');
		Route::delete('/products/{id}', 'ProductController@delete')->name('product.delete');

		// Posts
		Route::get('/posts', 'PostController@index')->name('post.index');
		Route::get('/posts/create', 'PostController@create')->name('post.create');
		Route::post('/posts', 'PostController@store')->name('post.store');
		Route::get('/posts/{id}', 'PostController@edit')->where('id','[0-9]+')->name('post.edit');
		Route::put('/posts/{id}', 'PostController@update')->name('post.update');
		Route::delete('/posts/{id}', 'PostController@delete')->name('post.delete');

		// Attributes
		Route::get('/attributes', 'AttributeController@index')->name('attribute.index');
		Route::get('/attributes/create', 'AttributeController@create')->name('attribute.create');
		Route::post('/attributes', 'AttributeController@store')->name('attribute.store');
		Route::get('/attributes/{id}', 'AttributeController@edit')->where('id','[0-9]+')->name('attribute.edit');
		Route::put('/attributes/{id}', 'AttributeController@update')->name('attribute.update');
		Route::delete('/attributes/{id}', 'AttributeController@delete')->name('attribute.delete');

		// Single
		Route::get('/single', 'SingleController@index')->name('single.index');
		Route::get('/single/create', 'SingleController@create')->name('single.create');
		Route::post('/single', 'SingleController@store')->name('single.store');
		Route::get('/single/{id}', 'SingleController@edit')->where('id','[0-9]+')->name('single.edit');
		Route::put('/single/{id}', 'SingleController@update')->name('single.update');
		Route::delete('/single/{id}', 'SingleController@delete')->name('single.delete');

        // Images
        Route::get('/photos', 'PhotoController@index')->name('photo.index');
        Route::get('/photos/create', 'PhotoController@create')->name('photo.create');
        Route::post('/photos', 'PhotoController@store')->name('photo.store');
        Route::get('/photos/{id}', 'PhotoController@edit')->where('id','[0-9]+')->name('photo.edit');
        Route::put('/photos/{id}', 'PhotoController@update')->name('photo.update');
        Route::delete('/photos/{id}', 'PhotoController@delete')->name('photo.delete');

        // Links
        Route::get('/links', 'LinkController@index')->name('link.index');
        Route::get('/links/create', 'LinkController@create')->name('link.create');
        Route::post('/links', 'LinkController@store')->name('link.store');
        Route::get('/links/{id}', 'LinkController@edit')->where('id','[0-9]+')->name('link.edit');
        Route::put('/links/{id}', 'LinkController@update')->name('link.update');
        Route::delete('/links/{id}', 'LinkController@delete')->name('link.delete');

        // Registers
        Route::get('/registers', 'RegisterController@index')->name('register.index');
        Route::get('/registers/create', 'RegisterController@create')->name('register.create');
        Route::post('/registers', 'RegisterController@store')->name('register.store');
        Route::get('/registers/{id}', 'RegisterController@edit')->where('id','[0-9]+')->name('register.edit');
        Route::put('/registers/{id}', 'RegisterController@update')->name('register.update');
        Route::delete('/registers/{id}', 'RegisterController@delete')->name('register.delete');

        // Comments
        Route::get('/comments', 'CommentController@index')->name('comment.index');
        Route::get('/comments/create', 'CommentController@create')->name('comment.create');
        Route::post('/comments', 'CommentController@store')->name('comment.store');
        Route::get('/comments/{id}', 'CommentController@edit')->where('id','[0-9]+')->name('comment.edit');
        Route::put('/comments/{id}', 'CommentController@update')->name('comment.update');
        Route::delete('/comments/{id}', 'CommentController@delete')->name('comment.delete');

        // Orders
        Route::get('/orders', 'OrderController@index')->name('order.index');
        Route::get('/orders/create', 'OrderController@create')->name('order.create');
        Route::post('/orders', 'OrderController@store')->name('order.store');
        Route::get('/orders/{id}', 'OrderController@edit')->where('id','[0-9]+')->name('order.edit');
        Route::put('/orders/{id}', 'OrderController@update')->name('order.update');
        Route::delete('/orders/{id}', 'OrderController@delete')->name('order.delete');

        // Suppliers
        Route::get('/suppliers', 'SupplierController@index')->name('supplier.index');
        Route::get('/suppliers/create', 'SupplierController@create')->name('supplier.create');
        Route::post('/suppliers', 'SupplierController@store')->name('supplier.store');
        Route::get('/suppliers/{id}', 'SupplierController@edit')->where('id','[0-9]+')->name('supplier.edit');
        Route::put('/suppliers/{id}', 'SupplierController@update')->name('supplier.update');
        Route::delete('/suppliers/{id}', 'SupplierController@delete')->name('supplier.delete');

        // WMS
        Route::get('/wms_stores', 'WMS_StoreController@index')->name('wms_store.index');
        Route::get('/wms_stores/create', 'WMS_StoreController@create')->name('wms_store.create');
        Route::post('/wms_stores', 'WMS_StoreController@store')->name('wms_store.store');
        Route::get('/wms_stores/{id}', 'WMS_StoreController@edit')->where('id','[0-9]+')->name('wms_store.edit');
        Route::put('/wms_stores/{id}', 'WMS_StoreController@update')->name('wms_store.update');
        Route::delete('/wms_stores/{id}', 'WMS_StoreController@delete')->name('wms_store.delete');

        Route::get('/wms_imports', 'WMS_ImportController@index')->name('wms_import.index');
        Route::get('/wms_imports/ajax', 'WMS_ImportController@ajax')->name('wms_import.ajax');
        Route::get('/wms_imports/create', 'WMS_ImportController@create')->name('wms_import.create');
        Route::post('/wms_imports', 'WMS_ImportController@store')->name('wms_import.store');
        Route::get('/wms_imports/{id}', 'WMS_ImportController@edit')->where('id','[0-9]+')->name('wms_import.edit');
        Route::put('/wms_imports/{id}', 'WMS_ImportController@update')->name('wms_import.update');
        Route::delete('/wms_imports/{id}', 'WMS_ImportController@delete')->name('wms_import.delete');

        Route::get('/wms_exports', 'WMS_ExportController@index')->name('wms_export.index');
        
        Route::get('/wms_exports/create', 'WMS_ExportController@create')->name('wms_export.create');
        Route::post('/wms_exports', 'WMS_ExportController@store')->name('wms_export.store');
        Route::get('/wms_exports/{id}', 'WMS_ExportController@edit')->where('id','[0-9]+')->name('wms_export.edit');
        Route::put('/wms_exports/{id}', 'WMS_ExportController@update')->name('wms_export.update');
        Route::delete('/wms_exports/{id}', 'WMS_ExportController@delete')->name('wms_export.delete');

        Route::get('/settings', 'SettingController@index')->name('setting.index');
        Route::post('/settings', 'SettingController@store')->name('setting.store');

		Route::post('/ajax', 'AjaxController@index');

		Route::get('/test', function(){
			// $owner = new \App\Role();
			// $owner->name         = 'owner';
			// $owner->display_name = 'Project Owner'; // optional
			// $owner->description  = 'User is the owner of a given project'; // optional
			// $owner->save();

			// $admin = new \App\Role();
			// $admin->name         = 'admin';
			// $admin->display_name = 'User Administrator'; // optional
			// $admin->description  = 'User is allowed to manage and edit other users'; // optional
			// $admin->save();
		});
	});
});

Route::get('/noimage/{width}x{height}', function(Intervention\Image\Facades\Image $image, $w, $h){
	$image::canvas($w,$h,'#ccc')
		->text($w.'x'.$h, $w/2, $h/2, function($font) {
		    $font->file( public_path('fonts/Roboto-Regular.ttf') );
		    $font->size(30);
		    $font->color('#000');
		    $font->align('center');
		    $font->valign('center');
		    // $font->angle(45);
		})
		->save( public_path('images/noimage/'.$w.'x'.$h.'.jpg') );
	return response()->file( public_path('images/noimage/'.$w.'x'.$h.'.jpg') );
});

Route::get('/images/{file}', function(Intervention\Image\Facades\Image $image, $file){
	return $image::make( public_path($file) )->response();
})->where('file','.*');

Route::get('/download/{file}', function($file){
	return response()->download(public_path($file));
})->where('file','.*')->name('download.file');

Route::get('/thumbnail/{width}x{height}x{zc}/{file}', function(Intervention\Image\Facades\Image $image, $w, $h, $zc, $file){
	return $image::make( public_path($file) )
		->fit($w,$h)
		->response();
})->where('file','.*');

Route::group(['namespace'=>'Frontend'], function(){
	Route::get('/lang={locale}', function($locale){
		session(['lang' => $locale]);
		return redirect()->back();
	})->name('home.lang');
	
	Route::get('/' , 'HomeController@index')->name('home.index');

	Route::get('/lien-he', 'HomeController@contact')->name('home.contact');
	Route::get('/tim-kiem', 'HomeController@search')->name('home.search');

	Route::get('/thanh-toan', 'CartController@checkout')->name('cart.checkout');
	Route::post('/thanh-toan', 'CartController@placeOrder')->name('cart.placeorder');
	Route::get('/thankyou', 'CartController@thankYou')->name('cart.thankyou');

	Route::get('/gio-hang', 'CartController@index')->name('cart.index');
	Route::post('/gio-hang/add', 'CartController@addToCart')->name('cart.add');
	Route::post('/gio-hang/delete', 'CartController@deleteCart')->name('cart.delete');
	Route::post('/gio-hang/update', 'CartController@updateCart')->name('cart.update');

	Route::get('/{type}/{slug}.html' , 'HomeController@single')->name('home.single');
	Route::get('/{type}/{slug}' , 'HomeController@category')->name('home.category');
	Route::get('/{type}' , 'HomeController@archive')->name('home.archive');
	
	Route::post('/ajax', 'AjaxController@index');
});

