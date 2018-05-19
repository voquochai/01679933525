<nav class="main-menu text-center">
    <ul>
        <li <?php echo (Route::currentRouteName() == 'home.index') ? 'class="active"' : ''; ?> ><a href="<?php echo e(url('/')); ?>"> <?php echo e(__('site.home')); ?> </a></li>
        <li <?php echo ($type == 'hosting') ? 'class="active"' : ''; ?> ><a href="<?php echo e(url('/hosting')); ?>"> Hosting </a></li>
        <li <?php echo ($type == 'san-pham') ? 'class="active"' : ''; ?> ><a href="<?php echo e(url('/san-pham')); ?>"> Kho web </a>
            <?php 
                Menu::resetMenu();
                Menu::setOption([
                    'open'=>['<ul class="sub-menu">','<ul>'],
                    'baseurl' => url('/san-pham')
                ]);
                Menu::setMenu(get_categories('san-pham',$lang));
                echo Menu::getMenu();
             ?>
        </li>
        <li <?php echo ($type == 'dich-vu') ? 'class="active"' : ''; ?> ><a href="<?php echo e(url('/dich-vu')); ?>"> Dịch vụ </a>
            <?php 
                Menu::resetMenu();
                Menu::setOption([
                    'open'=>['<ul class="sub-menu">'],
                    'baseurl' => url('/dich-vu')
                ]);
                Menu::setMenu(get_categories('dich-vu',$lang));
                echo Menu::getMenu();
             ?>
        </li>
        <li <?php echo ($type == 'thu-thuat') ? 'class="active"' : ''; ?> ><a href="<?php echo e(url('/thu-thuat')); ?>"> Thủ thuật </a>
            <?php 
                Menu::resetMenu();
                Menu::setOption([
                    'open'=>['<ul class="sub-menu">'],
                    'baseurl' => url('/thu-thuat')
                ]);
                Menu::setMenu(get_categories('thu-thuat',$lang));
                echo Menu::getMenu();
             ?>
        </li>
        <li <?php echo (Route::currentRouteName() == 'home.contact') ? 'class="active"' : ''; ?> ><a href="<?php echo e(url('/lien-he')); ?>"> <?php echo e(__('site.contact')); ?> </a></li>
    </ul>
</nav>
<div class="mobile-menu"></div>