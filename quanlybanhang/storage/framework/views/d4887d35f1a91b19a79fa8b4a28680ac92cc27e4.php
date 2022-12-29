
<?php $__env->startSection('title','Create Role'); ?>
<?php $__env->startSection('content'); ?>
        <div class="card">
            <h1>Create role</h1>
            <div>
                <form action="<?php echo e(route('roles.store')); ?>" method="post">
                    <?php echo csrf_field(); ?>

                    <div class="input-group input-group-static mb-4">
                        <label>Name</label>
                        <input type="text" name="name" value="<?php echo e(old('name')); ?>" class="form-control">

                        <?php $__errorArgs = ['name'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                            <span class="text-danger"><?php echo e($message); ?></span>
                        <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                    </div>
                    
                    <div class="input-group input-group-static mb-4">
                        <label>Display Name</label>
                        <input type="text" value="<?php echo e(old('display_name')); ?>" name="display_name" class="form-control">

                        <?php $__errorArgs = ['display_name'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                            <span class="text-danger"><?php echo e($message); ?></span>
                        <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                    </div>


                    <div class="input-group input-group-static mb-4">
                        <label class="ms-0">Group</label>
                            <select name="group" class="form-control">
                                <option value="system">System</option>
                                <option value="user">User</option>
                            </select>

                            <?php $__errorArgs = ['group'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                            <span class="text-danger"><?php echo e($message); ?></span>
                        <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                    </div>


                    <div class="form-group">
                            <label for="">Permission</label>
                        <div class="row">
                        <?php $__currentLoopData = $permissions; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $groupName => $permission): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <div class="col-5">
                                    <h4><?php echo e($groupName); ?></h4>

                                    <div>
                                        <?php $__currentLoopData = $permission; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <div class="form-check">
                                            <input class="form-check-input" name="permission_ids[]" type="checkbox"
                                                value="<?php echo e($item->id); ?>">
                                            <label class="custom-control-label"
                                                for="customCheck1"><?php echo e($item->display_name); ?></label>
                                        </div>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                    </div>
                                </div>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-submit btn-primary">Submit</button>
                </form>
            </div>
        </div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\xampp\htdocs\laravel\quanlybanhang\resources\views/admin/roles/create.blade.php ENDPATH**/ ?>