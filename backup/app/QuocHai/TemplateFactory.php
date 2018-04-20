<?php
namespace App\QuocHai;
class TemplateFactory {
	public function getTemplateProductPrice($regular_price, $sale_price){
		if( $regular_price > 0 && $sale_price == 0){
			$price = '<span class="new">'.number_format($regular_price,0,',','.').' đ </span>';
		}elseif($sale_price > 0){
			$price = '<span class="new">'.number_format($sale_price,0,',','.').' đ </span>
			<span class="old">'.number_format($regular_price,0,',','.').' đ </span>';
		}else{
			$price = '<span class="new"> Liên hệ </span>';
		}
		return $price;
		
	}
	public function getTemplateProduct($product,$type='san-pham',$show=4){
		$link = ($product->link) ? $product->link : route('home.single',['type' => $type, 'slug' => $product->slug]);
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
                        <a class="image" href="'.$link.'"><img src="'. ( $product->image ? asset( 'public/uploads/product/'.get_thumbnail($product->image, '_medium') ) : asset('public/images/noimage/275x400.jpg') ) .'" alt="'.$product->alt.'" /></a>
                        <a href="#" class="add-to-cart" data-ajax="id='. $product->id .'">add to cart</a>
                        <div class="action-btn fix">
                            <a href="#" title="Wishlist"><i class="pe-7s-like"></i></a>
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
        $link = ($post->link) ? $post->link : route('home.single',['type' => $type, 'slug' => $post->slug]);
        if($show==6){ $cls = "col-lg-2 col-md-3 col-sm-4 col-xs-6 col-xs-wide"; }
        elseif($show==4){ $cls = "col-md-3 col-sm-4 col-xs-6 col-xs-wide"; }
        elseif($show==3){ $cls = "col-md-4 col-sm-6 col-xs-12"; }
        elseif($show==2){ $cls = "col-sm-6 col-xs-12"; }
        elseif($show==1){ $cls = "col-xs-12"; }
        $template = '
            <!-- blog-item start -->
            <div class="'.$cls.' mb-40">
                <div class="blog-item">
                    <a class="image" href="'.$link.'"><img src="'. ( $post->image ? asset( 'public/uploads/post/'.get_thumbnail($post->image) ) : asset('public/images/noimage/320x200.jpg') ) .'" alt="'.$post->alt.'" /></a>
                    <div class="blog-dsc">
                        <span class="date">'.date('d/m/Y',strtotime($post->updated_at)).'</span>
                        <h4 class="title"><a href="'.$link.'">'.$post->title.'</a></h4>
                        <p>'.substr($post->description,0,100).'</p>
                    </div>
                </div>
            </div>
            <!-- blog-item end -->
        ';

        return $template;
    }
}