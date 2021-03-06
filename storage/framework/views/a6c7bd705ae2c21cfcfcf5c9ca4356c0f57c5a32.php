<?php $__env->startSection('breadcrumb'); ?>
<li>
    <span> <?php echo e($pageTitle); ?> </span>
</li>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('content'); ?>
<div class="row">
	<?php echo $__env->make('admin.blocks.messages', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
	<div class="col-md-12">
        <div class="portlet box green">
            <div class="portlet-title">
                <div class="caption">Cấu hình website</div>
                <ul class="nav nav-tabs">
                    <li>
                        <a href="#tab-overview" data-toggle="tab" aria-expanded="false"> Tổng quan </a>
                    </li>
                    <li>
                        <a href="#tab-info" data-toggle="tab" aria-expanded="false"> Thông tin website </a>
                    </li>
                    <li>
                        <a href="#tab-email" data-toggle="tab" aria-expanded="false"> Cấu hình Email </a>
                    </li>
                    <li>
                        <a href="#tab-script" data-toggle="tab" aria-expanded="false"> Script </a>
                    </li>
                    <li>
                        <a href="#tab-files" data-toggle="tab" aria-expanded="false"> Logo & Favicon </a>
                    </li>
                </ul>
            </div>
            <div class="portlet-body form">
                <!-- BEGIN FORM-->
                <form role="form" class="form-horizontal" method="POST" action="<?php echo e(route('admin.setting.store')); ?>" enctype="multipart/form-data" >
                    <?php echo e(csrf_field()); ?>

                    <div class="form-body">
                        <div class="tab-content">
                            <div class="tab-pane" id="tab-overview">
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Ngôn ngữ của trang</label>
                                    <div class="col-md-9 col-lg-9">
                                        <div class="mt-radio-inline">
                                        <?php $__currentLoopData = $languages; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $lang): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <label class="mt-radio">
                                                <input type="radio" name="data[language]" value="<?php echo e($key); ?>" <?php echo (@$item['language']) ? (($key == @$item['language']) ? 'checked' : '') : (($key == $default_language) ? 'checked' : ''); ?> > <?php echo e($lang); ?><span></span> </label>
                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                            <i class="help-block"> Chọn ngôn ngữ mặc định cho website </i>
                                        </div>
                                        
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Định dạng ngày</label>
                                    <div class="col-md-9 col-lg-9">
                                        <div class="mt-radio-inline">
                                            <label class="mt-radio">
                                                <input type="radio" name="data[date_format]" value="d/m/Y" <?php echo (@$item['date_format'] == 'd/m/Y') ? 'checked' : ''; ?> >
                                                <?php echo e(date('d/m/Y')); ?><span></span>
                                            </label>
                                            <span class="label label-default"> d/m/Y </span>
                                        </div>
                                        <div class="mt-radio-inline">
                                            <label class="mt-radio">
                                                <input type="radio" name="data[date_format]" value="m/d/Y" <?php echo (@$item['date_format'] == 'm/d/Y') ? 'checked' : ''; ?> >
                                                <?php echo e(date('m/d/Y')); ?><span></span>
                                            </label>
                                            <span class="label label-default"> m/d/Y </i>
                                        </div>
                                        <div class="mt-radio-inline">
                                            <label class="mt-radio">
                                                <input type="radio" name="data[date_format]" value="Y-m-d" <?php echo (@$item['date_format'] == 'Y-m-d') ? 'checked' : ''; ?> >
                                                <?php echo e(date('Y-m-d')); ?><span></span>
                                            </label>
                                            <span class="label label-default"> Y-m-d </i>
                                        </div>
                                        <div class="mt-radio-inline">
                                            <label class="mt-radio">
                                                <input type="radio" name="data[date_format]" value="custom" <?php echo (@$item['date_format'] == 'custom') ? 'checked' : ''; ?> >
                                                Tùy chọn<span></span>
                                            </label>
                                            &nbsp; &nbsp;
                                            <input type="text" name="data[date_custom_format]" value="<?php echo e(@$item['date_custom_format']); ?>" class="form-control input-small input-inline">
                                        </div>
                                        <i class="help-block"> Chọn định dạng ngày tháng năm</i>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Sản phẩm</label>
                                    <div class="col-md-9 col-lg-9">
                                        <input type="text" name="data[product_per_page]" value="<?php echo e((int)@$item['product_per_page']); ?>" class="form-control">
                                        <i class="help-block"> Nhập số lượng sản phẩm bạn muốn hiển thị trong 1 trang </i>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Kích thước ảnh</label>
                                    <div class="col-md-9 col-lg-9">
                                        <p>
                                            <span class="help-block"> Cỡ thu nhỏ</span>
                                            Rộng <input type="text" name="data[thumbs][product][_small][width]" value="<?php echo e((int)@$item[thumbs][product][_small][width]); ?>" class="form-control input-small input-inline">
                                            Cao <input type="text" name="data[thumbs][product][_small][height]" value="<?php echo e((int)@$item[thumbs][product][_small][height]); ?>" class="form-control input-small input-inline">
                                        </p>
                                        <p>
                                            <span class="help-block"> Cỡ trung bình </span>
                                            Rộng <input type="text" name="data[thumbs][product][_medium][width]" value="<?php echo e((int)@$item[thumbs][product][_medium][width]); ?>" class="form-control input-small input-inline">
                                            Cao <input type="text" name="data[thumbs][product][_medium][height]" value="<?php echo e((int)@$item[thumbs][product][_medium][height]); ?>" class="form-control input-small input-inline">
                                        </p>
                                        <p>
                                            <span class="help-block"> Cỡ lớn </span>
                                            Rộng <input type="text" name="data[thumbs][product][_large][width]" value="<?php echo e((int)@$item[thumbs][product][_large][width]); ?>" class="form-control input-small input-inline">
                                            Cao <input type="text" name="data[thumbs][product][_large][height]" value="<?php echo e((int)@$item[thumbs][product][_large][height]); ?>" class="form-control input-small input-inline">
                                            <i class="help-block"> Kích thước lớn sẽ làm ảnh hưởng tốc độ load web</i>
                                        </p>

                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Bài viết</label>
                                    <div class="col-md-9 col-lg-9">
                                        <input type="text" name="data[post_per_page]" value="<?php echo e((int)@$item['post_per_page']); ?>" class="form-control">
                                        <i class="help-block"> Nhập số lượng bài viết bạn muốn hiển thị trong 1 trang </i>
                                    </div>
                                </div>
                            </div>

                            <div class="tab-pane" id="tab-info">
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Tên website</label>
                                    <div class="col-md-9 col-lg-9">
                                        <input type="text" name="data[site_name]" value="<?php echo e(@$item['site_name']); ?>" class="form-control">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Khẩu hiệu</label>
                                    <div class="col-md-9 col-lg-9">
                                        <input type="text" name="data[site_slogan]" value="<?php echo e(@$item['site_slogan']); ?>" class="form-control">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Địa chỉ</label>
                                    <div class="col-md-9 col-lg-9">
                                        <input type="text" name="data[site_address]" value="<?php echo e(@$item['site_address']); ?>" class="form-control">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Email</label>
                                    <div class="col-md-9 col-lg-9">
                                        <input type="text" name="data[site_email]" value="<?php echo e(@$item['site_email']); ?>" class="form-control">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Điện thoại</label>
                                    <div class="col-md-9 col-lg-9">
                                        <input type="text" name="data[site_phone]" value="<?php echo e(@$item['site_phone']); ?>" class="form-control">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Fax</label>
                                    <div class="col-md-9 col-lg-9">
                                        <input type="text" name="data[site_fax]" value="<?php echo e(@$item['site_fax']); ?>" class="form-control">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Hotline</label>
                                    <div class="col-md-9 col-lg-9">
                                        <input type="text" name="data[site_hotline]" value="<?php echo e(@$item['site_hotline']); ?>" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Website</label>
                                    <div class="col-md-9 col-lg-9">
                                        <input type="text" name="data[site_url]" value="<?php echo e(@$item['site_url']); ?>" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Bản quyền</label>
                                    <div class="col-md-9 col-lg-9">
                                        <input type="text" name="data[site_copyright]" value="<?php echo e(@$item['site_copyright']); ?>" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Fanpage</label>
                                    <div class="col-md-9 col-lg-9">
                                        <input type="text" name="data[fanpage]" value="<?php echo e(@$item['fanpage']); ?>" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Google Map</label>
                                    <div class="col-md-9 col-lg-9">
                                        <input type="text" id="pac-result" name="data[google_coordinates]" class="form-control" value="<?php echo e(@$item['google_coordinates']); ?>">
                                        <input type="text" id="pac-input" class="form-control">
                                        <div id="map"></div>
                                        <div id="infowindow-content">
                                            <img src="" width="16" height="16" id="place-icon">
                                            <span id="place-name"  class="title"></span><br>
                                            <span id="place-address"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="tab-pane" id="tab-email">
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Host</label>
                                    <div class="col-md-9 col-lg-9">
                                        <input type="text" name="data[email_host]" value="<?php echo e(@$item['email_host']); ?>" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Port</label>
                                    <div class="col-md-9 col-lg-9">
                                        <input type="text" name="data[email_port]" value="<?php echo e(@$item['email_port']); ?>" class="form-control input-inline input-small">
                                        SMTPSecure <input type="text" name="data[email_smtpsecure]" value="<?php echo e(@$item['email_smtpsecure']); ?>" class="form-control input-inline input-small">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Tên đăng nhập</label>
                                    <div class="col-md-9 col-lg-9">
                                        <input type="text" name="data[email_username]" value="<?php echo e(@$item['email_username']); ?>" class="form-control">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Mật khẩu</label>
                                    <div class="col-md-9 col-lg-9">
                                        <input type="password" name="data[email_password]" value="<?php echo e(@$item['email_password']); ?>" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Email nhận tin</label>
                                    <div class="col-md-9 col-lg-9">
                                        <input type="text" name="data[email_to]" value="<?php echo e(@$item['email_to']); ?>" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Email CC</label>
                                    <div class="col-md-9 col-lg-9">
                                        <input type="text" name="data[email_cc]" value="<?php echo e(@$item['email_cc']); ?>" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Email BCC</label>
                                    <div class="col-md-9 col-lg-9">
                                        <input type="text" name="data[email_bcc]" value="<?php echo e(@$item['email_bcc']); ?>" class="form-control">
                                    </div>
                                </div>
                            </div>

                            <div class="tab-pane" id="tab-script">
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Head script</label>
                                    <div class="col-md-9 col-lg-9">
                                        <textarea name="data[script_head]" rows="6" class="form-control"> <?php echo e(@$item['script_head']); ?> </textarea>
                                        <span class="help-block"> Script nằm trong thẻ head </span>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Body script</label>
                                    <div class="col-md-9 col-lg-9">
                                        <textarea name="data[script_body]" rows="6" class="form-control"> <?php echo e(@$item['script_body']); ?> </textarea>
                                        <span class="help-block"> Script nằm trong thẻ body </span>
                                    </div>
                                </div>
                            </div>

                            <div class="tab-pane" id="tab-files">
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Logo</label>
                                    <div class="col-md-9 col-lg-9">
                                        <div class="fileinput <?php echo e(( @$item['logo'] && file_exists(public_path($path.'/'.@$item['logo'])) ) ? 'fileinput-exists' : 'fileinput-new'); ?>" data-provides="fileinput">
                                            <div class="fileinput-new thumbnail">
                                                <img src="<?php echo e(asset('noimage/190x30')); ?>" alt="">
                                            </div>
                                            <div class="fileinput-preview fileinput-exists thumbnail">
                                                <?php if( @$item['logo'] && file_exists(public_path($path.'/'.@$item['logo'])) ): ?>
                                                <img src="<?php echo e(asset( 'public/'.$path.'/'.@$item['logo'] )); ?>" alt="">
                                                <?php endif; ?>
                                            </div>
                                            <div>
                                                <span class="btn default btn-file">
                                                    <span class="fileinput-new"> Chọn hình ảnh </span>
                                                    <span class="fileinput-exists"> Thay đổi </span>
                                                    <input type="file" name="files[logo]">
                                                </span>
                                                <a href="javascript:;" class="btn btn-delete-file default fileinput-exists" data-dismiss="fileinput" data-ajax="act=delete_file|path=<?php echo e($path.'/'.@$item['logo']); ?>"> Xóa </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Favicon</label>
                                    <div class="col-md-9 col-lg-9">
                                        <div class="fileinput <?php echo e(( @$item['favicon'] && file_exists(public_path($path.'/'.@$item['favicon'])) ) ? 'fileinput-exists' : 'fileinput-new'); ?>" data-provides="fileinput">
                                            <div class="fileinput-new thumbnail">
                                                <img src="<?php echo e(asset('noimage/50x50')); ?>" alt="">
                                            </div>
                                            <div class="fileinput-preview fileinput-exists thumbnail">
                                                <?php if( @$item['favicon'] && file_exists(public_path($path.'/'.@$item['favicon'])) ): ?>
                                                <img src="<?php echo e(asset( 'public/'.$path.'/'.@$item['favicon'] )); ?>" alt="">
                                                <?php endif; ?>
                                            </div>
                                            <div>
                                                <span class="btn default btn-file">
                                                    <span class="fileinput-new"> Chọn hình ảnh </span>
                                                    <span class="fileinput-exists"> Thay đổi </span>
                                                    <input type="file" name="files[favicon]">
                                                </span>
                                                <a href="javascript:;" class="btn btn-delete-file default fileinput-exists" data-dismiss="fileinput" data-ajax="act=delete_file|path=<?php echo e($path.'/'.@$item['favicon']); ?>"> Xóa </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Robots</label>
                                    <div class="col-md-9 col-lg-9">
                                        <div class="fileinput <?php echo e(( @$item['robots'] && file_exists(public_path($path.'/'.@$item['robots'])) ) ? 'fileinput-exists' : 'fileinput-new'); ?>" data-provides="fileinput">
                                            <div class="fileinput-preview fileinput-exists thumbnail">
                                                <?php if( @$item['robots'] && file_exists(public_path($path.'/'.@$item['robots'])) ): ?>
                                                <a href="<?php echo e(route('admin.download.file',$path.'/'.@$item['robots'])); ?>"> <?php echo e(@$item['robots']); ?> </a>
                                                <?php endif; ?>
                                            </div>
                                            <div>
                                                <span class="btn default btn-file">
                                                    <span class="fileinput-new"> Chọn file </span>
                                                    <span class="fileinput-exists"> Thay đổi </span>
                                                    <input type="file" name="files[robots]">
                                                </span>
                                                <a href="javascript:;" class="btn btn-delete-file default fileinput-exists" data-dismiss="fileinput" data-ajax="act=delete_file|path=<?php echo e($path.'/'.@$item['robots']); ?>"> Xóa </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Sitemap</label>
                                    <div class="col-md-9 col-lg-9">
                                        <div class="fileinput <?php echo e(( @$item['sitemap'] && file_exists(public_path($path.'/'.@$item['sitemap'])) ) ? 'fileinput-exists' : 'fileinput-new'); ?>" data-provides="fileinput">
                                            <div class="fileinput-preview fileinput-exists thumbnail">
                                                <?php if( @$item['sitemap'] && file_exists(public_path($path.'/'.@$item['sitemap'])) ): ?>
                                                <a href="<?php echo e(route('admin.download.file',$path.'/'.@$item['sitemap'])); ?>"> <?php echo e(@$item['sitemap']); ?> </a>
                                                <?php endif; ?>
                                            </div>
                                            <div>
                                                <span class="btn default btn-file">
                                                    <span class="fileinput-new"> Chọn file </span>
                                                    <span class="fileinput-exists"> Thay đổi </span>
                                                    <input type="file" name="files[sitemap]">
                                                </span>
                                                <a href="javascript:;" class="btn btn-delete-file default fileinput-exists" data-dismiss="fileinput" data-ajax="act=delete_file|path=<?php echo e($path.'/'.@$item['sitemap']); ?>"> Xóa </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="form-actions">
                        <div class="row">
                            <div class="col-md-offset-3 col-md-9 col-lg-offset-2 col-lg-10">
                                <button type="submit" class="btn green"> <i class="fa fa-check"></i> Lưu</button>
                            </div>
                        </div>
                    </div>
                </form>
                <!-- END FORM-->
            </div>
        </div>
	</div>
</div>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('css_head'); ?>
<style>
/* Always set the map height explicitly to define the size of the div
* element that contains the map. */

div.tab-content .tab-pane {display: block;height: 0;overflow: hidden;}
div.tab-content .active {height: auto;overflow: visible;}

#map {
    height: 500px;
}
/* Optional: Makes the sample page fill the window. */
#description {
    font-size: 15px;
    font-weight: 300;
}

#infowindow-content .title {
    font-weight: bold;
}

#infowindow-content {
    display: none;
}

#map #infowindow-content {
    display: inline;
}

.pac-card {
    margin: 10px 10px 0 0;
    border-radius: 2px 0 0 2px;
    box-sizing: border-box;
    -moz-box-sizing: border-box;
    outline: none;
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
    background-color: #fff;
}

#pac-container {
    padding-bottom: 12px;
    margin-right: 12px;
}

.pac-controls {
    display: inline-block;
    padding: 5px 11px;
}

.pac-controls label {
    font-size: 13px;
    font-weight: 300;
}

#pac-input {
    display: none;
    background-color: #fff;
    font-size: 15px;
    font-weight: 300;
    margin-left: 12px;
    padding: 0 11px 0 13px;
    text-overflow: ellipsis;
    width: 400px;
}
#map #pac-input {
    display: block;
    top: 10px !important;
}

#title {
    color: #fff;
    background-color: #4d90fe;
    font-size: 25px;
    font-weight: 500;
    padding: 6px 12px;
}
#target {
    width: 345px;
}
</style>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('script_bottom'); ?>
<?php 
if(@$item['google_coordinates']){
    $coordinates = str_replace(['(',')'],'',$item['google_coordinates']);
    $coordinates = explode(', ',$coordinates);
}else{
    $coordinates = explode(', ',$siteconfig['general']['google_coordinates']);
}
 ?>
<script>
function initAutocomplete() {
    var coordinates = { 'lat':<?php echo e($coordinates[0]); ?>, 'lng':<?php echo e($coordinates[1]); ?> };
    var map = new google.maps.Map(document.getElementById('map'), {
        center: coordinates,
        zoom: 17,
        mapTypeId: 'roadmap'
    });
    
    // Create the search box and link it to the UI element.
    var input = document.getElementById('pac-input');
    var searchBox = new google.maps.places.SearchBox(input);
    map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

    // Bias the SearchBox results towards current map's viewport.
    map.addListener('bounds_changed', function() {
        searchBox.setBounds(map.getBounds());
    });

    var marker = new google.maps.Marker({
        map: map,
        draggable: true,
        position: coordinates
    });
    marker.addListener('dragend', function() {
        document.getElementById('pac-result').value = marker.position;
    });
    // Listen for the event fired when the user selects a prediction and retrieve
    // more details for that place.
    searchBox.addListener('places_changed', function() {
        var places = searchBox.getPlaces();

        if (places.length == 0) {
            return;
        }

        // Clear out the old markers.
        marker.setMap(null);

        // For each place, get the icon, name and location.
        var bounds = new google.maps.LatLngBounds();
        places.forEach(function(place) {
            if (!place.geometry) {
                console.log("Returned place contains no geometry");
                return;
            }
            var icon = {
                url: place.icon,
                size: new google.maps.Size(71, 71),
                origin: new google.maps.Point(0, 0),
                anchor: new google.maps.Point(17, 34),
                scaledSize: new google.maps.Size(25, 25)
            };
            document.getElementById('pac-result').value = place.geometry.location;
            // Create a marker for each place.
            marker = new google.maps.Marker({
                map: map,
                draggable: true,
                title: place.name,
                position: place.geometry.location
            });
            marker.addListener('dragend', function() {
                document.getElementById('pac-result').value = marker.position;
            });
            
            if (place.geometry.viewport) {
                // Only geocodes have viewport.
                bounds.union(place.geometry.viewport);
            } else {
                bounds.extend(place.geometry.location);
            }
        });
        map.fitBounds(bounds);
    });
}
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAmtm5XL4qL8zyjf6lGxz6-9hkeu45-UiI&libraries=places&callback=initAutocomplete" async defer></script>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.app', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>