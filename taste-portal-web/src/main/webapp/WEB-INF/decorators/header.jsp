<!-- 页面头部 -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="taglib.jsp" %>
<!-- BEGIN TOP BAR -->
<div class="pre-header">
    <div class="container">
        <div class="row">
            <!-- BEGIN TOP BAR LEFT PART -->
            <div class="col-md-6 col-sm-6 additional-shop-info">
                <ul class="list-unstyled list-inline">
                    <li><i class="fa fa-phone"></i><span>+1 456 6717</span></li>
                    <!-- BEGIN LANGS -->
                    <li class="langs-block">
                        <a href="javascript:void(0);" class="current">中国</a>
                    </li>
                    <!-- END LANGS -->
                </ul>
            </div>
            <!-- END TOP BAR LEFT PART -->
            <!-- BEGIN TOP BAR MENU -->
            <div class="col-md-6 col-sm-6 additional-nav">
                <ul class="list-unstyled list-inline pull-right">
                    <li><a href="/toShopAccount" id="toCenter">个人中心</a></li>
                   <%-- <li><a href="/toShopWishList" id="toWish">收藏</a></li>--%>
                    <li><a href="/toShopOrderList" id="toOrder">订单</a></li>
                    <li> <c:if test="${loginFlag == '0' }"><a href="${ctx}/toLogin" id="toLog">登录</a></c:if>
                        <c:if test="${loginFlag == '1' }"><a href="${ctx}/taste/toLogOut" id="toLogOut" ><span id="logMsg">${sessionScope.session_user.userName}&nbsp;</span>注销</a></c:if>
                    </li>
                </ul>
            </div>
            <!-- END TOP BAR MENU -->
        </div>
    </div>
</div>
<!-- END TOP BAR -->



