<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../decorators/taglib.jsp" %>
<html>
<head>
    <meta charset="utf-8" />
    <title>内容列表 - 餐厅管理</title>
    <meta name="decorator" content="default">
    <link href="${ctxStatic}/js/common/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${ctxStatic}/css/common/base.css" rel="stylesheet"/>
</head>
<body data-target="#one" data-spy="scroll">
<div class="container" style="padding-bottom: 15px;min-height: 300px; margin-top: 40px;">
    <div class="row">
        <div id="one" class="col-md-2">
            <ul data-spy="affix" class="nav nav-list nav-tabs nav-stacked bs-docs-sidenav dropdown affix" style="top: 100px; z-index: 100;">
                <li class="active">
                    <a href="javascript:;">
                        <i class="glyphicon glyphicon-chevron-right"></i>首页内容
                    </a>
                </li>
            </ul>
        </div>
        <div class="col-md-10">
            <h2>首页内容</h2>
            <hr>
                <hr>
                <table class="table table-bordered">
                    <tbody><tr>
                        <th>内容类目</th>
                        <th>内容标题</th>
                        <th>图片</th>
                        <th>关联内容</th>
                        <th>更新时间</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach var="dishes" items="${dishesList}">
                        <tr>
                            <td>${dishes.dishesName}</td>
                            <td>${dishes.dishesPrice}</td>
                            <td>${dishes.dishesTypeName}</td>
                            <td><img src="${ctxStatic}${dishes.picture}" width="50px" height="50px"></td>
                            <td>${dishes.desc}</td>
                            <td>
                                <a href="javascript:_delete([${dishes.id}]);">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody></table>
        </div>
    </div>
    <div class="modal fade" id="alertContent" tabindex="-1" role="dialog" aria-labelledby="addroleLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="addroleLabel">修改</h4>
                </div>
                <div class="modal-body">
                    <form id="boxContentForm" enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">图片:</label>
                            <div class="layui-upload">
                                <input type="file" name="file" id="test8">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">关联内容:</label>
                            <input type="text" class="form-control" id="desc" name="desc"  placeholder="关联内容" required>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" id="save" onclick="alertContent();" class="btn btn-primary">保存</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${ctxStatic}/js/common/jquery-2.1.1.js"></script>
<script src="${ctxStatic}/js/common/layer/layer.js"></script>
<script src="${ctxStatic}/js/common/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="${ctxStatic}/js/shiro.demo.js"></script>
<script src="${ctxStatic}/layui/layui.all.js"></script>
<script >
    function addDishes(){
        /*if($.trim(name) == ''){
            return layer.msg('角色名称不能为空。',so.default),!1;
        }
        if(!/^[a-z0-9A-Z]{6}$/.test(type)){
            return layer.msg('角色类型为6数字字母。',so.default),!1;
        }*/
        var load = layer.load();
        $.post(rootPath + '/dishes/addDishes',$("#boxDishesForm").serialize(),function(result){
            layer.close(load);
            if(result.status != 'success'){
                return layer.msg(result.message,so.default),!1;
            }
            layer.msg('添加成功。');
            setTimeout(function(){
                $('#formId').submit();
            },1000);
        },'json');
    }
    layui.use('upload', function() {
            var $ = layui.jquery
                ,upload = layui.upload;
            upload.render({
                 elem: '#test8'
                , url: rootPath + '/dishes/uploadFile'
                , done: function (res) {
                    if(res == '200'){

                    }
                }
            });
    });
</script>
</body>
</html>