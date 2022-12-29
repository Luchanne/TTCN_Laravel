  <!-- Featured Start -->
  
  <?php $__env->startSection('title', 'Giỏ hàng'); ?>
  <?php $__env->startSection('content'); ?>


      <div class="row px-xl-5">
          <?php if(session('message')): ?>
              <div class="row">
                  <h3 class="text-danger"><?php echo e(session('message')); ?></h3>
              </div>
          <?php endif; ?>
          <div class="col-lg-8 table-responsive mb-5">
              <table class="table table-bordered text-center mb-0">
                  <thead class="bg-secondary text-dark">
                      <tr>
                          <th>Sản phẩm</th>
                          <th>Giá</th>
                          <th>Size</th>
                          <th>Sale</th>
                          <th>Số lượng</th>
                          <th>Tổng</th>
                          <th>Hành động</th>
                      </tr>
                  </thead>
                  <tbody class="align-middle">
                      <?php $__currentLoopData = $cart->products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                          <tr id="row-<?php echo e($item->id); ?>">
                              <td class="align-middle"><img src="<?php echo e($item->product->image_path); ?>" alt=""
                                      style="width: 50px;">
                                  <?php echo e($item->product->name); ?></td>
                              <td class="align-middle">
                                  <p
                                      style="<?php echo e($item->product->sale ? 'text-decoration: line-through' : ''); ?>;                                                                                                                                                                                                                                                 ">
                                      <?php echo e(number_format($item->product->price)); ?>đ
                                  </p>

                                  <?php if($item->product->sale): ?>
                                      <p
                                          style="
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ">
                                          <?php echo e(number_format($item->product->sale_price)); ?>đ
                                      </p>
                                  <?php endif; ?>
                              </td>
                              <td class="align-middle"><?php echo e($item->product_size); ?></td>
                              <td class="align-middle"><?php echo e($item->product->sale); ?>%</td>
                              <td class="align-middle">
                                  <div class="input-group quantity mx-auto" style="width: 100px;">
                                      <div class="input-group-btn">
                                          <button class="btn btn-sm btn-primary btn-minus btn-update-quantity"
                                              data-action="<?php echo e(route('client.carts.update_product_quantity', $item->id)); ?>"
                                              data-id="<?php echo e($item->id); ?>">
                                              <i class="fa fa-minus"></i>
                                          </button>
                                      </div>
                                      <input type="number"
                                          class="form-control form-control-sm bg-secondary text-center p-0"
                                          id="productQuantityInput-<?php echo e($item->id); ?>" min="1"
                                          value="<?php echo e($item->product_quantity); ?>">
                                      <div class="input-group-btn">
                                          <button class="btn btn-sm btn-primary btn-plus btn-update-quantity"
                                              data-action="<?php echo e(route('client.carts.update_product_quantity', $item->id)); ?>"
                                              data-id="<?php echo e($item->id); ?>">
                                              <i class="fa fa-plus"></i>
                                          </button>
                                      </div>
                                  </div>
                              </td>
                              <td class="align-middle">
                                  <span id="cartProductPrice<?php echo e($item->id); ?>">
                                      <?php echo e(number_format($item->product->sale ? $item->product->sale_price * $item->product_quantity : $item->product->price * $item->product_quantity)); ?>đ</span>

                              </td>
                              <td class="align-middle">
                                  <button class="btn btn-sm btn-primary btn-delete btn-remove-product"
                                      data-action="<?php echo e(route('client.carts.remove_product', $item->id)); ?>"  data-id="<?php echo e($item->id); ?>"><i
                                          class="fa fa-times"></i></button>
                              </td>
                          </tr>
                      <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                  </tbody>
              </table>
          </div>
          <div class="col-lg-4">
              
              <form class="mb-5" method="POST" action="<?php echo e(route('client.carts.apply_coupon')); ?>">
                  <?php echo csrf_field(); ?>
                  <div class="input-group">
                      
                      <input type="text" class="form-control p-4" value="<?php echo e(Session::get('coupon_code')); ?>" name="coupon_code"
                          placeholder="Coupon Code">
                      <div class="input-group-append">
                          <button class="btn btn-primary">Apply Coupon</button>
                      </div>
                  </div>
              </form>
              <div class="card border-secondary mb-5">
                  <div class="card-header bg-secondary border-0">
                      <h4 class="font-weight-semi-bold m-0">Tổng hóa đơn</h4>
                  </div>
                  <div class="card-body">
                      <div class="d-flex justify-content-between mb-3 pt-1">
                          <h6 class="font-weight-medium">Subtotal</h6>
                          <h6 class="font-weight-medium total-price" data-price="<?php echo e($cart->total_price); ?>">
                              <?php echo e(number_format($cart->total_price)); ?>đ</h6>
                      </div>

                        <?php if(session('discount_amount_price')): ?>
                        <div class="d-flex justify-content-between ">
                            <h6 class="font-weight-medium">Coupon </h6>
                            <h6 class="font-weight-medium coupon-div"
                                data-price="<?php echo e(session('discount_amount_price')); ?>">
                                <?php echo e(session('discount_amount_price')); ?>%</h6>
                        </div>
                        <?php endif; ?>
                    </div>
                  </div>
                  <div class="card-footer border-secondary bg-transparent">
                      <div class="d-flex justify-content-between mt-2">
                          <h5 class="font-weight-bold">Tổng tiền</h5>
                          <h5 class="font-weight-bold total-price-all"></h5>
                      </div>
                      
                      <a href="<?php echo e(route('client.checkout.index')); ?>" class="btn btn-block btn-primary my-3 py-3">Thanh toán</a>
                  </div>
              </div>
          </div>
      </div>
  <?php $__env->stopSection(); ?>
  <?php $__env->startSection('script'); ?>
  <script type="text/javascript">
          $(function() {
              getTotalValue();

              function getTotalValue() {
                  let total = $('.total-price').data('price');
                  let couponPrice = $(".coupon-div")?.data("price")  ?? 0;
                  let example = total*(100 - couponPrice)/100;
                  example = new Intl.NumberFormat('en-US').format(example);
                  $(".total-price-all").text(`${example}đ`);
              }

              $(document).on('click', '.btn-remove-product', function(e) {
                  let url = $(this).data('action');
                  confirmDelete()
                      .then(function() {
                          $.post(url, (res) => {
                              let cart = res.cart;
                              let cartProductId = res.product_cart_id;
                              $('#productCountCart').text(cart.product_count);
                              $('.total-price')
                                  .text(`${cart.total_price}đ`)
                                  .data("price", cart.product_count);
                              $(`#row-${cartProductId}`).remove();
                              getTotalValue();
                          });
                      })
                      .catch(function() {});
              });

              const TIME_TO_UPDATE = 1000;

              $(document).on(
                  "click",
                  ".btn-update-quantity",
                  _.debounce(function(e) {
                      let url = $(this).data("action");
                      let id = $(this).data("id");
                      let data = {
                          product_quantity: $(`#productQuantityInput-${id}`).val(),
                          "_token": "<?php echo e(csrf_token()); ?>",
                      };
                      $.post(url, data, (res) => {
                          let cartProductId = res.product_cart_id;
                          let cart = res.cart;
                          $("#productCountCart").text(cart.product_count);
                          if (res.remove_product) {
                              $(`#row-${cartProductId}`).remove();
                          } else {
                              $(`#cartProductPrice${cartProductId}`).html(
                                  `$${res.cart_product_price}`
                              );
                          }
                          getTotalValue();
                        //   cartProductPrice;
                          $(".total-price").text(`${cart.total_price}đ`);
                          Swal.fire({
                              position: "top-end",
                              icon: "success",
                              title: "success",
                              showConfirmButton: false,
                              timer: 1500,
                          });
                      });
                  }, TIME_TO_UPDATE)
              );
          });
      </script>
  <?php $__env->stopSection(); ?>

<?php echo $__env->make('client.layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\xampp\htdocs\laravel\quanlybanhang\resources\views/client/carts/index.blade.php ENDPATH**/ ?>