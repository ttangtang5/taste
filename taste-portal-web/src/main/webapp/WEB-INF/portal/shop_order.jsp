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
                    订单
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
								结算</span>
                                <span class="caption-helper">Dec 27, 2013 7:16:25</span>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div class="tabbable">
                                <div class="tab-content">
                                    <div class="tab-pane active" id="tab_1">
                                        <div class="row">
                                            <div class="col-md-12 col-sm-12">
                                                <div class="portlet grey-cascade box">
                                                    <div class="portlet-title">
                                                        <div class="caption">
                                                            <i class="fa fa-cogs"></i>结算信息
                                                        </div>
                                                    </div>
                                                    <div class="portlet-body">
                                                        <div class="table-responsive">
                                                            <div class="portlet-body form">
                                                                <!-- BEGIN FORM-->
                                                                <form class="form-horizontal" role="form">
                                                                    <div class="form-body">
                                                                        <h3 class="form-section">配送信息</h3>
                                                                        <div class="row">
                                                                            <div class="col-md-12">
                                                                                <div class="form-group">
                                                                                    <label class="control-label col-md-2">收件人:</label>
                                                                                    <div class="col-md-8">
                                                                                        <select class="form-control input-circle"></select>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="row">
                                                                            <div class="col-md-6">
                                                                                <div class="form-group">
                                                                                    <label class="control-label col-md-4"></label>
                                                                                    <div class="col-md-6">
                                                                                        <p class="form-control-static">
                                                                                            <button id="addAddress" type="button"   class="btn green"><i class="fa fa-pencil"></i> 新增收件人</button>
                                                                                        </p>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <!--/row-->
                                                                        <h3 class="form-section">订单信息</h3>
                                                                        <div class="row">
                                                                            <div class="col-md-4">
                                                                                <div class="form-group">
                                                                                    <label class="control-label col-md-4">商品名称:</label>
                                                                                    <div class="col-md-6">
                                                                                        <p class="form-control-static">
                                                                                            产品1
                                                                                        </p>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <!--/span-->
                                                                            <div class="col-md-4">
                                                                                <div class="form-group">
                                                                                    <label class="control-label col-md-3">数量:</label>
                                                                                    <div class="col-md-6">
                                                                                        <p class="form-control-static">
                                                                                            New York
                                                                                        </p>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <!--/span-->
                                                                            <div class="col-md-4">
                                                                                <div class="form-group">
                                                                                    <label class="control-label col-md-3">价格:</label>
                                                                                    <div class="col-md-6">
                                                                                        <p class="form-control-static">
                                                                                            New York
                                                                                        </p>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <!--/row-->
                                                                        <!--/row-->
                                                                        <h3 class="form-section">备注</h3>
                                                                        <div class="row">
                                                                            <div class="col-md-12">
                                                                                <div class="form-group">
                                                                                    <label class="control-label col-md-2">用餐人数:</label>
                                                                                    <div class="col-md-1">
                                                                                        <select class="form-control input-circle"></select>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="row">
                                                                            <div class="col-md-12">
                                                                                <div class="form-group">
                                                                                    <label class="control-label col-md-2">备注:</label>
                                                                                    <div class="col-md-6">
                                                                                        <textarea style="height: 80px;width: 300px"></textarea>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <!--/row-->
                                                                    </div>
                                                                    <div class="form-actions">
                                                                        <div class="row">
                                                                            <div class="col-md-6">
                                                                                <div class="row">
                                                                                    <div class="col-md-offset-3 col-md-9">
                                                                                        <button type="button" class="btn default">取消</button>
                                                                                        <button type="submit" class="btn green"><i class="fa fa-pencil"></i> 付款</button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-md-6">
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </form>
                                                                <!-- END FORM-->
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
<script>
    jQuery(document).ready(function() {
        Metronic.init(); // init metronic core components
        Layout.init(); // init current layout
        Demo.init(); // init demo features
        EcommerceOrdersView.init();
    });

    $("#addAddress").click(function(){
        //弹出即全屏
        var index = layer.open({
            type: 2,
            skin: 'demo-class',
            content: '/toShopAddress',
            area: ['980px', '480px'],
            offset: ['100px', '200px'],
            scrollbar: false,
            anim: 0,
            cancel: function(index){
                //右上角关闭回调
                location.reload();
                 // layer.close(index);
                //return false //开启该代码可禁止点击该按钮关闭
            }
        });
    });

</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
