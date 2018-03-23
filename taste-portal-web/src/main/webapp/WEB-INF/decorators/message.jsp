<!-- 提示消息弹出窗口 -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="taglib.jsp" %>

<div class="modal fade" id="messageDiv" tabindex="-1">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"></button>
                <h4 class="modal-title">提示</h4>
            </div>
            <div class="modal-body">
                <span id="message"></span>
            </div>
        </div>
    </div>
</div>