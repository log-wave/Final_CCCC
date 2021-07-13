<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<!-- 다시다시 -->
<link rel="stylesheet" href="<c:url value='/resources/css/style.css/index.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/member/findMember/findId.css?ver=1.0'/>">

</head>
<body>
	<c:import url="../../common/header.jsp"/>
	<br><br>
	<div id="wrapper">
		<div id="content">
			<form action="find_id_result.me" method="post">
				<h1 align="center">아이디 찾기</h1><br>
				<label>이메일</label>
				<input type="text" name="email" id="email" class="int" maxlength="100" >
				<div id="email_check">
			               	
			    </div><br>
			    <input style="cursor: pointer" type="button" name="emailBtn" class="emailBtn" id="emailBtn" onclick="emailSend()" value="인증받기"/><br>
			    <label>인증번호를 입력하세요.</label>
			    <input type="text" id="email_confirm" class="int" maxlength="100" >
			    <div id="email_confirmCheck">
			               	
			    </div> 
			    <input type="hidden" name="emailCheckHidden" id="emailCheckHidden" value=""/>
			    
			    <button style="cursor: pointer" type="submit" id="signUpBtn">확인</button>
		    </form>
	    </div>
    </div>  
    <script type="text/javascript">
    
    $(function(){
		
		$("#signUpBtn").prop("disabled", true);
		$("#signUpBtn").css("background-color", "#E2E2E2");
		$("#emailBtn").prop("disabled", true);
		$("#emailBtn").css("background-color", "#E2E2E2");
	});
	
	function disabeldSignUpBtn(){
		
		$("#signUpBtn").prop("disabled", true);
		$("#signUpBtn").css("background-color", "#E2E2E2");
		
	}
	
	function disabeldemailBtn(){
		
		$("#emailBtn").prop("disabled", true);
		$("#emailBtn").css("background-color", "#E2E2E2");
		
	}
    
    $("#userName").blur(function(){
   		
   		var name = $('#userName').val();
   		var krNameCheck = /([^가-힣ㄱ-ㅎㅏ-ㅣ\x20])/i;
   		var specialCheck = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
   								
   		
   		if(name== null || name.length <2){
   			
   	
   			$("#name_check").text("이름은 최소 2글자를 입력해야 합니다. ");
   			$("#name_check").css("color", "red");
   			disabeldemailBtn();
   			disabeldSignUpBtn();
				
   		}else if(krNameCheck.test(name)){
   			
   	
   			$("#name_check").text("이름은 한글만 입력 가능합니다. ");
   			$("#name_check").css("color", "red");
   			disabeldemailBtn();
   			disabeldSignUpBtn();
   		
   		}else if(specialCheck.test(name)){
   			
   			$('#userName').focus(); 
   			$("#name_check").text("이름에 특수문자를 사용할 수 없습니다. ");
   			$("#name_check").css("color", "red");
   			disabeldemailBtn();
   			disabeldSignUpBtn();
   		
   			
   		}else
   			var userName = $('#userName').val();
			
			$.ajax({
   			url : "name_check.me?userName=" + userName,
   			type : "get",
   			success : function(data) {
   				
   				if(data == 1){
   					$("#name_check").text("등록된 이름입니다.");
					$("#name_check").css("color", "green");
					$("#signUpBtn").prop("disabled", false);
   					
   				}else{
   					$('#userName').focus();
   					$("#name_check").text("회원목록에 없는 이름 입니다. ");
   					$("#name_check").css("color", "red");
   					disabeldemailBtn();
   					disabeldSignUpBtn();
   				
   				}

				}

   		});
				

   	});
    
    $("#email").blur(function(){
   		
   		var email = $('#email').val();
   		var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/; //이메일 유효성 코드
   		
	
   		
   		if(email =="" || email==null){
   			
   			$("#email_check").text("이메일은 필수 입력 사항입니다.");
   			$("#email_check").css("color", "red");
   			disabeldemailBtn();
   			disabeldSignUpBtn();
   		
   		}else if(email.search(/\s/) !=-1){
				
			
				$("#email_check").text("이메일에는 공백을 포함할 수 없습니다.");
				$("#email_check").css("color", "red");
				disabeldemailBtn();
				disabeldSignUpBtn();
				
   		
   		}else if(!regex.test(email)){
			
			$("#email_check").text("이메일 형식을 정확히 입력해주세요.");
			$("#email_check").css("color", "red");
			disabeldemailBtn();
			disabeldSignUpBtn();
			
		}else{
			
			
			var email = $('#email').val();

				$.ajax({
	    			url : "emailCheck.me?email=" + email,
	    			type : "get",
	    			success : function(data) {
	    				
	    				if(data == 1){
	    					
	    					$("#email_check").text("등록된 이메일 입니다.");
							$("#email_check").css("color", "green");
							$("#emailBtn").prop("disabled", false);
							$("#emailBtn").css("background-color", "rgb(242, 159, 5)");
	    				}else{
	    					
							$("#email_check").text("등록되지 않은 이메일 입니다.");
	    					$("#email_check").css("color", "red");
	    					disabeldemailBtn();
	    					disabeldSignUpBtn();
       				
	    				}

					}

	    		});

		}
   	}); 		
    
    
   	var globalEmailCheckNum = 0;
   	
   	
   	function emailSend(){
   		
   		var email = $('#email').val();
   		var userName = $('#userName').val();
   		var subject = '테스트 제목';
   		var message = '테스트 메시지';
   		var email_confirm = $('#email_confirm').val();
   	
   		
   		console.log('email');
   		console.log('subject');
   		console.log('message');
   	
   		$.ajax({
   			
   			url : "emailSend.me",
   			type: "GET",
   			data: {"email":email, "userName":userName, "subject":subject, "message":message},
   			dataType: "json",
   			success:function(data){
   				
   				
   				$("#email_confirmCheck").text("이메일 인증번호가 성공적으로 발송되었습니다.");
					$("#email_confirmCheck").css("color", "green");
					$("#signUpBtn").prop("disabled", false);
   				
					console.log(data);
   					console.log(data.checkNum);
					
					function trans(){
						
						globalEmailCheckNum = data.checkNum;
						
					}
					
					trans();
					console.log("전역변수:" + globalEmailCheckNum);		
					
					$("#email_confirm").blur(function(){
						
						var email_confirm = $('#email_confirm').val();
	    				
	    				if(email_confirm == globalEmailCheckNum){
	        				$("#email_confirmCheck").text("이메일 인증번호가 일치합니다.");
	    					$("#email_confirmCheck").css("color", "green");
	    					$("#signUpBtn").prop("disabled", false);
	    					$("#signUpBtn").css("background-color", "rgb(242, 159, 5)");
	    					
	        			}else{
	        				$("#email_confirmCheck").text("이메일 인증번호가 일치하지 않습니다.");
	        				$("#email_confirmCheck").css("color", "red");
	        				disabeldemailBtn();
	        				disabeldSignUpBtn();
	    					
	    				
	        				
	        			}
						
					});

   			}
   			
   		});
   	
   	}
    
    </script>
	<c:import url="../../common/footer.jsp"/>
</body>
</html>