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
    <title>结算</title>
    <!-- Fonts START -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700|PT+Sans+Narrow|Source+Sans+Pro:200,300,400,600,700,900&amp;subset=all" rel="stylesheet" type="text/css">
    <!-- Fonts END -->

    <!-- Global styles START -->
    <link href="${ctxStatic}/assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="${ctxStatic}/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Global styles END -->

    <!-- Page level plugin styles START -->
    <link href="${ctxStatic}/assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css">
    <!-- Page level plugin styles END -->

    <!-- Theme styles START -->
    <!-- Theme styles END -->
</head>
<!-- Head END -->

<!-- Body BEGIN -->
<body class="ecommerce">

<div class="main">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="/toIndex">主页</a></li>
            <li class="active">结算</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
            <!-- BEGIN CONTENT -->
            <div class="col-md-12 col-sm-12">
                <h1>结算</h1>
                <!-- BEGIN CHECKOUT PAGE -->
                <div class="panel-group checkout-page accordion scrollable" id="checkout-page">

                    <!-- BEGIN CHECKOUT -->
                    <div id="checkout" class="panel panel-default">
                        <div class="panel-heading">
                            <h2 class="panel-title">
                                <a data-toggle="collapse" data-parent="#checkout-page" href="#checkout-content" class="accordion-toggle">
                                    填写收货地址
                                </a>
                            </h2>
                        </div>
                        <div id="checkout-content" class="panel-collapse collapse in">
                            <div class="panel-body row">
                            </div>
                        </div>
                    </div>
                    <!-- END CHECKOUT -->

                    <!-- BEGIN SHIPPING METHOD -->
                    <div id="shipping-method" class="panel panel-default">
                        <div class="panel-heading">
                            <h2 class="panel-title">
                                <a data-toggle="collapse" data-parent="#checkout-page" href="#shipping-method-content" class="accordion-toggle">
                                    Step 4: Delivery Method
                                </a>
                            </h2>
                        </div>
                        <div id="shipping-method-content" class="panel-collapse collapse">
                            <div class="panel-body row">
                                <div class="col-md-12">
                                    <p>Please select the preferred shipping method to use on this order.</p>
                                    <h4>Flat Rate</h4>
                                    <div class="radio-list">
                                        <label>
                                            <input type="radio" name="FlatShippingRate" value="FlatShippingRate"> Flat Shipping Rate
                                        </label>
                                    </div>
                                    <div class="form-group">
                                        <label for="delivery-comments">Add Comments About Your Order</label>
                                        <textarea id="delivery-comments" rows="8" class="form-control"></textarea>
                                    </div>
                                    <button class="btn btn-primary  pull-right" type="submit" id="button-shipping-method" data-toggle="collapse" data-parent="#checkout-page" data-target="#payment-method-content">Continue</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- END SHIPPING METHOD -->

                    <!-- BEGIN PAYMENT METHOD -->
                    <div id="payment-method" class="panel panel-default">
                        <div class="panel-heading">
                            <h2 class="panel-title">
                                <a data-toggle="collapse" data-parent="#checkout-page" href="#payment-method-content" class="accordion-toggle">
                                    Step 5: Payment Method
                                </a>
                            </h2>
                        </div>
                        <div id="payment-method-content" class="panel-collapse collapse">
                            <div class="panel-body row">
                                <div class="col-md-12">
                                    <p>Please select the preferred payment method to use on this order.</p>
                                    <div class="radio-list">
                                        <label>
                                            <input type="radio" name="CashOnDelivery" value="CashOnDelivery"> Cash On Delivery
                                        </label>
                                    </div>
                                    <div class="form-group">
                                        <label for="delivery-payment-method">Add Comments About Your Order</label>
                                        <textarea id="delivery-payment-method" rows="8" class="form-control"></textarea>
                                    </div>
                                    <button class="btn btn-primary  pull-right" type="submit" id="button-payment-method" data-toggle="collapse" data-parent="#checkout-page" data-target="#confirm-content">Continue</button>
                                    <div class="checkbox pull-right">
                                        <label>
                                            <input type="checkbox"> I have read and agree to the <a title="Terms & Conditions" href="javascript:;">Terms & Conditions </a> &nbsp;&nbsp;&nbsp;
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- END PAYMENT METHOD -->

                    <!-- BEGIN CONFIRM -->
                    <div id="confirm" class="panel panel-default">
                        <div class="panel-heading">
                            <h2 class="panel-title">
                                <a data-toggle="collapse" data-parent="#checkout-page" href="#confirm-content" class="accordion-toggle">
                                    Step 6: Confirm Order
                                </a>
                            </h2>
                        </div>
                        <div id="confirm-content" class="panel-collapse collapse">
                            <div class="panel-body row">
                                <div class="col-md-12 clearfix">
                                    <div class="table-wrapper-responsive">
                                        <table>
                                            <tr>
                                                <th class="checkout-image">Image</th>
                                                <th class="checkout-description">Description</th>
                                                <th class="checkout-model">Model</th>
                                                <th class="checkout-quantity">Quantity</th>
                                                <th class="checkout-price">Price</th>
                                                <th class="checkout-total">Total</th>
                                            </tr>
                                            <tr>
                                                <td class="checkout-image">
                                                    <a href="javascript:;"><img src="${ctxStatic}/assets/frontend/pages/img/products/model3.jpg" alt="Berry Lace Dress"></a>
                                                </td>
                                                <td class="checkout-description">
                                                    <h3><a href="javascript:;">Cool green dress with red bell</a></h3>
                                                    <p><strong>Item 1</strong> - Color: Green; Size: S</p>
                                                    <em>More info is here</em>
                                                </td>
                                                <td class="checkout-model">RES.193</td>
                                                <td class="checkout-quantity">1</td>
                                                <td class="checkout-price"><strong><span>$</span>47.00</strong></td>
                                                <td class="checkout-total"><strong><span>$</span>47.00</strong></td>
                                            </tr>
                                            <tr>
                                                <td class="checkout-image">
                                                    <a href="javascript:;"><img src="${ctxStatic}/assets/frontend/pages/img/products/model4.jpg" alt="Berry Lace Dress"></a>
                                                </td>
                                                <td class="checkout-description">
                                                    <h3><a href="javascript:;">Cool green dress with red bell</a></h3>
                                                    <p><strong>Item 1</strong> - Color: Green; Size: S</p>
                                                    <em>More info is here</em>
                                                </td>
                                                <td class="checkout-model">RES.193</td>
                                                <td class="checkout-quantity">1</td>
                                                <td class="checkout-price"><strong><span>$</span>47.00</strong></td>
                                                <td class="checkout-total"><strong><span>$</span>47.00</strong></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="checkout-total-block">
                                        <ul>
                                            <li>
                                                <em>Sub total</em>
                                                <strong class="price"><span>$</span>47.00</strong>
                                            </li>
                                            <li>
                                                <em>Shipping cost</em>
                                                <strong class="price"><span>$</span>3.00</strong>
                                            </li>
                                            <li>
                                                <em>Eco Tax (-2.00)</em>
                                                <strong class="price"><span>$</span>3.00</strong>
                                            </li>
                                            <li>
                                                <em>VAT (17.5%)</em>
                                                <strong class="price"><span>$</span>3.00</strong>
                                            </li>
                                            <li class="checkout-total-price">
                                                <em>Total</em>
                                                <strong class="price"><span>$</span>56.00</strong>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="clearfix"></div>
                                    <button class="btn btn-primary pull-right" type="submit" id="button-confirm">Confirm Order</button>
                                    <button type="button" class="btn btn-default pull-right margin-right-20">Cancel</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- END CONFIRM -->
                </div>
                <!-- END CHECKOUT PAGE -->
            </div>
            <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->
    </div>
</div>


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

<script src="${ctxStatic}/assets/frontend/layout/scripts/layout.js" type="text/javascript"></script>
<script src="${ctxStatic}/assets/frontend/pages/scripts/checkout.js" type="text/javascript"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {
        Layout.init();
        Layout.initOWL();
        Layout.initTwitter();
        Layout.initImageZoom();
        Layout.initTouchspin();
        Layout.initUniform();
        Checkout.init();
    });
</script>
<!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
