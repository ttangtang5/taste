<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../decorators/taglib.jsp" %>
<html>
<head>
    <title>Title</title>
    <meta charset="utf-8">
    <meta name="decorator" content="default">
    <link rel="${ctxStatic}/js/bootstrap-table.css">
</head>
<body>
<div class="container" style="padding-bottom: 15px;min-height: 300px; margin-top: 40px;">
    <div class="row">
        <div id="one" class="col-md-2">
            <ul data-spy="affix" class="nav nav-list nav-tabs nav-stacked bs-docs-sidenav dropdown affix" style="top: 100px; z-index: 100;">
                <li class="dropdown">
                    <a href="${ctx}/manage/toIndex">
                        <i class="glyphicon glyphicon-chevron-right"></i>点餐
                    </a>
                </li>
                <li class="dropdown">
                    <a href="${ctx}/manage/toOrderCheck">
                        <i class="glyphicon glyphicon-chevron-right"></i>外卖接单
                    </a>
                </li>
                <li class="dropdown  active">
                    <a href="javascript:;">
                        <i class="glyphicon glyphicon-chevron-right"></i>预订
                    </a>
                </li>
            </ul>
        </div>
        <div class="col-md-10">
            <h2>预订信息</h2>
            <hr>
            <table id="orderTable" class="table table-hover table-bordered table-striped"
                   data-classes="table-no-bordered"
                   data-toggle="table"
                   data-cache="true"
                   data-url="${ctx}/order/getBookingList"
                   data-pagination="true"
                   data-tool-bar="#toolbar">
                <thead>
                <tr>
                    <th data-field="id" >编号</th>
                    <th data-field="phone" >联系方式</th>
                    <th data-field="timeStr" >用餐时间</th>
                    <th data-field="num" >人数</th>
                    <th data-field="tableId">餐桌编号</th>
                    <th data-field="remark" data-formatter="opFormat">操作</th>
                </tr>
                </thead>
            </table>
        </div>
    </div>
</div>
<div class="modal fade" id="dealBooking" tabindex="-1" role="dialog" aria-labelledby="addroleLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="addroleLabel">分配餐桌</h4>
            </div>
            <div class="modal-body">
                <form id="bookingForm">
                    <div class="form-group">
                        <label for="recipient-name" class="control-label">餐桌编号:</label>
                        <select id="selectTable">
                        </select>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" onclick="save();" class="btn btn-primary">保存</button>
            </div>
        </div>
    </div>
</div>
<script  src="${ctxStatic}/js/common/jquery-2.1.1.js"></script>
<script src="${ctxStatic}/js/bootstrap-table.js" type="text/javascript"></script>
<script>
    //操作
    function opFormat(value,row){
        var show;
        var id = row.id;
        var tableId = row.tableId;
        console.info('tableId='+tableId);
        if(tableId == undefined){
            show = '<button class="btn btn-primary" onclick="show('+id+')" >接单</button>';
        }
        return show;
    }

    var bookingId;
    function show(id){
        bookingId = id;
        $.ajax({
            type : 'post',
            url : rootPath + '/order/getTableBooking',
            dataType : 'json',
            data : {
                id : bookingId
            },
            success : function(msg){
                var html ;
                for(var i = 0;i < msg.length; i++){
                    html = '<option value="'+msg[i].id+'">'+msg[i].id+'号餐桌</option>';
                    $("#selectTable").append(html);
                }
            }
        });
        $("#dealBooking").modal("show");
    }

    function save(){
        $.ajax({
            type : 'post',
            url : rootPath + '/order/saveBooking',
            dataType : 'json',
            data : {
                id : bookingId,
                tableId :  $("#selectTable").val()
            },
            success : function(msg){
                if(msg.status == '200'){
                    location.reload();
                }else{
                    alert("操作失败！");
                }
            }
        });
    }
</script>
</body>
</html>
