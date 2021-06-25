<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="../../../style.css/index.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/view/Member/insertMember/InsertMember.css">

</head>
<body>

	<c:import url="../../common/header.jsp" charEncoding="UTF-8"></c:import>
	
	<form class="signform">
	<div class="wrapper">
		<img id="main_logoaa" src="${ pageContext.servletContext.contextPath }/images/cccc_logo.PNG">
		<h1 class="h1" align="center">회원가입</h1>
	
		<input type="text" id="userId" name="userId" placeholder="아이디">
		<br>
		<input type="password" id="userPwd1" name="userPwd1" placeholder="비밀번호">
		<br>
		<input type="password" id="userPwd2" name="userPwd2" placeholder="비밀번호 확인">
		<br>
		<input type='email' id='email' name='email' placeholder="이메일">
		<br>
		<input type="text" id="nickName" name="nickName" placeholder="닉네임">
		<br>
		
		<span><button type="button" id="sign_male" onclick="malecolor">남자</button></span>
		<span><button type="button" id="sign_female" onclick="malecolor">여자</button></span>
		
    	<input id="signup" name="signupBtn" type="submit" value="가입하기" disabled><br>

		
		
	</div>
	</form>
	
	<c:import url="../../common/footer.jsp" charEncoding="UTF-8"></c:import>
	<script>
	var b1 = document.getElementById("sign_male");
	var b2 = document.getElementById("sign_female");
	
	
	b1.onclick = function() {
	     b1.style.background = "#F2B705";
	     b1.style.color="white";
	     b2.style.background = "#FFFFFF";
	     b2.style.color="black";
	}
	
	b2.onclick = function() {
	     b1.style.background = "#FFFFFF";
	     b1.style.color="black";
	     b2.style.background = "#F2B705";   
	     b2.style.color="white";
	}

	</script>
</body>
</html>