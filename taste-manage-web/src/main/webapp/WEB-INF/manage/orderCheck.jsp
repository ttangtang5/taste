<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../decorators/taglib.jsp" %>
<html>
<head>
    <title>Title</title>
    <meta charset="utf-8">
    <meta name="decorator" content="default">
    <link rel="${ctxStatic}/js/bootstrap-table.css">
</head>
<body>
<div class="container" style="padding-bottom: 15px;min-height: 300px; margin-top: 40px;">
    <div class="row">
        <div id="one" class="col-md-2">
            <ul data-spy="affix" class="nav nav-list nav-tabs nav-stacked bs-docs-sidenav dropdown affix" style="top: 100px; z-index: 100;">
                <li class="dropdown">
                    <a href="/user/index.shtml">
                        <i class="glyphicon glyphicon-chevron-right"></i>点餐
                    </a>
                </li>
                <li class="dropdown  active">
                    <a href="javascript:;">
                        <i class="glyphicon glyphicon-chevron-right"></i>外卖接单
                    </a>
                </li>
            </ul>
        </div>
        <div class="col-md-10">
            <h2>外卖信息</h2>
            <hr>
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
<script src="${ctxStatic}/js/bootstrap-table.js" type="text/javascript"></script>
<script  src="${ctxStatic}/js/common/jquery-2.1.1.js"></script>
<script>
    //操作
    function opFormat(value,row){
        var id = row.orderId;
        var show = '<button class="btn btn-sm green show" onclick="show('+id+')" >查看</button>';
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
    /**
     * 查看订单弹出详情
     */
    function show(id){
        orderId = id;
        var index = layer.open( {
            type: 2,
            skin: 'demo-class',
            content: rootPath + '/toShopOrderView',
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
</body>
</html>
