@extends('client.layouts.app')
@section('title', 'Thanh toán giỏ hàng')
@section('content')
    <div class="container-fluid pt-5">
        {{-- {{ route('client.checkout.proccess') }} --}}
        <form class="row px-xl-5" method="POST" action="{{ route('client.checkout.process') }}">
            @csrf
            <div class="col-lg-8">
                <div class="mb-4">
                    <h4 class="font-weight-semi-bold mb-4">Thông tin nhận hàng</h4>
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label>Tên nè</label>
                            <input class="form-control" value="{{ old('customer_name') }}" name="customer_name"
                                type="text" placeholder="Luchan">
                            @error('customer_name')
                                <span class="text-danger">{{ $message }}</span>
                            @enderror ()

                        </div>

                        <div class="col-md-6 form-group">
                            <label>E-mail nè</label>
                            <input class="form-control" name="customer_email" value="{{ old('customer_email') }}"
                                type="text" placeholder="example@email.com">
                            @error('customer_email')
                                <span class="text-danger">{{ $message }}</span>
                            @enderror ()
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Số điện thoại nè</label>
                            <input class="form-control" name="customer_phone" value="{{ old('customer_phone') }}"
                                type="text" placeholder="+123 456 789">
                            @error('customer_phone')
                                <span class="text-danger">{{ $message }}</span>
                            @enderror ()
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Địa chỉ nè </label>
                            <input class="form-control" name="customer_address" value="{{ old('customer_address') }}"
                                type="text" placeholder="123 Street">
                            @error('customer_address')
                                <span class="text-danger">{{ $message }}</span>
                            @enderror ()
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Muốn ghi chú gì hong? </label>
                            <input class="form-control" value="{{ old('note') }}" name="note" type="text"
                                placeholder="123 Street">
                            @error('note')
                                <span class="text-danger">{{ $message }}</span>
                            @enderror ()
                        </div>

                    </div>
                </div>

            </div>
            <div class="col-lg-4">
                <div class="card border-secondary mb-5">
                    <div class="card-header bg-secondary border-0">
                        <h4 class="font-weight-semi-bold m-0">Tổng hóa đơn</h4>
                    </div>
                    <div class="card-body">
                        <h5 class="font-weight-medium mb-3">Sản phẩm</h5>
                        @foreach ($cart->products as $item)
                            <div class="d-flex justify-content-between">
                                <p> {{ $item->product_quantity }} x {{ $item->product->name }}</p>
                                <p
                                    style="
                                                                                                                                                                                                                                                                                                                                                                {{ $item->product->sale ? 'text-decoration: line-through' : '' }};
                                                                                                                                                                                                                                                                                                                                                                                                                      ">
                                    {{ number_format($item->product_quantity * $item->product->price) }}đ
                                </p>

                                @if ($item->product->sale)
                                    <p
                                        style="
                                                                                                                                                                                                                                                                                                                                                                                                                            ">
                                        {{ number_format($item->product_quantity * $item->product->sale_price) }}đ
                                    </p>
                                @endif

                            </div>
                        @endforeach
                        <hr class="mt-0">
                        <div class="d-flex justify-content-between mb-3 pt-1">
                            <h6 class="font-weight-medium">Subtotal</h6>
                            <h6 class="font-weight-medium total-price" data-price="{{ $cart->total_price }}">
                                {{ number_format($cart->total_price) }}đ</h6>

                        </div>
                        <div class="d-flex justify-content-between">
                            <h6 class="font-weight-medium">Phí vận chuyển</h6>
                            <h6 class="font-weight-medium shipping" data-price="30">30,000đ</h6>
                            <input type="hidden" value="30000" name="ship">

                        </div>
                        @if (session('discount_amount_price'))
                            <div class="d-flex justify-content-between">
                                <h6 class="font-weight-medium">Coupon </h6>
                                <h6 class="font-weight-medium coupon-div"
                                    data-price="{{ session('discount_amount_price') }}">
                                    {{ session('discount_amount_price') }}%</h6>
                            </div>
                        @endif

                    </div>
                    <div class="card-footer border-secondary bg-transparent">
                        <div class="d-flex justify-content-between mt-2">
                            <h5 class="font-weight-bold">Tổng tiền</h5>
                            <h5 class="font-weight-bold total-price-all"></h5>
                            <input type="hidden" id="total" value="" name="total">
                        </div>
                    </div>
                </div>
                <div class="card border-secondary mb-5">
                    <div class="card-header bg-secondary border-0">
                        <h4 class="font-weight-semi-bold m-0">Phương thức thanh toán</h4>
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <div class="custom-control custom-radio">
                                <input type="radio" class="custom-control-input" checked value="monney" name="payment">
                                <label class="custom-control-label">Thanh toán sau khi nhận hàng</label>
                            </div>

                        </div>

                    </div>
                    <div class="card-footer border-secondary bg-transparent">
                        <button class="btn btn-lg btn-block btn-primary font-weight-bold my-3 py-3">Thanh toán</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
@endsection
@section('script')
    <script>
        $(function() {


            getTotalValue()

            function getTotalValue() {
                let total = $('.total-price').data('price')
                let couponPrice = $('.coupon-div')?.data('price') ?? 0;
                let shiping = $('.shipping').data('price')*1000;
                let example = (total + shiping) *((100-couponPrice)/100) ;
                example = new Intl.NumberFormat('en-US').format(example);
                $('.total-price-all').text(`${example}đ`)
                $('#total').val((total + shiping) *((100-couponPrice)/100))
            }

        });
    </script>

@endsection
