<?php $__env->startSection('title', 'Create Coupon'); ?>
<?php $__env->startSection('content'); ?>
    <div class="card">
        <h1>Create Coupon</h1>

        <div>
            <form action="<?php echo e(route('coupons.store')); ?>" method="post">
                <?php echo csrf_field(); ?>

                <div class="input-group input-group-static mb-4">
                    <label>Name</label>
                    <input type="text" value="<?php echo e(old('name')); ?>" name="name" class="form-control"
                        style="text-transform: uppercase">

                    <?php $__errorArgs = ['name'];
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
                    <label>Value</label>
                    <input type="number" value="<?php echo e(old('value')); ?>" name="value" class="form-control">

                    <?php $__errorArgs = ['value'];
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
                    <label name="group" class="ms-0">Type</label>
                    <select name="type" class="form-control">
                        <option> Select Type </option>
                        <option value="money"> Money </option>

                    </select>
                </div>
                <?php $__errorArgs = ['type'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                    <span class="text-danger"> <?php echo e($message); ?></span>
                <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>

                <div class="input-group input-group-static mb-4">
                    <label>Expery date</label>
                    <input type="date" value="<?php echo e(old('expery_date')); ?>" name="expery_date" class="form-control">

                    <?php $__errorArgs = ['expery_date'];
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

                <button type="submit" class="btn btn-submit btn-primary">Submit</button>
            </form>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('admin.layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\xampp\htdocs\laravel\quanlybanhang\resources\views/admin/coupons/create.blade.php ENDPATH**/ ?>