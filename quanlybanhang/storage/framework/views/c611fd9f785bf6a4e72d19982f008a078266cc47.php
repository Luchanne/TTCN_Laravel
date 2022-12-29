<?php $__env->startSection('title','Edit User '.$user->name); ?>
<?php $__env->startSection('content'); ?>
        <div class="card">
            <h1>Edit User</h1>
            <div>
                <form action="<?php echo e(route('users.update',$user->id)); ?>" method="post" enctype="multipart/form-data">
                    <?php echo csrf_field(); ?>
                    <?php echo method_field('put'); ?>
                    <div class="row">
                    <div class=" input-group-static col-5 mb-4">
                        <label>Image</label>
                        <input type="file" accept="image/png,image/jpeg,image/jpg" name="image" id="image-input" class="form-control">

                        <?php $__errorArgs = ['image'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                            <span class="text-danger"> <?php echo e($message); ?></span>
                        <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                    </div>
                    <div class="col-5">
                        <img src="<?php echo e($user->images->count()>0 ? asset('upload/' . $user->images->first()->url) : 'upload/default1.png'); ?>" width="200" height="200"
                            id="show-image" alt="">
                    </div>
                </div>

                    <div class="input-group input-group-static mb-4">
                        <label>Name</label>
                        <input type="text" name="name" value="<?php echo e(old('name') ?? $user->name); ?>" class="form-control">

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
                        <label>Email</label>
                        <input type="text" value="<?php echo e(old('email') ?? $user->email); ?>" name="email" class="form-control">

                        <?php $__errorArgs = ['email'];
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
                        <label>Phone</label>
                        <input type="text" value="<?php echo e(old('phone') ?? $user->phone); ?>" name="phone" class="form-control">

                        <?php $__errorArgs = ['phone'];
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
                        <label>Address</label>
                        <textarea type="text" name="address" class="form-control"><?php echo e($user->address); ?></textarea>

                        <?php $__errorArgs = ['address'];
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
                        <label name="group" class="ms-0">Gender</label>
                            <select name="gender" class="form-control" value="<?php echo e($user->gender); ?>" >
                                <option value="male">Male</option>
                                <option value="fe-male">FeMale</option>
                            </select>
                        <?php $__errorArgs = ['gender'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                            <span class="text-danger"> <?php echo e($message); ?></span>
                        <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                    </div>


                    <div class="input-group input-group-static mb-4">
                        <label>Password</label>
                         <input type="password" name="password" class="form-control">
                            <?php $__errorArgs = ['password'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                <span class="text-danger"> <?php echo e($message); ?></span>
                             <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                    </div>


                    <div class="form-group">
                            <label for="">Roles</label>
                        <div class="row">
                        <?php $__currentLoopData = $roles; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $groupName => $role): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <div class="col-5">
                                    <h4><?php echo e($groupName); ?></h4>

                                    <div>
                                        <?php $__currentLoopData = $role; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <div class="form-check">
                                            <input class="form-check-input" name="role_ids[]"
                                            <?php echo e($user->roles->contains('id',$item->id) ? 'checked' : ' '); ?> type="checkbox"
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

                    <button type="submit" class="btn btn-submit btn-primary">Update</button>
                </form>
            </div>
        </div>
    <?php echo $__env->make('admin.users.scripts', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<?php $__env->stopSection(); ?>



<?php echo $__env->make('admin.layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\xampp\htdocs\laravel\quanlybanhang\resources\views/admin/users/edit.blade.php ENDPATH**/ ?>