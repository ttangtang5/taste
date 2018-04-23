<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="taglib.jsp"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>

<!DOCTYPE html>
<html>
<head>
	<title>后台管理 - <sitemesh:title/></title>
	<%@include file="head.jsp"%>
	<sitemesh:head/>
</head>
<body class="ecommerce">
		<%@ include file="header.jsp" %>
		<sitemesh:body />
		<%@ include file="message.jsp"%>
		<%@ include file="footer.jsp"%>
		<%@ include file="foot.jsp" %>
</body>
</html>