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
                                <form class="form-horizontal" role="form" action="${ctx}/order/saveOrder" method="post">
                                  <div class="form-body">
                                    <h3 class="form-section">配送信息</h3>
                                    <div class="row">
                                      <div class="col-md-12">
                                        <div class="form-group">
                                          <label class="control-label col-md-2">收件人:</label>
                                          <div class="col-md-6">
                                            <select class="form-control input-circle addressee" name="addressee">
                                            </select>
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
                                    <table id="cartTable"
                                         data-classes="table-no-bordered"
                                         data-toggle="table" data-cache="true"
                                         data-url="${ctx}/shoppingCart/cartDetailShow"
                                         <%--data-pagination="true"--%>
                                         data-tool-bar="#toolbar">
                                      <thead>
                                      <tr>
                                        <%--<th data-field="status" data-checkbox="true"></th>--%>
                                        <th data-field="dishesId" data-visible="false"></th>
                                        <th data-field="dishesPicture" data-formatter="picture">图片</th>
                                        <th data-field="dishesName" data-formatter="dishesName" >名称</th>
                                        <th data-field="num" data-formatter="quantity">数量</th>
                                        <th data-field="dishesPrice" data-formatter="dishesPrice" >价格</th>
                                        <th data-field="dishesTotal" data-formatter="dishesPrice">总计</th>
                                      </tr>
                                      </thead>
                                    </table>
                                    <div class="shopping-total">
                                      <ul>
                                        <li class="shopping-total-price">
                                          <em>总计</em>
                                          <strong class="price"><span>$</span>${total}</strong>
                                        </li>
                                      </ul>
                                    </div>
                                    <!--/row-->
                                    <!--/row-->
                                    <h3 class="form-section">备注</h3>
                                    <div class="row">
                                      <div class="col-md-12">
                                        <div class="form-group">
                                          <label class="control-label col-md-2">用餐人数:</label>
                                          <div class="col-md-1">
                                            <select class="form-control input-circle" name="num">
                                              <option value="1">1</option>
                                              <option value="2">2</option>
                                              <option value="3">3</option>
                                              <option value="4">4</option>
                                              <option value="5">5</option>
                                              <option value="6">6</option>
                                              <option value="8">8</option>
                                              <option value="10">备注人数</option>
                                            </select>
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                    <div class="row">
                                      <div class="col-md-12">
                                        <div class="form-group">
                                          <label class="control-label col-md-2">备注:</label>
                                          <div class="col-md-6">
                                            <textarea style="height: 80px;width: 300px" maxlength="50" name="remarks"></textarea>
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
                                            <button type="button"  class="btn default">取消</button>
                                            <button type="submit"  class="btn green"><i class="fa fa-pencil"></i> 付款</button>
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
<script src="${ctxStatic}/assets/global/plugins/bootstrap-table/bootstrap-table.js" type="text/javascript"></script>
<script src="${ctxStatic}/layer/layer.js" type="text/javascript"></script>
<script>
  jQuery(document).ready(function() {
    Metronic.init(); // init metronic core components
    Layout.init(); // init current layout
    Demo.init(); // init demo features
    EcommerceOrdersView.init();
  });

  $(function(){
    $.ajax({
      type : 'post',
      url : rootPath + '/taste/getUserAddress',
      dataType : 'json',
      success : function(data){
        var option;
        var str;
        for(var i = 0;i < data.length;i++){
          str = data[i].addressee+'--'+data[i].phone+'--'+data[i].address;
          option = '<option value="'+data[i].id+'">'+str+'</option>';
          $(".addressee").append(option);
        }
      }
    });
  });

  $("#addAddress").click(function(){
    //弹出即全屏
    var index = layer.open({
      type: 2,
      skin: 'demo-class',
      content: '/toShopAddress',
      area: ['1100px', '480px'],
      offset: ['80px', '150px'],
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

  function picture(value){
    return '<img style="width:68px;height:80px" src="${ctxStatic}'+value+'"/>';
  }

  function dishesName(value){
    return '<strong style="font-size: 18px;font-weight: normal;text-align:center">'+value+'</strong>';

  }
  function dishesPrice(value) {
    return '<strong style="color: red;font-size: 21px;font-weight: normal;text-align:center"><span>￥</span>'+value+'</strong>';
  }
  function quantity(value){
    return  '<strong style="font-size: 18px;font-weight: normal;text-align:center">'+value+'</strong>';
  }
</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
