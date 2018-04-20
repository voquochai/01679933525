@extends('frontend.default.master')
@section('content')
<!-- PAGE SECTION START -->
<div class="page-section section pt-100 pb-60">
    <div class="container">
        <div class="row">
            @if (count($errors) > 0)
            <div class="col-md-12" id="alert-container">
                <div class="alert alert-danger alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <ul>
                        @foreach ($errors->all() as $error)
                            <li>{!! $error !!}</li>
                        @endforeach
                    </ul>
                </div>
            </div>
            @endif
            <div class="checkout-form">
                <form method="post" action="{{ url('/thanh-toan') }}">
                    {{ csrf_field() }}
                    <div class="col-lg-6 col-md-6 mb-40">
                        <h3>Billing Details</h3>
                        <div class="row">
                            <div class="col-xs-12 mb-30">
                                <label for="b_f_name">Họ và tên <span class="required">*</span></label>                                        
                                <input id="b_f_name" name="name" type="text" value="{{ old('name') }}"/>
                            </div>
                            <div class="col-xs-12 mb-30">
                                <label>Địa chỉ <span class="required">*</span></label>
                                <input type="text" name="address" placeholder="Street address" value="{{ old('address') }}" />
                            </div>
                            <div class="col-xs-12 mb-30">
                                <label for="b_email">Email<span class="required">*</span></label>                                      
                                <input id="b_email" type="email" name="email" value="{{ old('email') }}" />
                            </div>
                            <div class="col-xs-12 mb-30">
                                <label for="b_phone">Điện thoại  <span class="required">*</span></label>                                     
                                <input id="b_phone" name="phone" type="text" placeholder="Phone Number" value="{{ old('phone') }}" />
                            </div>
                            <div class="col-sm-6 col-xs-12 mb-30">
                                <label for="b_city">Tỉnh / Thành phố <span class="required">*</span></label>
                                <select id="b_province" class="province" name="province_id">
                                    <option value="{{ old('province_id') }}" selected ></option>
                                </select>
                            </div>
                            <div class="col-sm-6 col-xs-12 mb-30">
                                <label>Quận / Huyện <span class="required">*</span></label>                                       
                                <select id="b_district" class="district" name="district_id">
                                    <option value="{{ old('district_id') }}" selected ></option>
                                </select>
                            </div>
                        </div>
                        <div class="order-notes">
                            <label for="order_note">Ghi chú</label>
                            <textarea id="order_note" name="order_note" placeholder="Notes about your order, e.g. special notes for delivery." >{{ old('order_note') }}</textarea>                               
                        </div>
                                                             
                    </div>
                    <div class="col-lg-6 col-md-6 col-xs-12 mb-40">
                        <div class="coupon-form mb-30">
                            <h3>coupon code</h3>
                            <p>Enter your coupon code if you have one</p>
                            <input type="text" placeholder="Coupon code" />
                            <input type="submit" value="Apply" />
                        </div>
                        <div class="order-wrapper">
                            <h3>Your order</h3>
                            <div class="order-table table-responsive mb-30">
                                <table>
                                    <thead>
                                        <tr>
                                            <th class="product-name">Product</th>
                                            <th class="product-total">Total</th>
                                        </tr>                           
                                    </thead>
                                    <tbody>
                                        @forelse($cart as $key => $product)
                                        <tr>
                                            <td class="product-name">
                                                {{ $product['name'] }} <strong class="product-qty"> × {{ $product['qty'] }} </strong>
                                            </td>
                                            <td class="product-total">
                                                <span class="amount">{{ $product['sum'] }}</span>
                                            </td>
                                        </tr>
                                        @empty
                                        <tr> <td colspan="30"> Hiện không có sản phẩm trong giỏ hàng </td> </tr>
                                        @endforelse
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th>Cart Subtotal</th>
                                            <td>{{ $sumPrice }}</td>
                                        </tr>
                                        <tr>
                                            <th>Order Total</th>
                                            <td><strong>{{ $sumPrice }}</strong>
                                            </td>
                                        </tr>                               
                                    </tfoot>
                                </table>
                            </div>
                            <div class="payment-method">
                                <div class="panel-group" id="accordion">
                                    <div class="panel panel-default">
                                        <div class="panel-heading" id="headingOne">
                                            <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                                Direct Bank Transfer
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="collapseOne" class="panel-collapse collapse in">
                                            <div class="panel-body">
                                                <p>Make your payment directly into our bank account. Please use your Order ID as the payment reference. Your order won’t be shipped until the funds have cleared in our account.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading" id="headingTwo">
                                            <h4 class="panel-title">
                                                <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                                                Cheque Payment
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                                            <div class="panel-body">
                                                <p>Please send your cheque to Store Name, Store Street, Store Town, Store State / County, Store Postcode.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading" id="headingThree">
                                            <h4 class="panel-title">
                                                <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
                                                PayPal
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="collapseThree" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <p>Pay via PayPal; you can pay with your credit card if you don’t have a PayPal account.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12">
                        <div class="order-button">
                            <center><input type="submit" value="Place order" /></center>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- PAGE SECTION END --> 
@endsection