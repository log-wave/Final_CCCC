<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 설정 페이지</title>
<script src="https://kit.fontawesome.com/1706693aec.js" crossorigin="anonymous"></script>
 <link href="../style.css/index.css" rel="stylesheet" type="text/css">
 <link href="updateProfile.css" rel="stylesheet" type="text/css">
</head>
<body>
<c:import url="common/header.jsp?ver=1.0" charEncoding="UTF-8"></c:import>
<!-- 
	<i class="fas fa-user-circle fa-7x" ></i>
 -->
	<br clear="all">
	<form>
	<div class="total_area">
		<!-- 로고 -->
		<div class="p_logoimg">
			<img src="${pageContext.request.contextPath}/images/cccc_logo_ver2.png" >
		</div>
		
		<div class="main_area">
			<div class="pu_top">
				<div class="user_p_img"><i class="fas fa-user-circle fa-7x" ></i></div>
				<p>강건강</p>
			</div>
			
			<div class="pu_mid">
				<div class="email_area">
					<div class="md_ea_left">이메일</div>
					<div class="md_ea_right">
						<input type="text" class="md_ea_input">
						<input type="hidden">
					</div>
				</div>
				<div class="nick_area">
					<div class="md_na_left">닉네임</div>
					<div class="md_na_right">
						<input type="text" class="md_na_input">
						<input type="hidden">
					</div>
				</div>
				<div class="prod_area">
					<div class="md_pda_left">자기소개</div>
					<div class="md_pda_right">
						<textarea rows="5" cols="40" class="md_pda_input"></textarea>
						<input type="hidden">
					</div>
				</div>
				<div class="pass_area">
					<div class="md_psa_left">비밀번호 변경</div>
					<div class="md_psa_right">
						<input type="text" class="md_psa_Tinput">
						
						<input type="text" class="md_psa_Binput">
						<input type="hidden">
					</div>
				</div>
			</div>
			
			<div class="btn_area">
				<button class="cnbtn">취소</button>
				<input type="submit" class="subtn" value="저장">
			</div>
		</div>
	</div>
	</form>
	
	
	<c:import url="common/footer.jsp" charEncoding="UTF-8"></c:import>
</body>
</html>