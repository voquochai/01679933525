<?php

namespace App\QuocHai\Providers;

use Illuminate\Support\ServiceProvider;
use App\QuocHai\MenuFactory;

class MenuServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        $this->app->singleton(MenuFactory::class, function ($app) {
            return new MenuFactory();
        });
    }
}
