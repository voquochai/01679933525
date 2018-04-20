<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Schema;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Schema::defaultStringLength(191);
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        $this->app->singleton('League\Glide\Server', function($app){
            $filesystem = $app->make('Illuminate\Contracts\Filesystem\Filesystem');
            return \League\Glide\ServerFactory::create([
                'response' => new \League\Glide\Responses\SymfonyResponseFactory(),
                'source'    =>  $filesystem->getDriver(),
                'cache'    =>  $filesystem->getDriver(),
                'source_path_prefix'    =>  '/',
                'cache_path_prefix'    =>  '/.cache',
                'base_url'  =>  'images/'
            ]);
        });
    }
}
