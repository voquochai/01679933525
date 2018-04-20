<?php 
    $colors = get_attributes('product_colors',$lang);
 ?>
<div class="sidebar">
    <div class="single-sidebar mb-40">
        <form method="get" action="<?php echo e(url('/san-pham')); ?>" class="sidebar-search">
            <input type="text" name="keyword" value="<?php echo e(Request::get('keyword')); ?>" placeholder="<?php echo e(__('site.search')); ?>">
            <button class="submit"><i class="pe-7s-search"></i></button>
        </form>
    </div>
    
    <div class="single-sidebar mb-40">
        <h3 class="sidebar-title"><?php echo e(__('site.category')); ?></h3>
        <?php 
            Menu::resetMenu();
            Menu::setOption([
                'open'=>['<ul class="category-sidebar">'],
                'baseurl' => url('/san-pham')
            ]);
            Menu::setMenu(get_categories('san-pham',$lang));
            echo Menu::getMenu(@$category->id);
         ?>
    </div>
    
    <div class="single-sidebar mb-40">
        <div id="price-range"></div>
    </div>
   
    <div class="single-sidebar mb-40">
        <h3 class="sidebar-title">Color</h3>
        <ul class="color-sidebar">
            <?php $__empty_1 = true; $__currentLoopData = $colors; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $color): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
            <li><a href="<?php echo e(route('frontend.home.archive', ['type'=>'san-pham','color'=>$color->slug] )); ?>"> <i style="background-color: <?php echo $color->value; ?>;"></i> <span><?php echo $color->title; ?></span> </a></li>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
            <?php endif; ?>
        </ul>
    </div>

</div>