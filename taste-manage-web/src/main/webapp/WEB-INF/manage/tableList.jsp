<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../decorators/taglib.jsp" %>
<html>
<head>
    <meta charset="utf-8" />
    <title>菜品列表 - 餐厅管理</title>
    <meta name="decorator" content="default">
    <link href="${ctxStatic}/js/common/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${ctxStatic}/css/common/base.css" rel="stylesheet"/>
</head>
<body data-target="#one" data-spy="scroll">
<div class="container" style="padding-bottom: 15px;min-height: 300px; margin-top: 40px;">
    <div class="row">
        <div id="one" class="col-md-2">
            <ul data-spy="affix" class="nav nav-list nav-tabs nav-stacked bs-docs-sidenav dropdown affix" style="top: 100px; z-index: 100;">

                <li class="dorpdown">
                    <a href="${ctx}/manage/toDishesManage">
                        <i class="glyphicon glyphicon-chevron-right"></i>菜品列表
                    </a>
                </li>
                <li class="active">
                    <a href="javascript:;">
                        <i class="glyphicon glyphicon-chevron-right"></i>餐桌列表
                    </a>
                </li>
                <li class="dropdown">
                    <a href="${ctx}/manage/toStuffManage">
                        <i class="glyphicon glyphicon-chevron-right"></i>物品列表
                    </a>
                </li>
            </ul>
        </div>
        <div class="col-md-10">
            <h2>餐桌列表</h2>
            <hr>
            <form method="post" action="" id="formId" class="form-inline">
                <div clss="well">
                    <div class="form-group">
                        <input type="number" class="form-control" style="width: 300px;" value="" name="findContent" id="findContent" placeholder="输入餐桌编号">
                    </div>
                    <span class="">
				         	<button type="submit" class="btn btn-primary">查询</button>
                             <a class="btn btn-success" onclick="$('#addEmp').modal();">增加餐桌</a>
                            <button type="button" id="deleteAll" class="btn  btn-danger">删除</button>
                     </span>
                </div>
                <hr>
                <table class="table table-bordered">
                    <tbody><tr>
                        <th><input  type="checkbox" id="checkAll"></th>
                        <th>编号</th>
                        <th>容纳量</th>
                        <th>状态</th>
                        <th>描述</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach var="tables" items="${tablesList}">
                        <tr>
                            <td><input value="${tables.id}" check="box" type="checkbox"></td>
                            <th>${tables.id}</th>
                            <td>${tables.capcity}</td>
                            <td>${tables.statusStr}</td>
                            <td>${tables.desc}</td>
                            <td>
                                <a href="javascript:_alert(${tables.id});">修改状态</a>
                                <a href="javascript:_delete([${tables.id}]);">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody></table>
            </form>
        </div>
    </div>
    <div class="modal fade" id="addEmp" tabindex="-1" role="dialog" aria-labelledby="addroleLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="addroleLabel">添加餐桌</h4>
                </div>
                <div class="modal-body">
                    <form id="boxTablesForm" enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">容纳量:</label>
                            <input type="text" class="form-control" name="capcity" id="capcity" placeholder="容纳量" required/>
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">描述:</label>
                            <input type="text" class="form-control" id="desc" name="desc"  placeholder="描述" required>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" id="save" onclick="addTables();" class="btn btn-primary">保存</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="alert" tabindex="-1" role="dialog" aria-labelledby="addroleLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="addAlertLabel">修改餐桌状态</h4>
                </div>
                <div class="modal-body">
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">状态:</label>
                            <select id="status" name="status">
                                <option value="0">可使用</option>
                                <option value="1">已使用</option>
                                <option value="2">未使用</option>
                            </select>
                        </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" id="alertSave" onclick="_status()"  class="btn btn-primary">保存</button>
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
    so.init(function(){
        //初始化全选。
        so.checkBoxInit('#checkAll','[check=box]');
        //全选
        so.id('deleteAll').on('click',function(){
            var checkeds = $('[check=box]:checked');
            if(!checkeds.length){
                return layer.msg('请选择要删除的选项。',so.default),!0;
            }
            var array = [];
            checkeds.each(function(){
                array.push(this.value);
            });
            return _delete(array);
        });
    });
    var varId;
    function _alert(id){
        varId = id;
        $("#alert").modal("show");
    }
    //根据ID数组，删除
    function _delete(ids){
            var load = layer.load();
            $.post(rootPath + '/tables/delTableByIds',{ids:ids.join(',')},function(result){
                layer.close(load);
                if(result && result.status != 'success'){
                    return layer.msg(result.message,so.default),!0;
                }else{
                    layer.msg('删除成功');
                    setTimeout(function(){
                        $('#formId').submit();
                    },1000);
                }
            },'json');
            layer.close(index);

    }

    //修改状态
    function _status(){
        var load = layer.load();
        $.post(rootPath + '/tables/alertTables',{id:varId,status:$("#status").val()},function(result){
            layer.close(load);
            if(result && result.status != 'success'){
                return layer.msg(result.message,so.default),!0;
            }else{
                layer.msg('修改成功');
                setTimeout(function(){
                    $('#formId').submit();
                },1000);
            }
        },'json');
        layer.close(index);
    }

    function addTables(){
        /*if($.trim(name) == ''){
            return layer.msg('角色名称不能为空。',so.default),!1;
        }
        if(!/^[a-z0-9A-Z]{6}$/.test(type)){
            return layer.msg('角色类型为6数字字母。',so.default),!1;
        }*/
        var load = layer.load();
        $.post(rootPath + '/tables/addTables',$("#boxTablesForm").serialize(),function(result){
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
</script>
</body>
</html>