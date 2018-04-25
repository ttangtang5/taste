<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../decorators/taglib.jsp" %>
<html>
<head>
    <meta charset="utf-8" />
    <title>角色分配列表 - 权限管理</title>
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

                <li class="active dropdown">
                    <a href="javascript:;" >
                        <i class="glyphicon glyphicon-chevron-right"></i>角色分配
                    </a>
                </li>


                <li class=" dropdown">
                    <a href="${ctx}/manage/toMenuList">
                        <i class="glyphicon glyphicon-chevron-right"></i>权限列表
                    </a>
                </li>


                <li class="dropdown">
                    <a href="${ctx}/manage/toAllocationMenu">
                        <i class="glyphicon glyphicon-chevron-right"></i>权限分配
                    </a>
                </li>

            </ul>
        </div>

        <div class="col-md-10">
            <h2>用户角色分配</h2>
            <hr>
            <form method="post" action="" id="formId" class="form-inline">
                <div clss="well">
                    <div class="form-group">
                        <input type="text" class="form-control" style="width: 300px;" value=""
                               name="findContent" id="findContent" placeholder="输入用户昵称 / 用户帐号">
                    </div>
                    <span class="">
				         	<button type="submit" class="btn btn-primary">查询</button>

				         		<button type="button" id="deleteAll" class="btn  btn-danger">清空用户角色</button>

				         </span>
                </div>
                <hr>
                <table class="table table-bordered">
                    <input type="hidden" id="selectUserId">
                    <tr>
                        <th width="5%"><input type="checkbox" id="checkAll"/></th>
                        <th width="10%">员工姓名</th>
                        <th width="10%">联系电话</th>
                        <th width="55%">拥有的角色</th>
                        <th width="10%">操作</th>
                    </tr>
                    <c:forEach var="employee" items="${employeeList}">
                        <tr>
                            <td><input value="${employee.id}" check='box' type="checkbox" /></td>
                            <td>${employee.empName}</td>
                            <td>${employee.phone}</td>
                            <td roleIds="${employee.roleId}">${employee.roleStr}</td>
                            <td>
                                <i class="glyphicon glyphicon-share-alt"></i><a href="javascript:selectRoleById(${employee.id});">选择角色</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </form>
        </div>
    </div>


    <div class="modal fade bs-example-modal-sm"  id="selectRole" tabindex="-1" role="dialog" aria-labelledby="selectRoleLabel">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="selectRoleLabel">添加角色</h4>
                </div>
                <div class="modal-body">
                    <form id="boxRoleForm">
                        loading...
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" onclick="selectRole();" class="btn btn-primary">保存</button>
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

        //全选
        so.id('deleteAll').on('click',function(){
            var checkeds = $('[check=box]:checked');
            if(!checkeds.length){
                return layer.msg('请选择要清除的用户。',so.default),!0;
            }
            var array = [];
            checkeds.each(function(){
                array.push(this.value);
            });
            return deleteById(array);
        });

    });


    function deleteById(ids){
        var index = layer.confirm("确定清除这"+ ids.length +"个用户的角色？",function(){
            var load = layer.load();
            $.post(rootPath + '/delEmpRole',{empIds:ids.join(',')},function(result){
                layer.close(load);
                if(result && result.status != 'success'){
                    return layer.msg(result.message,so.default),!0;
                }else{
                    layer.msg(result.message);
                    setTimeout(function(){
                        $('#formId').submit();
                    },1000);
                }
            },'json');
            layer.close(index);
        });
    }



    function selectRole(){
        var checked = $("#boxRoleForm  :checked");
        var ids=[],names=[];
        $.each(checked,function(){
            ids.push(this.id);
            names.push($.trim($(this).attr('name')));
        });
        var index = layer.confirm("确定操作？",function(){

            var load = layer.load();
            $.post(rootPath + '/updateRole',{ids:ids.join(','),empId:$('#selectUserId').val()},function(result){
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
    function selectRoleById(id){
        var load = layer.load();
        $.post(rootPath + "/selectRoleByUserId",{empId:id},function(result){
            layer.close(load);
            if(result && result.length){
                var html =[];
                $.each(result,function(){
                    html.push("<div class='checkbox'><label>");
                    html.push("<input type='checkbox' id='");
                    html.push(this.id);
                    html.push("'");
                    if(this.check){
                        html.push(" checked='checked'");
                    }
                    html.push("name='");
                    html.push(this.roleName);
                    html.push("'/>");
                    html.push(this.roleName);
                    html.push('</label></div>');
                });
                return so.id('boxRoleForm').html(html.join('')) & $('#selectRole').modal(),$('#selectUserId').val(id),!1;
            }else{
                return layer.msg(result.message,so.default);
            }
        },'json');
    }

</script>
</body>
</html>
