<?php $__env->startSection('breadcrumb'); ?>
<li>
    <a href="<?php echo e(route('admin.wms_export.index', ['type'=>$type])); ?>"> <?php echo e($pageTitle); ?> </a>
    <i class="fa fa-circle"></i>
</li>
<li>
    <span> Thêm mới </span>
</li>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('content'); ?>
<div class="row">
    <?php echo $__env->make('admin.blocks.messages', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
    <!-- BEGIN FORM-->
    <form role="form" method="POST" action="<?php echo e(route('admin.wms_export.store',['type'=>$type])); ?>" class="form-validation">
        <?php echo e(csrf_field()); ?>


        <div class="col-lg-9 col-xs-12" id="qh-app">
            <div class="portlet box green">
                <div class="portlet-title">
                    <div class="caption"> Thêm mới </div>
                </div>
                <div class="portlet-body">
                    <div class="form-group">
                        <div class="input-group select2-bootstrap-append">
                            <select id="select2-button-addons-single-input-group-sm" class="form-control select2-data-ajax"  multiple="" data-label="Mã sản phẩm" data-url="<?php echo e(route('admin.wms_import.ajax',['type'=>'default'])); ?>">
                            </select>
                            <span class="input-group-btn"> <button v-on:click="addProduct" type="button" id="btn-select" class="btn btn-info"> Chọn </button> </span>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <qh-products></qh-products>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-3 col-xs-12">
            <div class="portlet box green">
                <div class="portlet-title">
                    <div class="caption"> Thông tin chung </div>
                </div>
                <div class="portlet-body">
                    
                    <div class="form-group">
                        <label class="control-label">Mã Phiếu</label>
                        <div>
                            <input type="text" name="data[code]" class="form-control" value="" placeholder="Hệ thống tự phát sinh" readonly="">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label">Tình trạng</label>
                        <div>
                            <select class="selectpicker show-tick show-menu-arrow form-control" name="status[]">
                                <?php $__currentLoopData = $siteconfig[$type]['status']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $val): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <option value="<?php echo e($key); ?>" <?php echo e((old('status')) ? ( (in_array($key,old('status'))) ? 'selected' : '') : ($key=='publish')?'selected':''); ?> > <?php echo e($val); ?> </option>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label">Thứ tự</label>
                        <div>
                            <input type="text" name="priority" class="form-control priceFormat" value="<?php echo e((old('priority')) ? old('priority') : 1); ?>">
                        </div>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn green"> <i class="fa fa-check"></i> Lưu</button>
                        <a href="<?php echo e(url()->previous()); ?>" class="btn default" > Thoát </a>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('custom_script'); ?>

<script type="text/x-template" id="select2-data-template">
    <table class="table table-bordered table-condensed">
        <thead>
            <tr>
                <th width="7%"> Mã SP </th>
                <th width="15%"> Tên sản phẩm </th>
                <th width="7%"> Màu sắc </th>
                <th width="7%"> Kích cỡ </th>
                <th width="8%"> Giá bán </th>
                <th width="6%"> Số lượng </th>
                <th width="10%"> Thành tiền </th>
                <th width="8%"> Tồn kho </th>
                <th width="3%"> Xóa </th>
            </tr>
        </thead>
        <tbody>
            <tr v-for="(item, key) in products" >
                <td align="center">
                    <input type="hidden" :name="'products['+ key +'][id]'" v-model="item.product_id">
                    <input type="hidden" :name="'products['+ key +'][code]'" v-model="item.product_code">
                    <input type="hidden" :name="'products['+ key +'][title]'" v-model="item.product_title">
                    <input type="hidden" :name="'products['+ key +'][price]'" v-model="item.product_price">
                    <input type="hidden" :name="'products['+ key +'][color_id]'" v-model="item.color_id">
                    <input type="hidden" :name="'products['+ key +'][size_id]'" v-model="item.size_id">
                    <input type="hidden" :name="'products['+ key +'][color_title]'" v-model="item.color_title">
                    <input type="hidden" :name="'products['+ key +'][size_title]'" v-model="item.size_title">
                    {{ item.product_code }}
                </td>
                <td>{{ item.product_title }}</td>
                <td align="center">{{ item.color_title }}</td>
                <td align="center">{{ item.size_title }}</td>
                <td align="center"> {{ formatPrice(item.product_price) }} </td>
                <td align="center"> <input type="text" :name="'products['+ key +'][qty]'" :class="'form-control validate[required,min[1],max[' + item.inventory + ']]'" v-model.number="item.product_qty"> </td>
                <td align="center"> <span> {{ formatPrice(subtotal[key]) }} </span> </td>
                <td align="center"> <span> {{ item.inventory }} </span> </td>
                <td align="center"> <button type="button" v-on:click="deleteProduct(item)" class="btn btn-sm btn-danger"><i class="fa fa-close"></i></button> </td>
            </tr>
            <tr>
                <td align="right" colspan="30"> Tổng: <span class="font-red-mint font-md bold"> {{ formatPrice(total) }} </span> </td>
            </tr>
        </tbody>
    </table>
</script>
<script type="text/javascript">
    new Vue({
        el: '#qh-app',
        data: function () {
            var products = [];
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
                            return Number( item.product_qty * item.product_price )
                        });
                    },
                    total() {
                        return this.products.reduce((total, item) => {
                            return total + item.product_qty * item.product_price;
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
                    var flag = false;
                    for (var j = 0; j < this.products.length; j++) {
                        if( this.products[j].product_id == select2data[i].product_id && this.products[j].color_id == select2data[i].color_id && this.products[j].size_id == select2data[i].size_id ){
                            flag = true;
                            break;
                        }
                    }
                    if(!flag){
                        this.products.push({
                            "id": select2data[i].id,
                            "product_id": select2data[i].product_id,
                            "product_code": select2data[i].product_code,
                            "product_price": select2data[i].product_price,
                            "product_title": select2data[i].title,
                            "product_qty": select2data[i].product_qty,
                            "color_id": select2data[i].color_id,
                            "size_id": select2data[i].size_id,
                            "color_title": select2data[i].color_title,
                            "size_title": select2data[i].size_title,
                            "inventory": select2data[i].inventory
                        });
                    }
                }
            }
        }
    });

    // $(document).ready(function(){
    //     var data = $(".select2-data-ajax").select2("data");
    //     $('.select2-data-ajax').on('select2:select', function (e) {
    //         var product_id = e.params.data.product_id;
    //         for (var i = 0; i < data.length; i++) {
    //             if(product_id == data[i].product_id){

    //             }
    //         }
    //         data = $(".select2-data-ajax").select2("data");
    //     });
    // })

</script>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.app', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>