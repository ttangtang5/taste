<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../decorators/taglib.jsp"%>
<html>
<head>
    <title>结账</title>
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
            <div class="col-md-6">
                <h2>结账信息</h2>
                <hr>
                <table id="checkoutTable">
                    <tr >
                        <td >总计：<span id="total">${tableOrder.total}</span></td>
                    </tr>
                    <tr >
                        <td>总数量：${goodsNum}</td>
                    </tr>
                    <tr >
                        <td >用餐人数：${tableOrder.num}</td>

                    </tr>
                    <tr>
                        <td >实收：<input type="text" onchange="deal()" value="0" id="pay"   style="width:100px" ></td>
                    </tr>
                    <tr >
                        <td>应找：<span id="breakPayer"></span></td>
                    </tr>
                </table>
            </div>
            <div class="col-md-6">
                <h2>订单信息</h2>
                <hr>
                <table id="orderTable">
                    <c:forEach var="orderDetail" items="${tableOrderDetail}">
                        <tr>
                            <td class="col-md-3">${orderDetail.dishesName}</td>
                            <td class="col-md-1">${orderDetail.sumNum}</td>
                            <td class="col-md-2">${orderDetail.sumMoney}</td>
                        </tr>
                    </c:forEach>
                </table>
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

   function deal(){
       var total = $("#total").html();
       console.info(total);
       var pay = $("#pay").val();
       console.info(pay);
       var back = Number(pay) - Number(total);
       $("#breakPayer").html(back);
   }
</script>
</body>
</html>
