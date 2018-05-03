<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ include file="../decorators/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="decorator" content="default">
    <title>评价列表</title>
    <!-- Fonts START -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700|PT+Sans+Narrow|Source+Sans+Pro:200,300,400,600,700,900&amp;subset=all" rel="stylesheet" type="text/css">
    <!-- Fonts END -->
    <!-- Global styles START -->
    <link href="${ctxStatic}/assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="${ctxStatic}/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Global styles END -->
    <!-- Page level plugin styles START -->
    <link href="${ctxStatic}/assets/global/plugins/fancybox/source/jquery.fancybox.css" rel="stylesheet">
    <link href="${ctxStatic}/assets/global/plugins/carousel-owl-carousel/owl-carousel/owl.carousel.css" rel="stylesheet">
    <link href="${ctxStatic}/assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css">
    <link href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" rel="stylesheet" type="text/css"><!-- for slider-range -->
    <link href="${ctxStatic}/assets/global/plugins/rateit/src/rateit.css" rel="stylesheet" type="text/css">
    <!-- Page level plugin styles END -->

    <!-- Theme styles START -->
    <link href="${ctxStatic}/assets/global/css/components.css" rel="stylesheet">
    <link href="${ctxStatic}/assets/frontend/layout/css/style.css" rel="stylesheet">
    <link href="${ctxStatic}/assets/frontend/pages/css/style-shop.css" rel="stylesheet" type="text/css">
    <link href="${ctxStatic}/assets/frontend/layout/css/style-responsive.css" rel="stylesheet">
    <link href="${ctxStatic}/assets/frontend/layout/css/themes/red.css" rel="stylesheet" id="style-color">
    <link href="${ctxStatic}/assets/frontend/layout/css/custom.css" rel="stylesheet">
    <link href="${ctxStatic}/layui/css/layui.css" rel="stylesheet" type="text/css">
    <!-- Theme styles END -->
</head>
<!-- Head END -->

<!-- Body BEGIN -->
<body class="ecommerce">

<div class="main">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="${ctx}/toIndex">主页</a></li>
            <li class="active">评价列表</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
            <div class="sidebar col-md-3 col-sm-5">

                <div class="sidebar-products clearfix">
                    <h2>热销产品</h2>
                    <c:forEach var="hot" items="${hotList}">
                        <div class="item">
                            <a href="javascript:;"><img src="${hot.picture}" alt="Some Shoes in Animal with Cut Out"></a>
                            <h3><a href="${ctx}/search?word=${hot.dishesName}">${hot.dishesName}</a></h3>
                            <div class="price">￥${hot.dishesPrice}</div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <!-- BEGIN CONTENT -->
            <div class="col-md-9 col-sm-7">
                <div class="product-page">
                    <div class="row">

                        <div class="product-page-content">
                            <ul id="myTab" class="nav nav-tabs">
                                <li class="active"><a href="#Reviews" data-toggle="tab">评价 (${totalPages})</a></li>
                            </ul>
                            <div id="myTabContent" class="tab-content">
                                <div class="tab-pane fade in active" id="Reviews">
                                    <!--<p>There are no reviews for this product.</p>-->
                                    <c:forEach var="rate" items="${rateList}">
                                        <div class="review-item clearfix">
                                            <div class="review-item-submitted">
                                                <strong>${rate.userName}****</strong>
                                                <em>${rate.createTimeStr}</em>
                                                <div class="rateit" data-rateit-value="${rate.rateLevel}" data-rateit-ispreset="true" data-rateit-readonly="trrateContentue"></div>
                                            </div>
                                            <div class="review-item-content">
                                                <p>${rate.rateContent}</p>
                                            </div>
                                            <div class="review-item-content">
                                                <c:forEach var="picture" items="${rate.ratePictureArr}">
                                                    <a href="${picture}" class="fancybox-button" rel="photos-lib">
                                                        <img src="${picture}" width="20%"/>
                                                    </a>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>

                        <div class="sticker sticker-sale"></div>
                    </div>
                    <!-- BEGIN PAGINATOR -->
                    <div class="row">
                        <div class="col-md-4 col-sm-4 items-info"> 总计 ${totalPages} 条</div>
                        <div class="col-md-8 col-sm-8" id="pagination" style="left: 300px">
                        </div>
                    </div>
                    <!-- END PAGINATOR -->
                </div>
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
<script src="${ctxStatic}/assets/global/plugins/rateit/src/jquery.rateit.js" type="text/javascript"></script>

<script src="${ctxStatic}/assets/frontend/layout/scripts/layout.js" type="text/javascript"></script>
<script src="${ctxStatic}/layui/layui.js" type="text/javascript"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {
        Layout.init();
        Layout.initOWL();
        Layout.initTouchspin();
        Layout.initUniform();
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