@extends('admin.layouts.app')
@section('title', 'Show Product')
@section('content')
    <div class="card">
        <h1>Show Product</h1>

        <div>

            <div class="row">
                <div class=" ">
                    <b>Image</b>
                    <div class="col-5">
                        <img src="{{ $product->images->count()>0 ? asset('upload/' . $product->images->first()->url) : 'upload/default.png' }}"
                            id="show-image" alt="">
                    </div>
                </div>

                <div class="4">
                    <b>Name : {{ $product->name }}</b>

                </div>

                <div class="">
                    <b>Price: {{ number_format($product->price) }}đ</b>

                </div>

                <div class="">
                    <b>Sale: {{ $product->sale }}%</b>

                </div>

                <div class="form-group">
                    <b>Description</b>
                    <div class="row w-100 h-100">
                        {!! $product->description !!}
                    </div>
                </div>
                <div>
                    <b>Size</b>
                    @if ($product->details->count() > 0)
                        @foreach ($product->details as $detail)
                            <p>Size: {{ $detail->size }} - Số lượng: {{ $detail->quantity }}</p>
                        @endforeach
                    @else
                        <b> Sản phẩm này chưa nhập size</b>
                    @endif
                </div>

            </div>
            <div>
                <p>Category</p>
                @foreach ($product->categories as $item)
                    <p>{{ $item->name }}</p>
                @endforeach
            </div>
        </div>
    </div>
    </div>
@endsection
