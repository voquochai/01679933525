<?php 
    $colors = get_attributes('product_colors',$lang);
 ?>
<div class="sidebar">
    <div class="sidebar-widget mb-20">
        <h3 class="title"><?php echo e(__('site.category')); ?></h3>
        <?php 
            Menu::resetMenu();
            Menu::setOption([
                'open'=>['<ul class="category">'],
                'baseurl' => url('/san-pham')
            ]);
            Menu::setMenu(get_categories('san-pham',$lang));
            echo Menu::getMenu(@$category->id);
         ?>
    </div>
</div>