<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="header">
<img id="admin_main_logo" src="${ pageContext.servletContext.contextPath }/resources/images/logo3.png" onclick="location.href='adminMember.ad'" width="190px" height="55px">
	<div class="header_middle">
	</div>
	<div class="header_admin">
		<img name="header_admin_img" src="${ pageContext.servletContext.contextPath }/resources/images/login.PNG">
		<label>관리자</label>
		<label onclick="location.href='logoutPage.me';" style="cursor: pointer">로그아웃</label>
	</div>
</div>
<div id="bar">
</div>
</body>
</html>