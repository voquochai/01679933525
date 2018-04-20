<header class="header-section section sticker header-transparent">
    <div class="container-fluid">
        <div class="row">
            <!-- logo -->
            <div class="col-md-2 col-sm-6 col-xs-6">
                <div class="header-logo">
                    <a href="{{ url('/') }}"><img src="{{ asset('public/uploads/photo/'.$setting->getValueByName('logo')) }}" alt="main logo"></a>
                </div>
            </div>
            <!-- header-search & total-cart -->
            <div class="col-md-2 col-sm-6 col-xs-6 float-right">
                <div class="header-option-btns float-right">
                    <!-- header-search -->
                    <div class="header-search float-left">
                        <button class="search-toggle" data-toggle="modal" data-target="#myModal" ><i class="pe-7s-search"></i></button>
                    </div>
                    <!-- header Account -->
                    <div class="header-account float-left">
                        <ul>
                            <li><a href="#" data-toggle="dropdown"><i class="pe-7s-config"></i></a>
                                <ul class="dropdown-menu">
                                    <li><a href="login.html">Log in</a></li>
                                    <li><a href="register.html">Register</a></li>
                                    <li><a href="#">My Account</a></li>
                                    <li><a href="wishlist.html">Wish list</a></li>
                                    <li><a href="checkout.html">Checkout</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <!-- Header Cart -->
                    <div class="header-cart float-left">
                        <!-- Cart Toggle -->
                        <a class="cart-toggle" href="#" data-toggle="dropdown">
                            <i class="pe-7s-cart"></i>
                            <span>2</span>
                        </a>
                        <!-- Mini Cart Brief -->
                        <div class="mini-cart-brief dropdown-menu text-left">
                            <div class="cart-items"><p>You have <span>2 items</span> in your shopping bag</p></div>
                            <!-- Cart Products -->
                            <div class="all-cart-product clearfix">
                                <div class="single-cart clearfix">
                                    <div class="cart-image">
                                        <a href="product-details.html"><img src="img/product/cart-1.jpg" alt=""></a>
                                    </div>
                                    <div class="cart-info">
                                        <h5><a href="product-details.html">Le Parc Minotti Chair</a></h5>
                                        <p>Price : £9.00</p>
                                        <p>Qty : 1</p>
                                        <a href="#" class="cart-delete" title="Remove this item"><i class="pe-7s-trash"></i></a>
                                    </div>
                                </div>
                                <div class="single-cart clearfix">
                                    <div class="cart-image">
                                        <a href="product-details.html"><img src="img/product/cart-2.jpg" alt=""></a>
                                    </div>
                                    <div class="cart-info">
                                        <h5><a href="product-details.html">DSR Eiffel chair</a></h5>
                                        <p>Price : £9.00</p>
                                        <p>Qty : 1</p>
                                        <a href="#" class="cart-delete" title="Remove this item"><i class="pe-7s-trash"></i></a>
                                    </div>
                                </div>
                            </div>
                            <!-- Cart Total -->
                            <div class="cart-totals">
                                <h5>Total <span>£12.00</span></h5>
                            </div>
                            <!-- Cart Button -->
                            <div class="cart-bottom  clearfix">
                                <a href="{{ url('/thanh-toan') }}">Check out</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- primary-menu -->
            <div class="col-md-8 col-xs-12">
                @include('frontend.default.layouts.navbar')
            </div>
        </div>
    </div>
</header>