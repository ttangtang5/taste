<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../decorators/taglib.jsp"%>
<html>
<head>
    <title>点菜</title>
    <link href="${ctxStatic}/js/common/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${ctxStatic}/css/common/base.css" rel="stylesheet"/>
    <link href="${ctxStatic}/js/common/layer/skin/layer.css" rel="stylesheet"/>
    <link href="${ctxStatic}/layui/css/modules/layer/default/layer.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${ctxStatic}/css/selectpage.css" type="text/css">
</head>
<body>
<div class="container" style="padding-bottom: 15px;min-height: 300px; margin-top: -28px;">
    <div class="row">
        <div id="one" class="col-md-2">
            <ul data-spy="affix" class="nav nav-list nav-tabs nav-stacked bs-docs-sidenav dropdown affix" style="top: 100px; z-index: 100;">
                <li class="dropdown active">
                    <a href="javascript:;" onclick="getDate(1)">
                        <i class="glyphicon glyphicon-chevron-right"></i>菜品
                    </a>
                </li>
                <li class="dropdown">
                    <a href="javascript:;" onclick="getDate(2)">
                        <i class="glyphicon glyphicon-chevron-right"></i>粥、粉
                    </a>
                </li>
                <li class="dropdown">
                    <a href="javascript:;" onclick="getDate(3)">
                        <i class="glyphicon glyphicon-chevron-right"></i>饮料
                    </a>
                </li>
                <li class="dropdown">
                    <a href="javascript:;" onclick="getDate(4)">
                        <i class="glyphicon glyphicon-chevron-right"></i>其他
                    </a>
                </li>
            </ul>
        </div>
        <div class="col-md-10">
            <div class="col-md-6">
                <h2>菜品信息</h2>
                <hr>
                <div id="select">
                    <input type="text" id="selectPage" class="form-control" value="" placeholder="请输入查询关键字" >
                </div>
            </div>
            <div class="col-md-6">
                <h2>订单信息</h2>
                <span>用餐人数：</span>
                <input type="text" id="person">
                <input class="btn btn-success" type="button" value="保存订单" onclick="save()">
                <hr>
                <table id="orderTable">
                    <tr>
                        <td class="col-md-1">总计：</td>
                        <td class="col-md-2" id="total"></td>
                        <td class="col-md-2">总数量：</td>
                        <td class="col-md-2" id="count"></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>
<script  src="${ctxStatic}/js/common/jquery-2.1.1.js"></script>
<script  src="${ctxStatic}/js/common/layer/layer.js"></script>
<script  src="${ctxStatic}/js/common/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script  src="${ctxStatic}/layui/layui.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/selectpage.min.js" ></script>
<script>

    var tableId = '${tableId}';
    $(function(){
        getDate(1);
    });

    /**
     * 初始化下拉框
     * @param id
     */
    function getDate(id){
        $(".active").removeClass("active");
        var target = event.target;
        $(target).parent().addClass("active");
        $("#select").html("");
        $("#select").html("<input type=\"text\" id=\"selectPage\" onchange='' class=\"form-control\" value=\"\" placeholder=\"请输入查询关键字\" >");
        /**
         * 下拉框选中事件
         */
        $("#selectPage").change(function(){
            var target = event.target;
            var str = $(target)[0].innerHTML;
            if(str != '' && str.indexOf("i") == -1){
                var html = '<tr>' +
                    '<td class="col-md-3"><span class="name">'+str+'</span></td>' +
                    '<td class="col-md-1"><input type="number" value="1" style="width: 50px" onchange="num()"></td>' +
                    '<td class="col-md-1"><span class="count">'+str.split("---")[1]+'</span></td>' +
                    '<td class="col-md-1"><input type="button" class="btn btn-danger" onclick="del()" value="移除"></td>' +
                    '</tr>';
                $("#orderTable").append(html);
                var table = $("#orderTable").find(".count");
                var table2 = $("#orderTable").find("input");
                var total = 0;
                var count;
                var num;
                var sumNum = 0;
                for(var i = 0;i < table.length; i++){
                    count = table[i].innerHTML;
                    total = Number(count) + Number(total);
                }
                $("#total").html(total);
                for(var i = 0;i < table2.length; i++){
                    num = table2[i].value;
                    sumNum = Number(num) + Number(sumNum);
                    i++;
                }
                $("#count").html(sumNum);
            }
        });
        $.ajax({
            type : 'post',
            url : rootPath+'/dishes/getDishesByCategory',
            dataType : 'json',
            data : {
                categoryId : id
            },
            success : function(data){
                $('#selectPage').selectPage({
                    showField : 'desc',
                    keyField : 'id',
                    data : data,
                    //多查询条件之间的“与”“或”关系
                    andOr : 'OR',
                    //设置结果集排序，若只指定字段，不指定排序方式，则默认使用asc升序模式
                    //排序字段若不指定，则默认对showField指定的列进行升序排列
                    //若需要多字段排序，则设置['id desc','name']
                    //当前案例设置了使用id字段的内容进行降序排序
                    orderBy : ['id desc'],
                    //启用多选模式
                    multiple : true
                });
            }
        });
    }



    /**
     * 修改总计
     */
   function num(){
       var target = event.target;
       var num = $(target).val();
       var pirce = $(target).parent().parent().children()[0].innerHTML.split("---")[1];
       var count = Number(pirce)*Number(num);
       $(target).parent().parent().children()[2].innerHTML = '<span class="count">'+count+'</span>';
        var table = $("#orderTable").find(".count");
        var table2 = $("#orderTable").find("input");
        var total = 0;
        var sumNum = 0;
        for(var i = 0;i < table.length; i++){
            count = table[i].innerHTML;
            total = Number(count) + Number(total);

        }
        $("#total").html(total);
        for(var i = 0;i < table2.length; i++){
            num = table2[i].value;
            sumNum = Number(num) + Number(sumNum);
            i++;
        }
        $("#count").html(sumNum);

    };

    /**
     * 移除
     */
   function del(){
       var target = event.target;
       var i = $(target).parent().parent().find("input")[0].value;
       var j = $(target).parent().parent().find(".count")[0].innerHTML;
        $("#count").html(Number($("#count").html()) - Number(i));
        $("#total").html(Number($("#total").html()) - Number(j));
       $(target).parent().parent().remove();
   }

    /**
     * 保存
     */
   function save(){
        var name = $("#orderTable").find(".name");
        var input = $("#orderTable").find("input");
        var names = new Array();
        var inputs = new Array();
        for(var i = 0; i < name.length; i++){
            names[i] = name[i].innerHTML;
        }
        var j = 0;
        for(var i = 0; i < input.length; i++){
            inputs[j] = input[i].value;
            i++;
            j++;
        }
        var count = $("#count").html();
        var total = $("#total").html();

        $.ajax({
            type : 'post',
            url : rootPath + '/order/saveOrder',
            traditional : 'true',
            data : {
                tableId : tableId,
                dishesNames : names,
                dishesNums : inputs,
                num : count,
                total : total
            },
            success : function(data){
                if(data == 'success'){
                    layer.msg('订单成功');
                }
            }
        });
    }
</script>
</body>
</html>
