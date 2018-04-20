<?php
namespace App\QuocHai\Facades;
use App\QuocHai\ToolFactory;
use Illuminate\Support\Facades\Facade;

class Tool extends Facade {
    protected static function getFacadeAccessor() {
        return ToolFactory::class;
    }
}