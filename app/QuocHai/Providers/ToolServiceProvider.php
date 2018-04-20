<?php
namespace App\QuocHai\Providers;

use Illuminate\Support\ServiceProvider;
use App\QuocHai\ToolFactory;

class ToolServiceProvider extends ServiceProvider
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
        $this->app->singleton(ToolFactory::class, function () {
            return new ToolFactory();
        });
    }
}
