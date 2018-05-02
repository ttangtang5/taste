<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../decorators/taglib.jsp"%>
<html>
<head>
    <title>接单</title>
    <link href="${ctxStatic}/js/common/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${ctxStatic}/css/common/base.css" rel="stylesheet"/>
    <link href="${ctxStatic}/js/common/layer/skin/layer.css" rel="stylesheet"/>
    <link href="${ctxStatic}/layui/css/modules/layer/default/layer.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${ctxStatic}/css/selectpage.css" type="text/css">
</head>
<body>
<div class="container" style="padding-bottom: 15px;min-height: 300px; margin-top: -28px;">
    <div class="row">
        <div class="col-md-10">
            <div class="col-md-10">
                <input type="text" id="orderId" value="${order.orderId}" hidden>
                <h2>订单信息</h2>
                <hr>
                <table id="checkoutTable">
                    <tr >
                        <td class="col-md-6">总计：<span id="total">${order.sumNum}</span></td>
                    </tr>
                    <tr >
                        <td class="col-md-6">总数量：${count}</td>
                    </tr>
                    <tr >
                        <td class="col-md-6">用餐人数：${order.num}</td>
                    </tr>
                    <tr >
                        <td class="col-md-6">收件人：${order.receiver}</td>
                    </tr>
                    <tr >
                        <td class="col-md-6">收货地址：${order.address}</td>
                    </tr>
                    <tr >
                        <td class="col-md-6">联系电话：${order.phone}</td>
                    </tr>
                    <tr >
                        <td class="col-md-6">配送员：${order.empName}</td>
                    </tr>
                    <tr >
                        <td class="col-md-6">配送员联系方式：${order.empPhone}</td>
                    </tr>
                    <tr >
                        <th class="col-md-6">详情：</th>
                    </tr>
                    <c:forEach var="orderDetail" items="${orderDetail}">
                        <tr>
                            <td class="col-md-2">菜名：${orderDetail.dishesName}</td>
                            <td class="col-md-2">价格：${orderDetail.dishesPrice}</td>
                            <td class="col-md-2">数量：${orderDetail.sumNum}</td>
                            <td class="col-md-2">总计：${orderDetail.sumMoney}</td>
                        </tr>
                    </c:forEach>
                </table>
                <div style="margin-top: 20px;margin-left: 20px">
                    <label>选择配送员：</label>
                    <select id="distribution"></select>
                </div>
                <div style="margin-top: 20px;margin-left: 20px">
                    <input class="btn btn-primary" type="button" id="accept" value="接单"/>
                </div>
            </div>
        </div>
    </div>
</div>
<script  src="${ctxStatic}/js/common/jquery-2.1.1.js"></script>
<script  src="${ctxStatic}/js/common/layer/layer.js"></script>
<script  src="${ctxStatic}/js/common/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script  src="${ctxStatic}/layui/layui.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/selectpage.min.js" ></script>
<script>
    $(function(){
        $.ajax({
            type : 'post',
            url : rootPath + '/distribution',
            dataType : 'json',
            success : function(msg){
                for(var i = 0; i < msg.length; i++){
                    var html = '<option value="'+msg[i].id+'">'+msg[i].empName+'</opting>';
                    $("#distribution").append(html);
                }
            }
        });
    });
   function deal(){
       var total = $("#total").html();
       console.info(total);
       var pay = $("#pay").val();
       console.info(pay);
       var back = Number(pay) - Number(total);
       $("#breakPayer").html(back);
   }

    /**
     * 接单
     * @param id
     */
   $("#accept").click(function() {
       $.ajax({
           type : 'post',
           url : rootPath + '/order/acceptOrder',
           data : {
               id : $("#orderId").val(),
               distribution : $("#distribution").val()
           },
           success : function(msg){
               if(msg == 'success'){
                   layer.msg('接单成功');
               }
           }
       });
   });
</script>
</body>
</html>
