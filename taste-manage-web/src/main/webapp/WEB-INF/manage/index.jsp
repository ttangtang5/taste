<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../decorators/taglib.jsp" %>
<html>
<head>
    <title>Title</title>
    <meta charset="utf-8">
    <meta name="decorator" content="default">
</head>
<body>
<div class="container" style="padding-bottom: 15px;min-height: 300px; margin-top: 40px;">
    <div class="row">
        <div id="one" class="col-md-2">
            <ul data-spy="affix" class="nav nav-list nav-tabs nav-stacked bs-docs-sidenav dropdown affix" style="top: 100px; z-index: 100;">
                <li class="active">
                    <a href="/user/index.shtml">
                        <i class="glyphicon glyphicon-chevron-right"></i>点餐
                    </a>
                </li>
                <li class="  dropdown">
                    <a href="/role/mypermission.shtml">
                        <i class="glyphicon glyphicon-chevron-right"></i>外卖接单
                    </a>
                </li>
            </ul>
        </div>
        <div class="col-md-10">
            <h2>餐桌信息</h2>
            <hr>
            <c:forEach var="table" items="${tables}">
                <div class="col-md-2">
                    <button type="button"  class="btn <c:if test="${table.status == 0}">btn-success</c:if> <c:if test="${table.status == 1}">btn-danger</c:if>" style="height: 80px;width: 80px;margin-top: 20px">${table.id}号桌<br/> ${table.desc}/${table.capcity}</button>
                </div>
            </c:forEach>
            <table class="table"  >

                <%--<tr>
                    <td><button type="button" class="btn btn-success ">一号桌<br/> 0/4</button></td>
                    <td><button type="button" class="btn btn-danger">二号桌<br/> 4/4</button></td>
                    <td><button type="button" class="btn btn-light">三号桌<br/> 0/4</button></td>
                    <td><button type="button" class="btn btn-light">四号桌<br/> 0/4</button></td>
                </tr>--%>

            </table>
        </div>
    </div>
</div>
<script  src="${ctxStatic}/js/common/jquery-2.1.1.js"></script>
<script>
    /**
     * 订单
     */
    $(".btn-success").click(function () {
        var index = layer.open( {
            type: 2,
            skin: 'demo-class',
            content: rootPath+'/manage/orderDishes',
            area: ['1100px', '500px'],
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
    });

    /**
     * 结账
     */
    $(".btn-danger").click(function () {
        var index = layer.open( {
            type: 2,
            skin: 'demo-class',
            content: rootPath+'/manage/orderDishes',
            area: ['1100px', '500px'],
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
    });
</script>
</body>
</html>
