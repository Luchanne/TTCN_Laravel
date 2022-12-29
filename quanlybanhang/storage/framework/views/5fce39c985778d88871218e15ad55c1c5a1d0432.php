<?php $__env->startSection('title', 'Coupons'); ?>
<?php $__env->startSection('content'); ?>
    <div class="card">

        <?php if(session('message')): ?>
            <h1 class="text-primary"><?php echo e(session('message')); ?></h1>
        <?php endif; ?>


        <h1>
            Coupon list
        </h1>
        <div>
            <a href="<?php echo e(route('coupons.create')); ?>" class="btn btn-primary">Create</a>

        </div>
        <div>
            <table class="table table-hover">
                <tr>
                    <th>#</th>
                    <th>Name</th>
                    <th>Type</th>
                    <th>Value</th>
                    <th>Expery Date</th>

                    <th>Action</th>
                </tr>

                <?php $__currentLoopData = $coupons; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <tr>
                        <td><?php echo e($item->id); ?></td>
                        <td><?php echo e($item->name); ?></td>

                        <td><?php echo e($item->type); ?></td>
                        <td><?php echo e($item->value); ?></td>
                        <td><?php echo e($item->expery_date); ?></td>

                        <td>

                                <a href="<?php echo e(route('coupons.edit', $item->id)); ?>" class="btn btn-warning">Edit</a>


                                <form action="<?php echo e(route('coupons.destroy', $item->id)); ?>" id="form-delete<?php echo e($item->id); ?>"
                                    method="post">
                                    <?php echo csrf_field(); ?>
                                    <?php echo method_field('delete'); ?>

                                </form>

                                <button class="btn btn-delete btn-danger" data-id=<?php echo e($item->id); ?>>Delete</button>

                        </td>
                    </tr>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </table>
            <?php echo e($coupons->links()); ?>

        </div>

    </div>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('script'); ?>

    <script></script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('admin.layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\xampp\htdocs\laravel\quanlybanhang\resources\views/admin/coupons/index.blade.php ENDPATH**/ ?>