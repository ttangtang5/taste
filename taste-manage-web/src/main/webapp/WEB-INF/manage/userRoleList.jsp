<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../decorators/taglib.jsp" %>
<html>
<head>
    <meta charset="utf-8" />
    <title>角色列表 - 权限管理</title>
    <meta name="decorator" content="default">
    <link href="${ctxStatic}/js/common/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${ctxStatic}/css/common/base.css" rel="stylesheet"/>
</head>
<body data-target="#one" data-spy="scroll">
<div class="container" style="padding-bottom: 15px;min-height: 300px; margin-top: 40px;">
    <div class="row">
        <div id="one" class="col-md-2">
            <ul data-spy="affix" class="nav nav-list nav-tabs nav-stacked bs-docs-sidenav dropdown affix" style="top: 100px; z-index: 100;">

                <li class="dropdown">
                    <a href="${ctx}/manage/toUserMange">
                        <i class="glyphicon glyphicon-chevron-right"></i>用户列表
                    </a>
                </li>
                <li class="active">
                    <a href="javacript:;">
                        <i class="glyphicon glyphicon-chevron-right"></i>角色列表
                    </a>
                </li>
                <li class="dropdown">
                    <a href="${ctx}/manage/toAllocationRole">
                        <i class="glyphicon glyphicon-chevron-right"></i>角色分配
                    </a>
                </li>
                <li class="dropdown">
                    <a href="${ctx}/manage/toMenuList">
                        <i class="glyphicon glyphicon-chevron-right"></i>菜单列表
                    </a>
                </li>
                <li class="  dropdown">
                    <a href="${ctx}/manage/toAllocationMenu">
                        <i class="glyphicon glyphicon-chevron-right"></i>权限分配
                    </a>
                </li>
            </ul>
        </div>
        <div class="col-md-10">
            <h2>角色列表</h2>
            <hr>
            <form method="post" action="" id="formId" class="form-inline">
                <div clss="well">
                    <div class="form-group">
                        <input type="text" class="form-control" style="width: 300px;" value=""
                               name="findContent" id="findContent" placeholder="输入角色名称 / 角色标识">
                    </div>
                    <span class="">
                        <button type="submit" class="btn btn-primary">查询</button>
                        <a class="btn btn-success" onclick="$('#addrole').modal();">增加角色</a>
                        <button type="button" id="deleteAll" class="btn  btn-danger">删除</button>
                     </span>
                </div>
                <hr>
                <table class="table table-bordered">
                    <tr>
                        <th><input type="checkbox" id="checkAll"/></th>
                        <th>角色名称</th>
                        <th>角色标识</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach var="role" items="${RoleList}">
                        <tr>
                            <td><input value="${role.id}" check='box' type="checkbox" /></td>
                            <td>${role.roleName}</td>
                            <td>${role.remarks}</td>
                            <td>
                              <i class="glyphicon glyphicon-remove"></i><a href="javascript:deleteById([${role.id}]);">删除</a>
                            </td>
                        </tr>
                    </c:forEach>

                </table>
            </form>
        </div>
    </div>
    <div class="modal fade" id="addrole" tabindex="-1" role="dialog" aria-labelledby="addroleLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="addroleLabel">添加角色</h4>
                </div>
                <div class="modal-body">
                    <form id="boxRoleForm">
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">角色名称:</label>
                            <input type="text" class="form-control" name="roleName" id="name" placeholder="请输入角色名称" required="required"/>
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">角色标识:</label>
                            <input type="text" class="form-control" id="type" name="remarks"  placeholder="请输入角色标识" required="required">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" onclick="addRole();" class="btn btn-primary">保存</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script  src="${ctxStatic}/js/common/jquery-2.1.1.js"></script>
<script  src="${ctxStatic}/js/common/layer/layer.js"></script>
<script  src="${ctxStatic}/js/common/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script  src="${ctxStatic}/js/shiro.demo.js"></script>
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
            return deleteById(array);
        });
    });
    function deleteById(ids){
        var index = layer.confirm("确定删除？",function(){
            var load = layer.load();
            $.post(rootPath + '/delRole',{ids:ids.join(',')},function(result){
                layer.close(load);
                if(result && result.status != 'success'){
                    return layer.msg(result.message,so.default),!0;
                }else{
                    layer.msg(result.resultMsg);
                    setTimeout(function(){
                        $('#formId').submit();
                    },1000);
                }
            },'json');
            layer.close(index);
        });
    }
    function addRole(){
        var load = layer.load();
        $.post(rootPath + '/addRole',$("#boxRoleForm").serialize(),function(result){
            layer.close(load);
            if(result && result.status != 'success'){
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