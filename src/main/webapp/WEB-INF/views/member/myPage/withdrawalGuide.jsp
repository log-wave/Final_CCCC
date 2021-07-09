<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<link rel="stylesheet" href="<c:url value='/resources/css/style.css/index.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/member/myPage/withdrawalGuide.css?ver=1.1'/>">
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.6.0.min.js" />"></script>
<script src="https://kit.fontawesome.com/307ff02242.js" crossorigin="anonymous"></script>

</head>
<body>
	<div class="withdrawalGuide_box">
		<div class="withdrawalGuide_img">
			<img src="${ pageContext.servletContext.contextPath }/resources/images/logo2.png" onclick = "location.href='${pageContext.servletContext.contextPath}'" >
		</div>
		<div class="withdrawalGuide_title" style="font-size: 30px;font-weight: 400; margin-top: 50px;">탈퇴 안내</div>
		<div style="margin-top: 30px; font-size: 16px;" >회원 탈퇴를 신청하기 전에 안내사항을 꼭 확인해 주세요</div>
		<div style="margin-top:50px;"><span ><i class="fas fa-check" style="color:green;"></i></span>사용하고 계신 아이디(${loginUser.getUser_id()})는 탈퇴할 경우 재사용 및 복구가 불가능 합니다.</div>
		<div style="margin-top:10px;"><span style="color:red; font-weight: 400;margin-left: 15px;">탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구</span>가 불가능하오니 신중히 선택하시기 바랍니다.</div>
		<div style="margin-top:50px;"><span ><i class="fas fa-check" style="color:green;"></i></span>탈퇴 후 회원정보 및 개인서비스 이용기록은 모두 삭제됩니다.</div>
		<div style="margin-top:50px;">개인정보 , 팔로잉/팔로우 , 스크랩 , Qna 및 개인형 서비스 이용기록은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.</div>
		<div style="margin-top:10px; border-bottom:1px solid black; padding-bottom:30px;">삭제되는 내용을 확인하시고 필요한 데이터는 미리 백업을 해주세요.</div>
		
		
		<div style="margin-top:50px;"><span ><i class="fas fa-check" style="color:green;"></i></span>탈퇴한 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아있습니다..</div>
		<div style="margin-top:10px;">삭제를 원하시는 게시글이 있다면 <span style="color:red;">반드시 탈퇴 전 비공개 처리하거나 삭제하시기 바랍니다.</span> </div>
		<div style="margin-top:10px; border-bottom:1px solid black; padding-bottom:30px;">탈퇴한 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, 게시글을 임의로 삭제해드릴 수 없습니다.  </div>
		
		
		<div style="margin-top:30px;">탈퇴한 후에는 아이디(${loginUser.getUser_id()})로 다시 가입할 수 없으며 아이다와 데이터는 복구할 수 없습니다.</div>
		<div style="margin-top:10px;"><span>게시판형 서비스에 남아있는 게시글은 탈퇴 후 삭제 할 수 없습니다</span> </div>
		
		<div style="margin-top:50px;">
			<input type="checkbox" name="withdrawalGuide_check" id="withdrawalGuide_check" value="withdrawalGuide_check">안내 사항을 모두 확인하였으며 , 이에 동의합니다.
		
		</div>
		<div style="margin-top: 50px; text-align: center; " >
			 <button type="submit" id="withdrawalGuide_check_btn" style="background: #F29F05; width:150px; height:50px;  color:white; border-style:none; cursor: pointer;">회원탈퇴</button>
		
		</div>

	</div>
	<script type="text/javascript">
		
		
	
		$('#withdrawalGuide_check_btn').click(function(){
			
			var checked = $('#withdrawalGuide_check').is(':checked');	
			
			
			if(checked == true){
				
				location.href='deleteMemberPage.me'
			}else{
				alert("탈퇴 약관에 동의해주시기 바랍니다.")
			}
			
			
			
			
			
			
			
			
			
			
			
		});	
	
	
	
	
	
	
	</script>


</body>
</html>