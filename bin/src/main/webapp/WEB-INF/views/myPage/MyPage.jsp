<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<script src="https://kit.fontawesome.com/307ff02242.js" crossorigin="anonymous"></script>

<link href="../../style.css/index.css" rel="stylesheet" type="text/css">
<link href="MyPage.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">  
</head>
<body>
	<c:import url="/view/common/header.jsp?ver=1.0" charEncoding="UTF-8"></c:import>
	
	<div class="myPage_box">
		<div class="myPage_profile_bigBox">
			<div class="myPage_profile_box">
				<div class="myPage_profileSmallBox">
					<div class="myPage_profile_img"></div>
					
					<div class="myPage_profile_textAreabox">
						<div class="myPage_profile_userName">
							강건강
						</div>
						<div class="myPage_profile_userFollowing"> 
							<span class="userFollwing">팔로잉</span>
							<span class="userFollowing_number">121명</span>
						</div>
					
					</div>
				
				</div>
			</div>
			<div class="myPage_profile_changeBox">
				<div>
					<button class="profile_setting_Btn"><i class="fas fa-user-cog fa-2x"></i><span style="margin-left: 7px;">프로필 설정</span></button>
				</div>
			</div>
		
		</div>
	
	</div>
	
	<div class="myPage_content_title">
		<div class="myPage_content_title_myRecipe ">마이 레이시피<span class="title_common_number">89</span></div>
		<div class="myPage_content_title_scrap ">스크랩<span class="title_common_number">55</span></div>
		<div class="myPage_content_title_following ">팔로잉<span class="title_common_number">121</span></div>
	</div>

	
	
	
	
	
	
	
	
	<c:import url="/view/common/footer.jsp" charEncoding="UTF-8"></c:import>
	
	
</body>
</html>