<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../decorators/taglib.jsp" %>
<%--添加shiro的标签--%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
<head>
    <title>统计</title>
    <meta charset="utf-8">
    <meta name="decorator" content="default">
</head>
<body>
<div class="container" style="padding-bottom: 15px;min-height: 300px; margin-top: 40px;">
    <div class="row">
        <div id="one" class="col-md-2">
            <ul data-spy="affix" class="nav nav-list nav-tabs nav-stacked bs-docs-sidenav dropdown affix" style="top: 100px; z-index: 100;">
                <li class="active">
                    <a href="javascript:;">
                        <i class="glyphicon glyphicon-chevron-right"></i>销售统计
                    </a>
                </li>
            </ul>
        </div>
        <div class="col-md-10">
            <h2>销售统计</h2>
            <hr>
            <div id="main" style="width:600px; height: 400px;"></div>
        </div>
    </div>
</div>
<script  src="${ctxStatic}/js/common/jquery-2.1.1.js"></script>
<script  src="${ctxStatic}/js/echarts.js"></script>
<script>
    $(function(){
        $.ajax({
            type : 'post',
            url : rootPath + '/order/getReport',
            dataType : 'json',
            success : function(msg){
                // 基于准备好的dom，初始化echarts实例
                var myChart = echarts.init(document.getElementById('main'));
                // 指定图表的配置项和数据
                var option = {
                    title: {
                        text: '销售额柱状图'
                    },
                    tooltip: {},
                    legend: {
                        data:['销售额']
                    },
                    xAxis: {
                        data: ["线上","线下"]
                    },
                    yAxis: {},
                    series: [{
                        name: '销量',
                        type: 'bar',
                        data: msg
                    }]
                };
                // 使用刚指定的配置项和数据显示图表。
                myChart.setOption(option);
            }
        });
    });
</script>
</body>
</html>
