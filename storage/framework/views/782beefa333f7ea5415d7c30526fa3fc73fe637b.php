<?php $__env->startSection('breadcrumb'); ?>
<li>
    <a href="<?php echo e(route('admin.wms_import.index', ['type'=>$type])); ?>"> <?php echo e($pageTitle); ?> </a>
    <i class="fa fa-circle"></i>
</li>
<li>
    <span>Chỉnh sửa</span>
</li>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('content'); ?>
<div class="row">
    <?php echo $__env->make('admin.blocks.messages', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
    <!-- BEGIN FORM-->
    <form role="form" method="POST" action="<?php echo e(route('admin.wms_import.update',['id'=>$item->id,'type'=>$type])); ?>" class="form-validation">
        <?php echo e(csrf_field()); ?>

        <?php echo e(method_field('put')); ?>

        <input type="hidden" name="redirects_to" value="<?php echo e((old('redirects_to')) ? old('redirects_to') : url()->previous()); ?>" />
        <div class="col-lg-9 col-xs-12" id="qh-app"> 
            <div class="portlet box green">
                <div class="portlet-title">
                    <div class="caption"> Chỉnh sửa </div>
                </div>
                <div class="portlet-body">
                    
                    <div class="table-responsive">
                        <qh-products></qh-products>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-xs-12">
            <div class="portlet box green">
                <div class="portlet-title">
                    <div class="caption">Thông tin chung </div>
                </div>
                <div class="portlet-body">
                    
                    <div class="form-group">
                        <label class="control-label">Mã Phiếu</label>
                        <div>
                            <input type="text" name="data[code]" class="form-control" value="<?php echo e($item->code); ?>" readonly="">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label">Tình trạng</label>
                        <div>
                            <select class="selectpicker show-tick show-menu-arrow form-control" name="status[]">
                                <optgroup >
                                    <?php $__currentLoopData = $siteconfig[$type]['status']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $val): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <option value="<?php echo e($key); ?>" <?php echo e((strpos($item->status,$key) !== false)?'selected':''); ?> > <?php echo e($val); ?> </option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </optgroup>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Thứ tự</label>
                        <div>
                            <input type="text" name="priority" value="<?php echo e($item->priority); ?>" class="form-control priceFormat">
                        </div>
                    </div>
                    <div class="form-group">
                        
                        <a href="<?php echo e(url()->previous()); ?>" class="btn default" > Thoát </a>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<?php $__env->stopSection(); ?>


<?php $__env->startSection('script_bottom'); ?>
<script type="text/x-template" id="select2-data-template">
    <table class="table table-bordered table-condensed">
        <thead>
            <tr>
                <th width="7%"> Mã SP </th>
                <th width="15%"> Tên sản phẩm </th>
                <th width="7%"> Màu sắc </th>
                <th width="7%"> Kích cỡ </th>
                <th width="8%"> Giá vốn </th>
                <th width="6%"> Số lượng </th>
                <th width="10%"> Thành tiền </th>
                
            </tr>
        </thead>
        <tbody>
            <tr v-for="(item, key) in products">
                <td align="center">
                    <input type="hidden" :name="'products['+ key +'][id]'" v-model="item.id">
                    <input type="hidden" :name="'products['+ key +'][code]'" v-model="item.code">
                    {{ item.code }}
                </td>
                <td>
                    {{ item.title }}
                </td>
                <td align="center">
                    <select v-if="item.colors" :name="'products['+ key +'][color]'" class="form-control" readonly="" >
                        <option v-for="(color, keyC) in item.colors" :value="'' + color.id + ''" :selected="item.color && item.color == color.id" > {{ color.title }} </option>
                    </select>
                </td>
                <td align="center">
                    <select v-if="item.sizes" :name="'products['+ key +'][size]'" class="form-control" readonly="" >
                        <option v-for="(size, keyS) in item.sizes" :value="'' + size.id + ''" :selected="item.size && item.size == size.id" > {{ size.title }} </option>
                    </select>
                </td>
                <td align="center"> <input type="text" :name="'products['+ key +'][price]'" class="form-control validate[required,min[1]]" v-model.number="item.price" readonly="" > </td>
                <td align="center"> <input type="text" :name="'products['+ key +'][qty]'" class="form-control validate[required,min[1]]" v-model.number="item.qty" readonly="" > </td>
                <td align="center"> <span> {{ formatPrice(subtotal[key]) }} </span> </td>
                
            </tr>
            <tr>
                <td align="right" colspan="30"> Tổng: <span class="font-red-mint font-md bold"> {{ formatPrice(total) }} </span> </td>
            </tr>
        </tbody>
    </table>
</script>
<script type="text/javascript">
    <?php 
    $products = $products ? json_encode($products) : null;
     ?>
    new Vue({
        el: '#qh-app',
        data: function () {
            var products = [];
            <?php if($products): ?>
                products = <?php echo $products; ?>;
            <?php endif; ?>
            return {
                products: products
            };
        },
        components: {
            'qh-products': {
                template: '#select2-data-template',
                data: function () {
                    return {
                        products: this.$parent.products
                    };
                },
                computed: {
                    subtotal() {
                        return this.products.map((item) => {
                            return Number( item.qty * item.price )
                        });
                    },
                    total() {
                        return this.products.reduce((total, item) => {
                            return total + item.qty * item.price;
                        }, 0);
                    }
                },
                methods: {
                    deleteProduct: function (item) {
                        this.products.splice(this.products.indexOf(item) ,1);
                    },
                    formatPrice(value) {
                        let val = (value/1).toFixed(0).replace('.', ',')
                        return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".")
                    }
                }
            }
        },
        methods: {
            addProduct: function () {
                var select2data = $(".select2-data-ajax").select2("data");
                for (var i = 0; i < select2data.length; i++) {
                    this.products.push({
                        "id": select2data[i].id,
                        "code": select2data[i].code,
                        "price": select2data[i].price,
                        "title": select2data[i].title,
                        "qty": select2data[i].qty,
                        "colors": select2data[i].colors,
                        "sizes": select2data[i].sizes
                    });
                }
            }
        }
    });
</script>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.app', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>