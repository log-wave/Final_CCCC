<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지 초안</title>

<link rel="stylesheet" href="<c:url value='/resources/css/style.css/index.css'/>">

</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" charEncoding="UTF-8"></c:import>
	<c:import url="/WEB-INF/views/common/main.jsp" charEncoding="UTF-8"></c:import>
	<c:import url="/WEB-INF/views/common/footer.jsp" charEncoding="UTF-8"></c:import>
	
	
</body>
<% String strReferer = request.getHeader("referer"); %>
	<% if(strReferer == null) { %>
	
<script>
	alert("정상적인 경로를 통해 다시 접근해 주십시오.");
	document.location.href= '<%=request.getContextPath()%>/adminMember.ad';
</script>

<% return;
}%>
</html>

