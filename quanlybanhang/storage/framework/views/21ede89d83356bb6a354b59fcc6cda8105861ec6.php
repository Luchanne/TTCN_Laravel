<?php $__env->startSection('title', 'Thanh toán giỏ hàng'); ?>
<?php $__env->startSection('content'); ?>
    <div class="container-fluid pt-5">
        
        <form class="row px-xl-5" method="POST" action="<?php echo e(route('client.checkout.process')); ?>">
            <?php echo csrf_field(); ?>
            <div class="col-lg-8">
                <div class="mb-4">
                    <h4 class="font-weight-semi-bold mb-4">Thông tin nhận hàng</h4>
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label>Tên nè</label>
                            <input class="form-control" value="<?php echo e(old('customer_name')); ?>" name="customer_name"
                                type="text" placeholder="Luchan">
                            <?php $__errorArgs = ['customer_name'];
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

                        <div class="col-md-6 form-group">
                            <label>E-mail nè</label>
                            <input class="form-control" name="customer_email" value="<?php echo e(old('customer_email')); ?>"
                                type="text" placeholder="example@email.com">
                            <?php $__errorArgs = ['customer_email'];
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
                        <div class="col-md-6 form-group">
                            <label>Số điện thoại nè</label>
                            <input class="form-control" name="customer_phone" value="<?php echo e(old('customer_phone')); ?>"
                                type="text" placeholder="+123 456 789">
                            <?php $__errorArgs = ['customer_phone'];
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
                        <div class="col-md-6 form-group">
                            <label>Địa chỉ nè </label>
                            <input class="form-control" name="customer_address" value="<?php echo e(old('customer_address')); ?>"
                                type="text" placeholder="123 Street">
                            <?php $__errorArgs = ['customer_address'];
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
                        <div class="col-md-6 form-group">
                            <label>Muốn ghi chú gì hong? </label>
                            <input class="form-control" value="<?php echo e(old('note')); ?>" name="note" type="text"
                                placeholder="123 Street">
                            <?php $__errorArgs = ['note'];
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

                    </div>
                </div>

            </div>
            <div class="col-lg-4">
                <div class="card border-secondary mb-5">
                    <div class="card-header bg-secondary border-0">
                        <h4 class="font-weight-semi-bold m-0">Tổng hóa đơn</h4>
                    </div>
                    <div class="card-body">
                        <h5 class="font-weight-medium mb-3">Sản phẩm</h5>
                        <?php $__currentLoopData = $cart->products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <div class="d-flex justify-content-between">
                                <p> <?php echo e($item->product_quantity); ?> x <?php echo e($item->product->name); ?></p>
                                <p
                                    style="
                                                                                                                                                                                                                                                                                                                                                                <?php echo e($item->product->sale ? 'text-decoration: line-through' : ''); ?>;
                                                                                                                                                                                                                                                                                                                                                                                                                      ">
                                    <?php echo e(number_format($item->product_quantity * $item->product->price)); ?>đ
                                </p>

                                <?php if($item->product->sale): ?>
                                    <p
                                        style="
                                                                                                                                                                                                                                                                                                                                                                                                                            ">
                                        <?php echo e(number_format($item->product_quantity * $item->product->sale_price)); ?>đ
                                    </p>
                                <?php endif; ?>

                            </div>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        <hr class="mt-0">
                        <div class="d-flex justify-content-between mb-3 pt-1">
                            <h6 class="font-weight-medium">Subtotal</h6>
                            <h6 class="font-weight-medium total-price" data-price="<?php echo e($cart->total_price); ?>">
                                <?php echo e(number_format($cart->total_price)); ?>đ</h6>

                        </div>
                        <div class="d-flex justify-content-between">
                            <h6 class="font-weight-medium">Phí vận chuyển</h6>
                            <h6 class="font-weight-medium shipping" data-price="30">30,000đ</h6>
                            <input type="hidden" value="30000" name="ship">

                        </div>
                        <?php if(session('discount_amount_price')): ?>
                            <div class="d-flex justify-content-between">
                                <h6 class="font-weight-medium">Coupon </h6>
                                <h6 class="font-weight-medium coupon-div"
                                    data-price="<?php echo e(session('discount_amount_price')); ?>">
                                    <?php echo e(session('discount_amount_price')); ?>%</h6>
                            </div>
                        <?php endif; ?>

                    </div>
                    <div class="card-footer border-secondary bg-transparent">
                        <div class="d-flex justify-content-between mt-2">
                            <h5 class="font-weight-bold">Tổng tiền</h5>
                            <h5 class="font-weight-bold total-price-all"></h5>
                            <input type="hidden" id="total" value="" name="total">
                        </div>
                    </div>
                </div>
                <div class="card border-secondary mb-5">
                    <div class="card-header bg-secondary border-0">
                        <h4 class="font-weight-semi-bold m-0">Phương thức thanh toán</h4>
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <div class="custom-control custom-radio">
                                <input type="radio" class="custom-control-input" checked value="monney" name="payment">
                                <label class="custom-control-label">Thanh toán sau khi nhận hàng</label>
                            </div>

                        </div>

                    </div>
                    <div class="card-footer border-secondary bg-transparent">
                        <button class="btn btn-lg btn-block btn-primary font-weight-bold my-3 py-3">Thanh toán</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('script'); ?>
    <script>
        $(function() {


            getTotalValue()

            function getTotalValue() {
                let total = $('.total-price').data('price')
                let couponPrice = $('.coupon-div')?.data('price') ?? 0;
                let shiping = $('.shipping').data('price')*1000;
                let example = (total + shiping) *((100-couponPrice)/100) ;
                example = new Intl.NumberFormat('en-US').format(example);
                $('.total-price-all').text(`${example}đ`)
                $('#total').val((total + shiping) *((100-couponPrice)/100))
            }

        });
    </script>

<?php $__env->stopSection(); ?>

<?php echo $__env->make('client.layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\xampp\htdocs\laravel\quanlybanhang\resources\views/client/carts/checkout.blade.php ENDPATH**/ ?>