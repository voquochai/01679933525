<?php
namespace App\QuocHai\Facades;

use Illuminate\Support\Facades\Facade;
use App\QuocHai\TemplateFactory;

class Template extends Facade{
    /**
     * Get the registered name of the component.
     *
     * @return string
     */
    protected static function getFacadeAccessor() {
    	return TemplateFactory::class;
    }
}