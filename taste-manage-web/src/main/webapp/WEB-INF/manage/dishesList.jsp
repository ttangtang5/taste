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

                <li class="active">
                    <a href="javascript:;">
                        <i class="glyphicon glyphicon-chevron-right"></i>用户列表
                    </a>
                </li>
                <li class="dropdown">
                    <a href="${ctx}/manage/toRoleList">
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
                        <i class="glyphicon glyphicon-chevron-right"></i>权限列表
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
            <h2>用户列表</h2>
            <hr>
            <form method="post" action="" id="formId" class="form-inline">
                <div clss="well">
                    <div class="form-group">
                        <input type="text" class="form-control" style="width: 300px;" value="" name="findContent" id="findContent" placeholder="输入昵称 / 帐号">
                    </div>
                    <span class="">
				         	<button type="submit" class="btn btn-primary">查询</button>
                             <a class="btn btn-success" onclick="$('#addEmp').modal();">增加角色</a>
                            <button type="button" id="deleteAll" class="btn  btn-danger">删除</button>
                     </span>
                </div>
                <hr>
                <table class="table table-bordered">
                    <tbody><tr>
                        <th><input type="checkbox" id="checkAll"></th>
                        <th>员工编号</th>
                        <th>员工名称</th>
                        <th>身份证</th>
                        <th>性别</th>
                        <th>联系电话</th>
                        <th>地址</th>
                        <th>入职时间</th>
                        <th>离职时间</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach var="employee" items="${employeeList}">
                        <tr>
                            <td><input value="${employee.id}" check="box" type="checkbox"></td>
                            <td>${employee.id}</td>
                            <td>${employee.empName}</td>
                            <td>${employee.idcard}</td>
                            <td>${employee.sax}</td>
                            <td>${employee.phone}</td>
                            <td>${employee.address}</td>
                            <td>${employee.entryTimeStr}</td>
                            <td>${employee.leaveTimeStr}</td>
                            <td>
                                <c:if test="${employee.delFlag == 0}"><a href="javascript:_delete([${employee.id}]);">删除</a></c:if>
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
                    <h4 class="modal-title" id="addroleLabel">添加用户</h4>
                </div>
                <div class="modal-body">
                    <form id="boxEmpForm">
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">员工姓名:</label>
                            <input type="text" class="form-control" name="empName" id="empName" placeholder="员工姓名" required/>
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">员工密码:</label>
                            <input type="password" class="form-control" id="password" name="password"  placeholder="请输入密码  [字母 + 数字] 小于16位" required>
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">确认密码:</label>
                            <input type="password" class="form-control" id="rpassword" name="rpassword"  placeholder="请输入密码  [字母 + 数字] 小于16位" required>
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">身份证:</label>
                            <input type="text" class="form-control" id="idcard" name="idcard"  placeholder="身份证号码" required>
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">性别:</label>
                            <select name="sax" id="sax">
                            <option value="0">男</option>
                            <option value="1">女</option>
                        </select>
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">联系电话:</label>
                            <input type="text" class="form-control" id="phone" name="phone"  placeholder="联系电话" required>
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">住址:</label>
                            <input type="text" class="form-control" id="address" name="address"  placeholder="住址" required>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" onclick="addEmp();" class="btn btn-primary">保存</button>
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
                return layer.msg('请选择要删除的选项。',so.default),!0;
            }
            var array = [];
            checkeds.each(function(){
                array.push(this.value);
            });
            return _delete(array);
        });
    });
    //根据ID数组，删除
    function _delete(ids){
        var index = layer.confirm("确定这"+ ids.length +"个用户？",function(){
            var load = layer.load();
            $.post(rootPath + '/delEmp',{ids:ids.join(',')},function(result){
                layer.close(load);
                if(result && result.status != 200){
                    return layer.msg(result.message,so.default),!0;
                }else{
                    layer.msg('删除成功');
                    setTimeout(function(){
                        $('#formId').submit();
                    },1000);
                }
            },'json');
            layer.close(index);
        });
    }
    function addEmp(){
        /*if($.trim(name) == ''){
            return layer.msg('角色名称不能为空。',so.default),!1;
        }
        if(!/^[a-z0-9A-Z]{6}$/.test(type)){
            return layer.msg('角色类型为6数字字母。',so.default),!1;
        }*/
        var load = layer.load();
        $.post(rootPath + '/addEmp',$("#boxEmpForm").serialize(),function(result){
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