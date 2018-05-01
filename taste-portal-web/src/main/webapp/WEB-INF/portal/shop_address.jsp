<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../decorators/taglib.jsp" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta name="decorator" content="default">
    <meta charset="utf-8">
    <title>地址管理</title>
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
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12" style="padding:2em 0;">
                                    <div class="table-responsive">
                                        <table class="table table-bordered table-striped" id="categoryTable"
                                               data-toggle="table"
                                               data-url="${ctx}/taste/getUserAddress"
                                               data-tool-bar="#toolbar" >
                                            <thead>
                                            <tr>
                                                <th data-field="id" data-visible="false"></th>
                                                <th data-field="addressee">收货人</th>
                                                <th data-field="address">收货地址</th>
                                                <th data-field="phone">联系电话</th>
                                                <th data-field="remarks" data-formatter="opFormat">操作</th>
                                            </tr>
                                            </thead>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <span>收货人</span>
                                <input type="text" id="addressee">
                                <span>地址</span>
                                <input type="text"  style="width: 300px;" id="suggestId" placeholder="请输入地址..."/>
                                <div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div>
                                <span>联系电话</span>
                                <input type="text" id="phone">
                                <button class="btn blue" id="addAddress">添加</button>
                                <button class="btn blue" id="saveAddress" style="display:none">保存</button>
                                <button class="btn blue" id="cancel" style="display:none">取消</button>
                                <span id="Msg" style="color:red;"></span>
                            </div>
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
                                <%--<input type="text"  style="width: 500px;" class="form-control" id="suggestId" placeholder="请输入地址..."/>
                                    <div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div>--%>
                               <%-- <span class="input-group-btn">
                                    <button class="btn blue" id="gmap_geocoding_btn">确定</button>
                                 </span>--%>
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

    function opFormat(value,row){
        var id = row.id;
        var show ='<button class="btn btn-sm blue edit" onclick="edit('+id+')" >编辑</button><button class="btn btn-sm red delete" onclick="del('+id+')">删除</button>' ;
        return show;
    }

    var editId;
    /**
     * 编辑
     */
   function edit(id){
        editId = id;
        $("#addAddress").hide();
        $("#saveAddress").show();
        $("#cancel").show();
        var target = event.target;
        var nodes = $(target).parent().parent().children();
        var addressee = nodes[0].innerHTML;
        var address = nodes[1].innerHTML;
        var phone = nodes[2].innerHTML;
        $("#addressee").val(addressee);
        $("#suggestId").val(address);
        $("#phone").val(phone);
    };

    //取消编辑
   $("#cancel").click(function (){
       $("#addAddress").show();
       $("#saveAddress").hide();
       $("#cancel").hide();
   });

   //保存修改
   $("#saveAddress").click(function (){
       var addressee = $("#addressee").val();
       var address = $("#suggestId").val();
       var phone = $("#phone").val();
       if(addressee == ''){
           $("#Msg").empty();
           $("#Msg").html("收货人必填信息！");
       }
       if(isMobileMethod(phone)){
           $.ajax({
               type : 'post',
               url : rootPath+'/taste/updateAddress',
               data : {
                   id : editId,
                   addressee : addressee,
                   address : address,
                   phone : phone
               },
               success : function(data){
                   if(data = 'success'){
                       $("#Msg").empty();
                       $("#Msg").html("修改成功！");
                       setTimeout(function(){
                           $("#Msg").empty();
                           location.reload();
                       },1000);
                   }else{
                       $("#Msg").empty();
                       $("#Msg").html("修改失败！");
                       setTimeout(function(){
                           $("#Msg").empty();
                       },3000);
                   }
               }
           });

       }
   });

    /**
     * 删除
     */
    function del(id){
        var target = event.target;

        $.ajax({
            type : 'post',
            url : rootPath+'/taste/deleteAddress',
            data : {
                id : id
            },
            success : function(data){
                if(data = 'success'){
                    $(target).parent().parent().remove();
                    $("#Msg").empty();
                    $("#Msg").html("删除成功！");
                    setTimeout(function(){
                        $("#Msg").empty();
                    },1000);
                }else{
                    $("#Msg").empty();
                    $("#Msg").html("删除失败！");
                    setTimeout(function(){
                        $("#Msg").empty();
                    },3000);
                }
            }
        });
    };

    /**
     * 添加地址
     */
    $("#addAddress").click(function(){
        if($("#categoryTable").find('tr').length <= 5 ){
            var addressee = $("#addressee").val();
            var address = $("#suggestId").val();
            var phone = $("#phone").val();
            if(addressee == ''){
                $("#Msg").empty();
                $("#Msg").html("收货人必填信息！");
            }
            if(isMobileMethod(phone)){
                if(!bdGEO()){
                    $("#Msg").empty();
                    $("#Msg").html("此地址不在配送范围！");
                    return;
                }
                $.ajax({
                    type : 'post',
                    url : rootPath+'/taste/addAddress',
                    data : {
                        addressee : addressee,
                        address : address,
                        phone : phone
                    },
                    success : function(data){
                        if(data = 'success'){
                            var tr = '<tr data-index="3"><td style="">'+addressee+'</td><td style="">'+address+'</td><td style="">'+phone+'</td><td style=""><button class="btn btn-sm blue edit" onclick="edit()" >编辑</button><button class="btn btn-sm red delete" onclick="del()">删除</button></td></tr>';
                            $("#categoryTable").append(tr);
                            $("#Msg").empty();
                            $("#Msg").html("添加成功！");
                            setTimeout(function(){
                                $("#Msg").empty();
                            },3000);
                        }else{
                            $("#Msg").empty();
                            $("#Msg").html("添加失败！");
                            setTimeout(function(){
                                $("#Msg").empty();
                            },3000);
                        }
                    }
                });

            }
        }else{
            $("#Msg").empty();
            $("#Msg").html("最多保存四个可用地址");
        }
    });


    // 手机号码验证
    function isMobileMethod(phone){
        var regPhone = /^(13[0-9]|15[0-9]|18[0-9]|147|145|17[0-9])\d{8}$/;
        if(regPhone.test(phone)){
            return true;
        }else{
            if(phone == "" || phone == null){
                $("#Msg").empty();
                $("#Msg").html("手机号码必填信息！");
                return false;
            }else{
                $("#Msg").empty();
                $("#Msg").html("手机号码格式错误！");
                return false;
            }
        }
    }

</script>

</body>
<!-- END BODY -->
</html>