<?php $__env->startSection('title', 'Orders'); ?>
<?php $__env->startSection('content'); ?>

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

                        <?php $__currentLoopData = $orders; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <tr>
                                <td><?php echo e($item->id); ?></td>
                                <td>
                                    <div class="input-group input-group-static mb-4">
                                    <select name="status" class="form-control select-status"
                                        data-action="<?php echo e(route('admin.orders.update_status', $item->id)); ?>">
                                        <?php $__currentLoopData = config('order.status'); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $status): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <option value="<?php echo e($status); ?>"
                                                <?php echo e($status == $item->status ? 'selected' : ''); ?>><?php echo e($status); ?>

                                            </option>
                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                    </select>
                                </td>
                                <td><?php echo e(number_format($item->total)); ?>đ</td>

                                <td><?php echo e(number_format($item->ship)); ?>đ</td>
                                <td><?php echo e($item->customer_name); ?></td>
                                <td><?php echo e($item->customer_email); ?></td>

                                <td><?php echo e($item->customer_address); ?></td>
                                <td><?php echo e($item->note); ?></td>
                                <td><?php echo e($item->payment); ?></td>

                            </tr>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </table>
                    <?php echo e($orders->links()); ?>

                </div>
            </div>

        </div>
    </div>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('script'); ?>
    <script src="<?php echo e(asset('admin/assets/order/order.js')); ?>"></script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('admin.layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\xampp\htdocs\laravel\quanlybanhang\resources\views/admin/orders/index.blade.php ENDPATH**/ ?>