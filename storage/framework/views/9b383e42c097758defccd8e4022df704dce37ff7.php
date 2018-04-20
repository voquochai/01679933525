<header class="header-section section sticker header-transparent">
    <div class="container-fluid">
        <div class="row">
            <!-- logo -->
            <div class="col-md-2 col-sm-6 col-xs-6">
                <div class="header-logo">
                    <a href="<?php echo e(url('/')); ?>"><img src="<?php echo e((config('settings.logo') && file_exists(public_path('/uploads/photos/'.config('settings.logo'))) ? asset('public/uploads/photos/'.config('settings.logo')) : asset('noimage/190x30'))); ?>" alt="main logo"></a>
                </div>
            </div>
            <!-- header-search & total-cart -->
            <div class="col-md-2 col-sm-6 col-xs-6 float-right">
                <div class="header-option-btns float-right">
                    <!-- header-search -->
                    <div class="header-search float-left">
                        <button class="search-toggle" data-toggle="modal" data-target="#myModal" ><i class="pe-7s-search"></i></button>
                    </div>
                    <!-- header Account -->
                    <div class="header-account float-left">
                        <ul>
                            <li><a href="#" data-toggle="dropdown"><i class="pe-7s-user"></i></a>
                                <ul class="dropdown-menu">
                                    <?php if( auth()->guard('member')->check() ): ?>
                                    <li>
                                        <a href="<?php echo e(route('frontend.member.profile')); ?>">
                                            <i class="icon-user"></i> Thông tin </a>
                                    </li>
                                    <li class="divider"> </li>
                                    <li>
                                        <a href="javascript:;" onclick="event.preventDefault(); document.getElementById('logout-form').submit();"> <i class="icon-key"></i> Thoát </a>
                                        <form id="logout-form" action="<?php echo e(route('frontend.logout')); ?>" method="POST" style="display: none;">
                                            <?php echo e(csrf_field()); ?>

                                        </form>
                                    </li>
                                    <?php else: ?>
                                    <li><a href="<?php echo e(url('/login')); ?>"> <?php echo e(__('account.login')); ?> </a></li>
                                    <li><a href="<?php echo e(url('/register')); ?>">  <?php echo e(__('account.register')); ?>  </a></li>
                                    <?php endif; ?>
                                    <li><a href="<?php echo e(route('frontend.home.lang',['lang'=>'vi'])); ?>"> VietNam </a></li>
                                    <li><a href="<?php echo e(route('frontend.home.lang',['lang'=>'en'])); ?>"> English </a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <!-- Header Cart -->
                    <div class="header-cart float-left">
                        <a class="cart-toggle" href="<?php echo e(route('frontend.cart.index')); ?>">
                            <i class="pe-7s-cart"></i>
                            <span class="countCart"><?php echo e($countCart); ?></span>
                        </a>
                    </div>
                </div>
            </div>
            <!-- primary-menu -->
            <div class="col-md-8 col-xs-12">
                <?php echo $__env->make('frontend.default.layouts.navbar', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
            </div>
        </div>
    </div>
</header>