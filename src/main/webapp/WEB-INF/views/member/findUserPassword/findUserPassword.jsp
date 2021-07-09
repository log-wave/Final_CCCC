<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 </title>
<link rel="stylesheet" href="<c:url value='/resources/css/style.css/index.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/member/login/login.css?ver=1.0'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/member/login/loginUtil.css'/>">
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.6.0.min.js" />"></script>


<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">  
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp?ver=1.0" charEncoding="UTF-8"></c:import>
	
	<form >
	<div class="login_box">
		<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-50">
				
					<span class="login100-form-title p-b-33">
						비밀번호 찾기 
					</span>

					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<input class="input100 user_id" type="text" name="user_id" value="${loginUser.getUser_id()}" readonly="readonly"">
						<span class="focus-input100-1"></span>
						<span class="focus-input100-2"></span>
					</div>

					<div class="wrap-input100 rs1 validate-input" data-validate="Password is required">
						<input class="input100 user_password" type="password"  name="user_password" placeholder="비밀번호">
						<span class="focus-input100-1"></span>
						<span class="focus-input100-2"></span>
					</div>
					
					
					<div class="loginErrorMessage_box">
					
						<p class="loginErrorMessage">${loginErrorMessage}</p>
					
					
					</div>

					<div class="container-login100-form-btn m-t-20">
						<button class="login100-form-btn" id="deleteMemberCheck_btn" type="button">
							회원 탈퇴
						</button>
					</div>
			
				
			</div>
		</div>
	</div>
	</div>
	</form>
	<c:import url="/WEB-INF/views/common/footer.jsp" charEncoding="UTF-8"></c:import>
		
	
		
		
	
</body>
</html>