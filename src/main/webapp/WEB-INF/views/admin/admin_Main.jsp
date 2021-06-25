<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/admin_index.css" rel="stylesheet" type="text/css">

</head>
<body>
	<c:import url="/WEB-INF/views/admincommon/header.jsp" charEncoding="UTF-8"></c:import>

    <c:import url="/WEB-INF/views/admincommon/Main.jsp" charEncoding="UTF-8"></c:import>
    
    <c:import url="/WEB-INF/views/common/footer.jsp" charEncoding="UTF-8"></c:import>
</body>
</html>