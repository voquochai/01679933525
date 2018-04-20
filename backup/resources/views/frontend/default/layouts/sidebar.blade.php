<div class="sidebar">
    <div class="single-sidebar mb-40">
        <form action="#" class="sidebar-search">
            <input type="text" placeholder="Search here...">
            <button class="submit"><i class="pe-7s-search"></i></button>
        </form>
    </div>
    
    <div class="single-sidebar mb-40">
        <h3 class="sidebar-title">Category</h3>
        @php
            Menu::resetMenu();
            Menu::setOption([
                'open'=>['<ul class="category-sidebar">'],
                'baseurl' => url('/san-pham')
            ]);
            Menu::setMenu(get_categories('san-pham',$lang));
            echo Menu::getMenu();
        @endphp
    </div>
    
    <div class="single-sidebar mb-40">
        <h3 class="sidebar-title">Category</h3>
        <div id="price-range"></div>
    </div>
   
    <div class="single-sidebar mb-40">
        <h3 class="sidebar-title">Color</h3>
        <ul class="color-sidebar">
            <li><a href="#"><i style="background-color: #0000FF;"></i><span>blue</span></a></li>
            <li><a href="#"><i style="background-color: #DCDCDA;"></i><span>gray</span></a></li>
            <li><a href="#"><i style="background-color: #855439;"></i><span>brown</span></a></li>
            <li><a href="#"><i style="background-color: #50B948;"></i><span>green</span></a></li>
            <li><a href="#"><i style="background-color: #FF0000;"></i><span>red</span></a></li>
            <li><a href="#"><i style="background-color: #FF6801;"></i><span>orange</span></a></li>
            <li><a href="#"><i style="background-color: #000000;"></i><span>black</span></a></li>
        </ul>
    </div>
   
    <div class="single-sidebar mb-40">
        <h3 class="sidebar-title">Popular Tags</h3>
        <div class="tag-cloud">
            <a href="#">Chairs</a>
            <a href="#">Tables</a>
            <a href="#">Sofas</a>
            <a href="#">Lights</a>
            <a href="#">Lamps</a>
            <a href="#">curtains</a>
            <a href="#">cabinets</a>
        </div>
    </div>
</div>