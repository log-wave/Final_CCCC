<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<!-- 다시 -->
<link rel="stylesheet" href="<c:url value='/resources/css/style.css/index.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/member/findMember/findIdResult.css?ver=1.0'/>">

</head>
<body>
	<c:import url="../../common/header.jsp"/>
	<br><br>
	<div id="wrapper">
		<div id="content">
			<h1 align="center">아이디 찾기 검색 결과</h1><br>
			
			<hr>
			
			<div align="center"><label id="namerst">${ membervo.user_name }</label><label> 님의 아이디는</label><br>
			<label id="idrst">${ membervo.user_id }</label><label> 입니다.</label></div><br><br>
			
			<div align="center">
			<button style="cursor: pointer" id="logbtn" onclick="location.href='loginPage.me'">로그인 하기</button>&nbsp;&nbsp;
			<button style="cursor: pointer" id="findpwd" onclick="location.href='find_user_password.me'">비밀번호 찾기</button>
			</div>
	    </div>
    </div>  
    <c:import url="../../common/footer.jsp"/>
</body>
</html>