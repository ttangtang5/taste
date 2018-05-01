<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../decorators/taglib.jsp"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta name="decorator" content="default">
    <title>预订</title>

    <link rel="shortcut icon" href="favicon.ico">

    <!-- Fonts START -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700|PT+Sans+Narrow|Source+Sans+Pro:200,300,400,600,700,900&amp;subset=all" rel="stylesheet" type="text/css">
    <!-- Fonts END -->

    <!-- Global styles START -->
    <link href="${ctxStatic}/assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="${ctxStatic}/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Global styles END -->

    <!-- Page level plugin styles START -->
    <link href="${ctxStatic}/assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css">
    <link href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" rel="stylesheet" type="text/css"><!-- for slider-range -->
    <link href="${ctxStatic}/assets/global/plugins/rateit/src/rateit.css" rel="stylesheet" type="text/css">
    <!-- Page level plugin styles END -->

    <link href="${ctxStatic}/assets/admin/layout3/css/layout.css" rel="stylesheet" type="text/css">
    <link href="${ctxStatic}/layui/css/layui.css" rel="stylesheet" type="text/css">
</head>
<!-- Head END -->

<!-- Body BEGIN -->
<body class="ecommerce">
<!-- BEGIN HEADER -->
<div class="header">
    <div class="container">
        <a class="site-logo" href="shop-index.html"><img src="${ctxStatic}/assets/frontend/layout/img/logos/logo-shop-red.png" alt="餐厅图标"></a>

        <a href="javascript:void(0);" class="mobi-toggler"><i class="fa fa-bars"></i></a>

        <!-- BEGIN CART -->
        <div class="top-cart-block" >
            <div class="top-cart-info">
                <a href="javascript:void(0);" class="top-cart-info-count"><span id="top-cart-info-count">0</span>件</a>
                <a href="javascript:void(0);" class="top-cart-info-value">￥<span id="top-cart-info-value">0</span></a>
            </div>
            <i class="fa fa-shopping-cart"></i>
            <!--shopping cart-->
            <div class="top-cart-content-wrapper">
                <div class="top-cart-content">
                    <ul class="scroller" style="height: 100px;">
                    </ul>
                    <div class="text-right">
                        <a href="/toShopOrder" class="btn btn-primary">结算</a>
                    </div>
                </div>
            </div>
        </div>
        <!--END CART -->

        <!-- BEGIN NAVIGATION -->
        <div class="header-navigation">
            <ul>
                <li><a href="${ctx}/search/toCategoryList?categoryId=1">主食</a></li>
                <li><a href="${ctx}/search/toCategoryList?categoryId=2">粥、粉</a></li>
                <li><a href="${ctx}/search/toCategoryList?categoryId=3">饮料</a></li>
                <li><a href="${ctx}/search/toCategoryList?categoryId=4">其他</a></li>
                <li><a href="javascript:;">预订</a></li>
                <li><a href="${ctx}/toRatingList">评价</a></li>

                <!-- BEGIN TOP SEARCH -->
                <li class="menu-search">
                    <div class="input-group input-medium">
                        <input type="text" class="form-control" id="keyWord" placeholder="请输入搜索内容">
                        <span class="input-group-btn">
                        <button id="search" class="btn blue" type="button">搜索</button>
                        </span>
                    </div>
                </li>
                <!-- END TOP SEARCH -->
            </ul>
        </div>
        <!-- END NAVIGATION -->
    </div>
</div>
<!-- Header END -->
<div class="main">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="/toIndex">主页</a></li>
            <li class="active">预订</li>
        </ul>

        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
            <!-- BEGIN SIDEBAR -->
            <div class="sidebar col-md-3 col-sm-5">

                <div class="sidebar-products clearfix">
                    <h2>热销产品</h2>
                    <c:forEach var="hot" items="${hotList}">
                        <div class="item">
                            <a href="javascript:;"><img src="${ctxStatic}${hot.picture}" alt="Some Shoes in Animal with Cut Out"></a>
                            <h3><a href="${ctx}/search?word=${hot.dishesName}">${hot.dishesName}</a></h3>
                            <div class="price">￥${hot.dishesPrice}</div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <!-- END SIDEBAR -->
            <!-- BEGIN CONTENT -->
            <div class="col-md-7 col-sm-7">
                <c:if test="${flag == 1}">
                <div class="form-horizontal form-without-legend" >
                    <div class="form-group">
                        <label class="col-lg-4 control-label">手机号:</label>
                        <div class="col-lg-8">
                            <input type="text" class="form-control" id="phone" style="width:200px" name="phone" value="${sessionScope.session_user.userName}" disabled="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-4 control-label">验证码:</label>
                        <div class="col-lg-8">
                            <input type="text" id="forgetCaptcha" class="form-control" style="width:200px" maxlength="6" name="captcha">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-8 col-md-offset-4 padding-left-0 padding-top-5">
                            <button type="button" id="captcha" class="btn btn-primary" style="margin-left:18px">发送验证</button>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-4 control-label">用餐人数:</label>
                        <div class="col-lg-8">
                            <input type="number" class="form-control" id="number" style="width:200px" value="1" min="1" max="6" name="num">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-4 control-label">预订时间:</label>
                        <div class="layui-input-inline" style="margin-left: 16px;">
                            <input type="text" class="layui-input" id="test-limit2" name="time" placeholder="yyyy-MM-dd">
                        </div>
                        <div class="layui-input-inline">
                            <input type="text" class="layui-input" id="test-limit3" name="time2" placeholder="HH:mm:ss">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-8 col-md-offset-4 padding-left-0 padding-top-5">
                            <button id="bookingBtn" class="btn btn-primary" onclick="Booking.bookingOrder()" style="margin-left:18px">提交</button>
                        </div>
                    </div>
                </div>
                </c:if>
                <c:if test="${flag == 2}">
                <div class="form-horizontal form-without-legend" >
                    <input type="text" id="id"  name="id"  value="${booking.id}" hidden>
                    <div class="form-group">
                        <label class="col-lg-4 control-label">手机号:</label>
                        <div class="col-lg-8">
                            <input type="text" class="form-control" style="width:200px" name="phone" value="18373156436" disabled="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-4 control-label">用餐人数:</label>
                        <div class="col-lg-8">
                            <input type="number" class="form-control"  style="width:200px" value="${booking.num}" maxlength="16" name="num" disabled>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-4 control-label">预订时间:</label>
                        <div class="layui-input-inline" style="margin-left: 16px;width:200px">
                            <input type="text" class="layui-input"  placeholder="yyyy-MM-dd" value="${booking.timeStr}" disabled>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-4 control-label">餐桌号:</label>
                        <div class="col-lg-8">
                            <input type="text" class="form-control" style="width:200px" name="phone"  value="${booking.tableId}" disabled>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-8 col-md-offset-4 padding-left-0 padding-top-5">
                            <button id="cancelBtn" class="btn btn-primary" onclick="Booking.bookingCancel()" style="margin-left:18px">取消</button>
                        </div>
                    </div>
                </div>
                </c:if>
            </div>
        </div>
        <!-- END CONTENT -->
        <!-- END SIDEBAR & CONTENT -->
    </div>
</div>


<!-- BEGIN fast view of a product -->
<div id="product-pop-up" style="display: none; width: 700px;">
    <div class="product-page product-pop-up">
        <div class="row">
            <div class="col-md-6 col-sm-6 col-xs-3">
                <div class="product-main-image">
                    <img src="${ctxStatic}/assets/frontend/pages/img/products/model7.jpg" alt="Cool green dress with red bell" class="img-responsive">
                </div>
                <div class="product-other-images">
                    <a href="javascript:;" class="active"><img alt="Berry Lace Dress" src="${ctxStatic}/assets/frontend/pages/img/products/model3.jpg"></a>
                    <a href="javascript:;"><img alt="Berry Lace Dress" src="${ctxStatic}/assets/frontend/pages/img/products/model4.jpg"></a>
                    <a href="javascript:;"><img alt="Berry Lace Dress" src="${ctxStatic}/assets/frontend/pages/img/products/model5.jpg"></a>
                </div>
            </div>
            <div class="col-md-6 col-sm-6 col-xs-9">
                <h1>Cool green dress with red bell</h1>
                <div class="price-availability-block clearfix">
                    <div class="price">
                        <strong><span>$</span>47.00</strong>
                        <em>$<span>62.00</span></em>
                    </div>
                    <div class="availability">
                        Availability: <strong>In Stock</strong>
                    </div>
                </div>
                <div class="description">
                    <p>Lorem ipsum dolor ut sit ame dolore  adipiscing elit, sed nonumy nibh sed euismod laoreet dolore magna aliquarm erat volutpat
                        Nostrud duis molestie at dolore.</p>
                </div>
                <div class="product-page-options">
                    <div class="pull-left">
                        <label class="control-label">Size:</label>
                        <select class="form-control input-sm">
                            <option>L</option>
                            <option>M</option>
                            <option>XL</option>
                        </select>
                    </div>
                    <div class="pull-left">
                        <label class="control-label">Color:</label>
                        <select class="form-control input-sm">
                            <option>Red</option>
                            <option>Blue</option>
                            <option>Black</option>
                        </select>
                    </div>
                </div>
                <div class="product-page-cart">
                    <div class="product-quantity">
                        <input id="product-quantity" type="text" value="1" readonly name="product-quantity" class="form-control input-sm">
                    </div>
                    <button class="btn btn-primary" type="submit">Add to cart</button>
                    <a href="javascript:;" class="btn btn-default">More details</a>
                </div>
            </div>

            <div class="sticker sticker-sale"></div>
        </div>
    </div>
</div>
<!-- END fast view of a product -->

<!-- Load javascripts at bottom, this will reduce page load time -->
<!-- BEGIN CORE PLUGINS(REQUIRED FOR ALL PAGES) -->
<!--[if lt IE 9]>
<script src="${ctxStatic}/assets/global/plugins/respond.min.js"></script>
<![endif]-->
<script src="${ctxStatic}/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/assets/frontend/layout/scripts/back-to-top.js" type="text/javascript"></script>
<script src="${ctxStatic}/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->

<!-- BEGIN PAGE LEVEL JAVASCRIPTS (REQUIRED ONLY FOR CURRENT PAGE) -->
<script src="${ctxStatic}/assets/global/plugins/fancybox/source/jquery.fancybox.pack.js" type="text/javascript"></script><!-- pop up -->
<script src="${ctxStatic}/assets/global/plugins/carousel-owl-carousel/owl-carousel/owl.carousel.min.js" type="text/javascript"></script><!-- slider for products -->
<script src='${ctxStatic}/assets/global/plugins/zoom/jquery.zoom.min.js' type="text/javascript"></script><!-- product zoom -->
<script src="${ctxStatic}/assets/global/plugins/bootstrap-touchspin/bootstrap.touchspin.js" type="text/javascript"></script><!-- Quantity -->
<script src="${ctxStatic}/assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/assets/global/plugins/rateit/src/jquery.rateit.js" type="text/javascript"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js" type="text/javascript"></script><!-- for slider-range -->

<script src="${ctxStatic}/assets/frontend/layout/scripts/layout.js" type="text/javascript"></script>
<script src="${ctxStatic}/portal/shopping_cart.js" type="text/javascript"></script>
<script src="${ctxStatic}/js/jquery.cookie.js" type="text/javascript"></script>
<script src="${ctxStatic}/portal/index.js" type="text/javascript"></script>
<script src="${ctxStatic}/portal/booking.js" type="text/javascript"></script>
<script src="${ctxStatic}/layui/layui.js" type="text/javascript"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {
        Layout.init();
        Layout.initOWL();
        Layout.initImageZoom();
        Layout.initTouchspin();
        Layout.initUniform();
        Layout.initSliderRange();
        ShoppingCart.init();
    });
    layui.use('laydate', function(){
        var laydate = layui.laydate;
        //前后若干天可选，这里以7天为例
        laydate.render({
            elem: '#test-limit2'
            ,min: 0
            ,max: 6
        });

        //限定可选时间
        laydate.render({
            elem: '#test-limit3'
            ,type: 'time'
            ,min: '09:30:00'
            ,max: '20:30:00'
            ,btns: ['clear', 'confirm']
        });
    });



</script>
<!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
