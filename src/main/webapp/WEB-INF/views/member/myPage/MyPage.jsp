<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<script src="https://kit.fontawesome.com/307ff02242.js" crossorigin="anonymous"></script>

<link rel="stylesheet" href="<c:url value='/resources/css/style.css/index.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/member/myPage/myPage.css?ver=1.0'/>">




<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">  
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp?ver=1.0" charEncoding="UTF-8"></c:import>
	
	<form id="uploadForm"  method="get" enctype="multipart/form-data">
	<input type="hidden" id="id_check" value="${loginUser.user_no }">
	<div class="myPage_box">
		<div class="myPage_profile_bigBox">
			<div class="myPage_profile_box">
				<div class="myPage_profileSmallBox">
					
					<!-- 프로필 사진  -->
					
					<div>
						<div class="profileimage_upload" align="center" style="width: 150px; height: 150px; border-radius: 70%; overflow: hidden;">
							
							
						</div>
						<div align="center"><span style="font-size: 12px;">프로필 사진 변경</span></div>
						
					</div>			
					
					<div class="myPage_profile_textAreabox">
						<div class="myPage_profile_userName">
							${loginUser.getUser_name()}
						</div>
						<div class="myPage_profile_userFollowing"> 
							<span class="userFollwing">팔로잉</span>
							<span class="userFollowing_number">121명</span>
						</div>
					
					</div>
				
				</div>
				
			</div>
			<div class="myPage_profile_changeBox" style="display:flex; justify-content: space-between;  width: 300px;">
				<div>
					<button class="profile_Edit_Btn"  style="cursor:pointer;" onclick="location.href='edit_my_inform.me'"><i class="fas fa-user-cog fa-2x"></i><span style="margin-left: 7px;">내정보 수정</span></button>
				</div>
				<div>
					<button class="profile_setting_Btn" style="cursor:pointer;" onclick="location.href='withdrawalGuide.me'"><span>회원 탈퇴</span></button>
			    </div>
			</div>
		
		</div>
	
	</div>
	
	<div class="myPage_content_title">
		<div class="myPage_content_title_myRecipe ">마이 레시피<span class="title_common_number">89</span></div>
		<div class="myPage_content_title_scrap ">스크랩<span class="title_common_number">55</span></div>
		<div class="myPage_content_title_following ">팔로잉<span class="title_common_number">121</span></div>
	</div>
	
	<!-- 파일 업로드 /js로 hide할 예정 -->
	<div id="fileArea">
		<input type="file" id="thumbnailImg1" multiple="multiple" name="editImg" accept="image/gif,image/jpeg,image/png"/>
	</div>
	<input type="hidden" name="userNo" value="${loginUser}">
	
	
	  </form>
	
	
	<c:import url="/WEB-INF/views/common/footer.jsp" charEncoding="UTF-8"></c:import>
	
	
</body>
<script type="text/javascript">
	
	

//프로필 수정 

$(function(){

		
	
	$("#fileArea").hide();
	
	
	$(".profileimage_upload").click(function(){
		$("#thumbnailImg1").click();
		
		
		$("#thumbnailImg1").on("click",function(){
			
			var formData = new FormData($("#uploadForm")[0]);
			
			
			$.ajax({
				
				enctype: 'multipart/form-data',	
				data:formData,
				processData: false,
	            contentType: false,
	            url : "user_profile_change.me",
				type:'POST',
				success: function(data){
					
					var profile_changeName = data;
					get_profileImg();
					
					
					window.location.reload();
							
				}
				
				
			});
		
		
		});
		
		
			});

		
	});


function get_profileImg(){
	var user = $('#id_check').val();
	
	$.ajax({
		url:'getprofile.me',
		success(data){
			console.log(data);
			if(data == ''){
				$('.profileimage_upload').append('<img src="resources/images/경기도.png" id= "profileImg" name= "profileImg" style="width:100%; height:100%; object-fit: cover; cursor: pointer;"/>');
			}else{
				$('.profileimage_upload').append('<img src="${ pageContext.servletContext.contextPath }/resources/userProfile_uploadFile/'+data+'" id= "profileImg" name= "profileImg" style="width:100%; height:100%; object-fit: cover; cursor: pointer;"/>');
			}
		}
	});
}
	
</script>

</html>