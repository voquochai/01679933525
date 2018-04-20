<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    protected $table = 'orders';
    protected $guarded = [];
    // protected $casts = ['products'=>'json'];
    public $timestamps = false;
}
