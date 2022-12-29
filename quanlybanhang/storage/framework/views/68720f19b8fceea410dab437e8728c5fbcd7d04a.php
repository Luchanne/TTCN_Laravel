  <!-- Featured Start -->
  
  <?php $__env->startSection('title', 'Home'); ?>
  <?php $__env->startSection('content'); ?>
      <div class="container-fluid pt-5">
          <?php if(session('message')): ?>
              <h1 class="text-primary"><?php echo e(session('message')); ?></h1>
          <?php endif; ?>


          <div class="col">
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

                              <td><?php echo e($item->status); ?></td>
                              <td><?php echo e(number_format($item->total)); ?>đ</td>

                              <td><?php echo e(number_format($item->ship)); ?>đ</td>
                              <td><?php echo e($item->customer_name); ?></td>
                              <td><?php echo e($item->customer_email); ?></td>

                              <td><?php echo e($item->customer_address); ?></td>
                              <td><?php echo e($item->note); ?></td>
                              <td><?php echo e($item->payment); ?></td>
                              <td>
                                  <?php if($item->status == 'chờ duyệt'): ?>
                                  
                                      <form action="<?php echo e(route('client.orders.cancel', $item->id)); ?>"
                                          id="form-cancel<?php echo e($item->id); ?>" method="post">
                                          <?php echo csrf_field(); ?>
                                          <button class="btn btn-cancel btn-danger" data-id=<?php echo e($item->id); ?>>Hủy đơn hàng</button>
                                      </form>
                                  <?php endif; ?>

                              </td>
                          </tr>
                      <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                  </table>
                  <?php echo e($orders->links()); ?>

              </div>
          </div>

      </div>
  <?php $__env->stopSection(); ?>
  <?php $__env->startSection('script'); ?>
      <script>
          $(function() {

              $(document).on("click", ".btn-cancel", function(e) {
                  e.preventDefault();
                  let id = $(this).data("id");
                  confirmDelete()
                      .then(function() {
                          $(`#form-cancel${id}`).submit();
                      })
                      .catch();
              });

          });
      </script>

  <?php $__env->stopSection(); ?>

<?php echo $__env->make('client.layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\xampp\htdocs\laravel\quanlybanhang\resources\views/client/orders/index.blade.php ENDPATH**/ ?>