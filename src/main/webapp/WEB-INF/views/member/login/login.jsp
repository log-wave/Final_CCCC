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
	
	<form>
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
						<input class="input100" type="password" id="user_password" name="user_password" placeholder="비밀번호" onkeyup="loginEnterKey();">
						<span class="focus-input100-1"></span>
						<span class="focus-input100-2"></span>
					</div>
					
					
					<div class="loginErrorMessage_box">
					
						<input type="hidden" name="login_chec_hidden" id="login_chec_hidden" value=""/>
						
					
					</div>
					
					<div class="container-login100-form-btn m-t-20">
						<button class="login100-form-btn"  id="login_btn" type="button">
							로그인
						</button>
					</div>
					

					<div class="text-center p-t-45 p-b-4">
						<span class="txt1" onclick="location.href='find_id_view.me'" style="cursor: pointer;">아이디 찾기 </span><span class="txt1" onclick="location.href='find_user_password.me'" style="cursor: pointer;">비밀번호 찾기 </span>

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
					
					<!-- 네이버 로그인 창으로 이동 -->
					<!-- 컨트롤러에서 받아온 url 이 실행되지 않음..  -->
					<div id="naver_id_login" style="text-align:center; margin-top: 30px;"><a id="naver_login_url_aTag" href="">
					<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>
					
				</form>
			</div>
		</div>
	</div>
	</div>
	</form>
	
	<c:import url="/WEB-INF/views/common/footer.jsp" charEncoding="UTF-8"></c:import>
	
	
	<script type="text/javascript">
	
	
	/* 네이버 로그인 url을 받기 위한 함수 */
	
	$('#naver_id_login').click(function(){
		
		$.ajax({
			
			url:"naverLogin.sns",
			type:"get",
			dataType:'json',
			success:function(data){
				
				//네이버 로그인 api 주소를 생짜로 넣으면 되긴 하나 보안상 매우 심각한 위험을 초래
				
				/* alert(JSON.stringify(data)); */
				/* alert(JSON.stringify(data.url)); */
				 var naver_login_url =  JSON.stringify(data.url);
				
				var url = naver_login_url.replace(/\"/gi, "");
				
				alert(url);
				
				location.href=url;
			
			}
			
			
			
		});
		
	});
	
	function loginEnterKey(){
		if (window.event.keyCode == 13) {
			 
        	$('#login_btn').click();
        }
	}
	
	
	
	function reset_pass_cnt(){
			
		var user_id = $('#user_id').val();
		location.href = '<%=request.getContextPath()%>/reset_pass_cnt.me?user_id='+user_id; 

		
	}

	$('#login_btn').click(function(){
		
		var user_id = $('#user_id').val();
   		var user_password= $('#user_password').val();
   		
   		
   		$.ajax({
   			
   			url:"count_DeleteMemberCheck_Num.me",
  			data: {"user_id":user_id, "user_password":user_password},
   			type:"post",
   			async: false,
   			success:function(data){
   				
				if(data == 1){
  					
  					alert("5회이상 틀렸습니다.비밀번호 찾기 페이지로 이동합니다!");
  					location.href = '<%=request.getContextPath()%>/find_user_password.me'; 
  					
  				}else{
  					$.ajax({
  				   		
  			   			url:"loginCheck.me",
  			   			data: {"user_id":user_id, "user_password":user_password},
  			   			type:"post",
  			   			dataType:'json',
  			   			async: false,	
  			   			success:function(data){
  			   				
  			   				if(data == 1){
  			   					reset_pass_cnt();
  			   					location.href = '<%=request.getContextPath()%>/adminPage.me';
  			   					
  			   				}
  			   				
  			   				if(data == 0){
  			   				 	reset_pass_cnt();
  			   					location.href = '<%=request.getContextPath()%>/backIndex.do';
  			   				}	
  			   		   		
  			   				if(data == -1){
  			   		   			
  			   		   			$.ajax({
  			   		   				
  			  						url:"pass_cnt.me",
  			  						data: {"user_id":user_id, "user_password":user_password},
  			  						type:"post",
  			  						async: false,
  			  						success:function(data){
  			  							
  			  							if(data == 1){
  			  								alert("회원탈퇴 카운트 누적완료 제발 되자!");
  			  							}
  			  							
  			  						}
  			   		   				
  			   		   			});
  			   		   
  			   		   		}
  			   			
  			   			}
  		
  			   		});
	
  				}
   			
   			}
   			
   		});
  
	}); 
	


	</script>
	
	

</body>
</html>