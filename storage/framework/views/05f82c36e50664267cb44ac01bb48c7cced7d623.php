<div class="sidebar">
    <div class="single-sidebar mb-40">
        <p class="text-center"> <?php echo e(__('account.account_of')); ?> </p>
        <h3 class="sidebar-title text-center"><?php echo e(auth()->guard('member')->user()->name); ?></h3>
        <ul class="category-sidebar">
            <li> <a href="<?php echo e(route('frontend.member.profile')); ?>"> <?php echo e(__('account.profile')); ?> </a> </li>
            <li> <a href=""> <?php echo e(__('account.notification')); ?> </a> </li>
            <li> <a href="<?php echo e(route('frontend.member.order')); ?>"> <?php echo e(__('account.order_management')); ?> </a> </li>
            <li> <a href=""> <?php echo e(__('account.delivery_address')); ?> </a> </li>
            <li> <a href="<?php echo e(route('frontend.home.viewed')); ?>"> <?php echo e(__('account.viewed')); ?> </a> </li>
            <li> <a href="<?php echo e(route('frontend.wishlist.index')); ?>"> <?php echo e(__('account.wishlist')); ?> </a> </li>
        </ul>
    </div>
</div>