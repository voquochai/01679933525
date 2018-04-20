<nav class="main-menu text-center">
    <ul>
        <li <?php echo (Route::currentRouteName() == 'home.index') ? 'class="active"' : ''; ?> ><a href="<?php echo e(url('/')); ?>"> <?php echo e(__('site.home')); ?> </a></li>
        <li <?php echo ($type == 'gioi-thieu') ? 'class="active"' : ''; ?> ><a href="<?php echo e(url('/gioi-thieu')); ?>"> <?php echo e(__('site.about')); ?> </a></li>
        <li <?php echo ($type == 'san-pham') ? 'class="active"' : ''; ?> ><a href="<?php echo e(url('/san-pham')); ?>"> <?php echo e(__('site.product')); ?> </a>
            <?php 
                Menu::resetMenu();
                Menu::setOption([
                    'open'=>['<ul class="mega-menu">','<ul>'],
                    'baseurl' => url('/san-pham')
                ]);
                Menu::setMenu(get_categories('san-pham',$lang));
                echo Menu::getMenu();
             ?>
        </li>
        <li <?php echo ($type == 'tin-tuc') ? 'class="active"' : ''; ?> ><a href="<?php echo e(url('/tin-tuc')); ?>"> <?php echo e(__('site.news')); ?> </a>
            <?php 
                Menu::resetMenu();
                Menu::setOption([
                    'open'=>['<ul class="sub-menu">'],
                    'baseurl' => url('/tin-tuc')
                ]);
                Menu::setMenu(get_categories('tin-tuc',$lang));
                echo Menu::getMenu();
             ?>
        </li>
        <li <?php echo (Route::currentRouteName() == 'home.contact') ? 'class="active"' : ''; ?> ><a href="<?php echo e(url('/lien-he')); ?>"> <?php echo e(__('site.contact')); ?> </a></li>
    </ul>
</nav>
<div class="mobile-menu"></div>