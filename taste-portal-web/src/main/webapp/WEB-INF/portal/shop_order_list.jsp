<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../decorators/taglib.jsp" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta name="decorator" content="default">
    <title>订单</title>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="${ctxStatic}/assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css">
    <link href="${ctxStatic}/assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css">
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN PAGE LEVEL STYLES -->
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/assets/global/plugins/select2/select2.css"/>
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/assets/global/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css"/>
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css"/>
    <!-- END PAGE LEVEL STYLES -->
    <!-- BEGIN THEME STYLES -->
    <link href="${ctxStatic}/assets/global/css/components-md.css" id="style_components" rel="stylesheet" type="text/css">
    <link href="${ctxStatic}/assets/global/css/plugins-md.css" rel="stylesheet" type="text/css">
    <link href="${ctxStatic}/assets/admin/layout3/css/layout.css" rel="stylesheet" type="text/css">
    <link href="${ctxStatic}/assets/admin/layout3/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color">
    <!-- END THEME STYLES -->
    <link rel="shortcut icon" href="favicon.ico"/>
    <link href="${ctxStatic}/assets/global/plugins/bootstrap-table/bootstrap-table.css" rel="stylesheet" type="text/css"/>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<!-- DOC: Apply "page-header-menu-fixed" class to set the mega menu fixed  -->
<!-- DOC: Apply "page-header-top-fixed" class to set the top menu fixed  -->
<body class="page-md">
<!-- BEGIN HEADER -->
<!-- END HEADER -->
<!-- BEGIN PAGE CONTAINER -->
<div class="page-container">
    <!-- BEGIN PAGE CONTENT -->
    <div class="page-content">
        <div class="container">
            <!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
            <div class="modal fade" id="portlet-config" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                            <h4 class="modal-title">Modal title</h4>
                        </div>
                        <div class="modal-body">
                            Widget settings form goes here
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn blue">Save changes</button>
                            <button type="button" class="btn default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
            <!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->
            <!-- BEGIN PAGE BREADCRUMB -->
            <ul class="page-breadcrumb breadcrumb">
                <li>
                    <a href="/toIndex">主页</a><</i>
                </li>
                <li class="active">
                    订单列表
                </li>
            </ul>
            <!-- END PAGE BREADCRUMB -->
            <!-- BEGIN PAGE CONTENT INNER -->
            <div class="row">
                <div class="col-md-12">
                    <!-- Begin: life time stats -->
                    <div class="portlet light">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="icon-basket font-green-sharp"></i>
                                <span class="caption-subject font-green-sharp bold uppercase">
								订单列表</span>
                                <span class="caption-helper">Dec 27, 2013 7:16:25</span>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div class="tabbable">
                                <div class="input-group date date-picker "  style="width: 300px" data-date-format="dd/mm/yyyy">
                                    <input type="text" class="form-control form-filter input-sm" readonly name="order_shipment_date_from" placeholder="From">
                                    <span class="input-group-btn">
														<button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button>
														</span>
                                </div>
                                <br>
                                <div class="input-group date date-picker"  style="width: 300px" data-date-format="dd/mm/yyyy">
                                    <input type="text" class="form-control form-filter input-sm" readonly name="order_shipment_date_to" placeholder="To">
                                    <span class="input-group-btn">
                                    <button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button>
                                    </span>
                                </div>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="tab_1">
                                        <div class="row">
                                            <div class="col-md-12 col-sm-12">
                                                <div class="portlet grey-cascade box">
                                                    <div class="portlet-title">
                                                        <div class="caption">
                                                            <i class="fa fa-cogs"></i>订单
                                                        </div>
                                                    </div>
                                                    <div class="portlet-body">
                                                        <div class="table-responsive">
                                                            <table id="orderTable" class="table table-hover table-bordered table-striped"
                                                                   data-classes="table-no-bordered"
                                                                   data-toggle="table"
                                                                   data-cache="true"
                                                                   data-url="${ctx}/order/orderList"
                                                                   data-pagination="true"
                                                                   data-tool-bar="#toolbar">
                                                                <thead>
                                                                <tr>
                                                                    <th data-field="orderId" >订单编号</th>
                                                                    <th data-field="receiver" >收件人</th>
                                                                    <th data-field="phone" >联系方式</th>
                                                                    <th data-field="createTime" >时间</th>
                                                                    <th data-field="sumNum" >订单总计</th>
                                                                    <th data-field="paymentType" data-formatter="payType">付款方式</th>
                                                                    <th data-field="status" data-formatter="orderStatus">订单状态</th>
                                                                    <th data-field="remark" data-formatter="opFormat">操作</th>
                                                                </tr>
                                                                </thead>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End: life time stats -->
                </div>
            </div>
            <!-- END PAGE CONTENT INNER -->
        </div>
    </div>
    <!-- END PAGE CONTENT -->
</div>
<!-- END PAGE CONTAINER -->
<!-- BEGIN FOOTER -->
<div class="scroll-to-top">
    <i class="icon-arrow-up"></i>
</div>
<!-- END FOOTER -->
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script src="${ctxStatic}/assets/global/plugins/respond.min.js"></script>
<script src="${ctxStatic}/assets/global/plugins/excanvas.min.js"></script>
<![endif]-->
<script src="${ctxStatic}/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
<!-- IMPORTANT! Load jquery-ui.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
<script src="${ctxStatic}/assets/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script type="text/javascript" src="${ctxStatic}/assets/global/plugins/select2/select2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
<script type="text/javascript" src="${ctxStatic}/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="${ctxStatic}/assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="${ctxStatic}/assets/admin/layout3/scripts/layout.js" type="text/javascript"></script>
<script src="${ctxStatic}/assets/admin/layout3/scripts/demo.js" type="text/javascript"></script>
<script src="${ctxStatic}/assets/global/scripts/datatable.js"></script>
<script src="${ctxStatic}/assets/admin/pages/scripts/ecommerce-orders-view.js"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<!--自定义js-->
<script src="${ctxStatic}/layer/layer.js" type="text/javascript"></script>
<script src="${ctxStatic}/assets/global/plugins/bootstrap-table/bootstrap-table.js" type="text/javascript"></script>
<script>
    jQuery(document).ready(function() {
        Metronic.init(); // init metronic core components
        Layout.init(); // init current layout
        Demo.init(); // init demo features
        EcommerceOrdersView.init();
    });

    //操作
    function opFormat(value,row){
        var id = row.orderId;
        var show = '<button class="btn btn-sm green show" onclick="show('+id+')" >查看</button><button class="btn btn-sm red del" onclick="del('+id+')" >删除</button>';
        return show;
    }
    //支付类型
    function payType(value){
        var show ;
        switch(value)
        {
            case 1:
                show = '支付宝支付';
                break;
            case 2:
                show = '微信';
                break;
            default:
                show = '货到付款';
        }
        return show;
    }
    //订单状态
    function orderStatus(value){
        var show ;
        switch(value)
        {
            case 1:
                show = '未付款';
                break;
            case 2:
                show = '已付款';
                break;
            case 3:
                show = '未发货';
                break;
            case 4:
                show = '已发货';
                break;
            case 5:
                show = '交易成功';
                break;
            default:
                show = '交易关闭';
        }
        return show;
    }
    var orderId;
    function del(id){
        var target =event.target;
        $.ajax({
            type : 'post',
            url : rootPath+'/order/delOrder',
            dataType : 'json',
            data : {
                orderId : id
            },
            success : function(data){
                if(data == 'success'){
                 $(target).parent().parent().remove();
                }else{
                    alert('删除失败！');
                }
            }
        });
    }
    /**
     * 查看订单弹出详情
     */
    function show(id){
        orderId = id;
        var index = layer.open( {
            type: 2,
            skin: 'demo-class',
            content: '/toShopOrderView',
            area: ['1200px', '500px'],
            offset: ['100px', '100px'],
            scrollbar: false,
            anim: 0,
            cancel: function(index){
                //右上角关闭回调
                location.reload();
                // layer.close(index);
                //return false //开启该代码可禁止点击该按钮关闭
            }
        });
    }
</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
