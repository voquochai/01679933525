<?php $__env->startSection('content'); ?>
<!-- PAGE SECTION START -->
<section class="page-section section pt-60 pb-60 wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
    <div class="container">
        <div class="row">
            <?php echo $__env->make('frontend.default.blocks.messages', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
            <div class="col-lg-9 col-md-8 col-xs-12 pull-right">
                <div class="note-wrapper"><?php echo $domain_result; ?></div>
            </div>
            <div class="col-lg-3 col-md-4 col-xs-12">
                <?php echo $__env->make('frontend.default.layouts.sidebar', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
            </div>
        </div>
    </div>
</section>
<!-- PAGE SECTION END -->
<?php $__env->stopSection(); ?>

<?php $__env->startSection('custom_script'); ?>
<script type="text/javascript" src="<?php echo e(asset('public/js/axios.min.js')); ?>"></script>
<script type="text/javascript">
    async function getJSONAsync(domain) {

        // The await keyword saves us from having to write a .then() block.
        let json = await axios.post( Laravel.baseUrl + '/ajax', { 'act': 'whois', 'domain': domain, '_token=': Laravel.csrfToken } );

        // The result of the GET request is available in the json variable.
        // We return it just like in a regular synchronous function.
        return json;
    }
    $(document).ready(function(){
        <?php $__empty_1 = true; $__currentLoopData = $domain_search; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $domain): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
            getJSONAsync('<?php echo e($domain); ?>').then( function(result) {
                $('div[data-domain="<?php echo e($domain); ?>"]').addClass('note-'+result.data.class);
                if( result.data.class === 'danger' || result.data.class === 'warning' ){
                    $('div[data-domain="<?php echo e($domain); ?>"] button').removeClass('btn-buy-domain').addClass('disabled');
                }
                $('div[data-domain="<?php echo e($domain); ?>"] button').addClass('btn-'+result.data.class).text(result.data.text);
            });
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
        <?php endif; ?>
    })
</script>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('frontend.default.master', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>