<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../decorators/taglib.jsp" %>
<html>
<head>
    <title>Title</title>
    <meta charset="utf-8">
    <meta name="decorator" content="default">
</head>
<body>
<div class="container" style="padding-bottom: 15px;min-height: 300px; margin-top: 40px;">
    <div class="row">
        <div id="one" class="col-md-2">
            <ul data-spy="affix" class="nav nav-list nav-tabs nav-stacked bs-docs-sidenav dropdown affix" style="top: 100px; z-index: 100;">

                <li class="active">
                    <a href="/role/index.shtml">
                        <i class="glyphicon glyphicon-chevron-right"></i>角色列表
                    </a>
                </li>
                <li class="  dropdown">
                    <a href="/role/allocation.shtml">
                        <i class="glyphicon glyphicon-chevron-right"></i>角色分配（这是个JSP页面）
                    </a>
                </li>
                <li class="  dropdown">
                    <a href="/permission/index.shtml">
                        <i class="glyphicon glyphicon-chevron-right"></i>权限列表
                    </a>
                </li>
                <li class="  dropdown">
                    <a href="/permission/allocation.shtml">
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
                        <input type="text" class="form-control" style="width: 300px;" value="" name="findContent" id="findContent" placeholder="输入角色类型 / 角色名称">
                    </div>
                    <span class="">
				         	<button type="submit" class="btn btn-primary">查询</button>
				         		<a class="btn btn-success" onclick="$('#addrole').modal();">增加角色</a>
				         		<button type="button" id="deleteAll" class="btn  btn-danger">Delete</button>
				         </span>
                </div>
                <hr>
                <table class="table table-bordered">
                    <tbody><tr>
                        <th><input type="checkbox" id="checkAll"></th>
                        <th>角色名称</th>
                        <th>角色类型</th>
                        <th>操作</th>
                    </tr>
                    <tr>
                        <td><input value="1" check="box" type="checkbox"></td>
                        <td>系统管理员</td>
                        <td>888888</td>
                        <td>
                            -
                        </td>
                    </tr>
                    <tr>
                        <td><input value="3" check="box" type="checkbox"></td>
                        <td>权限角色</td>
                        <td>100003</td>
                        <td>
                            <i class="glyphicon glyphicon-remove"></i><a href="javascript:deleteById([3]);">删除</a>
                        </td>
                    </tr>
                    <tr>
                        <td><input value="4" check="box" type="checkbox"></td>
                        <td>用户中心</td>
                        <td>100002</td>
                        <td>
                            <i class="glyphicon glyphicon-remove"></i><a href="javascript:deleteById([4]);">删除</a>
                        </td>
                    </tr>
                    </tbody></table>
                <div class="pagination pull-right">
                    <ul class="pagination"><li class="active"><a href="javascript:void(0);">1</a></li></ul><script>	function _submitform(pageNo){		$("#formId").append($("<input type='hidden' value='" + pageNo +"' name='pageNo'>")).submit();	}</script>
                </div>
            </form>
        </div>
    </div>

    <div class="modal fade" id="addrole" tabindex="-1" role="dialog" aria-labelledby="addroleLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h4 class="modal-title" id="addroleLabel">添加角色</h4>
                </div>
                <div class="modal-body">
                    <form id="boxRoleForm">
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">角色名称:</label>
                            <input type="text" class="form-control" name="name" id="name" placeholder="请输入角色名称">
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">角色类型:</label>
                            <input type="text" class="form-control" id="type" name="type" placeholder="请输入角色类型  [字母 + 数字] 6位">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" onclick="addRole();" class="btn btn-primary">Save</button>
                </div>
            </div>
        </div>
    </div>

</div>
</body>
</html>
