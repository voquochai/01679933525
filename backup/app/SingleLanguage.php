<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SingleLanguage extends Model
{
    protected $table = 'single_languages';
    protected $guarded = [];
    protected $casts = ['meta_seo'=>'json'];
    public $timestamps = false;
    
    public function single(){
    	return $this->belongsTo('App\Single', 'single_id');
    }
}
