<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Setting extends Model
{
    protected $table = 'settings';
    protected $guarded = [];
    public $timestamps = false;

    public function getValueByName($name=''){
    	$value = $this->where('name',$name)->first();
    	return $value ? $value->value : '';
    }
}
