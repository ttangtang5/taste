<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <title>首页</title>

    <!-- Fonts START -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700|PT+Sans+Narrow|Source+Sans+Pro:200,300,400,600,700,900&amp;subset=all" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900&amp;subset=all" rel="stylesheet" type="text/css"><!--- fonts for slider on the index page -->
    <!-- Fonts END -->

    <!-- Global styles START -->
    <link href="/static/assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="/static/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Global styles END -->

    <!-- Page level plugin styles START -->
    <link href="/static/assets/global/plugins/fancybox/source/jquery.fancybox.css" rel="stylesheet">
    <link href="/static/assets/global/plugins/carousel-owl-carousel/owl-carousel/owl.carousel.css" rel="stylesheet">
    <link href="/static/assets/global/plugins/slider-layer-slider/css/layerslider.css" rel="stylesheet">
    <!-- Page level plugin styles END -->

    <!-- Theme styles START -->
    <link href="/static/assets/global/css/components.css" rel="stylesheet">
    <link href="/static/assets/frontend/layout/css/style.css" rel="stylesheet">
    <link href="/static/assets/frontend/pages/css/style-shop.css" rel="stylesheet" type="text/css">
    <link href="/static/assets/frontend/pages/css/style-layer-slider.css" rel="stylesheet">
    <link href="/static/assets/frontend/layout/css/style-responsive.css" rel="stylesheet">
    <link href="/static/assets/frontend/layout/css/themes/red.css" rel="stylesheet" id="style-color">
    <link href="/static/assets/frontend/layout/css/custom.css" rel="stylesheet">
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
                    <li><a href="shop-account.html">个人中心</a></li>
                    <li><a href="shop-wishlist.html">收藏</a></li>
                    <li><a href="shop-checkout.html">订单</a></li>
                    <li><a href="page-login.html">登录</a></li>
                </ul>
            </div>
            <!-- END TOP BAR MENU -->
        </div>
    </div>
</div>
<!-- END TOP BAR -->

<!-- BEGIN HEADER -->
<div class="header">
    <div class="container">
        <a class="site-logo" href="shop-index.html"><img src="/static/assets/frontend/layout/img/logos/logo-shop-red.png" alt="餐厅图标"></a>

        <a href="javascript:void(0);" class="mobi-toggler"><i class="fa fa-bars"></i></a>

        <!-- BEGIN CART -->
        <div class="top-cart-block">
            <div class="top-cart-info">
                <a href="javascript:void(0);" class="top-cart-info-count">3件</a>
                <a href="javascript:void(0);" class="top-cart-info-value">￥1260</a>
            </div>
            <i class="fa fa-shopping-cart"></i>
            <!--shopping cart-->
            <div class="top-cart-content-wrapper">
                <div class="top-cart-content">
                    <ul class="scroller" style="height: 100px;">
                        <li>
                            <a href="shop-item.html"><img src="/static/assets/frontend/pages/img/cart-img.jpg" alt="Rolex Classic Watch" width="37" height="34"></a>
                            <span class="cart-content-count">x 1</span>
                            <strong><a href="shop-item.html">Rolex Classic Watch</a></strong>
                            <em>$1230</em>
                            <a href="javascript:void(0);" class="del-goods">&nbsp;</a>
                        </li>
                        <li>
                            <a href="shop-item.html"><img src="/static/assets/frontend/pages/img/cart-img.jpg" alt="Rolex Classic Watch" width="37" height="34"></a>
                            <span class="cart-content-count">x 1</span>
                            <strong><a href="shop-item.html">Rolex Classic Watch</a></strong>
                            <em>$1230</em>
                            <a href="javascript:void(0);" class="del-goods">&nbsp;</a>
                        </li>
                    </ul>
                    <div class="text-right">
                        <a href="shop-shopping-cart.html" class="btn btn-default">查看</a>
                        <a href="shop-checkout.html" class="btn btn-primary">结账</a>
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

                    <!-- BEGIN DROPDOWN MENU -->
                    <ul class="dropdown-menu">
                        <li class="dropdown-submenu">
                            <a href="shop-product-list.html">Hi Tops <i class="fa fa-angle-right"></i></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="shop-product-list.html">Second Level Link</a></li>
                                <li><a href="shop-product-list.html">Second Level Link</a></li>
                                <li class="dropdown-submenu">
                                    <a class="dropdown-toggle" data-toggle="dropdown" data-target="#" href="javascript:;">
                                        Second Level Link
                                        <i class="fa fa-angle-right"></i>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="shop-product-list.html">Third Level Link</a></li>
                                        <li><a href="shop-product-list.html">Third Level Link</a></li>
                                        <li><a href="shop-product-list.html">Third Level Link</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li><a href="shop-product-list.html">Running Shoes</a></li>
                        <li><a href="shop-product-list.html">Jackets and Coats</a></li>
                    </ul>
                    <!-- END DROPDOWN MENU -->
                </li>
                <li class="dropdown dropdown-megamenu">
                    <a class="dropdown-toggle" data-toggle="dropdown" data-target="#" href="javascript:;">
                        分类二
                    </a>
                    <ul class="dropdown-menu">
                        <li>
                            <div class="header-navigation-content">
                                <div class="row">
                                    <div class="col-md-4 header-navigation-col">
                                        <h4>Footwear</h4>
                                        <ul>
                                            <li><a href="shop-product-list.html">Astro Trainers</a></li>
                                            <li><a href="shop-product-list.html">Basketball Shoes</a></li>
                                            <li><a href="shop-product-list.html">Boots</a></li>
                                            <li><a href="shop-product-list.html">Canvas Shoes</a></li>
                                            <li><a href="shop-product-list.html">Football Boots</a></li>
                                            <li><a href="shop-product-list.html">Golf Shoes</a></li>
                                            <li><a href="shop-product-list.html">Hi Tops</a></li>
                                            <li><a href="shop-product-list.html">Indoor and Court Trainers</a></li>
                                        </ul>
                                    </div>
                                    <div class="col-md-4 header-navigation-col">
                                        <h4>Clothing</h4>
                                        <ul>
                                            <li><a href="shop-product-list.html">Base Layer</a></li>
                                            <li><a href="shop-product-list.html">Character</a></li>
                                            <li><a href="shop-product-list.html">Chinos</a></li>
                                            <li><a href="shop-product-list.html">Combats</a></li>
                                            <li><a href="shop-product-list.html">Cricket Clothing</a></li>
                                            <li><a href="shop-product-list.html">Fleeces</a></li>
                                            <li><a href="shop-product-list.html">Gilets</a></li>
                                            <li><a href="shop-product-list.html">Golf Tops</a></li>
                                        </ul>
                                    </div>
                                    <div class="col-md-4 header-navigation-col">
                                        <h4>Accessories</h4>
                                        <ul>
                                            <li><a href="shop-product-list.html">Belts</a></li>
                                            <li><a href="shop-product-list.html">Caps</a></li>
                                            <li><a href="shop-product-list.html">Gloves, Hats and Scarves</a></li>
                                        </ul>

                                        <h4>Clearance</h4>
                                        <ul>
                                            <li><a href="shop-product-list.html">Jackets</a></li>
                                            <li><a href="shop-product-list.html">Bottoms</a></li>
                                        </ul>
                                    </div>
                                    <div class="col-md-12 nav-brands">
                                        <ul>
                                            <li><a href="shop-product-list.html"><img title="esprit" alt="esprit" src="/static/assets/frontend/pages/img/brands/esprit.jpg"></a></li>
                                            <li><a href="shop-product-list.html"><img title="gap" alt="gap" src="/static/assets/frontend/pages/img/brands/gap.jpg"></a></li>
                                            <li><a href="shop-product-list.html"><img title="next" alt="next" src="/static/assets/frontend/pages/img/brands/next.jpg"></a></li>
                                            <li><a href="shop-product-list.html"><img title="puma" alt="puma" src="/static/assets/frontend/pages/img/brands/puma.jpg"></a></li>
                                            <li><a href="shop-product-list.html"><img title="zara" alt="zara" src="/static/assets/frontend/pages/img/brands/zara.jpg"></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </li>
                <li><a href="shop-item.html">分类三</a></li>
                <li class="dropdown dropdown100 nav-catalogue">
                    <a class="dropdown-toggle" data-toggle="dropdown" data-target="#" href="javascript:;">
                        分类四
                    </a>
                    <ul class="dropdown-menu">
                        <li>
                            <div class="header-navigation-content">
                                <div class="row">
                                    <div class="col-md-3 col-sm-4 col-xs-6">
                                        <div class="product-item">
                                            <div class="pi-img-wrapper">
                                                <a href="shop-item.html"><img src="/static/assets/frontend/pages/img/products/model4.jpg" class="img-responsive" alt="Berry Lace Dress"></a>
                                            </div>
                                            <h3><a href="shop-item.html">Berry Lace Dress</a></h3>
                                            <div class="pi-price">$29.00</div>
                                            <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-4 col-xs-6">
                                        <div class="product-item">
                                            <div class="pi-img-wrapper">
                                                <a href="shop-item.html"><img src="/static/assets/frontend/pages/img/products/model3.jpg" class="img-responsive" alt="Berry Lace Dress"></a>
                                            </div>
                                            <h3><a href="shop-item.html">Berry Lace Dress</a></h3>
                                            <div class="pi-price">$29.00</div>
                                            <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-4 col-xs-6">
                                        <div class="product-item">
                                            <div class="pi-img-wrapper">
                                                <a href="shop-item.html"><img src="/static/assets/frontend/pages/img/products/model7.jpg" class="img-responsive" alt="Berry Lace Dress"></a>
                                            </div>
                                            <h3><a href="shop-item.html">Berry Lace Dress</a></h3>
                                            <div class="pi-price">$29.00</div>
                                            <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-4 col-xs-6">
                                        <div class="product-item">
                                            <div class="pi-img-wrapper">
                                                <a href="shop-item.html"><img src="/static/assets/frontend/pages/img/products/model4.jpg" class="img-responsive" alt="Berry Lace Dress"></a>
                                            </div>
                                            <h3><a href="shop-item.html">Berry Lace Dress</a></h3>
                                            <div class="pi-price">$29.00</div>
                                            <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" data-target="#" href="javascript:;">
                        Pages
                    </a>

                    <ul class="dropdown-menu">
                        <li class="active"><a href="shop-index.html">Home Default</a></li>
                        <li><a href="shop-index-header-fix.html">Home Header Fixed</a></li>
                        <li><a href="shop-index-light-footer.html">Home Light Footer</a></li>
                        <li><a href="shop-product-list.html">Product List</a></li>
                        <li><a href="shop-search-result.html">Search Result</a></li>
                        <li><a href="shop-item.html">Product Page</a></li>
                        <li><a href="shop-shopping-cart-null.html">Shopping Cart (Null Cart)</a></li>
                        <li><a href="shop-shopping-cart.html">Shopping Cart</a></li>
                        <li><a href="shop-checkout.html">Checkout</a></li>
                        <li><a href="shop-about.html">About</a></li>
                        <li><a href="shop-contacts.html">Contacts</a></li>
                        <li><a href="shop-account.html">My account</a></li>
                        <li><a href="shop-wishlist.html">My Wish List</a></li>
                        <li><a href="shop-goods-compare.html">Product Comparison</a></li>
                        <li><a href="shop-standart-forms.html">Standart Forms</a></li>
                        <li><a href="shop-faq.html">FAQ</a></li>
                        <li><a href="shop-privacy-policy.html">Privacy Policy</a></li>
                        <li><a href="shop-terms-conditions-page.html">Terms &amp; Conditions</a></li>
                    </ul>
                </li>

                <!-- BEGIN TOP SEARCH -->
                <li class="menu-search">
                    <div class="input-group input-medium">
                        <input type="text" class="form-control" placeholder="请输入搜索内容">
                        <span class="input-group-btn">
											<button class="btn blue" type="button">搜索</button>
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

            <img src="/static/assets/frontend/pages/img/layerslider/slide1/bg.jpg" class="ls-bg" alt="Slide background">

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

            <img src="/static/assets/frontend/pages/img/layerslider/slide2/bg.jpg" class="ls-bg" alt="Slide background">

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
          showuntil: 4000;"><b>from</b> <strong><span>$</span>25</strong>
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
          showuntil: 4000;">See More Details
            </a>
        </div>
        <!-- slide two end -->

        <!-- slide three start -->
        <div class="ls-slide ls-slide3" data-ls="offsetxin: right; slidedelay: 7000; transition2d: 92,93,105;">

            <img src="/static/assets/frontend/pages/img/layerslider/slide3/bg.jpg" class="ls-bg" alt="Slide background">

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
          showuntil: 4000;
          ">
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

            <img src="/static/assets/frontend/pages/img/layerslider/slide5/bg.jpg" class="ls-bg" alt="Slide background">

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
                                <img src="/static/assets/frontend/pages/img/products/model1.jpg" class="img-responsive" alt="Berry Lace Dress">
                                <div>
                                    <a href="/static/assets/frontend/pages/img/products/model1.jpg" class="btn btn-default fancybox-button">缩放</a>
                                    <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">查看</a>
                                </div>
                            </div>
                            <h3><a href="shop-item.html">Berry Lace Dress</a></h3>
                            <div class="pi-price">$29.00</div>
                            <a href="javascript:;" class="btn btn-default add2cart">加入购物车</a>
                            <div class="sticker sticker-sale"></div>
                        </div>
                    </div>
                    <div>
                        <div class="product-item">
                            <div class="pi-img-wrapper">
                                <img src="/static/assets/frontend/pages/img/products/model2.jpg" class="img-responsive" alt="Berry Lace Dress">
                                <div>
                                    <a href="/static/assets/frontend/pages/img/products/model2.jpg" class="btn btn-default fancybox-button">缩放</a>
                                    <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">查看</a>
                                </div>
                            </div>
                            <h3><a href="shop-item.html">Berry Lace Dress2</a></h3>
                            <div class="pi-price">$29.00</div>
                            <a href="javascript:;" class="btn btn-default add2cart">加入购物车</a>
                        </div>
                    </div>
                    <div>
                        <div class="product-item">
                            <div class="pi-img-wrapper">
                                <img src="/static/assets/frontend/pages/img/products/model6.jpg" class="img-responsive" alt="Berry Lace Dress">
                                <div>
                                    <a href="/static/assets/frontend/pages/img/products/model6.jpg" class="btn btn-default fancybox-button">缩放</a>
                                    <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">查看</a>
                                </div>
                            </div>
                            <h3><a href="shop-item.html">Berry Lace Dress2</a></h3>
                            <div class="pi-price">$29.00</div>
                            <a href="javascript:;" class="btn btn-default add2cart">加入购物车</a>
                        </div>
                    </div>
                    <div>
                        <div class="product-item">
                            <div class="pi-img-wrapper">
                                <img src="/static/assets/frontend/pages/img/products/model4.jpg" class="img-responsive" alt="Berry Lace Dress">
                                <div>
                                    <a href="/static/assets/frontend/pages/img/products/model4.jpg" class="btn btn-default fancybox-button">Zoom</a>
                                    <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                                </div>
                            </div>
                            <h3><a href="javascript:;">Berry Lace Dress4</a></h3>
                            <div class="pi-price">$29.00</div>
                            <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                            <div class="sticker sticker-new"></div>
                        </div>
                    </div>
                    <div>
                        <div class="product-item">
                            <div class="pi-img-wrapper">
                                <img src="/static/assets/frontend/pages/img/products/model5.jpg" class="img-responsive" alt="Berry Lace Dress">
                                <div>
                                    <a href="/static/assets/frontend/pages/img/products/model5.jpg" class="btn btn-default fancybox-button">Zoom</a>
                                    <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                                </div>
                            </div>
                            <h3><a href="shop-item.html">Berry Lace Dress5</a></h3>
                            <div class="pi-price">$29.00</div>
                            <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                        </div>
                    </div>
                    <div>
                        <div class="product-item">
                            <div class="pi-img-wrapper">
                                <img src="/static/assets/frontend/pages/img/products/model3.jpg" class="img-responsive" alt="Berry Lace Dress">
                                <div>
                                    <a href="/static/assets/frontend/pages/img/products/model3.jpg" class="btn btn-default fancybox-button">Zoom</a>
                                    <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                                </div>
                            </div>
                            <h3><a href="shop-item.html">Berry Lace Dress3</a></h3>
                            <div class="pi-price">$29.00</div>
                            <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                        </div>
                    </div>
                    <div>
                        <div class="product-item">
                            <div class="pi-img-wrapper">
                                <img src="/static/assets/frontend/pages/img/products/model7.jpg" class="img-responsive" alt="Berry Lace Dress">
                                <div>
                                    <a href="/static/assets/frontend/pages/img/products/model7.jpg" class="btn btn-default fancybox-button">Zoom</a>
                                    <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                                </div>
                            </div>
                            <h3><a href="shop-item.html">Berry Lace Dress3</a></h3>
                            <div class="pi-price">$29.00</div>
                            <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END SALE PRODUCT -->
        </div>
        <!-- END SALE PRODUCT & NEW ARRIVALS -->

        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40 ">
            <!-- BEGIN SIDEBAR -->
            <div class="sidebar col-md-3 col-sm-4">
                <ul class="list-group margin-bottom-25 sidebar-menu">
                    <li class="list-group-item clearfix"><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> 分类一</a></li>
                    <li class="list-group-item clearfix dropdown">
                        <a href="shop-product-list.html">
                            <i class="fa fa-angle-right"></i>
                            分类二

                        </a>
                        <ul class="dropdown-menu">
                            <li class="list-group-item dropdown clearfix">
                                <a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Shoes </a>
                                <ul class="dropdown-menu">
                                    <li class="list-group-item dropdown clearfix">
                                        <a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Classic </a>
                                        <ul class="dropdown-menu">
                                            <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Classic 1</a></li>
                                            <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Classic 2</a></li>
                                        </ul>
                                    </li>
                                    <li class="list-group-item dropdown clearfix">
                                        <a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Sport  </a>
                                        <ul class="dropdown-menu">
                                            <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Sport 1</a></li>
                                            <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Sport 2</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Trainers</a></li>
                            <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Jeans</a></li>
                            <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> Chinos</a></li>
                            <li><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> T-Shirts</a></li>
                        </ul>
                    </li>
                    <li class="list-group-item clearfix"><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> 分类三</a></li>
                    <li class="list-group-item clearfix"><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> 分类四</a></li>
                    <li class="list-group-item clearfix"><a href="shop-product-list.html"><i class="fa fa-angle-right"></i> 分类五</a></li>
                </ul>
            </div>
            <!-- END SIDEBAR -->
            <!-- BEGIN CONTENT -->
            <div class="col-md-9 col-sm-8">
                <h2>Three items</h2>
                <div class="owl-carousel owl-carousel3">
                    <div>
                        <div class="product-item">
                            <div class="pi-img-wrapper">
                                <img src="/static/assets/frontend/pages/img/products/k1.jpg" class="img-responsive" alt="Berry Lace Dress">
                                <div>
                                    <a href="/static/assets/frontend/pages/img/products/k1.jpg" class="btn btn-default fancybox-button">Zoom</a>
                                    <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                                </div>
                            </div>
                            <h3><a href="shop-item.html">Berry Lace Dress</a></h3>
                            <div class="pi-price">$29.00</div>
                            <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                            <div class="sticker sticker-new"></div>
                        </div>
                    </div>
                    <div>
                        <div class="product-item">
                            <div class="pi-img-wrapper">
                                <img src="/static/assets/frontend/pages/img/products/k2.jpg" class="img-responsive" alt="Berry Lace Dress">
                                <div>
                                    <a href="/static/assets/frontend/pages/img/products/k2.jpg" class="btn btn-default fancybox-button">Zoom</a>
                                    <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                                </div>
                            </div>
                            <h3><a href="shop-item.html">Berry Lace Dress2</a></h3>
                            <div class="pi-price">$29.00</div>
                            <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                        </div>
                    </div>
                    <div>
                        <div class="product-item">
                            <div class="pi-img-wrapper">
                                <img src="/static/assets/frontend/pages/img/products/k3.jpg" class="img-responsive" alt="Berry Lace Dress">
                                <div>
                                    <a href="/static/assets/frontend/pages/img/products/k3.jpg" class="btn btn-default fancybox-button">Zoom</a>
                                    <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                                </div>
                            </div>
                            <h3><a href="shop-item.html">Berry Lace Dress3</a></h3>
                            <div class="pi-price">$29.00</div>
                            <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                        </div>
                    </div>
                    <div>
                        <div class="product-item">
                            <div class="pi-img-wrapper">
                                <img src="/static/assets/frontend/pages/img/products/k4.jpg" class="img-responsive" alt="Berry Lace Dress">
                                <div>
                                    <a href="/static/assets/frontend/pages/img/products/k4.jpg" class="btn btn-default fancybox-button">Zoom</a>
                                    <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                                </div>
                            </div>
                            <h3><a href="shop-item.html">Berry Lace Dress4</a></h3>
                            <div class="pi-price">$29.00</div>
                            <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                            <div class="sticker sticker-sale"></div>
                        </div>
                    </div>
                    <div>
                        <div class="product-item">
                            <div class="pi-img-wrapper">
                                <img src="/static/assets/frontend/pages/img/products/k1.jpg" class="img-responsive" alt="Berry Lace Dress">
                                <div>
                                    <a href="/static/assets/frontend/pages/img/products/k1.jpg" class="btn btn-default fancybox-button">Zoom</a>
                                    <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                                </div>
                            </div>
                            <h3><a href="shop-item.html">Berry Lace Dress5</a></h3>
                            <div class="pi-price">$29.00</div>
                            <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                        </div>
                    </div>
                    <div>
                        <div class="product-item">
                            <div class="pi-img-wrapper">
                                <img src="/static/assets/frontend/pages/img/products/k2.jpg" class="img-responsive" alt="Berry Lace Dress">
                                <div>
                                    <a href="/static/assets/frontend/pages/img/products/k2.jpg" class="btn btn-default fancybox-button">Zoom</a>
                                    <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                                </div>
                            </div>
                            <h3><a href="shop-item.html">Berry Lace Dress6</a></h3>
                            <div class="pi-price">$29.00</div>
                            <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->
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
                            <img src="/static/assets/frontend/pages/img/index-sliders/slide1.jpg" class="img-responsive" alt="Berry Lace Dress">
                        </div>
                        <div class="item">
                            <img src="/static/assets/frontend/pages/img/index-sliders/slide2.jpg" class="img-responsive" alt="Berry Lace Dress">
                        </div>
                        <div class="item">
                            <img src="/static/assets/frontend/pages/img/index-sliders/slide3.jpg" class="img-responsive" alt="Berry Lace Dress">
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
                <h2>Two items</h2>
                <div class="owl-carousel owl-carousel2">
                    <div>
                        <div class="product-item">
                            <div class="pi-img-wrapper">
                                <img src="/static/assets/frontend/pages/img/products/k4.jpg" class="img-responsive" alt="Berry Lace Dress">
                                <div>
                                    <a href="/static/assets/frontend/pages/img/products/k4.jpg" class="btn btn-default fancybox-button">Zoom</a>
                                    <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                                </div>
                            </div>
                            <h3><a href="shop-item.html">Berry Lace Dress</a></h3>
                            <div class="pi-price">$29.00</div>
                            <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                        </div>
                    </div>
                    <div>
                        <div class="product-item">
                            <div class="pi-img-wrapper">
                                <img src="/static/assets/frontend/pages/img/products/k2.jpg" class="img-responsive" alt="Berry Lace Dress">
                                <div>
                                    <a href="/static/assets/frontend/pages/img/products/k2.jpg" class="btn btn-default fancybox-button">Zoom</a>
                                    <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                                </div>
                            </div>
                            <h3><a href="shop-item.html">Berry Lace Dress</a></h3>
                            <div class="pi-price">$29.00</div>
                            <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                        </div>
                    </div>
                    <div>
                        <div class="product-item">
                            <div class="pi-img-wrapper">
                                <img src="/static/assets/frontend/pages/img/products/k3.jpg" class="img-responsive" alt="Berry Lace Dress">
                                <div>
                                    <a href="/static/assets/frontend/pages/img/products/k3.jpg" class="btn btn-default fancybox-button">Zoom</a>
                                    <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                                </div>
                            </div>
                            <h3><a href="shop-item.html">Berry Lace Dress</a></h3>
                            <div class="pi-price">$29.00</div>
                            <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                        </div>
                    </div>
                    <div>
                        <div class="product-item">
                            <div class="pi-img-wrapper">
                                <img src="/static/assets/frontend/pages/img/products/k1.jpg" class="img-responsive" alt="Berry Lace Dress">
                                <div>
                                    <a href="/static/assets/frontend/pages/img/products/k1.jpg" class="btn btn-default fancybox-button">Zoom</a>
                                    <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                                </div>
                            </div>
                            <h3><a href="shop-item.html">Berry Lace Dress</a></h3>
                            <div class="pi-price">$29.00</div>
                            <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                        </div>
                    </div>
                    <div>
                        <div class="product-item">
                            <div class="pi-img-wrapper">
                                <img src="/static/assets/frontend/pages/img/products/k4.jpg" class="img-responsive" alt="Berry Lace Dress">
                                <div>
                                    <a href="/static/assets/frontend/pages/img/products/k4.jpg" class="btn btn-default fancybox-button">Zoom</a>
                                    <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                                </div>
                            </div>
                            <h3><a href="shop-item.html">Berry Lace Dress</a></h3>
                            <div class="pi-price">$29.00</div>
                            <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                        </div>
                    </div>
                    <div>
                        <div class="product-item">
                            <div class="pi-img-wrapper">
                                <img src="/static/assets/frontend/pages/img/products/k3.jpg" class="img-responsive" alt="Berry Lace Dress">
                                <div>
                                    <a href="/static/assets/frontend/pages/img/products/k3.jpg" class="btn btn-default fancybox-button">Zoom</a>
                                    <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                                </div>
                            </div>
                            <h3><a href="shop-item.html">Berry Lace Dress</a></h3>
                            <div class="pi-price">$29.00</div>
                            <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END TWO PRODUCTS -->

        </div>
        <!-- END TWO PRODUCTS & PROMO -->
    </div>
</div>
<!-- BEGIN STEPS -->
<div class="steps-block steps-block-red">
    <div class="container">
        <div class="row">
            <div class="col-md-4 steps-block-col">
                <i class="fa fa-gift"></i>
                <div>
                    <h2>下单</h2>
                    <em>30分钟送达</em>
                </div>
                <span>&nbsp;</span>
            </div>
            <div class="col-md-4 steps-block-col">
                <i class="fa fa-truck"></i>
                <div>
                    <h2>免费配送</h2>
                    <em>限校园内</em>
                </div>
                <span>&nbsp;</span>
            </div>
            <div class="col-md-4 steps-block-col">
                <i class="fa fa-phone"></i>
                <div>
                    <h2>477 505 8877</h2>
                    <em>营业时间：7:00-21:00</em>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- END STEPS -->

<!-- BEGIN PRE-FOOTER -->
<div class="pre-footer">
    <div class="container">
        <div class="row">
            <!-- BEGIN BOTTOM ABOUT BLOCK -->
            <div class="pre-footer-col">
                <h2 style="text-align: center;">关于我们</h2>
                <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam sit nonummy nibh euismod tincidunt ut laoreet dolore magna aliquarm erat sit volutpat. Nostrud exerci tation ullamcorper suscipit lobortis nisl aliquip  commodo consequat. </p>
                <p>Duis autem vel eum iriure dolor vulputate velit esse molestie at dolore.</p>
            </div>
            <!-- END BOTTOM ABOUT BLOCK -->
        </div>
        <hr>
    </div>
</div>
<!-- END PRE-FOOTER -->

<!-- BEGIN FOOTER -->
<div class="footer">
    <div class="container">
        <div class="row">
            <!-- BEGIN COPYRIGHT -->
            <div class="col-md-6 col-sm-6 padding-top-10" style="text-align: center;">
                2018 © *******. ALL Rights Reserved.
            </div>
            <!-- END COPYRIGHT -->
            <!-- BEGIN PAYMENTS -->
            <div class="col-md-6 col-sm-6">
                <ul class="list-unstyled list-inline pull-right">
                    <li><img src="/static/assets/frontend/layout/img/payments/western-union.jpg" alt="We accept Western Union" title="支持微信支付"></li>
                    <li><img src="/static/assets/frontend/layout/img/payments/american-express.jpg" alt="We accept American Express" title="支持支付宝"></li>
                </ul>
            </div>
            <!-- END PAYMENTS -->
        </div>
    </div>
</div>
<!-- END FOOTER -->

<!-- BEGIN fast view of a product -->
<div id="product-pop-up" style="display: none; width: 700px;">
    <div class="product-page product-pop-up">
        <div class="row">
            <div class="col-md-6 col-sm-6 col-xs-3">
                <div class="product-main-image">
                    <img src="/static/assets/frontend/pages/img/products/model7.jpg" alt="Cool green dress with red bell" class="img-responsive">
                </div>
                <div class="product-other-images">
                    <a href="javascript:;" class="active"><img alt="Berry Lace Dress" src="/static/assets/frontend/pages/img/products/model3.jpg"></a>
                    <a href="javascript:;"><img alt="Berry Lace Dress" src="/static/assets/frontend/pages/img/products/model4.jpg"></a>
                    <a href="javascript:;"><img alt="Berry Lace Dress" src="/static/assets/frontend/pages/img/products/model5.jpg"></a>
                </div>
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
                    <button class="btn btn-primary" type="submit">Add to cart</button>
                    <a href="shop-item.html" class="btn btn-default">More details</a>
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
<script src="/static/assets/global/plugins/respond.min.js"></script>
<![endif]-->
<script src="/static/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="/static/assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
<script src="/static/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="/static/assets/frontend/layout/scripts/back-to-top.js" type="text/javascript"></script>
<script src="/static/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->

<!-- BEGIN PAGE LEVEL JAVASCRIPTS (REQUIRED ONLY FOR CURRENT PAGE) -->
<script src="/static/assets/global/plugins/fancybox/source/jquery.fancybox.pack.js" type="text/javascript"></script><!-- pop up -->
<script src="/static/assets/global/plugins/carousel-owl-carousel/owl-carousel/owl.carousel.min.js" type="text/javascript"></script><!-- slider for products -->
<script src='/static/assets/global/plugins/zoom/jquery.zoom.min.js' type="text/javascript"></script><!-- product zoom -->
<script src="/static/assets/global/plugins/bootstrap-touchspin/bootstrap.touchspin.js" type="text/javascript"></script><!-- Quantity -->

<!-- BEGIN LayerSlider -->
<script src="/static/assets/global/plugins/slider-layer-slider/js/greensock.js" type="text/javascript"></script><!-- External libraries: GreenSock -->
<script src="/static/assets/global/plugins/slider-layer-slider/js/layerslider.transitions.js" type="text/javascript"></script><!-- LayerSlider script files -->
<script src="/static/assets/global/plugins/slider-layer-slider/js/layerslider.kreaturamedia.jquery.js" type="text/javascript"></script><!-- LayerSlider script files -->
<script src="/static/assets/frontend/pages/scripts/layerslider-init.js" type="text/javascript"></script>
<!-- END LayerSlider -->

<script src="/static/assets/frontend/layout/scripts/layout.js" type="text/javascript"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {
        Layout.init();
        Layout.initOWL();
        LayersliderInit.initLayerSlider();
        Layout.initImageZoom();
        Layout.initTouchspin();
        Layout.initTwitter();
    });
</script>
<!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
