<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="<c:url value='/resources/css/style.css/index.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/member/login/login.css?ver=1.0'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/member/login/loginUtil.css'/>">
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.6.0.min.js" />"></script>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">  
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp?ver=1.0" charEncoding="UTF-8"></c:import>
	
	<form action="login.me" method="post">
	<div class="login_box">
		<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-50">
				<form class="login100-form validate-form">
					<span class="login100-form-title p-b-33">
						로그인
					</span>

					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<input class="input100" type="text" id="user_id" name="user_id" placeholder="아이디">
						<span class="focus-input100-1"></span>
						<span class="focus-input100-2"></span>
					</div>

					<div class="wrap-input100 rs1 validate-input" data-validate="Password is required">
						<input class="input100" type="password" id="user_password" name="user_password" placeholder="비밀번호">
						<span class="focus-input100-1"></span>
						<span class="focus-input100-2"></span>
					</div>
					
					
					<div class="loginErrorMessage_box">
					
						<p class="loginErrorMessage">${loginErrorMessage}</p>
					
					
					</div>
					
					<div class="container-login100-form-btn m-t-20">
						<button class="login100-form-btn" type="submit" id="login_btn" onclick="return loginCheck();">
							로그인
						</button>
					</div>
					

					<div class="text-center p-t-45 p-b-4">
						<span class="txt1">
							아이디 찾기 | 비밀번호 찾기 
						</span>

						<a href="#" class="txt2 hov1">
							
						</a>
					</div>

					<div class="text-center" style="margin-top: 20px;">
						<span class="txt1">
							<a href="insertMemberTerms.me">회원가입</a>
						</span>

						<a href="#" class="txt2 hov1">
							
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	</div>
	</form>
	
	<c:import url="/WEB-INF/views/common/footer.jsp" charEncoding="UTF-8"></c:import>
	
	
	<script type="text/javascript">

		/* 처음시작하는 if 에 정확히 입력했을때 로직작성하고 
		else{
			
			틀렸을때 카운트 누적되는데 
			
			if(5회이상 )
			
		}}
		 */
		
	</script>
	
	
	
	
	
	
	
	
</body>
</html>