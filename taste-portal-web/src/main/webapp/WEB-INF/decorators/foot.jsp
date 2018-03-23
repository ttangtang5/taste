<!-- 页面js，放在<body>最后 -->
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="taglib.jsp"%>
<script type="text/javascript">
    var ctx = '${ctx}', ctxStatic = '${ctxStatic}';
    $(function () {
        $.ajaxSetup({
            error: function (data) {
                Exception.showMessage(data);
            }
        });
    });

</script> 