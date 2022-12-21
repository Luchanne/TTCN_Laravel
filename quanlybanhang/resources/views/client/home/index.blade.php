        <!-- Featured Start -->
        @extends('client.layouts.app')
        @section('content')
        @section('title','Shop của Luchan')
        <div class="container-fluid pt-5">
            <div class="row px-xl-5 pb-3">
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                        <h1 class="fa fa-check text-primary m-0 mr-3"></h1>
                        <h5 class="font-weight-semi-bold m-0">Sản phẩm chất lượng</h5>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                        <h1 class="fa fa-shipping-fast text-primary m-0 mr-2"></h1>
                        <h5 class="font-weight-semi-bold m-0">Miễn phí vận chuyển</h5>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                        <h1 class="fas fa-exchange-alt text-primary m-0 mr-3"></h1>
                        <h5 class="font-weight-semi-bold m-0">Đổi trả trong 14 ngày</h5>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                        <h1 class="fa fa-phone-volume text-primary m-0 mr-3"></h1>
                        <h5 class="font-weight-semi-bold m-0">Hỗ trợ 24/7</h5>
                    </div>
                </div>
            </div>
        </div>
        <!-- Featured End -->


        <!-- Categories Start -->
        <div class="container-fluid pt-5">
            <div class="row px-xl-5 pb-3">
                <div class="col-lg-4 col-md-6 pb-1">
                    <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
                        <p class="text-right">15 sản phẩm</p>
                        <a href="" class="cat-img position-relative overflow-hidden mb-3">
                            <img class="img-fluid" src="{{ asset('client/img/cat-1.jpg') }}" alt="">
                        </a>
                        <h5 class="font-weight-semi-bold m-0" style="text-align:center">Đồ cho nam</h5>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 pb-1">
                    <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
                        <p class="text-right">15 sản phẩm</p>
                        <a href="" class="cat-img position-relative overflow-hidden mb-3">
                            <img class="img-fluid" src="{{ asset('client/img/cat-2.jpg') }}" alt="">
                        </a>
                        <h5 class="font-weight-semi-bold m-0" style="text-align:center">Đồ cho nữ</h5>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 pb-1">
                    <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
                        <p class="text-right">15 sản phẩm</p>
                        <a href="" class="cat-img position-relative overflow-hidden mb-3">
                            <img class="img-fluid" src="{{ asset('client/img/cat-3.jpg') }}" alt="">
                        </a>
                        <h5 class="font-weight-semi-bold m-0" style="text-align:center">Đồ cho em bé</h5>
                    </div>
                </div>
            </div>
        </div>
        <!-- Categories End -->


        <!-- Offer Start -->
        <div class="container-fluid offer pt-5">
            <div class="row px-xl-5">
                <div class="col-md-6 pb-4">
                    <div class="position-relative bg-secondary text-center text-md-right text-white mb-2 py-5 px-5">
                        <img src="img/offer-1.png" alt="">
                        <div class="position-relative" style="z-index: 1;">
                            <h5 class="text-uppercase text-primary mb-3">Giảm 20% cho tất cả hóa đơn</h5>
                            <h1 class="mb-4 font-weight-semi-bold">Bộ sưu tập mùa xuân</h1>
                            <a href="" class="btn btn-outline-primary py-md-2 px-md-3">Đặt hàng ngay</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 pb-4">
                    <div class="position-relative bg-secondary text-center text-md-left text-white mb-2 py-5 px-5">
                        <img src="{{ asset('client/img/offer-2.png') }}" alt="">
                        <div class="position-relative" style="z-index: 1;">
                            <h5 class="text-uppercase text-primary mb-3">Giảm 20% cho tất cả hóa đơn</h5>
                            <h1 class="mb-4 font-weight-semi-bold">Bộ sưu tập mùa đông</h1>
                            <a href="" class="btn btn-outline-primary py-md-2 px-md-3">Đặt hàng ngay</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Offer End -->


        <!-- Products Start -->
        <div class="container-fluid pt-5">
            <div class="text-center mb-4">
                <h2 class="section-title px-5"><span class="px-2">Products</span></h2>
            </div>
            <div class="row px-xl-5 pb-3">

                @foreach ($products as $item)
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="card product-item border-0 mb-4">
                        <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                            <img class="img-fluid w-100" src="{{ $item->images->count() > 0? asset('upload/' . $item->images->first()->url) : 'upload/default.png' }}" width="150px" height="150px" alt="">
                        </div>
                        <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                            <h6 class="text-truncate mb-3">{{ $item->name }}</h6>
                            <div class="d-flex justify-content-center">
                                <h6>{{ number_format($item->price) }}đ</h6>
                                <h6 class="text-muted ml-2"><del>{{ number_format($item->price) }}đ</del></h6>
                            </div>
                        </div>
                        <div class="card-footer d-flex justify-content-between bg-light border">
                            <a href="{{ route('client.products.show',$item->id) }}" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>Xem chi tiết</a>

                        </div>
                    </div>
                </div>
                @endforeach ()
            </div>
        </div>
        <div>
            {{$products->links()}}
        </div>
        <!-- Products End -->
@endsection
