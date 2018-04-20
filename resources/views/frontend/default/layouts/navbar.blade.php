<nav class="main-menu text-center">
    <ul>
        <li {!! (Route::currentRouteName() == 'home.index') ? 'class="active"' : '' !!} ><a href="{{ url('/') }}"> {{ __('site.home') }} </a></li>
        <li {!! ($type == 'gioi-thieu') ? 'class="active"' : '' !!} ><a href="{{ url('/gioi-thieu') }}"> {{ __('site.about') }} </a></li>
        <li {!! ($type == 'san-pham') ? 'class="active"' : '' !!} ><a href="{{ url('/san-pham') }}"> {{ __('site.product') }} </a>
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
        <li {!! ($type == 'tin-tuc') ? 'class="active"' : '' !!} ><a href="{{ url('/tin-tuc') }}"> {{ __('site.news') }} </a>
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
        <li {!! (Route::currentRouteName() == 'home.contact') ? 'class="active"' : '' !!} ><a href="{{ url('/lien-he') }}"> {{ __('site.contact') }} </a></li>
    </ul>
</nav>
<div class="mobile-menu"></div>