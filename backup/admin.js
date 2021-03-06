var Admin = function(){

    var handleSideBarActive = function(){
        $('ul.page-sidebar-menu .nav-item .nav-link[data-route="'+Laravel.routeName+'"]').parents('.nav-item').addClass('active open');
    };

	var handleGroupCheckable = function(){
		$('body').on('click', 'input.group-checkable', function(){
			$(this).parents('table').find('input.checkable').prop('checked',$(this).is(':checked'));
			$('.count-checkbox').html( $('input.checkable:checked').length );
		});
	};

	var handleStripUnicode = function(str){
		str = str.toLowerCase();
        str = str.replace(/(à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ)/g, 'a');
        str = str.replace(/(è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ)/g, 'e');
        str = str.replace(/(ì|í|ị|ỉ|ĩ)/g, 'i');
        str = str.replace(/(ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ)/g, 'o');
        str = str.replace(/(ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ)/g, 'u');
        str = str.replace(/(ỳ|ý|ỵ|ỷ|ỹ)/g, 'y');
        str = str.replace(/(đ)/g, 'd');
        str = str.replace(/([^0-9a-z-\s])/g, '');
        str = str.replace(/(\s+)/g, '-');
        str = str.replace(/^-+/g, '');
        str = str.replace(/--+$/g, '-');
        return str;
	};

	var handleStrToSlug = function(){
		$('input.title').on('keyup blur', function(){
            var str = handleStripUnicode($(this).val());
            $('input.slug').val(str);
        });
        $('input.slug').on('keyup', function(event){
        	if( event.keyCode>=37 && event.keyCode<=40 ) return;
            var str = handleStripUnicode($(this).val());
            $(this).val(str);
        });
	};

    var handleAjax = function(){
        // Change Status
        $('.btn-status:enabled').on('click', function(e){
            e.preventDefault();
            var btn = $(this);
            if( typeof btn.data('ajax') === 'undefined' ) return;
            var dataAjax = btn.data('ajax').replace(/\|/g,'&')+'&_token='+Laravel.csrfToken;
            $.ajax({
                type: 'POST',
                url : Laravel.baseUrl+'/admin/ajax',
                data: dataAjax,
                beforeSend: function(){
                    btn.button('loading');
                }
            }).done(function(response){
                btn.button('reset').toggleClass('blue');
            });
        });

        // Change Priority
        $('.input-priority').on('blur', function(e){
            e.preventDefault();
            var input = $(this);
            if( typeof input.data('ajax') === 'undefined' ) return;
            var dataAjax = input.data('ajax').replace(/\|/g,'&')+'&val='+input.val()+'&_token='+Laravel.csrfToken;
            $.ajax({
                type: 'POST',
                url : Laravel.baseUrl+'/admin/ajax',
                data: dataAjax,
                beforeSend: function(){
                    input.prop('disabled',true);
                }
            }).done(function(response){
                input.prop('disabled',false);
            });
        });

        $('.btn-delete').on('click', function(e){
            e.preventDefault();
            var btn = $(this);
            var frm = btn.parents('form');
            swal({
                title: 'Bạn muốn xóa dữ liệu này?',
                text: '',
                type: '',
                allowOutsideClick: true,
                showConfirmButton: true,
                showCancelButton: true,
                showLoaderOnConfirm: true,
                confirmButtonClass: 'btn-primary',
                cancelButtonClass: 'btn-default',
                closeOnConfirm: false,
                closeOnCancel: true,
                confirmButtonText: 'Đồng ý',
                cancelButtonText: 'Bỏ qua',
            },function(isConfirm){
                if (isConfirm){
                    frm.submit();
                }
            });
        });

        $('body').on('click', '.btn-delete-file', function(e){
            e.preventDefault();
            var btn = $(this);
            if( typeof btn.data('ajax') === 'undefined' ) return;
            var dataAjax = btn.data('ajax').replace(/\|/g,'&')+'&_token='+Laravel.csrfToken;
            $.ajax({
                type: 'POST',
                url : Laravel.baseUrl+'/admin/ajax',
                data: dataAjax,
                beforeSend: function(){
                }
            }).done(function(response){
            });
        });

        $('.btn-action').on('click', function(e){
            e.preventDefault();
            var btn = $(this);
            if( typeof btn.data('ajax') === 'undefined' ) return;
            var dataType = btn.data('type');
            var dataAjax = btn.data('ajax').replace(/\|/g,'&')+'&_token='+Laravel.csrfToken;

            var listID = '';
            var sa_title = 'Bạn muốn thực hiện hành động này?';
            var sa_message = '';
            var sa_type = 'info';
            var sa_allowOutsideClick = true;
            var sa_showConfirmButton = true;
            var sa_showCancelButton = true;
            var sa_showLoaderOnConfirm = true;
            var sa_closeOnConfirm = false;
            var sa_closeOnCancel = true;
            var sa_confirmButtonText = 'Đồng ý';
            var sa_cancelButtonText = 'Bỏ qua';
            var sa_popupTitleSuccess = 'Đã thực thi';
            var sa_popupMessageSuccess = '';
            var sa_popupTitleCancel = 'Đã hủy';
            var sa_popupMessageCancel = 'You have disagreed to our Terms and Conditions';
            var sa_confirmButtonClass = 'btn-primary';
            var sa_cancelButtonClass = 'btn-default';

            $('input.checkable:checked').each(function(){
                listID = listID+","+$(this).val();
            });

            listID=listID.substr(1);
            if (listID == '') {
                App.alert({
                    container: '#alert-container', // alerts parent container(by default placed after the page breadcrumbs)
                    place: 'append', // "append" or "prepend" in container 
                    type: 'danger', // alert's type
                    message: 'Không có bản ghi nào được chọn', // alert's message
                    close: true, // make alert closable
                    reset: true, // close all previouse alerts first
                    focus: true, // auto scroll to the alert after shown
                    closeInSeconds: 5, // auto close after defined seconds
                    icon: 'warning' // put icon before the message
                });
                return false;
            }
            swal({
                title: sa_title,
                text: sa_message,
                type: sa_type,
                allowOutsideClick: sa_allowOutsideClick,
                showConfirmButton: sa_showConfirmButton,
                showCancelButton: sa_showCancelButton,
                showLoaderOnConfirm: sa_showLoaderOnConfirm,
                confirmButtonClass: sa_confirmButtonClass,
                cancelButtonClass: sa_cancelButtonClass,
                closeOnConfirm: sa_closeOnConfirm,
                closeOnCancel: sa_closeOnCancel,
                confirmButtonText: sa_confirmButtonText,
                cancelButtonText: sa_cancelButtonText,
            },function(isConfirm){
                if (isConfirm){
                    $.ajax({
                        type: 'POST',
                        url : Laravel.baseUrl+'/admin/ajax',
                        data: dataAjax+'&id='+listID
                    }).done(function(response){
                        if( dataType === 'delete' ){
                            $.each(listID.split(','), function(i,v){
                                $('#record-'+v).slideUp();
                            });
                        }else{
                            $.each(listID.split(','), function(i,v){
                                $('.btn-status-'+dataType+'-'+v).toggleClass('blue');
                            });
                        }
                        swal(sa_popupTitleSuccess, sa_popupMessageSuccess, "success");
                    });
                    
                } else {
                    // swal(sa_popupTitleCancel, sa_popupMessageCancel, "error");
                }
            });
        });

        $('.btn-quick-add').on('click', function(e){
            e.preventDefault();
            var btn = $(this);
            var frm = btn.parents('form');
            if( typeof btn.data('url') === 'undefined' ) return;
            var IDs = $('select[name="'+btn.data('ajax')+'"').val();
            var dataAjax = frm.serialize()+'&ids='+IDs+'&_token='+Laravel.csrfToken;
            $.ajax({
                type: 'POST',
                url : btn.data('url'),
                data: dataAjax,
                beforeSend: function(){
                    btn.button('loading');
                }
            }).done(function(response){
                btn.button('reset').toggleClass('blue');
                if(response.type == 'success'){
                    $('select[name="'+btn.data('ajax')+'"').html(response.newData).selectpicker('refresh');
                    frm.find('.input-rs').val('');
                }
                App.alert({
                    container: frm.find('.modal-body'), // alerts parent container(by default placed after the page breadcrumbs)
                    place: 'prepend', // "append" or "prepend" in container 
                    type: response.type, // alert's type
                    message: response.message, // alert's message
                    close: true, // make alert closable
                    reset: true, // close all previouse alerts first
                    focus: false, // auto scroll to the alert after shown
                    closeInSeconds: 5, // auto close after defined seconds
                    icon: response.icon // put icon before the message
                });
            });
        });

        $('#refresh-analysis').on('click', function(e){
            e.preventDefault();
            $('#yoast-seo').css('display','block');
            $('#content').val($('.tab-pane.active .content').val());
            $('#focusKeyword').val($('.tab-pane.active .meta-keywords').val());
            $('#snippet-editor-title').val($('.tab-pane.active .meta-title').val());
            $('#snippet-editor-slug').val($('.slug').val());
            $('#snippet-editor-meta-description').val($('.tab-pane.active .meta-description').val());
            $('#snippet-editor-title').focus();
        });
        
    };

    var handleFileuploader = function() {
        $('input[name="files"]').fileuploader({
            addMore: true,
            enableApi: true,
            editor: {
                cropper: {
                    ratio: '',
                    minWidth: 100,
                    minHeight: 100,
                    showGrid: true
                }
            },
            thumbnails: {
                box: '<div class="table-responsive">\
                    <table class="table table-bordered table-hover">\
                        <thead>\
                            <tr role="row" class="heading">\
                                <th width="2%"> Thứ tự </th>\
                                <th width="8%"> Hình ảnh </th>\
                                <th width="25%"> Tiêu đề </th>\
                                <th width="10%"> </th>\
                            </tr>\
                        </thead>\
                        <tbody class="fileuploader-items-list"></tbody>\
                    </table>\
                </div>',
                boxAppendTo: $('.fileuploader-items'),
                item: '<tr class="fileuploader-item columns">\
                    <td align="center" class="column-order">\
                        <input type="hidden" name="attachment[name][]" value="${name}">\
                        <input type="text" class="form-control input-mini input-orderby" name="attachment[priority][]" value="1"> </td>\
                    <td align="center" class="column-thumbnail">\
                        ${image} <span class="fileuploader-action-popup"></span>\
                    </td>\
                    <td class="column-title">\
                        <input type="text" class="form-control" name="attachment[alt][]" value="${title}"> </td>\
                    <td class="column-actions">\
                        <a href="javascript:;" class="btn btn-sm red fileuploader-action fileuploader-action-remove">\
                            <i class="fa fa-times"></i> Remove </a>\
                        <div class="progress-bar2">${progressBar}<span></span></div>\
                    </td>\
                </tr>',
                item2: '<tr class="fileuploader-item columns">\
                    <td align="center" class="column-order">\
                        <input type="hidden" name="media[id][]" value="${data.id}">\
                        <input type="text" class="form-control input-mini input-priority" name="media[priority][]" value="${data.priority}"> </td>\
                    <td align="center" class="column-thumbnail">\
                        ${image} <span class="fileuploader-action-popup"></span>\
                    </td>\
                    <td class="column-title">\
                        <input type="text" class="form-control" name="media[alt][]" value="${data.alt}"> </td>\
                    <td class="column-actions">\
                        <a href="${data.url}" class="btn btn-sm fileuploader-action fileuploader-action-download" title="${captions.download}"> <i class="fa fa-download"></i> Download </a>\
                        <a href="javascript:;" class="btn btn-delete-file btn-sm red fileuploader-action fileuploader-action-remove" data-ajax="act=delete_record|table=media_libraries|id=${data.id}|config=${data.config}|type=${data.type}">\
                            <i class="fa fa-times"></i> Remove </a>\
                        <div class="progress-bar2">${progressBar}<span></span></div>\
                    </td>\
                </tr>',
                canvasImage: false,
                removeConfirmation: false,
                onItemRemove: function(itemEl, listEl, parentEl, newInputEl, inputEl) {
                    itemEl.children().animate({'opacity': 0}, 200, function() {
                        setTimeout(function() {
                            itemEl.slideUp(200, function() {
                                itemEl.remove();
                            });
                        }, 100);
                    });
                },
                
            }
        });
    };

    var handleSelect2 = function() {
        $.fn.select2.defaults.set("theme", "bootstrap");

        var placeholder = "Mã sản phẩm";
        var dataUrl = $(".select2-data-ajax").data('url');

        // @see https://select2.github.io/examples.html#data-ajax
        function formatRepo(repo) {
            if (repo.loading) return repo.text;
            var markup = "<div>" + repo.title + "</div>";

            return markup;
        }

        function formatRepoSelection(repo) {
            return repo.title || repo.text;
        }

        $(".select2-data-ajax").select2({
            width: "off",
            closeOnSelect: false,
            allowClear: true,
            placeholder: placeholder,
            ajax: {
                url: dataUrl,
                dataType: 'json',
                delay: 250,
                data: function(params) {
                    return {
                        q: params.term, // search term
                        page: params.page
                    };
                },
                processResults: function(data, page) {
                    // parse the results into the format expected by Select2.
                    // since we are using custom formatting functions we do not need to
                    // alter the remote JSON data
                    return {
                        results: data.items
                    };
                },
                cache: true
            },
            escapeMarkup: function(markup) {
                return markup;
            }, // let our custom formatter work
            minimumInputLength: 3,
            templateResult: formatRepo,
            templateSelection: formatRepoSelection
        });
        
    };

	return{
		init: function(){
            handleSideBarActive();
			handleGroupCheckable();
			handleStrToSlug();
            handleAjax();
            handleFileuploader();
            handleSelect2();
		},
	};

}();
$(document).ready(function() {
	Admin.init();
    var targetTab = localStorage.getItem("targetTab");
    if(targetTab && $('.nav-tabs a[href="'+targetTab+'"]').length > 0){
        $('.nav-tabs a[href="'+targetTab+'"]').tab('show');
    }else{
        $('.nav-tabs a:first').tab('show');
    }
    $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
        localStorage.setItem("targetTab",$(this).attr('href'));
    });
    localStorage.setItem("targetTab","");
    $('.priceFormat').priceFormat({
        limit: 13,
        prefix: '',
        centsSeparator: ',',
        thousandsSeparator: '.',
        centsLimit: 0
    });
    
    $('.colorpicker-component').colorpicker({"color": "#2b3643"});
    $('.form-validation').validationEngine({
        autoHidePrompt: true,
        autoHideDelay: 3000
    });

    // Places
    var listProvince = ['<option value=""> -- Chọn Tỉnh / Thành phố --</option>'];
    var curProvince = $('select.province').val();
    var curDistrict = $('select.district').val();
    $.each( province, function( key, val ) {
        listProvince.push('<option value="'+key+'" '+ ( key == curProvince ? 'selected' : '' ) +'>'+val.name+'</option>');
    });
    $('select.province').html(listProvince.join("")).on('change', function(){
        var province_id = $(this).val();
        var listDistrict = ['<option value=""> -- Chọn Quận / Huyện --</option>'];
        $.each( district[province_id], function( key, val ) {
            listDistrict.push('<option value="'+key+'" '+ ( key == curDistrict ? 'selected' : '' ) +'>'+val.name+'</option>');
        });
        $('select.district').html(listDistrict.join(""));
    }).change();
});