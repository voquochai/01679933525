@extends('frontend.default.master')
@section('content')
<!-- PAGE SECTION START -->
<div class="page-section section pt-100 pb-60">
    <div class="container">
        <div class="row">
            <form action="#">               
                <div class="col-xs-12">
                    <div class="cart-table table-responsive mb-40">
                        <table>
                            <thead>
                                <tr>
                                    <th class="pro-thumbnail">hình ảnh</th>
                                    <th class="pro-title">sản phẩm</th>
                                    <th class="pro-price">giá bán (vnd)</th>
                                    <th class="pro-quantity">số lượng</th>
                                    <th class="pro-subtotal">tổng (vnd)</th>
                                    <th class="pro-remove">xóa</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($cart as $key => $product)
                                <tr id="pro-id-{{ $key }}">
                                    <td class="pro-thumbnail"><a href="#"><img src="{{ $product['image'] }}" alt="" /></a></td>
                                    <td class="pro-title"><a href="#">{{ $product['name'] }}</a></td>
                                    <td class="pro-price"><span class="amount">{{ $product['price'] }}</span></td>
                                    <td class="pro-quantity"><div class="product-quantity"><input type="text" value="{{ $product['qty'] }}" class="update-cart" data-ajax="id={{ $key }}" /></div></td>
                                    <td class="pro-subtotal">{{ $product['sum'] }}</td>
                                    <td class="pro-remove"><a href="#" class="delete-cart" data-ajax="id={{ $key }}" >×</a></td>
                                </tr>
                                @empty
                                <tr> <td colspan="30"> Hiện không có sản phẩm trong giỏ hàng </td> </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-md-8 col-sm-7 col-xs-12">
                    <div class="cart-buttons mb-30">
                        <a href="{{ url('/san-pham') }}">Tiếp tục mua hàng</a>
                    </div>
                    <div class="cart-coupon mb-40">
                        <h4>Coupon</h4>
                        <p>Nhập mã coupon của bạn</p>
                        <input type="text" placeholder="Mã coupon" />
                        <input type="submit" value="Sử dụng" />
                    </div>
                </div>
                <div class="col-md-4 col-sm-5 col-xs-12">
                    <div class="cart-total mb-40">
                        <h3>Tổng giỏ hàng</h3>
                        <table>
                            <tbody>
                                <tr class="cart-subtotal">
                                    <th>Tổng tiền</th>
                                    <td><span class="amount">{{ $sumPrice }}</span></td>
                                </tr>
                                <tr class="order-total">
                                    <th>Tổng cộng</th>
                                    <td>
                                        <strong><span class="amount">{{ $sumPrice }}</span></strong>
                                    </td>
                                </tr>                                           
                            </tbody>
                        </table>
                        <div class="proceed-to-checkout section mt-30">
                            <a href="{{ url('/thanh-toan') }}">Checkout</a>
                        </div>
                    </div>
                </div>
            </form> 
        </div>
    </div>
</div>
<!-- PAGE SECTION END --> 
@endsection