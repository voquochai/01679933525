@php
    $colors = get_attributes('product_colors',$lang);
@endphp
<div class="sidebar">
    <div class="single-sidebar mb-40">
        <form method="get" action="{{ url('/san-pham') }}" class="sidebar-search">
            <input type="text" name="keyword" value="{{ Request::get('keyword') }}" placeholder="{{ __('site.search') }}">
            <button class="submit"><i class="pe-7s-search"></i></button>
        </form>
    </div>
    
    <div class="single-sidebar mb-40">
        <h3 class="sidebar-title">{{ __('site.category') }}</h3>
        @php
            Menu::resetMenu();
            Menu::setOption([
                'open'=>['<ul class="category-sidebar">'],
                'baseurl' => url('/san-pham')
            ]);
            Menu::setMenu(get_categories('san-pham',$lang));
            echo Menu::getMenu(@$category->id);
        @endphp
    </div>
    
    <div class="single-sidebar mb-40">
        <div id="price-range"></div>
    </div>
   
    <div class="single-sidebar mb-40">
        <h3 class="sidebar-title">Color</h3>
        <ul class="color-sidebar">
            @forelse($colors as $color)
            <li><a href="{{ route('frontend.home.archive', ['type'=>'san-pham','color'=>$color->slug] ) }}"> <i style="background-color: {!! $color->value !!};"></i> <span>{!! $color->title !!}</span> </a></li>
            @empty
            @endforelse
        </ul>
    </div>

</div>