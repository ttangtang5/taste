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
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css"/>
    <link href="${ctxStatic}/assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctxStatic}/assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctxStatic}/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctxStatic}/assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
    <link href="${ctxStatic}/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css"/>
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN THEME STYLES -->
    <link href="${ctxStatic}/assets/global/css/components-md.css" id="style_components" rel="stylesheet" type="text/css"/>
    <link href="${ctxStatic}/assets/global/css/plugins-md.css" rel="stylesheet" type="text/css"/>
    <link href="${ctxStatic}/assets/admin/layout/css/layout.css" rel="stylesheet" type="text/css"/>
    <link id="style_color" href="${ctxStatic}/assets/admin/layout/css/themes/darkblue.css" rel="stylesheet" type="text/css"/>
    <link href="${ctxStatic}/assets/admin/layout/css/custom.css" rel="stylesheet" type="text/css"/>
    <!-- END THEME STYLES -->
    <link rel="shortcut icon" href="favicon.ico"/>
    <link href="${ctxStatic}/assets/global/plugins/bootstrap-table/bootstrap-table.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="page-container">
    <!-- BEGIN CONTENT -->
        <div class="page-content">
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
            <!-- BEGIN PAGE CONTENT-->
            <div class="row">
                <div class="col-md-12">
                    <!-- BEGIN SAMPLE TABLE PORTLET-->
                    <div class="portlet light">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="fa fa-user"></i>地址管理
                            </div>
                        </div>
                        <div class="portlet-body">
                            <table id="categoryTable"
                                   data-toggle="table"
                                   data-url=""
                                   data-query-params=queryParams
                                   data-page-list=[]
                            <%--data-side-pagination="server"--%>
                                   data-pagination="true">
                                <thead>
                                <tr>
                                    <th data-field="title">标题</th>
                                    <%--<th data-field="content">投诉内容</th>--%>
                                    <th data-field="phone">联系电话</th>
                                    <th data-field="cityName">地市</th>
                                    <th data-field="remarks" data-formatter="opFormat">操作</th>
                                </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                    <!-- END SAMPLE TABLE PORTLET-->
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                <!-- BEGIN  PORTLET-->
                    <div class="portlet light">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="fa fa-gift"></i>地图定位
                        </div>
                    </div>
                    <div class="portlet-body">
                        <form class="form-inline margin-bottom-10" action="#">
                            <div class="input-group">
                                <input type="text"  style="width: 500px;" class="form-control" id="suggestId" placeholder="请输入地址..."/>
                                    <div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div>
                                <span class="input-group-btn">
                                    <button class="btn blue" id="gmap_geocoding_btn">确定</button>
                                 </span>
                            </div>
                        </form>
                        <div id="gmap_geocoding" class="gmaps"></div>
                    </div>
                </div>
                <!-- END GEOCODING PORTLET-->
                </div>
            </div>
            <!-- END PAGE CONTENT-->
        </div>
    <!-- END CONTENT -->
</div>
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
<script src="${ctxStatic}/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<script src="${ctxStatic}/assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="${ctxStatic}/assets/admin/layout/scripts/layout.js" type="text/javascript"></script>
<script src="${ctxStatic}/assets/admin/layout/scripts/quick-sidebar.js" type="text/javascript"></script>
<script src="${ctxStatic}/assets/admin/layout/scripts/demo.js" type="text/javascript"></script>

<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=KYFfLcoc56IA3rEv6MFQY7SRLIXirxM9"></script>
<script src="${ctxStatic}/assets/global/plugins/bootstrap-table/bootstrap-table.js" type="text/javascript"></script>
<script src="${ctxStatic}/portal/map.js" type="text/javascript"></script>
<script>
    jQuery(document).ready(function() {
        // initiate layout and plugins
        Metronic.init(); // init metronic core components
        Layout.init(); // init current layout
        QuickSidebar.init(); // init quick sidebar
        Demo.init(); // init demo features
    });

    /**
     * 编辑  改变表格状态
     */
    $(".edit").click(function(){

    });

    //操作函数
    function opFormat(value, row) {
        /*var id =  row.id;
        var compStatus = row.compStatus;
        var level=row.levelType;
        var show = '<a href="javascript:;" class="btn btn-sm green" onclick="toDetail(' + id + ')">查看</a>';
        return show;*/
    }



</script>

</body>
<!-- END BODY -->
</html>