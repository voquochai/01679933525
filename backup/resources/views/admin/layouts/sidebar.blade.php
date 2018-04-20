<div class="page-sidebar-wrapper">
    <div class="page-sidebar navbar-collapse collapse">
        <ul class="page-sidebar-menu  page-header-fixed page-sidebar-menu-light " data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200" style="padding-top: 20px">
            <li class="sidebar-toggler-wrapper hide">
                <div class="sidebar-toggler"> </div>
            </li>
            <li class="sidebar-search-wrapper">
                <form class="sidebar-search  " action="page_general_search_3.html" method="POST">
                    <a href="javascript:;" class="remove">
                        <i class="icon-close"></i>
                    </a>
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search...">
                        <span class="input-group-btn">
                            <a href="javascript:;" class="btn submit">
                                <i class="icon-magnifier"></i>
                            </a>
                        </span>
                    </div>
                </form>
            </li>
            <li class="nav-item start">
                <a href="{{ route('dashboard') }}" class="nav-link">
                    <i class="icon-home"></i>
                    <span class="title">Bảng điều khiển</span>
                    <span class="selected"></span>
                </a>
            </li>
            <li class="nav-item">
                <a href="javascript:;" class="nav-link nav-toggle">
                    <i class="icon-puzzle"></i>
                    <span class="title">Sản phẩm</span>
                    <span class="arrow"></span>
                </a>
                <ul class="sub-menu">
                    <li class="nav-item">
                        <a href="{{ route('category.index',['type'=>'san-pham']) }}" data-route="category.san-pham" class="nav-link ">
                            <span class="title"> Danh mục </span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="{{ route('product.index',['type'=>'san-pham']) }}" data-route="product.san-pham" class="nav-link ">
                            <span class="title"> Sản phẩm </span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="{{ route('attribute.index',['type'=>'product_colors']) }}" data-route="attribute.product_colors" class="nav-link ">
                            <span class="title"> Màu sắc </span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="{{ route('attribute.index',['type'=>'product_sizes']) }}" data-route="attribute.product_sizes" class="nav-link ">
                            <span class="title"> Kích cỡ </span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="{{ route('attribute.index',['type'=>'product_tags']) }}" data-route="attribute.product_tags" class="nav-link ">
                            <span class="title"> Thẻ </span>
                        </a>
                    </li>
                    
                </ul>
            </li>

            <li class="nav-item">
                <a href="{{ route('order.index',['type'=>'online']) }}" data-route="order.online" class="nav-link">
                    <i class="icon-puzzle"></i>
                    <span class="title">Đơn hàng</span>
                </a>
            </li>

            <li class="nav-item">
                <a href="javascript:;" class="nav-link nav-toggle">
                    <i class="icon-puzzle"></i>
                    <span class="title">Kho hàng</span>
                    <span class="arrow"></span>
                </a>
                <ul class="sub-menu">
                    <li class="nav-item">
                        <a href="{{ route('supplier.index',['type'=>'default']) }}" data-route="supplier.default" class="nav-link ">
                            <span class="title"> Nhà cung cấp </span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="{{ route('wms_store.index',['type'=>'default']) }}" data-route="wms_store.default" class="nav-link ">
                            <span class="title"> Kho hàng </span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="{{ route('wms_import.index',['type'=>'default']) }}" data-route="wms_import.default" class="nav-link ">
                            <span class="title"> Nhập hàng </span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="{{ route('wms_export.index',['type'=>'default']) }}" data-route="wms_export.default" class="nav-link ">
                            <span class="title"> Xuất hàng </span>
                        </a>
                    </li>
                </ul>
            </li>

            <li class="nav-item">
                <a href="javascript:;" class="nav-link nav-toggle">
                    <i class="icon-puzzle"></i>
                    <span class="title">Bài viết</span>
                    <span class="arrow"></span>
                </a>
                <ul class="sub-menu">
                    <li class="nav-item">
                        <a href="{{ route('category.index',['type'=>'tin-tuc']) }}" data-route="category.tin-tuc" class="nav-link ">
                            <span class="title"> Danh mục </span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="{{ route('post.index',['type'=>'tin-tuc']) }}" data-route="post.tin-tuc" class="nav-link ">
                            <span class="title"> Tin tức </span>
                        </a>
                    </li>

                    <li class="nav-item">
                        <a href="{{ route('post.index',['type'=>'khach-hang']) }}" data-route="post.khach-hang" class="nav-link ">
                            <span class="title"> Khách hàng </span>
                        </a>
                    </li>

                    <li class="nav-item">
                        <a href="{{ route('attribute.index',['type'=>'post_tags']) }}" data-route="attribute.post_tags" class="nav-link ">
                            <span class="title"> Thẻ </span>
                        </a>
                    </li>
                </ul>
            </li>

            <li class="nav-item">
                <a href="javascript:;" class="nav-link nav-toggle">
                    <i class="icon-puzzle"></i>
                    <span class="title">Trang tĩnh</span>
                    <span class="arrow"></span>
                </a>
                <ul class="sub-menu">
                    <li class="nav-item">
                        <a href="{{ route('single.index',['type'=>'index']) }}" data-route="single.index" class="nav-link ">
                            <span class="title"> Trang chủ </span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="{{ route('single.index',['type'=>'gioi-thieu']) }}" data-route="single.gioi-thieu" class="nav-link ">
                            <span class="title"> Giới thiệu </span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="{{ route('single.index',['type'=>'tuyen-dung']) }}" data-route="single.tuyen-dung" class="nav-link ">
                            <span class="title"> Tuyển dụng </span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="{{ route('single.index',['type'=>'lien-he']) }}" data-route="single.lien-he" class="nav-link ">
                            <span class="title"> Liên hệ </span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="{{ route('single.index',['type'=>'footer']) }}" data-route="single.footer" class="nav-link ">
                            <span class="title"> Footer </span>
                        </a>
                    </li>
                </ul>
            </li>

            <li class="nav-item">
                <a href="javascript:;" class="nav-link nav-toggle">
                    <i class="icon-puzzle"></i>
                    <span class="title">Hình ảnh</span>
                    <span class="arrow"></span>
                </a>
                <ul class="sub-menu">
                    <li class="nav-item">
                        <a href="{{ route('photo.index',['type'=>'slideshow']) }}" data-route="photo.slideshow" class="nav-link ">
                            <span class="title"> Slideshow </span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="{{ route('photo.index',['type'=>'banner']) }}" data-route="photo.banner" class="nav-link ">
                            <span class="title"> Banner </span>
                        </a>
                    </li>

                    <li class="nav-item">
                        <a href="{{ route('photo.index',['type'=>'bank']) }}" data-route="photo.bank" class="nav-link ">
                            <span class="title"> Bank </span>
                        </a>
                    </li>
                </ul>
            </li>

            <li class="nav-item">
                <a href="javascript:;" class="nav-link nav-toggle">
                    <i class="icon-puzzle"></i>
                    <span class="title">Liên kết</span>
                    <span class="arrow"></span>
                </a>
                <ul class="sub-menu">
                    <li class="nav-item">
                        <a href="{{ route('link.index',['type'=>'tieu-chi']) }}" data-route="link.tieu-chi" class="nav-link ">
                            <span class="title"> Tiêu chí </span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="{{ route('link.index',['type'=>'social']) }}" data-route="link.social" class="nav-link ">
                            <span class="title"> Mạng xã hội </span>
                        </a>
                    </li>
                </ul>
            </li>

            <li class="nav-item">
                <a href="javascript:;" class="nav-link nav-toggle">
                    <i class="icon-puzzle"></i>
                    <span class="title">Đăng ký</span>
                    <span class="arrow"></span>
                </a>
                <ul class="sub-menu">
                    <li class="nav-item">
                        <a href="{{ route('register.index',['type'=>'newsletter']) }}" data-route="register.newsletter" class="nav-link ">
                            <span class="title"> Bản tin </span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="{{ route('register.index',['type'=>'contact']) }}" data-route="register.contact" class="nav-link ">
                            <span class="title"> Liên hệ </span>
                        </a>
                    </li>
                </ul>
            </li>

            <li class="nav-item">
                <a href="{{ route('comment.index',['type'=>'default']) }}" data-route="comment.default" class="nav-link">
                    <i class="icon-user"></i>
                    <span class="title">Bình luận</span>
                </a>
            </li>

            <li class="heading">
                <h3 class="uppercase">Người dùng</h3>
            </li>
            <li class="nav-item">
                <a href="{{ route('user.index') }}" data-route="user." class="nav-link">
                    <i class="icon-user"></i>
                    <span class="title">Thành viên</span>
                </a>
            </li>

            <li class="nav-item">
                <a href="{{ route('setting.index') }}" data-route="setting." class="nav-link">
                    <i class="icon-settings"></i>
                    <span class="title">Cấu hình</span>
                </a>
            </li>
        </ul>
    </div>
</div>