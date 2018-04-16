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
    <title>首页</title>

    <!-- Fonts START -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700|PT+Sans+Narrow|Source+Sans+Pro:200,300,400,600,700,900&amp;subset=all" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900&amp;subset=all" rel="stylesheet" type="text/css"><!--- fonts for slider on the index page -->
    <!-- Fonts END -->

    <!-- Global styles START -->
    <link href="${ctxStatic}/assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="${ctxStatic}/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Global styles END -->

    <!-- Page level plugin styles START -->
    <link href="${ctxStatic}/assets/global/plugins/slider-layer-slider/css/layerslider.css" rel="stylesheet">
    <!-- Page level plugin styles END -->

    <!-- Theme styles START -->
    <link href="${ctxStatic}/assets/frontend/pages/css/style-layer-slider.css" rel="stylesheet">
    <!-- Theme styles END -->
</head>
<!-- Head END -->

<!-- Body BEGIN -->
<body class="ecommerce">
<!-- BEGIN STYLE CUSTOMIZER -->
<div class="color-panel hidden-sm">
    <div class="color-mode-icons icon-color"></div>
    <div class="color-mode-icons icon-color-close"></div>
    <div class="color-mode">
        <p>主题颜色</p>
        <ul class="inline">
            <li class="color-red current color-default" data-style="red"></li>
            <li class="color-blue" data-style="blue"></li>
            <li class="color-green" data-style="green"></li>
            <li class="color-orange" data-style="orange"></li>
            <li class="color-gray" data-style="gray"></li>
            <li class="color-turquoise" data-style="turquoise"></li>
        </ul>
    </div>
</div>
<!-- END BEGIN STYLE CUSTOMIZER -->


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
                        <a href="/toShopShoppingCart" class="btn btn-default">查看</a>
                        <a href="/toShopCheckout" class="btn btn-primary">结账</a>
                    </div>
                </div>
            </div>
        </div>
        <!--END CART -->

        <!-- BEGIN NAVIGATION -->
        <div class="header-navigation">
            <ul>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" data-target="#" href="javascript:;">
                        分类一
                    </a>
                </li>
                <li class="dropdown dropdown-megamenu">
                    <a class="dropdown-toggle" data-toggle="dropdown" data-target="#" href="javascript:;">
                        分类二
                    </a>
                </li>
                <li><a href="shop-item.html">分类三</a></li>
                <li class="dropdown dropdown100 nav-catalogue">
                    <a class="dropdown-toggle" data-toggle="dropdown" data-target="#" href="javascript:;">
                        分类四
                    </a>
                </li>

                <!-- BEGIN TOP SEARCH -->
                <li class="menu-search">
                    <div class="input-group input-medium">
                        <input type="text" class="form-control" placeholder="请输入搜索内容">
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

<!-- BEGIN SLIDER -->
<div class="page-slider margin-bottom-35">
    <!-- LayerSlider start -->
    <div id="layerslider" style="width: 100%; height: 494px; margin: 0 auto;">

        <!-- slide one start -->
        <div class="ls-slide ls-slide1" data-ls="offsetxin: right; slidedelay: 7000; transition2d: 24,25,27,28;">

            <img class="ls-bg" alt="Slide background">

            <div class="ls-l ls-title" style="top: 96px; left: 35%; white-space: nowrap;" data-ls="
                fade: true;
                fadeout: true;
                durationin: 750;
                durationout: 750;
                easingin: easeOutQuint;
                rotatein: 90;
                rotateout: -90;
                scalein: .5;
                scaleout: .5;
                showuntil: 4000;
          ">Tones of <strong>shop UI features</strong> designed</div>

            <div class="ls-l ls-mini-text" style="top: 338px; left: 35%; white-space: nowrap;" data-ls="
                  fade: true;
                  fadeout: true;
                  durationout: 750;
                  easingin: easeOutQuint;
                  delayin: 300;
                  showuntil: 4000;
          ">Lorem ipsum dolor sit amet  constectetuer diam<br > adipiscing elit euismod ut laoreet dolore.
            </div>
        </div>
        <!-- slide one end -->

        <!-- slide two start -->
        <div class="ls-slide ls-slide2" data-ls="offsetxin: right; slidedelay: 7000; transition2d: 110,111,112,113;">

            <img  class="ls-bg" alt="Slide background">

            <div class="ls-l ls-title" style="top: 40%; left: 21%; white-space: nowrap;" data-ls="
              fade: true;
              fadeout: true;
              durationin: 750; durationout: 109750;
              easingin: easeOutQuint;
              easingout: easeInOutQuint;
              delayin: 0;
              delayout: 0;
              rotatein: 90;
              rotateout: -90;
              scalein: .5;
              scaleout: .5;
              showuntil: 4000;
          "><strong>Unlimted</strong> Layout Options <em>Fully Responsive</em>
            </div>

            <div class="ls-l ls-price" style="top: 50%; left: 45%; white-space: nowrap;" data-ls="
              fade: true;
              fadeout: true;
              durationout: 109750;
              easingin: easeOutQuint;
              delayin: 300;
              scalein: .8;
              scaleout: .8;
              showuntil: 4000;
           "><b>from</b> <strong><span>$</span>25</strong>
            </div>

            <a href="javascript:;" class="ls-l ls-more" style="top: 72%; left: 21%; display: inline-block; white-space: nowrap;" data-ls="
              fade: true;
              fadeout: true;
              durationin: 750;
              durationout: 750;
              easingin: easeOutQuint;
              easingout: easeInOutQuint;
              delayin: 0;
              delayout: 0;
              rotatein: 90;
              rotateout: -90;
              scalein: .5;
              scaleout: .5;
              showuntil: 4000;
            ">See More Details
            </a>
        </div>
        <!-- slide two end -->

        <!-- slide three start -->
        <div class="ls-slide ls-slide3" data-ls="offsetxin: right; slidedelay: 7000; transition2d: 92,93,105;">

            <img  class="ls-bg" alt="Slide background">

            <div class="ls-l ls-title" style="top: 83px; left: 33%; white-space: nowrap;" data-ls="
              fade: true;
              fadeout: true;
              durationin: 750;
              durationout: 750;
              easingin: easeOutQuint;
              rotatein: 90;
              rotateout: -90;
              scalein: .5;
              scaleout: .5;
              showuntil: 4000;
          ">Full Admin &amp; Frontend <strong>eCommerce UI</strong> Is Ready For Your Project
            </div>
            <div class="ls-l" style="top: 333px; left: 33%; white-space: nowrap; font-size: 20px; font: 20px 'Open Sans Light', sans-serif;" data-ls="
              fade: true;
              fadeout: true;
              durationout: 750;
              easingin: easeOutQuint;
              delayin: 300;
              scalein: .8;
              scaleout: .8;
              showuntil: 4000;">
                <a href="javascript:;" class="ls-buy">
                    Buy It Now!
                </a>
                <div class="ls-price">
                    <span>All these for only:</span>
                    <strong>25<sup>$</sup></strong>
                </div>
            </div>
        </div>
        <!-- slide three end -->

        <!-- slide four start -->
        <div class="ls-slide ls-slide4" data-ls="offsetxin: right; slidedelay: 7000; transition2d: 110,111,112,113;">

            <img  class="ls-bg" alt="Slide background">

            <div class="ls-l ls-title" style="top: 35%; left: 60%; white-space: nowrap;" data-ls="
          fade: true;
          fadeout: true;
          durationin: 750;
          durationout: 750;
          easingin: easeOutQuint;
          rotatein: 90;
          rotateout: -90;
          scalein: .5;
          scaleout: .5;
          showuntil: 4000;">
                The most<br>
                wanted bijouterie
            </div>

            <div class="ls-l ls-mini-text" style="top: 70%; left: 60%; white-space: nowrap;" data-ls="
          fade: true;
          fadeout: true;
          durationout: 750;
          easingin: easeOutQuint;
          delayin: 300;
          scalein: .8;
          scaleout: .8;
          showuntil: 4000;">
                <span>Lorem ipsum and</span>
                <a href="javascript:;">Buy It Now!</a>
            </div>

        </div>
        <!-- slide four end -->
    </div>
    <!-- LayerSlider end -->
</div>
<!-- END SLIDER -->

<div class="main">
    <div class="container">
        <!-- BEGIN SALE PRODUCT & NEW ARRIVALS -->
        <div class="row margin-bottom-40">
            <!-- BEGIN SALE PRODUCT -->
            <div class="col-md-12 sale-product">
                <h2>新品上架</h2>
                <div class="owl-carousel owl-carousel5">
                    <div>
                    <div class="product-item">
                        <div class="pi-img-wrapper">
                            <img  class="img-responsive imgNewProduct" alt="Berry Lace Dress">
                            <div>
                                <a  class="btn btn-default fancybox-button newProductZoom">缩放</a>
                                <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">查看</a>
                            </div>
                        </div>
                        <h3><a href="shop-item.html" class="aNewProduct"></a></h3>
                        <div class="pi-price priceNewProduct" ></div>
                        <a href="javascript:;"  class="btn btn-default add2cart">加入购物车</a>
                        <div class="sticker sticker-sale"></div>
                    </div>
                </div>
                    <div>
                        <div class="product-item">
                            <div class="pi-img-wrapper">
                                <img  class="img-responsive imgNewProduct" alt="Berry Lace Dress">
                                <div>
                                    <a  class="btn btn-default fancybox-button newProductZoom">缩放</a>
                                    <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">查看</a>
                                </div>
                            </div>
                            <h3><a href="shop-item.html" class="aNewProduct"></a></h3>
                            <div class="pi-price priceNewProduct"></div>
                            <a href="javascript:;" class="btn btn-default add2cart">加入购物车</a>
                        </div>
                    </div>
                    <div>
                        <div class="product-item">
                            <div class="pi-img-wrapper">
                                <img  class="img-responsive imgNewProduct" alt="Berry Lace Dress">
                                <div>
                                    <a  class="btn btn-default fancybox-button newProductZoom">缩放</a>
                                    <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">查看</a>
                                </div>
                            </div>
                            <h3><a href="shop-item.html" class="aNewProduct"></a></h3>
                            <div class="pi-price priceNewProduct"></div>
                            <a href="javascript:;" class="btn btn-default add2cart">加入购物车</a>
                        </div>
                    </div>
                    <div>
                        <div class="product-item">
                            <div class="pi-img-wrapper">
                                <img  class="img-responsive imgNewProduct" alt="Berry Lace Dress">
                                <div>
                                    <a  class="btn btn-default fancybox-button newProductZoom">缩放</a>
                                    <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">查看</a>
                                </div>
                            </div>
                            <h3><a href="shop-item.html" class="aNewProduct"></a></h3>
                            <div class="pi-price priceNewProduct"></div>
                            <a href="javascript:;" class="btn btn-default add2cart">加入购物车</a>
                        </div>
                    </div>
                    <div>
                        <div class="product-item">
                            <div class="pi-img-wrapper">
                                <img  class="img-responsive imgNewProduct" alt="Berry Lace Dress">
                                <div>
                                    <a  class="btn btn-default fancybox-button newProductZoom">缩放</a>
                                    <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">查看</a>
                                </div>
                            </div>
                            <h3><a href="shop-item.html" class="aNewProduct"></a></h3>
                            <div class="pi-price priceNewProduct"></div>
                            <a href="javascript:;" class="btn btn-default add2cart">加入购物车</a>
                        </div>
                    </div>
                    <div>
                        <div class="product-item">
                            <div class="pi-img-wrapper">
                                <img  class="img-responsive imgNewProduct" alt="Berry Lace Dress">
                                <div>
                                    <a  class="btn btn-default fancybox-button newProductZoom">Zoom</a>
                                    <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                                </div>
                            </div>
                            <h3><a href="javascript:;" class="aNewProduct"></a></h3>
                            <div class="pi-price priceNewProduct"></div>
                            <a href="javascript:;" class="btn btn-default add2cart">加入购物车</a>
                            <div class="sticker sticker-new"></div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END SALE PRODUCT -->
        </div>
        <!-- END SALE PRODUCT & NEW ARRIVALS -->
        <!-- BEGIN PROMO -->
        <div class="col-md-6 shop-index-carousel">
            <div class="content-slider">
                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="item active">
                            <img  class="img-responsive imgRecommend" alt="Berry Lace Dress">
                        </div>
                        <div class="item">
                            <img  class="img-responsive imgRecommend" alt="Berry Lace Dress">
                        </div>
                        <div class="item">
                            <img  class="img-responsive imgRecommend" alt="Berry Lace Dress">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END PROMO -->
        <!-- BEGIN TWO PRODUCTS & PROMO -->
        <div class="row margin-bottom-35 ">
            <!-- BEGIN TWO PRODUCTS -->
            <div class="col-md-6 two-items-bottom-items">
                <h2>推荐</h2>
                <div class="owl-carousel owl-carousel2">
                    <div>
                        <div class="product-item">
                            <div class="pi-img-wrapper">
                                <img  class="img-responsive imgRecommend" alt="Berry Lace Dress">
                                <div>
                                    <a  class="btn btn-default fancybox-button recommendZoom">缩放</a>
                                    <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">查看</a>
                                </div>
                            </div>
                            <h3><a href="shop-item.html" class="aRecommend"></a></h3>
                            <div class="pi-price priceRecommend"></div>
                            <a href="javascript:;" class="btn btn-default add2cart">加入购物车</a>
                        </div>
                    </div>
                    <div>
                        <div class="product-item">
                            <div class="pi-img-wrapper">
                                <img  class="img-responsive imgRecommend" alt="Berry Lace Dress">
                                <div>
                                    <a  class="btn btn-default fancybox-button recommendZoom">缩放</a>
                                    <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">查看</a>
                                </div>
                            </div>
                            <h3><a href="shop-item.html" class="aRecommend"></a></h3>
                            <div class="pi-price priceRecommend"></div>
                            <a href="javascript:;" class="btn btn-default add2cart">加入购物车</a>
                        </div>
                    </div>
                    <div>
                        <div class="product-item">
                            <div class="pi-img-wrapper">
                                <img  class="img-responsive imgRecommend" alt="Berry Lace Dress">
                                <div>
                                    <a class="btn btn-default fancybox-button recommendZoom">缩放</a>
                                    <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">查看</a>
                                </div>
                            </div>
                            <h3><a href="shop-item.html" class="aRecommend"></a></h3>
                            <div class="pi-price priceRecommend"></div>
                            <a href="javascript:;" class="btn btn-default add2cart">加入购物车</a>
                        </div>
                    </div>
                    <div>
                        <div class="product-item">
                            <div class="pi-img-wrapper">
                                <img  class="img-responsive imgRecommend" alt="Berry Lace Dress">
                                <div>
                                    <a class="btn btn-default fancybox-button recommendZoom">缩放</a>
                                    <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">查看</a>
                                </div>
                            </div>
                            <h3><a href="shop-item.html" class="aRecommend"></a></h3>
                            <div class="pi-price priceRecommend"></div>
                            <a href="javascript:;" class="btn btn-default add2cart">加入购物车</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END TWO PRODUCTS -->

        </div>
        <!-- END TWO PRODUCTS & PROMO -->
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
               <%-- <div class="product-other-images">
                    <a href="javascript:;" class="active"><img alt="Berry Lace Dress" src="${ctxStatic}/assets/frontend/pages/img/products/model3.jpg"></a>
                    <a href="javascript:;"><img alt="Berry Lace Dress" src="${ctxStatic}/assets/frontend/pages/img/products/model4.jpg"></a>
                    <a href="javascript:;"><img alt="Berry Lace Dress" src="${ctxStatic}/assets/frontend/pages/img/products/model5.jpg"></a>
                </div>--%>
            </div>
            <div class="col-md-6 col-sm-6 col-xs-9">
                <h2>Cool green dress with red bell</h2>
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
                    <button class="btn btn-primary" id="addCart" type="submit">添加至购物车</button>
                    <a href="/toShopItem" class="btn btn-default">查看详情</a>
                </div>
            </div>
            <div class="sticker sticker-sale"></div>
        </div>
    </div>
</div>
<!-- END fast view of a product -->
<!-- Load javascripts at bottom, this will reduce page load time -->
<!-- BEGIN CORE PLUGINS (REQUIRED FOR ALL PAGES) -->
<!--[if lt IE 9]>
<script src="${ctxStatic}/assets/global/plugins/respond.min.js"></script>
<![endif]-->
<script src="${ctxStatic}/js/jquery-2.1.1.js" type="text/javascript"></script>
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

<!-- BEGIN LayerSlider -->
<script src="${ctxStatic}/assets/global/plugins/slider-layer-slider/js/greensock.js" type="text/javascript"></script><!-- External libraries: GreenSock -->
<script src="${ctxStatic}/assets/global/plugins/slider-layer-slider/js/layerslider.transitions.js" type="text/javascript"></script><!-- LayerSlider script files -->
<script src="${ctxStatic}/assets/global/plugins/slider-layer-slider/js/layerslider.kreaturamedia.jquery.js" type="text/javascript"></script><!-- LayerSlider script files -->
<script src="${ctxStatic}/assets/frontend/pages/scripts/layerslider-init.js" type="text/javascript"></script>
<!-- END LayerSlider -->

<script src="${ctxStatic}/assets/frontend/layout/scripts/layout.js" type="text/javascript"></script>

<!--自定义引用js-->
<script src="${ctxStatic}/portal/shopping_cart.js" type="text/javascript"></script>
<script src="${ctxStatic}/js/jquery.cookie.js" type="text/javascript"></script>
<script src="${ctxStatic}/portal/index.js" type="text/javascript"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {
        Layout.init();
        Layout.initOWL();
        LayersliderInit.initLayerSlider();
        Layout.initImageZoom();
        Layout.initTouchspin();
        IndexContent.init();
        ShoppingCart.init();
    });


</script>
<!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
