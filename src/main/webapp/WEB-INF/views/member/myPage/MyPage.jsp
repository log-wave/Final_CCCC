<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<input type="hidden" id="id_check" value="${loginUser.user_no }" name="id_check"/>
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
						<div class="myPage_profile_userRecipe"> 
							<span class="userRecipe">레시피</span>
							<span class="userRecipe_number1">${ rList.size() }</span><span class="userRecipe_number2">개</span>
						</div>
					
					</div>
				
				</div>
				
			</div>
			<div class="myPage_profile_changeBox" style="display:flex; justify-content: space-between;  width: 300px;">
				<div>
					<button class="profile_Edit_Btn" type="button" style="cursor:pointer;" onclick="location.href='edit_my_inform.me'"><i class="fas fa-user-cog fa-2x"></i><span style="margin-left: 7px;">내정보 수정</span></button>
				</div>
				<div>
					<button class="profile_setting_Btn" type="button" style="cursor:pointer;" onclick="location.href='withdrawalGuide.me'"><span>회원 탈퇴</span></button>
			    </div>
			</div>
		
		</div>
	
	</div>
	
	<div class="myPage_content_title">
		<div class="myPage_content_title_myRecipe " onclick="location.href='myPage.me'">마이 레시피<span class="title_common_number">${ rList.size() }</span></div>
		<div class="myPage_content_title_scrap " onclick="location.href='Scrap.me'">스크랩<span class="title_common_number">${ size }</span></div>
	</div>
	
			<c:if test="${ rList.size() > 0 }">
					<div class="MyrecipeList">
					
					<!-- 반복문으로  레시피리스트 돌려버리기 -->
						<c:forEach var="r" items="${rList }" begin="0" end="${ fn:length(rList)}" step="1" varStatus="i">
						
						
							<c:url var="rDetail" value="rDetail.rp">
								<c:param name="recipeNo" value="${r.recipe_no }"/>
							</c:url>
							<div class="Myrecipe_items" onclick="window.open('${rDetail}')">
							
								<div class="Myrecipe_img">
									<img src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/${fList.get(i.index).changeName}">
								</div>
								<div>
									<div class="recipe_name" align="center"><p>${r.recipe_title }</p><p>조회수 : ${ r.view_count}</p></div>
								</div>
							
							</div>
						
						</c:forEach>
						
						
						<div class="pagingArea">
							<!-- 이전  -->
							<c:if test="${ pi.currentPage <= 1 }">
								<button>&lt;</button>
							</c:if>
							<c:if test="${ pi.currentPage > 1 }">
								<c:url var="before" value="RList.rp">
									<c:param name="sort_no" value="${ sort_no}"/>
									<c:param name="type" value="${ type}"/>
									<c:param name="page" value="${ pi.currentPage - 1 }"/>
								</c:url>
								<a href="${ before }"><button>&lt;</button></a> 
							</c:if>
							
			               	<!-- 페이지 -->
							<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage}">
								<c:if test="${ p eq pi.currentPage }">
									<button style = "background: rgba(242, 159, 5, 0.88); color: white" ><b>${ p }</b></button>
								</c:if>  
								
								<c:if test="${ p ne pi.currentPage }">
									<c:url var="pagenation" value="RList.rp">
										<c:param name="sort_no" value="${ sort_no}"/>
										<c:param name="type" value="${ type}"/>
										<c:param name="page" value="${ p }"/>
									</c:url>
									<a href="${ pagenation }"><button>${ p }</button></a>
								</c:if>
							</c:forEach>
			
			                <c:if test="${ pi.currentPage >= pi.maxPage }">
								<button>&gt;</button>
							</c:if>
							<c:if test="${ pi.currentPage < pi.maxPage }">
								<c:url var="after" value="RList.rp">
									<c:param name="sort_no" value="${ sort_no}"/>
									<c:param name="type" value="${ type}"/>
									<c:param name="page" value="${ pi.currentPage + 1 }"/>
								</c:url> 
								<a href="${ after }"><button>&gt;</button></a>
							</c:if>
			                
						</div>
				</div>
			</c:if>
			
			<c:if test="${ rList.size() == 0 }">
				
				<div class="emptyList" align="center">
					<label class="emptyfont">등록된 레시피가 없습니다.</label><br><br>
					<label class="emptyfont">레시피를 등록해주세요.</label><br>
					<input type="button" id="insertRecipe" onclick="location.href='insertRecipeForm.rp'" value="레시피 등록"/>
				</div>
				
			</c:if>
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


function get_profileImg(){
	
	
	$.ajax({
		url:'getprofile.me',
		success:function(data){
			console.log(data);
			if(data == ''){
				$('.profileimage_upload').append('<img src="resources/images/경기도.png" id= "profileImg" name= "profileImg" style="width:100%; height:100%; object-fit: cover; cursor: pointer;"/>');
			}else{
				$('.profileimage_upload').append('<img src="${ pageContext.servletContext.contextPath }/resources/userProfile_uploadFile/'+data+'" id= "profileImg" name= "profileImg" style="width:100%; height:100%; object-fit: cover; cursor: pointer;"/>');
			}
		}
	});
}

$(function(){
	
	get_profileImg();
		
	
	$("#fileArea").hide();
	
	
	$(".profileimage_upload").click(function(){
		$("#thumbnailImg1").click();
		
		
		$("#thumbnailImg1").on("click",function(){
			
			var formData = new FormData($("#uploadForm")[0]);
			
			
			$.ajax({
				
				enctype: 'multipart/form-data',	
				data:formData,
				async: false,
				processData: false,
				
	            contentType: false,
	            url : "user_profile_change.me",
				type:'POST',
				success: function(data){
					
					var profile_changeName = data;
						
					window.location.reload();
							
				}
				
				
			});
		
		
		});
		
		
			});

		
	});



</script>

</html>	