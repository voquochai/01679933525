<div class="page-sidebar-wrapper">
    <div class="page-sidebar navbar-collapse collapse">
        <ul class="page-sidebar-menu page-header-fixed page-sidebar-menu-light" data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200">
            <li class="sidebar-toggler-wrapper hide">
                <div class="sidebar-toggler"> </div>
            </li>
            <li class="nav-item start padding-tb-20">
                <a href="<?php echo e(route('admin.dashboard.index')); ?>" data-route="dashboard" class="nav-link">
                    <i class="icon-home"></i>
                    <span class="title">Bảng điều khiển</span>
                    <span class="selected"></span>
                </a>
            </li>
            <li class="nav-item">
                <a href="javascript:;" class="nav-link nav-toggle">
                    <i class="icon-exclamation"></i>
                    <span class="title">Sản phẩm</span>
                    <span class="arrow"></span>
                </a>
                <ul class="sub-menu">
                    <li class="nav-item">
                        <a href="<?php echo e(route('admin.category.index',['type'=>'san-pham'])); ?>" data-route="category.san-pham" class="nav-link ">
                            <span class="title"> Danh mục </span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="<?php echo e(route('admin.product.index',['type'=>'san-pham'])); ?>" data-route="product.san-pham" class="nav-link ">
                            <span class="title"> Sản phẩm </span>
                        </a>
                    </li>
                    
                    <li class="nav-item">
                        <a href="<?php echo e(route('admin.order.index',['type'=>'online'])); ?>" data-route="order.online" class="nav-link">
                            <span class="title">Đơn hàng</span>
                        </a>
                    </li>

                    <li class="nav-item">
                        <a href="<?php echo e(route('admin.coupon.index')); ?>" data-route="coupon" class="nav-link">
                            <span class="title">Coupon</span>
                        </a>
                    </li>
                </ul>
            </li>

            

            <li class="nav-item">
                <a href="javascript:;" class="nav-link nav-toggle">
                    <i class="icon-exclamation"></i>
                    <span class="title">Kho hàng</span>
                    <span class="arrow"></span>
                </a>
                <ul class="sub-menu">
                    <li class="nav-item">
                        <a href="<?php echo e(route('admin.supplier.index',['type'=>'default'])); ?>" data-route="supplier.default" class="nav-link ">
                            <span class="title"> Nhà cung cấp </span>
                        </a>
                    </li>
                    
                    <li class="nav-item">
                        <a href="<?php echo e(route('admin.wms_import.index',['type'=>'default'])); ?>" data-route="wms_import.default" class="nav-link ">
                            <span class="title"> Nhập hàng </span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="<?php echo e(route('admin.wms_export.index',['type'=>'default'])); ?>" data-route="wms_export.default" class="nav-link ">
                            <span class="title"> Xuất hàng </span>
                        </a>
                    </li>
                </ul>
            </li>

            <li class="nav-item">
                <a href="javascript:;" class="nav-link nav-toggle">
                    <i class="icon-exclamation"></i>
                    <span class="title">Bài viết</span>
                    <span class="arrow"></span>
                </a>
                <ul class="sub-menu">
                    
                    <li class="nav-item">
                        <a href="<?php echo e(route('admin.post.index',['type'=>'dich-vu'])); ?>" data-route="post.dich-vu" class="nav-link ">
                            <span class="title"> Dịch vụ </span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="<?php echo e(route('admin.post.index',['type'=>'thu-thuat'])); ?>" data-route="post.thu-thuat" class="nav-link ">
                            <span class="title"> Thủ thuật </span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="<?php echo e(route('admin.post.index',['type'=>'tieu-chi'])); ?>" data-route="post.tieu-chi" class="nav-link ">
                            <span class="title"> Tiêu chí </span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="<?php echo e(route('admin.post.index',['type'=>'chinh-sach-quy-dinh'])); ?>" data-route="post.chinh-sach-quy-dinh" class="nav-link ">
                            <span class="title"> Chính sách &amp; Quy định </span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="<?php echo e(route('admin.post.index',['type'=>'ho-tro-khach-hang'])); ?>" data-route="post.ho-tro-khach-hang" class="nav-link ">
                            <span class="title"> Hỗ trợ khách hàng </span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="<?php echo e(route('admin.post.index',['type'=>'payment'])); ?>" data-route="post.payment" class="nav-link ">
                            <span class="title"> Hình thức thanh toán </span>
                        </a>
                    </li>
                    
                </ul>
            </li>

            <li class="nav-item">
                <a href="javascript:;" class="nav-link nav-toggle">
                    <i class="icon-exclamation"></i>
                    <span class="title">Trang tĩnh</span>
                    <span class="arrow"></span>
                </a>
                <ul class="sub-menu">
                    <li class="nav-item">
                        <a href="<?php echo e(route('admin.page.index',['type'=>'index'])); ?>" data-route="page.index" class="nav-link ">
                            <span class="title"> Trang chủ </span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="<?php echo e(route('admin.page.index',['type'=>'gioi-thieu'])); ?>" data-route="page.gioi-thieu" class="nav-link ">
                            <span class="title"> Giới thiệu </span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="<?php echo e(route('admin.page.index',['type'=>'tuyen-dung'])); ?>" data-route="page.tuyen-dung" class="nav-link ">
                            <span class="title"> Tuyển dụng </span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="<?php echo e(route('admin.page.index',['type'=>'lien-he'])); ?>" data-route="page.lien-he" class="nav-link ">
                            <span class="title"> Liên hệ </span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="<?php echo e(route('admin.page.index',['type'=>'footer'])); ?>" data-route="page.footer" class="nav-link ">
                            <span class="title"> Footer </span>
                        </a>
                    </li>
                </ul>
            </li>

            <li class="nav-item">
                <a href="javascript:;" class="nav-link nav-toggle">
                    <i class="icon-exclamation"></i>
                    <span class="title">Hình ảnh</span>
                    <span class="arrow"></span>
                </a>
                <ul class="sub-menu">
                    <li class="nav-item">
                        <a href="<?php echo e(route('admin.photo.index',['type'=>'slideshow'])); ?>" data-route="photo.slideshow" class="nav-link ">
                            <span class="title"> Slideshow </span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="<?php echo e(route('admin.photo.index',['type'=>'banner'])); ?>" data-route="photo.banner" class="nav-link ">
                            <span class="title"> Banner </span>
                        </a>
                    </li>

                    <li class="nav-item">
                        <a href="<?php echo e(route('admin.photo.index',['type'=>'bank'])); ?>" data-route="photo.bank" class="nav-link ">
                            <span class="title"> Bank </span>
                        </a>
                    </li>
                </ul>
            </li>

            <li class="nav-item">
                <a href="javascript:;" class="nav-link nav-toggle">
                    <i class="icon-exclamation"></i>
                    <span class="title">Liên kết</span>
                    <span class="arrow"></span>
                </a>
                <ul class="sub-menu">
                    <li class="nav-item">
                        <a href="<?php echo e(route('admin.link.index',['type'=>'tieu-chi'])); ?>" data-route="link.tieu-chi" class="nav-link ">
                            <span class="title"> Tiêu chí </span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="<?php echo e(route('admin.link.index',['type'=>'social'])); ?>" data-route="link.social" class="nav-link ">
                            <span class="title"> Mạng xã hội </span>
                        </a>
                    </li>
                </ul>
            </li>

            <li class="nav-item">
                <a href="javascript:;" class="nav-link nav-toggle">
                    <i class="icon-exclamation"></i>
                    <span class="title">Đăng ký</span>
                    <span class="arrow"></span>
                </a>
                <ul class="sub-menu">
                    <li class="nav-item">
                        <a href="<?php echo e(route('admin.register.index',['type'=>'newsletter'])); ?>" data-route="register.newsletter" class="nav-link ">
                            <span class="title"> Bản tin </span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="<?php echo e(route('admin.register.index',['type'=>'contact'])); ?>" data-route="register.contact" class="nav-link ">
                            <span class="title"> Liên hệ </span>
                        </a>
                    </li>
                </ul>
            </li>

            <li class="nav-item">
                <a href="<?php echo e(route('admin.comment.index')); ?>" data-route="comment" class="nav-link">
                    <i class="icon-exclamation"></i>
                    <span class="title">Bình luận</span>
                </a>
            </li>

            <li class="nav-item">
                <a href="<?php echo e(route('admin.member.index')); ?>" data-route="member" class="nav-link">
                    <i class="icon-people"></i>
                    <span class="title">Thành viên</span>
                </a>
            </li>

            <li class="nav-item">
                <a href="javascript:;" class="nav-link nav-toggle">
                    <i class="icon-user"></i>
                    <span class="title"> Quản trị </span>
                    <span class="arrow"></span>
                </a>
                <ul class="sub-menu">
                    <li class="nav-item">
                        <a href="<?php echo e(route('admin.role.index')); ?>" data-route="role" class="nav-link">
                            <span class="title"> Chức năng </span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="<?php echo e(route('admin.permission.index')); ?>" data-route="permission" class="nav-link">
                            <span class="title"> Quyền hạn </span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="<?php echo e(route('admin.group.index')); ?>" data-route="group" class="nav-link">
                            <span class="title"> Nhóm quản trị </span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="<?php echo e(route('admin.user.index')); ?>" data-route="user" class="nav-link">
                            <span class="title"> Tài khoản </span>
                        </a>
                    </li>
                </ul>
            </li>

            <li class="nav-item">
                <a href="<?php echo e(route('admin.setting.index')); ?>" data-route="setting" class="nav-link">
                    <i class="icon-settings"></i>
                    <span class="title">Cấu hình</span>
                </a>
            </li>
        </ul>
    </div>
</div>