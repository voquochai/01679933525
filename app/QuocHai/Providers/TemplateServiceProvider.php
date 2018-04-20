<?php

namespace App\QuocHai\Providers;

use Illuminate\Support\ServiceProvider;
use App\QuocHai\TemplateFactory;

class TemplateServiceProvider extends ServiceProvider
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
        $this->app->singleton(TemplateFactory::class, function ($app) {
            return new TemplateFactory();
        });
    }
}
