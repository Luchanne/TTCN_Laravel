<?php $__env->startSection('title','Roles'); ?>
<?php $__env->startSection('content'); ?>
    <div class="card">

        <?php if(session('message')): ?>
            <h3 class="text-primary"><?php echo e(session('message')); ?></h3>
        <?php endif; ?>

        <h1>
            Role List
        </h1>
        <div>
            <a href="<?php echo e(route('roles.create')); ?>" class="btn btn-primary">Create</a>
        </div>
        <div>
                <table class="table table-hover">
                    <tr>
                        <th>#</th>
                        <th>Name</th>
                        <th>DisplayName</th>
                        <th>Action</th>
                    </tr>

                    <?php $__currentLoopData = $roles; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $role): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <tr>
                            <td><?php echo e($role->id); ?></td>
                            <td><?php echo e($role->name); ?></td>
                            <td><?php echo e($role->display_name); ?></td>
                            <td>
                                <a href="<?php echo e(route('roles.edit',$role->id)); ?>" class="btn btn-warning">Edit</a>

                                <form action="<?php echo e(route('roles.destroy',$role->id)); ?>" id="form-delete<?php echo e($role -> id); ?>" method="post">
                                    <?php echo csrf_field(); ?>
                                    <?php echo method_field('delete'); ?>
                                        <button class="btn btn-delete btn-danger" type="submit" data-id=<?php echo e($role->id); ?>>Delete</button>
                                </form>
                            </td>
                        </tr>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </table>
                <?php echo e($roles->links()); ?>

        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('script'); ?>
    <script>

    </script>
<?php $__env->stopSection(); ?>


<?php echo $__env->make('admin.layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\xampp\htdocs\laravel\quanlybanhang\resources\views/admin/roles/index.blade.php ENDPATH**/ ?>