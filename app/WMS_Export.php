<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class WMS_Export extends Model
{
    protected $table = 'wms_exports';
    protected $guarded = [];
    public $timestamps = false;
}
