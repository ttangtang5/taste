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
    <title>搜索列表</title>

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
                <li><a href="">评价</a></li>


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
            <li class="active">搜索</li>
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
            <div class="col-md-9 col-sm-7">
                <div class="content-search margin-bottom-20">
                    <div class="row">
                        <div class="col-md-6">
                            <h1>关于搜索 <em><c:if test="${query == ''}">所有的</c:if>${query}
                            </em>结果</h1>
                        </div>
                        <%--<div class="col-md-6">
                            <form action="#">
                                <div class="input-group">
                                    <input type="text" placeholder="请输入搜索内容" class="form-control">
                                    <span class="input-group-btn">
                        <button class="btn btn-primary" type="submit">搜索</button>
                      </span>
                                </div>
                            </form>
                        </div>--%>
                    </div>
                </div>
                <div class="row list-view-sorting clearfix">
                    <div class="col-md-2 col-sm-2 list-view">
                        <a href="javascript:;"><i class="fa fa-th-large"></i></a>
                        <a href="javascript:;"><i class="fa fa-th-list"></i></a>
                    </div>
                    <div class="col-md-10 col-sm-10">
                        <%--<div class="pull-right">
                            <label class="control-label">排&nbsp;序:</label>
                            <select class="form-control input-sm">
                                <option value="#?sort=p.sort_order&amp;order=ASC" selected="selected">Default</option>
                                <option value="#?sort=pd.name&amp;order=ASC">Name (A - Z)</option>
                                <option value="#?sort=pd.name&amp;order=DESC">Name (Z - A)</option>
                                <option value="#?sort=p.price&amp;order=ASC">Price (Low &gt; High)</option>
                                <option value="#?sort=p.price&amp;order=DESC">Price (High &gt; Low)</option>
                                <option value="#?sort=rating&amp;order=DESC">Rating (Highest)</option>
                                <option value="#?sort=rating&amp;order=ASC">Rating (Lowest)</option>
                                <option value="#?sort=p.model&amp;order=ASC">Model (A - Z)</option>
                                <option value="#?sort=p.model&amp;order=DESC">Model (Z - A)</option>
                            </select>
                        </div>--%>
                    </div>
                </div>
                <!-- BEGIN PRODUCT LIST -->
                <div class="row">
                    <c:forEach var="item" items="${itemList}" >
                        <div class="col-md-3 col-sm-4 col-xs-8" style="padding-top: 15px;padding-bottom: 15px;">
                        <div class="product-item">
                            <div class="pi-img-wrapper">
                                <img src="${ctxStatic}${item.dishesPicture}" class="img-responsive imgNewProduct" alt="Berry Lace Dress">
                                <div>
                                    <a href="${ctxStatic}${item.dishesPicture}" class="btn btn-default fancybox-button">缩放</a>
                                    <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">查看</a>
                                </div>
                            </div>
                            <h3><a href="javascript:;" class="aNewProduct">${item.dishesName}</a></h3>
                            <div class="pi-price priceNewProduct">￥${item.dishesPrice}</div>
                            <a href="javascript:;" class="btn btn-default add2cart">加入购物车</a>
                        </div>
                    </div>
                    </c:forEach>
                </div>
                <!-- END PRODUCT LIST -->
                <!-- BEGIN PAGINATOR -->
                <div class="row">
                    <div class="col-md-4 col-sm-4 items-info"> ${(page-1)*16+1} 到 ${(page-1)*16+16} 总计 ${totalPages} 条</div>
                    <div class="col-md-8 col-sm-8" id="pagination">
                    </div>
                </div>
                <!-- END PAGINATOR -->
            </div>
            <!-- END CONTENT -->
        </div>
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
<script src="${ctxStatic}/layui/layui.js" type="text/javascript"></script>
<script src="${ctxStatic}/portal/index.js" type="text/javascript"></script>
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
    var page = '${page}';

    layui.use(['laypage', 'layer'], function(){
        var laypage = layui.laypage
            ,layer = layui.layer;

        //开启HASH
        laypage.render({
            elem: 'pagination'
            ,count: '${totalPages}'
            ,theme: '#FF5722'
            ,limit: '16'
            ,curr: page
            ,hash: 'fenye'
            ,jump: function(obj, first){
            //obj包含了当前分页的所有参数，比如：
            page = obj.curr;
            //首次不执行
            if(!first){
                //do something
                var url = ctx+"/search?page="+obj.curr+"&word=" + encodeURIComponent(document.getElementById("keyWord").value);
                window.location.href = url;
            }
        }
        });

    });
</script>
<!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
