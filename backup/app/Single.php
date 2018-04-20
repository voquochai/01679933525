<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Single extends Model
{
    protected $table = 'single';
    protected $guarded = [];

    public function languages(){
    	return $this->hasMany('App\SingleLanguage', 'single_id', 'id')->orderBy('id','asc');
    }
}
