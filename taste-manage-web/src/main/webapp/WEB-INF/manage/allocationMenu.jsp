<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../decorators/taglib.jsp" %>
<html>
<head>
    <meta charset="utf-8" />
    <title>权限分配 - 权限管理</title>
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

                <li class="dropdown">
                    <a href="${ctx}/manage/toRoleList">
                        <i class="glyphicon glyphicon-chevron-right"></i>角色列表
                    </a>
                </li>

                <li class="dropdown">
                    <a href="${ctx}/manage/toAllocationRole" >
                        <i class="glyphicon glyphicon-chevron-right"></i>角色分配
                    </a>
                </li>

                <li class="dropdown">
                    <a href="${ctx}/manage/toMenuList">
                        <i class="glyphicon glyphicon-chevron-right"></i>权限列表
                    </a>
                </li>

                <li class="active">
                    <a href="javacript:;">
                        <i class="glyphicon glyphicon-chevron-right"></i>权限分配
                    </a>
                </li>

            </ul>
        </div>

        <div class="col-md-10">
            <h2>权限分配</h2>
            <hr>
            <form method="post" action="" id="formId" class="form-inline">
                <div clss="well">
                    <div class="form-group">
                        <input type="text" class="form-control" style="width: 300px;" value="" name="findContent" id="findContent" placeholder="输入角色名称">
                    </div>
                    <span class="">
				         	<button type="submit" class="btn btn-primary">查询</button>
				         </span>
                </div>
                <hr>
                <table class="table table-bordered">
                    <input type="hidden" id="selectRoleId" value="1">
                    <tbody><tr>
                        <th width="5%"><input type="checkbox" id="checkAll"></th>
                        <th width="10%">角色名称</th>
                        <th width="10%">角色描述</th>
                        <th width="60%">拥有的权限</th>
                        <th width="15%">操作</th>
                    </tr>
                    <c:forEach var="role" items="${lists}">
                        <tr>
                        <td><input value="${role.id}" check="box" type="checkbox"></td>
                        <td>${role.roleName}</td>
                        <td>${role.remarks}</td>
                        <td permissionids="${role.menuIds}">${role.menuNames}</td>
                        <td>
                            <i class="glyphicon glyphicon-share-alt"></i><a href="javascript:selectPermissionById(${role.id});">选择权限</a>
                        </td>
                    </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </form>
        </div>
    </div>
    <div class="modal fade bs-example-modal-sm" id="selectPermission" tabindex="-1" role="dialog" aria-labelledby="selectPermissionLabel" style="display: none;">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h4 class="modal-title" id="selectPermissionLabel">添加权限</h4>
                </div>
                <div class="modal-body">
                    <form id="boxRoleForm"><div class="checkbox"><label><input type="checkbox" selectallbox="">全选</label></div><div class="checkbox"><label><input type="checkbox" selectbox="" id="4" checked="checked" name="权限列表">权限列表</label></div><div class="checkbox"><label><input type="checkbox" selectbox="" id="6" checked="checked" name="权限添加">权限添加</label></div><div class="checkbox"><label><input type="checkbox" selectbox="" id="7" checked="checked" name="权限删除">权限删除</label></div><div class="checkbox"><label><input type="checkbox" selectbox="" id="8" checked="checked" name="用户列表">用户列表</label></div><div class="checkbox"><label><input type="checkbox" selectbox="" id="9" checked="checked" name="在线用户">在线用户</label></div><div class="checkbox"><label><input type="checkbox" selectbox="" id="10" checked="checked" name="用户Session踢出">用户Session踢出</label></div><div class="checkbox"><label><input type="checkbox" selectbox="" id="11" checked="checked" name="用户激活&amp;禁止">用户激活&amp;禁止</label></div><div class="checkbox"><label><input type="checkbox" selectbox="" id="12" checked="checked" name="用户删除">用户删除</label></div><div class="checkbox"><label><input type="checkbox" selectbox="" id="13" checked="checked" name="权限分配">权限分配</label></div><div class="checkbox"><label><input type="checkbox" selectbox="" id="14" checked="checked" name="用户角色分配清空">用户角色分配清空</label></div><div class="checkbox"><label><input type="checkbox" selectbox="" id="15" checked="checked" name="角色分配保存">角色分配保存</label></div><div class="checkbox"><label><input type="checkbox" selectbox="" id="16" checked="checked" name="角色列表删除">角色列表删除</label></div><div class="checkbox"><label><input type="checkbox" selectbox="" id="17" checked="checked" name="角色列表添加">角色列表添加</label></div><div class="checkbox"><label><input type="checkbox" selectbox="" id="18" checked="checked" name="角色列表">角色列表</label></div><div class="checkbox"><label><input type="checkbox" selectbox="" id="19" checked="checked" name="权限分配">权限分配</label></div><div class="checkbox"><label><input type="checkbox" selectbox="" id="20" checked="checked" name="角色分配">角色分配</label></div></form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" onclick="selectPermission();" class="btn btn-primary">保存</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${ctxStatic}/js/common/jquery-2.1.1.js"></script>
<script src="${ctxStatic}/js/common/layer/layer.js"></script>
<script src="${ctxStatic}/js/common/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="${ctxStatic}/js/shiro.demo.js"></script>
<script >
    so.init(function(){
        //初始化全选。
        so.checkBoxInit('#checkAll','[check=box]');
    });
    function selectPermission(){
        var checked = $("#boxRoleForm  :checked");
        var ids=[],names=[];
        $.each(checked,function(){
            ids.push(this.id);
            names.push($.trim($(this).attr('name')));
        });
        var index = layer.confirm("确定操作？",function(){
            var load = layer.load();
            $.post(rootPath + '/updatePermissionByRole',{ids:ids.join(','),roleId:$('#selectRoleId').val()},function(result){
                layer.close(load);
                if(result && result.status != 'success'){
                    return layer.msg(result.message,so.default),!1;
                }
                layer.msg('添加成功。');
                setTimeout(function(){
                    $('#formId').submit();
                },1000);
            },'json');
        });
    }
    /*
    *根据角色ID选择权限，分配权限操作。
    */
    function selectPermissionById(id){
        var load = layer.load();
        $.post(rootPath + '/showPermission',{roleId:id},function(result){
            layer.close(load);
            if(result && result.length){
                var html =[];
                html.push('<div class="checkbox"><label><input type="checkbox"  selectAllBox="">全选</label></div>');
                $.each(result,function(){
                    html.push("<div class='checkbox'><label>");
                    html.push("<input type='checkbox' selectBox='' id='");
                    html.push(this.id);
                    html.push("'");
                    console.info(this.check);
                    if(this.check == 'true'){
                        html.push(" checked='checked'");
                    }
                    html.push("name='");
                    html.push(this.name);
                    html.push("'/>");
                    html.push(this.name);
                    html.push('</label></div>');
                });
                //初始化全选。
                return so.id('boxRoleForm').html(html.join('')),
                    so.checkBoxInit('[selectAllBox]','[selectBox]'),
                    $('#selectPermission').modal(),$('#selectRoleId').val(id),!1;
            }else{
                return layer.msg('没有获取到权限数据，请先添加权限数据。',so.default);
            }
        },'json');
    }
</script>
</body>
</html>
