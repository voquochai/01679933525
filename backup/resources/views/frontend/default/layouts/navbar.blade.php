<nav class="main-menu text-center">
    <ul>
        <li {!! (Route::currentRouteName() == 'home.index') ? 'class="active"' : '' !!} ><a href="{{ url('/') }}">Trang chủ</a></li>
        <li {!! ($type == 'gioi-thieu') ? 'class="active"' : '' !!} ><a href="{{ url('/gioi-thieu') }}">Giới thiệu</a></li>
        <li {!! ($type == 'san-pham') ? 'class="active"' : '' !!} ><a href="{{ url('/san-pham') }}">Sản phẩm</a>
            @php
                Menu::resetMenu();
                Menu::setOption([
                    'open'=>['<ul class="mega-menu">','<ul>'],
                    'baseurl' => url('/san-pham')
                ]);
                Menu::setMenu(get_categories('san-pham',$lang));
                echo Menu::getMenu();
            @endphp
        </li>
        <li {!! ($type == 'tin-tuc') ? 'class="active"' : '' !!} ><a href="{{ url('/tin-tuc') }}">Tin tức</a>
            @php
                Menu::resetMenu();
                Menu::setOption([
                    'open'=>['<ul class="sub-menu">'],
                    'baseurl' => url('/tin-tuc')
                ]);
                Menu::setMenu(get_categories('tin-tuc',$lang));
                echo Menu::getMenu();
            @endphp
        </li>
        <li {!! (Route::currentRouteName() == 'home.contact') ? 'class="active"' : '' !!} ><a href="{{ url('/lien-he') }}">Liên hệ</a></li>
    </ul>
</nav>
<div class="mobile-menu"></div>