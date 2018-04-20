@extends('admin.app')
@section('breadcrumb')
<li>
    <span> {{ $pageTitle }} </span>
</li>
@endsection
@section('content')
<div class="row">
	@include('admin.blocks.messages')
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
                <form role="form" class="form-horizontal" method="POST" action="{{ route('setting.store') }}" enctype="multipart/form-data" >
                    {{ csrf_field() }}
                    <div class="form-body">
                        <div class="tab-content">
                            <div class="tab-pane" id="tab-overview">
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Ngôn ngữ của trang</label>
                                    <div class="col-md-9 col-lg-9">
                                        <div class="mt-radio-inline">
                                        @foreach($languages as $key => $lang)
                                            <label class="mt-radio">
                                                <input type="radio" name="data[language]" value="{{ $key }}" {!! (@$item['language']) ? (($key == @$item['language']) ? 'checked' : '') : (($key == $default_language) ? 'checked' : '') !!} > {{ $lang }}<span></span> </label>
                                        @endforeach
                                            <i class="help-block"> Chọn ngôn ngữ mặc định cho website </i>
                                        </div>
                                        
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Định dạng ngày</label>
                                    <div class="col-md-9 col-lg-9">
                                        <div class="mt-radio-inline">
                                            <label class="mt-radio">
                                                <input type="radio" name="data[date_format]" value="d/m/Y" {!! (@$item['date_format'] == 'd/m/Y') ? 'checked' : '' !!} >
                                                {{ date('d/m/Y') }}<span></span>
                                            </label>
                                            <span class="label label-default"> d/m/Y </span>
                                        </div>
                                        <div class="mt-radio-inline">
                                            <label class="mt-radio">
                                                <input type="radio" name="data[date_format]" value="m/d/Y" {!! (@$item['date_format'] == 'm/d/Y') ? 'checked' : '' !!} >
                                                {{ date('m/d/Y') }}<span></span>
                                            </label>
                                            <span class="label label-default"> m/d/Y </i>
                                        </div>
                                        <div class="mt-radio-inline">
                                            <label class="mt-radio">
                                                <input type="radio" name="data[date_format]" value="Y-m-d" {!! (@$item['date_format'] == 'Y-m-d') ? 'checked' : '' !!} >
                                                {{ date('Y-m-d') }}<span></span>
                                            </label>
                                            <span class="label label-default"> Y-m-d </i>
                                        </div>
                                        <div class="mt-radio-inline">
                                            <label class="mt-radio">
                                                <input type="radio" name="data[date_format]" value="custom" {!! (@$item['date_format'] == 'custom') ? 'checked' : '' !!} >
                                                Tùy chọn<span></span>
                                            </label>
                                            &nbsp; &nbsp;
                                            <input type="text" name="data[date_custom_format]" value="{{ @$item['date_custom_format'] }}" class="form-control input-small input-inline">
                                        </div>
                                        <i class="help-block"> Chọn định dạng ngày tháng năm</i>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Sản phẩm</label>
                                    <div class="col-md-9 col-lg-9">
                                        <input type="text" name="data[product_per_page]" value="{{ @$item['product_per_page'] }}" class="form-control">
                                        <i class="help-block"> Nhập số lượng sản phẩm bạn muốn hiển thị trong 1 trang </i>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Bài viết</label>
                                    <div class="col-md-9 col-lg-9">
                                        <input type="text" name="data[post_per_page]" value="{{ @$item['post_per_page'] }}" class="form-control">
                                        <i class="help-block"> Nhập số lượng bài viết bạn muốn hiển thị trong 1 trang </i>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Kích thước ảnh</label>
                                    <div class="col-md-9 col-lg-9">
                                        <p>
                                            <span class="help-block"> Cỡ thu nhỏ</span>
                                            Rộng <input type="text" name="data[small_size_w]" value="{{ @$item['small_size_w'] }}" class="form-control input-small input-inline">
                                            Cao <input type="text" name="data[small_size_h]" value="{{ @$item['small_size_h'] }}" class="form-control input-small input-inline">
                                        </p>
                                        <p>
                                            <span class="help-block"> Cỡ trung bình </span>
                                            Rộng <input type="text" name="data[medium_size_w]" value="{{ @$item['medium_size_w'] }}" class="form-control input-small input-inline">
                                            Cao <input type="text" name="data[medium_size_h]" value="{{ @$item['medium_size_h'] }}" class="form-control input-small input-inline">
                                        </p>
                                        <p>
                                            <span class="help-block"> Cỡ lớn </span>
                                            Rộng <input type="text" name="data[large_size_w]" value="{{ @$item['large_size_w'] }}" class="form-control input-small input-inline">
                                            Cao <input type="text" name="data[large_size_h]" value="{{ @$item['large_size_h'] }}" class="form-control input-small input-inline">
                                            <i class="help-block"> Kích thước lớn sẽ làm ảnh hưởng tốc độ load web</i>
                                        </p>

                                    </div>
                                </div>
                            </div>

                            <div class="tab-pane" id="tab-info">
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Tên website</label>
                                    <div class="col-md-9 col-lg-9">
                                        <input type="text" name="data[site_name]" value="{{ @$item['site_name'] }}" class="form-control">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Khẩu hiệu</label>
                                    <div class="col-md-9 col-lg-9">
                                        <input type="text" name="data[site_slogan]" value="{{ @$item['site_slogan'] }}" class="form-control">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Địa chỉ</label>
                                    <div class="col-md-9 col-lg-9">
                                        <input type="text" name="data[site_address]" value="{{ @$item['site_address'] }}" class="form-control">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Email</label>
                                    <div class="col-md-9 col-lg-9">
                                        <input type="text" name="data[site_email]" value="{{ @$item['site_email'] }}" class="form-control">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Điện thoại</label>
                                    <div class="col-md-9 col-lg-9">
                                        <input type="text" name="data[site_phone]" value="{{ @$item['site_phone'] }}" class="form-control">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Fax</label>
                                    <div class="col-md-9 col-lg-9">
                                        <input type="text" name="data[site_fax]" value="{{ @$item['site_fax'] }}" class="form-control">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Hotline</label>
                                    <div class="col-md-9 col-lg-9">
                                        <input type="text" name="data[site_hotline]" value="{{ @$item['site_hotline'] }}" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Website</label>
                                    <div class="col-md-9 col-lg-9">
                                        <input type="text" name="data[site_url]" value="{{ @$item['site_url'] }}" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Bản quyền</label>
                                    <div class="col-md-9 col-lg-9">
                                        <input type="text" name="data[site_copyright]" value="{{ @$item['site_copyright'] }}" class="form-control">
                                    </div>
                                </div>
                            </div>

                            <div class="tab-pane" id="tab-email">
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Host</label>
                                    <div class="col-md-9 col-lg-9">
                                        <input type="text" name="data[email_host]" value="{{ @$item['email_host'] }}" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Port</label>
                                    <div class="col-md-9 col-lg-9">
                                        <input type="text" name="data[email_port]" value="{{ @$item['email_port'] }}" class="form-control input-inline input-small">
                                        SMTPSecure <input type="text" name="data[email_smtpsecure]" value="{{ @$item['email_smtpsecure'] }}" class="form-control input-inline input-small">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Tên đăng nhập</label>
                                    <div class="col-md-9 col-lg-9">
                                        <input type="text" name="data[email_username]" value="{{ @$item['email_username'] }}" class="form-control">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Mật khẩu</label>
                                    <div class="col-md-9 col-lg-9">
                                        <input type="text" name="data[email_password]" value="{{ @$item['email_password'] }}" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Email nhận tin</label>
                                    <div class="col-md-9 col-lg-9">
                                        <input type="text" name="data[email_to]" value="{{ @$item['email_to'] }}" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Email CC</label>
                                    <div class="col-md-9 col-lg-9">
                                        <input type="text" name="data[email_cc]" value="{{ @$item['email_cc'] }}" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Email BCC</label>
                                    <div class="col-md-9 col-lg-9">
                                        <input type="text" name="data[email_bcc]" value="{{ @$item['email_bcc'] }}" class="form-control">
                                    </div>
                                </div>
                            </div>

                            <div class="tab-pane" id="tab-script">
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Head script</label>
                                    <div class="col-md-9 col-lg-9">
                                        <textarea name="data[script_head]" rows="6" class="form-control"> {{ @$item['script_head'] }} </textarea>
                                        <span class="help-block"> Script nằm trong thẻ head </span>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Body script</label>
                                    <div class="col-md-9 col-lg-9">
                                        <textarea name="data[script_body]" rows="6" class="form-control"> {{ @$item['script_body'] }} </textarea>
                                        <span class="help-block"> Script nằm trong thẻ body </span>
                                    </div>
                                </div>
                            </div>

                            <div class="tab-pane" id="tab-files">
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Logo</label>
                                    <div class="col-md-9 col-lg-9">
                                        <div class="fileinput {{ ( @$item['logo'] && file_exists(public_path($path.'/'.@$item['logo'])) ) ? 'fileinput-exists' : 'fileinput-new' }}" data-provides="fileinput">
                                            <div class="fileinput-new thumbnail">
                                                <img src="http://via.placeholder.com/300x200/EFEFEF/AAAAAA&amp;text=190 x 30" alt="">
                                            </div>
                                            <div class="fileinput-preview fileinput-exists thumbnail">
                                                @if( @$item['logo'] && file_exists(public_path($path.'/'.@$item['logo'])) )
                                                <img src="{{ asset( 'public/'.$path.'/'.@$item['logo'] ) }}" alt="">
                                                @endif
                                            </div>
                                            <div>
                                                <span class="btn default btn-file">
                                                    <span class="fileinput-new"> Chọn hình ảnh </span>
                                                    <span class="fileinput-exists"> Thay đổi </span>
                                                    <input type="file" name="files[logo]">
                                                </span>
                                                <a href="javascript:;" class="btn btn-delete-file default fileinput-exists" data-dismiss="fileinput" data-ajax="act=delete_file|path={{ $path.'/'.@$item['logo'] }}"> Xóa </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Favicon</label>
                                    <div class="col-md-9 col-lg-9">
                                        <div class="fileinput {{ ( @$item['favicon'] && file_exists(public_path($path.'/'.@$item['favicon'])) ) ? 'fileinput-exists' : 'fileinput-new' }}" data-provides="fileinput">
                                            <div class="fileinput-new thumbnail">
                                                <img src="http://via.placeholder.com/50x50/EFEFEF/AAAAAA&amp;text=50x50" alt="">
                                            </div>
                                            <div class="fileinput-preview fileinput-exists thumbnail">
                                                @if( @$item['favicon'] && file_exists(public_path($path.'/'.@$item['favicon'])) )
                                                <img src="{{ asset( 'public/'.$path.'/'.@$item['favicon'] ) }}" alt="">
                                                @endif
                                            </div>
                                            <div>
                                                <span class="btn default btn-file">
                                                    <span class="fileinput-new"> Chọn hình ảnh </span>
                                                    <span class="fileinput-exists"> Thay đổi </span>
                                                    <input type="file" name="files[favicon]">
                                                </span>
                                                <a href="javascript:;" class="btn btn-delete-file default fileinput-exists" data-dismiss="fileinput" data-ajax="act=delete_file|path={{ $path.'/'.@$item['favicon'] }}"> Xóa </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Robots</label>
                                    <div class="col-md-9 col-lg-9">
                                        <div class="fileinput {{ ( @$item['robots'] && file_exists(public_path($path.'/'.@$item['robots'])) ) ? 'fileinput-exists' : 'fileinput-new' }}" data-provides="fileinput">
                                            <!-- <div class="fileinput-new thumbnail"></div> -->
                                            <div class="fileinput-preview fileinput-exists thumbnail">
                                                @if( @$item['robots'] && file_exists(public_path($path.'/'.@$item['robots'])) )
                                                <a href="{{ route('download.file',$path.'/'.@$item['robots']) }}"> {{@$item['robots']}} </a>
                                                @endif
                                            </div>
                                            <div>
                                                <span class="btn default btn-file">
                                                    <span class="fileinput-new"> Chọn file </span>
                                                    <span class="fileinput-exists"> Thay đổi </span>
                                                    <input type="file" name="files[robots]">
                                                </span>
                                                <a href="javascript:;" class="btn btn-delete-file default fileinput-exists" data-dismiss="fileinput" data-ajax="act=delete_file|path={{ $path.'/'.@$item['robots'] }}"> Xóa </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-lg-2">Sitemap</label>
                                    <div class="col-md-9 col-lg-9">
                                        <div class="fileinput {{ ( @$item['sitemap'] && file_exists(public_path($path.'/'.@$item['sitemap'])) ) ? 'fileinput-exists' : 'fileinput-new' }}" data-provides="fileinput">
                                            <!-- <div class="fileinput-new thumbnail"></div> -->
                                            <div class="fileinput-preview fileinput-exists thumbnail">
                                                @if( @$item['sitemap'] && file_exists(public_path($path.'/'.@$item['sitemap'])) )
                                                <a href="{{ route('download.file',$path.'/'.@$item['sitemap']) }}"> {{@$item['sitemap']}} </a>
                                                @endif
                                            </div>
                                            <div>
                                                <span class="btn default btn-file">
                                                    <span class="fileinput-new"> Chọn file </span>
                                                    <span class="fileinput-exists"> Thay đổi </span>
                                                    <input type="file" name="files[sitemap]">
                                                </span>
                                                <a href="javascript:;" class="btn btn-delete-file default fileinput-exists" data-dismiss="fileinput" data-ajax="act=delete_file|path={{ $path.'/'.@$item['sitemap'] }}"> Xóa </a>
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
@endsection