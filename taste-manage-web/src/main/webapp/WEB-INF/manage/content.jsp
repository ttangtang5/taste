<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../decorators/taglib.jsp" %>
<html>
<head>
    <meta charset="utf-8" />
    <title>内容列表 - 餐厅管理</title>
    <meta name="decorator" content="default">
    <link href="${ctxStatic}/js/common/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${ctxStatic}/css/common/base.css" rel="stylesheet"/>
    <link href="${ctxStatic}/layui/css/layui.css" rel="stylesheet" type="text/css">
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
                        <th>操作</th>
                    </tr>
                    <c:forEach var="content" items="${contentList}">
                        <tr>
                            <td>${content.categoryStr}</td>
                            <td>${content.title}</td>
                            <td><img src="${content.picture}" width="50px" height="50px"></td>
                            <td>${content.content}</td>
                            <td>
                                <a  href="javascript:updateContent(${content.id});">修改</a>
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
                            <button type="button" class="layui-btn" id="test2">图片上传</button>
                            <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
                                预览图：
                                <div class="layui-upload-list" id="demo2"></div>
                            </blockquote>
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">关联内容:</label>
                            <select id="dishes">
                                <option value="0">无</option>
                            </select>
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

    var contentId;

    function updateContent(id) {
        contentId = id;
        $.ajax({
            type : 'post',
            url : rootPath +  '/content/getDishes',
            dataType : 'json',
            success : function(msg){
                for(var i = 1; i < msg.length; i++){
                    var html = '<option value="'+msg[i].id+'">'+msg[i].dishesName+'</option>';
                    $("#dishes").append(html);
                }
            }
        });
        $("#alertContent").modal("show");
    }
    function alertContent(){
        var load = layer.load();
        $.post(rootPath + '/content/saveContent',{id : contentId,dishesId : $("#dishes").val()},function(result){
            layer.close(load);
            if(result.status != '200'){
                return layer.msg(result.message,so.default),!1;
            }
            layer.msg('修改成功。');
            setTimeout(function(){
                location.reload();
            },1000);
        },'json');
    }
    layui.use('upload', function() {
        var $ = layui.jquery
            ,upload = layui.upload;
        upload.render({
            elem: '#test2'
            ,url: rootPath + '/dishes/uploadFile'
            ,multiple: true
            ,before: function(obj){
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    $('#demo2').append('<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img" style="width: 20%" >')
                });
            }
            ,done: function(res){
                //上传完毕
            }
        });
    });
</script>
</body>
</html>