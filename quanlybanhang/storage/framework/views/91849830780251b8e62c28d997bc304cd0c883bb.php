<?php $__env->startSection('title','Users'); ?>
<?php $__env->startSection('content'); ?>
    <div class="card">

        <?php if(session('message')): ?>
            <h3 class="text-primary"><?php echo e(session('message')); ?></h3>
        <?php endif; ?>

        <h1>
            Users List
        </h1>
        <div>
            <a href="<?php echo e(route('users.create')); ?>" class="btn btn-primary">Create</a>
        </div>
        <div>
                <table class="table table-hover">
                    <tr>
                        <th>#</th>
                        <th>Image</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Action</th>
                    </tr>

                    <?php $__currentLoopData = $users; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <tr>
                            <td><?php echo e($item->id); ?></td>
                            <td><img src="<?php echo e($item->images->count()>0 ? asset('upload/' . $item->images->first()->url) : 'upload/default.png'); ?>"
                            width="200px" height="200px" alt=""></td>
                            <td><?php echo e($item->name); ?></td>
                            <td><?php echo e($item->email); ?></td>
                            <td><?php echo e($item->phone); ?></td>
                            <td>
                                <a href="<?php echo e(route('users.edit',$item->id)); ?>" class="btn btn-warning">Edit</a>

                                <form action="<?php echo e(route('users.destroy',$item->id)); ?>" id="form-delete<?php echo e($item -> id); ?>" method="post">
                                    <?php echo csrf_field(); ?>
                                    <?php echo method_field('delete'); ?>
                                    <button class="btn btn-delete btn-danger" type="submit" data-id=<?php echo e($item->id); ?>>Delete</button>
                                </form>
                            </td>
                        </tr>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </table>
                <?php echo e($users->links()); ?>

        </div>
    </div>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('script'); ?>
    <script>

    </script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('admin.layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\xampp\htdocs\laravel\quanlybanhang\resources\views/admin/users/index.blade.php ENDPATH**/ ?>