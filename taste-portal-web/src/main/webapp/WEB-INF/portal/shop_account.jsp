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
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css"/>
    <link href="${ctxStatic}/assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctxStatic}/assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
    <link href="${ctxStatic}/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css"/>
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN PLUGINS USED BY X-EDITABLE -->
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/assets/global/plugins/select2/select2.css"/>
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/assets/global/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.css"/>
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/assets/global/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css"/>
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/assets/global/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css"/>
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css"/>
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/assets/global/plugins/bootstrap-editable/bootstrap-editable/css/bootstrap-editable.css"/>
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/assets/global/plugins/bootstrap-editable/inputs-ext/address/address.css"/>
    <!-- END PLUGINS USED BY X-EDITABLE -->
    <!-- BEGIN THEME STYLES -->
    <link href="${ctxStatic}/assets/global/css/components-md.css" id="style_components" rel="stylesheet" type="text/css"/>
    <link href="${ctxStatic}/assets/global/css/plugins-md.css" rel="stylesheet" type="text/css"/>
    <link href="${ctxStatic}/assets/admin/layout/css/layout.css" rel="stylesheet" type="text/css"/>
    <link id="style_color" href="${ctxStatic}/assets/admin/layout/css/themes/darkblue.css" rel="stylesheet" type="text/css"/>
    <!-- END THEME STYLES -->
    <title>个人中心</title>
    <link rel="shortcut icon" href="favicon.ico">

</head>
<!-- Head END -->

<!-- Body BEGIN -->
<body class="ecommerce">


<div class="main">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="/toIndex">主页</a></li>
            <li class="active">个人中心</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
            <!-- BEGIN SIDEBAR -->
            <div class="sidebar col-md-3 col-sm-3">
                <ul class="list-group margin-bottom-25 sidebar-menu">
                    <li class="list-group-item clearfix active"><a  href="javascript:;"><i class="fa fa-angle-right"></i>
                        个人信息</a></li>
                    <li class="list-group-item clearfix"><a  href="javascript:;"><i class="fa fa-angle-right"></i>
                        修改密码</a></li>
                    <li class="list-group-item clearfix"><a  href="javascript:;"><i class="fa fa-angle-right"></i>
                        收货地址</a></li>
                    <li class="list-group-item clearfix"><a  href="javascript:;"><i class="fa fa-angle-right"></i>
                        订单信息</a></li>
                </ul>
            </div>
            <!-- END SIDEBAR -->

            <!-- BEGIN CONTENT -->
            <div class="col-md-9 col-sm-7" id="person" >
                <h1>个人信息</h1>
                <div class="content-page">
                    <ul>
                        <div class="page-content">
                            <!-- BEGIN PAGE CONTENT-->
                            <div class="row">
                                <div class="col-md-12">
                                    <button id="save" class="btn blue">保存</button>
                                    <hr>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <table id="user" class="table table-bordered table-striped">
                                        <tbody>
                                        <tr>
                                            <td style="width:15%">
                                                用户名：
                                            </td>
                                            <td style="width:50%">
                                                <a href="javascript:;" id="username" data-type="text" data-pk="1"
                                                   data-original-title="请输入新的用户名">
                                                    superuser </a>
                                            </td>
                                            <%--<td style="width:35%">
                                                <span class="text-muted"></span>
                                            </td>--%>
                                        </tr>
                                        <tr>
                                            <td>
                                                姓名：
                                            </td>
                                            <td>
                                                <a href="javascript:;" id="firstname" data-type="text" data-pk="1"
                                                   data-placement="right" data-placeholder="Required"
                                                   data-original-title="请输入真实姓名">
                                                </a>
                                            </td>
                                            <%--<td>
                                                <span class="text-muted"></span>
                                            </td>--%>
                                        </tr>
                                        <tr>
                                            <td>
                                                性别：
                                            </td>
                                            <td>
                                                <a href="javascript:;" id="sex" data-type="select" data-pk="1"
                                                   data-value="" data-original-title="请选择性别">
                                                </a>
                                            </td>
                                            <%--<td>
                                                <span class="text-muted">Select, loaded from js array. Custom display </span>
                                            </td>--%>
                                        </tr>
                                        <tr>
                                            <td>
                                                出生年月日：
                                            </td>
                                            <td>
                                                <a href="javascript:;" id="dob" data-type="combodate"
                                                   data-value="1984-05-15" data-format="YYYY-MM-DD"
                                                   data-viewformat="DD/MM/YYYY" data-template="D / MMM / YYYY"
                                                   data-pk="1" data-original-title="请选择出生年月日">
                                                </a>
                                            </td>
                                            <%--<td>
                                                <span class="text-muted">Date field (combodate) </span>
                                            </td>--%>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!-- END PAGE CONTENT-->
                        </div>
                    </ul>
                    <!-- END CONTENT -->
                    <hr>
                </div>
            </div>
            <div class="col-md-9 col-sm-7" id="alertPwd" hidden>
                <h1>修改密码</h1>
                <div class="content-page">
                    <ul>
                        <div class="page-content">
                            <!-- BEGIN PAGE CONTENT-->
                            <div class="col-md-12">
                                <h1>忘记密码?</h1>
                                <div class="content-form-page">
                                    <div class="row">
                                        <div class="col-md-7 col-sm-7">
                                            <form class="form-horizontal form-without-legend" role="form">
                                                <div class="form-group">
                                                    <label for="email" class="col-lg-4 control-label">手机号:</label>
                                                    <div class="col-lg-8">
                                                        <input type="text" class="form-control" id="email">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="email" class="col-lg-4 control-label">验证码:</label>
                                                    <div class="col-lg-8">
                                                        <input type="text" class="form-control" id="code">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-lg-8 col-md-offset-4 padding-left-0 padding-top-5">
                                                        <button type="button" class="btn btn-primary">发送验证</button>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="email" class="col-lg-4 control-label">新密码:</label>
                                                    <div class="col-lg-8">
                                                        <input type="password" class="form-control" id="password">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="email" class="col-lg-4 control-label">再次输入新密码:</label>
                                                    <div class="col-lg-8">
                                                        <input type="password" class="form-control" id="password2">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-lg-8 col-md-offset-4 padding-left-0 padding-top-5">
                                                        <button type="submit" class="btn btn-primary">提交</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- END PAGE CONTENT-->
                        </div>
                    </ul>
                    <!-- END CONTENT -->
                    <hr>
                </div>
            </div>
            <div class="col-md-9 col-sm-7" id="address2" hidden >
                <h1>收货地址</h1>
                <div class="content-page">
                    <ul>
                        <div class="page-content">
                            <!-- BEGIN PAGE CONTENT-->
                            <div class="row">
                                <div class="col-md-12">
                                    <button id="addAddress" class="btn blue">新增</button>
                                    <button id="saveAddress" class="btn blue">保存</button>
                                    <hr>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                </div>
                            </div>
                            <!-- END PAGE CONTENT-->
                        </div>
                    </ul>
                    <!-- END CONTENT -->
                    <hr>
                </div>
            </div>
            <div class="col-md-9 col-sm-7" id="order" hidden >
                <h1>订单信息</h1>
                <div class="content-page">
                    <ul>
                        <div class="page-content">
                            <!-- BEGIN PAGE CONTENT-->
                            <div class="row">
                                <div class="col-md-12">
                                </div>
                            </div>
                            <!-- END PAGE CONTENT-->
                        </div>
                    </ul>
                    <!-- END CONTENT -->
                    <hr>
                </div>
            </div>
            <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->
    </div>
</div>

<!-- Load javascripts at bottom, this will reduce page load time -->
<!-- BEGIN CORE PLUGINS(REQUIRED FOR ALL PAGES) -->
<!--[if lt IE 9]>
<script src="${ctxStatic}/assets/global/plugins/respond.min.js"></script>
<![endif]-->
<script src="${ctxStatic}/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/assets/frontend/layout/scripts/back-to-top.js" type="text/javascript"></script>
<script src="${ctxStatic}/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js"
        type="text/javascript"></script>
<!-- END CORE PLUGINS -->

<!-- BEGIN PAGE LEVEL JAVASCRIPTS (REQUIRED ONLY FOR CURRENT PAGE) -->
<script src="${ctxStatic}/assets/global/plugins/fancybox/source/jquery.fancybox.pack.js"
        type="text/javascript"></script><!-- pop up -->
<script src="${ctxStatic}/assets/global/plugins/carousel-owl-carousel/owl-carousel/owl.carousel.min.js"
        type="text/javascript"></script><!-- slider for products -->

<script src="${ctxStatic}/assets/frontend/layout/scripts/layout.js" type="text/javascript"></script>

<!-- IMPORTANT! Load jquery-ui.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
<script src="${ctxStatic}/assets/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<!-- BEGIN PLUGINS USED BY X-EDITABLE -->
<script type="text/javascript" src="${ctxStatic}/assets/global/plugins/select2/select2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/assets/global/plugins/bootstrap-wysihtml5/wysihtml5-0.3.0.js"></script>
<script type="text/javascript" src="${ctxStatic}/assets/global/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.js"></script>
<script type="text/javascript" src="${ctxStatic}/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/assets/global/plugins/bootstrap-datepicker/js/locales/bootstrap-datepicker.zh-CN.js"></script>
<script type="text/javascript" src="${ctxStatic}/assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/assets/global/plugins/moment.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/assets/global/plugins/jquery.mockjax.js"></script>
<script type="text/javascript" src="${ctxStatic}/assets/global/plugins/bootstrap-editable/bootstrap-editable/js/bootstrap-editable.js"></script>
<script type="text/javascript" src="${ctxStatic}/assets/global/plugins/bootstrap-editable/inputs-ext/address/address.js"></script>
<script type="text/javascript" src="${ctxStatic}/assets/global/plugins/bootstrap-editable/inputs-ext/wysihtml5/wysihtml5.js"></script>
<!-- END X-EDITABLE PLUGIN -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="${ctxStatic}/assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="${ctxStatic}/assets/admin/layout/scripts/quick-sidebar.js" type="text/javascript"></script>
<script src="${ctxStatic}/assets/admin/layout/scripts/demo.js" type="text/javascript"></script>
<script src="${ctxStatic}/assets/admin/pages/scripts/form-editable.js"></script>
<!--自写js-->
<script src="${ctxStatic}/portal/account.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function () {
        Layout.init();
        Layout.initOWL();
        Layout.initUniform();
        Layout.initSliderRange();
        FormEditable.init();
    });
</script>
<!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>