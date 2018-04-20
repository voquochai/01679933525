<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class WMS_Import extends Model
{
    protected $table = 'wms_imports';
    protected $guarded = [];
    public $timestamps = false;
}
