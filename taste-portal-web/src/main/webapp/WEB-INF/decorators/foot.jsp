<!-- 页面js，放在<body>最后 -->
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="taglib.jsp"%>
<script type="text/javascript">
    var ctx = '${ctx}', ctxStatic = '${ctxStatic}';
    $(function () {
        $.ajaxSetup({
            error: function (data) {
                Exception.showMessage(data);
            }
        });

        //显示信息
        var name = '${sessionScope.username}';
        if(name != ""){
            $("#toLog").hide();
            $("#toLogOut").show();
            $("#toCenter").attr("href","/toShopAccount");
            $("#toWish").attr("href","/toShopWishList");
            $("#toOrder").attr("href","/");
        }
    });


</script> 