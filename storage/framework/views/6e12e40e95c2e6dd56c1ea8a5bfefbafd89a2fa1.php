<div class="comment-wrapper mt-40 mb-40">
    <?php if( count($comments) > 0 ): ?>
    <h3><?php echo e(__('site.comment').' ('.count($comments).')'); ?></h3>
    <ul class="comment-list">
        <?php $__empty_1 = true; $__currentLoopData = $comments; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $comment): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
        <li>
            <div class="single-comment fix">
                <div class="image float-left"><img src="<?php echo e(asset('noimage/50x50')); ?>" alt="" class="img-circle"></div>
                <div class="content fix">
                    <div class="head fix">
                        <div class="author-time">
                            <h4><?php echo e($comment->name); ?></h4>
                            <span><?php echo e(nice_time($comment->created_at)); ?></span>
                        </div>
                        <a href="#">Replay</a>
                    </div>
                    <p><?php echo $comment->description; ?></p>
                </div>
            </div>
        </li>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
        <?php endif; ?>
    </ul>
    <?php endif; ?>
    <h3><?php echo e(__('site.leave_a_comment')); ?></h3>
    <div class="comment-form">
        <form action="<?php echo e(URL::current()); ?>" method="post">
            <?php if( @$product->id ): ?>
            <input type="hidden" name="product_id" value="<?php echo e($product->id); ?>">
            <?php elseif( @$post->id ): ?>
            <input type="hidden" name="post_id" value="<?php echo e($post->id); ?>">
            <?php endif; ?>
            <div class="row">
	            <div class="col-sm-4 col-xs-12">
	                <label for="name"><?php echo e(__('site.name')); ?></label>
	                <input name="name" type="text">
	            </div>
	            <div class="col-sm-8 col-xs-12">
	                <label for="email">Email</label>
	                <input name="email" type="text">
	            </div>
	            <div class="col-xs-12">
					<label for="contents"><?php echo e(__('site.content')); ?></label>
					<textarea name="contents"></textarea>
				</div>
	            <div class="col-xs-12">
	                <button type="submit" class="btn btn-primary btn-ajax" data-ajax="act=comment|type=default"> <?php echo e(__('site.send_comment')); ?> </button>
				</div>
			</div>
		</form>
    </div>
</div>