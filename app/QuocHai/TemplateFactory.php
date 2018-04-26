<?php
namespace App\QuocHai;
use App\QuocHai\Facades\Tool;
class TemplateFactory {
	public function getTemplateProductPrice($regular_price, $sale_price){
		if( $regular_price > 0 && $sale_price == 0){
			$price = '<span class="new">'.get_currency_vn($regular_price).'</span>';
		}elseif($sale_price > 0){
			$price = '<span class="new">'.get_currency_vn($sale_price).'</span>
			<span class="old">'.get_currency_vn($regular_price).'</span>';
		}else{
			$price = '<span class="new">'.__('site.contact').'</span>';
		}
		return $price;
		
	}
	public function getTemplateProduct($product,$type='san-pham',$show=4){
        if($type == '') $type = $product->type;
		$link = ($product->link) ? $product->link : route('frontend.home.page',['type' => $type, 'slug' => $product->slug]);
        if($show==6){ $cls = "col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-wide"; }
        elseif($show==4){ $cls = "col-md-3 col-sm-4 col-xs-6 col-xs-wide"; }
        elseif($show==3){ $cls = "col-md-4 col-sm-6 col-xs-12"; }
        elseif($show==2){ $cls = "col-sm-6 col-xs-12"; }
        elseif($show==1){ $cls = "col-xs-12"; }
		$template = '
			<!-- product-item start -->
            <div class="'.$cls.' mb-40">
                <div class="product-item text-center">
                    <div class="product-img">
                        <a class="image" href="'.$link.'"><img src="'. ( $product->image && file_exists(public_path('/uploads/products/'.$product->image)) ? asset( 'public/uploads/products/'.get_thumbnail($product->image, '_medium') ) : asset('noimage/300x300') ) .'" alt="'.$product->alt.'" /></a>
                        <a href="#" class="add-to-cart" data-ajax="id='. $product->id .'">'. __('cart.add_to_cart') .'</a>
                        <div class="action-btn fix">
                            <a href="#" class="add-to-wishlist" data-ajax="id='. $product->id .'" title="Wishlist"><i class="pe-7s-like"></i></a>
                            <a href="#" data-toggle="modal"  data-target="#productModal" title="Quickview"><i class="pe-7s-look"></i></a>
                            <a href="#" title="Compare"><i class="pe-7s-repeat"></i></a>
                        </div>
                    </div>
                    <div class="product-info">
                        <h5 class="title"><a href="'.$link.'">'.$product->title.'</a></h5>
                        <span class="price">
                        	'.self::getTemplateProductPrice($product->regular_price, $product->sale_price).'
                        </span>
                    </div>
                </div>
            </div>
            <!-- product-item end -->
		';

		return $template;
	}

    public function getTemplatePost($post,$type='bai-viet',$show=4){
        if($type == '') $type = $post->type;
        $link = ($post->link) ? $post->link : route('frontend.home.page',['type' => $type, 'slug' => $post->slug]);
        if($show==6){ $cls = "col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-wide"; }
        elseif($show==4){ $cls = "col-md-3 col-sm-4 col-xs-6 col-xs-wide"; }
        elseif($show==3){ $cls = "col-md-4 col-sm-6 col-xs-12"; }
        elseif($show==2){ $cls = "col-sm-6 col-xs-12"; }
        elseif($show==1){ $cls = "col-xs-12"; }
        $template = '
            <!-- blog-item start -->
            <div class="'.$cls.' mb-40">
                <div class="blog-item">
                    <a class="image" href="'.$link.'"><img src="'. ( $post->image && file_exists(public_path('/uploads/posts/'.$post->image)) ? asset( 'public/uploads/posts/'.get_thumbnail($post->image) ) : asset('noimage/330x220') ) .'" alt="'.$post->alt.'" /></a>
                    <div class="blog-dsc">
                        <span class="date">'.date(( config('settings.date_format') == 'custom' ? config('settings.date_custom_format') : config('settings.date_format') ),strtotime($post->updated_at)).'</span>
                        <h4 class="title"><a href="'.$link.'">'.$post->title.'</a></h4>
                        <p>'.substr($post->description,0,100).'</p>
                    </div>
                </div>
            </div>
            <!-- blog-item end -->
        ';

        return $template;
    }

    public function getTemplateComment($data,$parent=0,$lvl=0){
        $result = '';
        if( isset($data[$parent]) ){
            if( $parent==0 ) $result .= '<ul class="comment-list">';
            else $result .= '<ul>';
            foreach($data[$parent] as $k=>$v){
                $id=$v->id;
                $result .= '<li>';
                $result .= '
                    <div class="single-comment fix" data-lvl="'.$id.'"">
                        <div class="image float-left"><img src="'.asset('noimage/50x50').'" alt="" class="img-circle"></div>
                        <div class="content fix">
                            <div class="head fix">
                                <div class="author-time">
                                    <h4>'.$v->name.'</h4>
                                    <span>'.Tool::niceTime($v->created_at).'</span>
                                </div>
                                '.($lvl < 1 ? '<a href="#" class="replay" data-id="'.$id.'">Trả lời</a>' : '').'
                            </div>
                            <p>'.$v->description.'</p>
                        </div>
                    </div>
                ';
                $result .= self::getTemplateComment($data,$id,$lvl+1);
                $result .= '</li>';
            }
            $result .= '</ul>';
        }
        return $result;
    }
}