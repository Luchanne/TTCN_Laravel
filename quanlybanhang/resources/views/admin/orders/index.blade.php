@extends('admin.layouts.app')
@section('title', 'Orders')
@section('content')

    <div class="card">

        <h1>
            Orders
        </h1>
        <div class="container-fluid pt-5">

            <div class="col card">
                <div>
                    <table class="table table-hover">
                        <tr>
                            <th>#</th>
                            <th>Tình trạng</th>
                            <th>Tổng tiền</th>
                            <th>Phí vận chuyển</th>
                            <th>Tên khách hàng</th>
                            <th>Email</th>
                            <th>Địa chỉ</th>
                            <th>Ghi chú</th>
                            <th>Phương thức thanh toán</th>
                        </tr>

                        @foreach ($orders as $item)
                            <tr>
                                <td>{{ $item->id }}</td>
                                <td>
                                    <div class="input-group input-group-static mb-4">
                                    <select name="status" class="form-control select-status"
                                        data-action="{{ route('admin.orders.update_status', $item->id) }}">
                                        @foreach (config('order.status') as $status)
                                            <option value="{{ $status }}"
                                                {{ $status == $item->status ? 'selected' : '' }}>{{ $status }}
                                            </option>
                                        @endforeach
                                    </select>
                                </td>
                                <td>{{ number_format($item->total) }}đ</td>

                                <td>{{ number_format($item->ship) }}đ</td>
                                <td>{{ $item->customer_name }}</td>
                                <td>{{ $item->customer_email }}</td>

                                <td>{{ $item->customer_address }}</td>
                                <td>{{ $item->note }}</td>
                                <td>{{ $item->payment }}</td>

                            </tr>
                        @endforeach
                    </table>
                    {{ $orders->links() }}
                </div>
            </div>

        </div>
    </div>
@endsection
@section('script')
    <script src="{{ asset('admin/assets/order/order.js') }}"></script>
@endsection
