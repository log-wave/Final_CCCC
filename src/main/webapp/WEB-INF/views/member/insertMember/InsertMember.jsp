<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.6.0.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/js/member/member.js" />"></script>



<link rel="stylesheet" href="<c:url value='/resources/css/member/insertMember/InsertMember.css?ver=1.0'/>">

</head>
<body>
        <!-- header -->
        <div id="header">
           <img class="main_image" class="map_image" src="resources/images/cccc_logo.PNG	"/>
        </div>

		<form name="frm" action="insertUser.me" method="post">
        <!-- wrapper -->
        <div id="wrapper">

            <!-- content-->
            <div id="content">

                <!-- ID -->
                <div>
                    <h3 class="join_title">
                        <label for="id">아이디</label>
                    </h3>
                    <span class="box int_id">
                        <input type="text"  name="user_id" id="user_id" class="int" maxlength="20">
                    </span>
                </div>
                <div id="id_check">
                
                
                </div>
                

                <!-- PW1 -->
                <div>
                    <h3 class="join_title"><label for="pswd1">비밀번호</label></h3>
                    <span class="box int_pass">
                        <input type="password" name="user_password" id="pass01" class="int" maxlength="20">
                    </span>
                   <div style="margin-top: 20px"></div>
                </div>
                 <div id="pass01_check">
                
                
                </div>

                <!-- PW2 -->
                <div>
                    <h3 class="join_title"><label for="pswd2">비밀번호 재확인</label></h3>
                    <span class="box int_pass_check">
                        <input type="password" id="pass02" class="int"  maxlength="20">
                    </span>
                    <div style="margin-top: 20px"></div>
                </div>
                 <div id="pass02_check">
                
                
                </div>

                
 				<!-- NAME -->
                <div>
                    <h3 class="join_title"><label for="name">이름</label></h3>
                    <span class="box int_name">
                        <input type="text" name="user_name" id="name" class="int"  maxlength="20">
                    </span>		
                </div>
                 <div id="name_check">
                
                
                </div>
                
                <!-- NICKNAME -->
                <div>
                    <h3 class="join_title"><label for="nickName">닉네임</label></h3>
                    <span class="box int_nickName">
                        <input type="text" name="nickname" id="nickName" class="int" maxlength="20">
                    </span>		
                </div>
                <div id="nickName_check">
                
                </div>
                
                  <!-- BIRTH -->
                <div>
                    <h3 class="join_title"><label for="yy">생년월일</label></h3>

                    <div id="bir_wrap">
                        <!-- BIRTH_YY -->
                        <div id="bir_yy">
                            <span class="box">
                                <input type="text" name="yy" id="yy" class="int" maxlength="4" placeholder="년(4자)">
                            </span>
                        </div>
                   

                        <!-- BIRTH_MM -->
                        <div id="bir_mm">
                            <span class="box">
                                <select id="mm" class="sel">
                                    <option>월</option>
                                    <option value="01">1</option>
                                    <option value="02">2</option>
                                    <option value="03">3</option>
                                    <option value="04">4</option>
                                    <option value="05">5</option>
                                    <option value="06">6</option>
                                    <option value="07">7</option>
                                    <option value="08">8</option>
                                    <option value="09">9</option>                                    
                                    <option value="10">10</option>
                                    <option value="11">11</option>
                                    <option value="12">12</option>
                                </select>
                            </span>
                        </div>

                        <!-- BIRTH_DD -->
                        <div id="bir_dd">
                            <span class="box">
                                <input type="text" id="dd" class="int" maxlength="2" placeholder="일">
                            </span>
                        </div>

                    </div>
                    <div id="yy_check">
                        	
                        
                    </div>
                </div>
                
                
                
                
                

                
                <!-- GENDER -->
                <div>
                    <h3 class="join_title"><label for="gender">성별</label></h3>
                    <span class="box gender_code">
                        <select id="gender" class="sel" name="gender">
                            <option selected>성별을 선택하세요</option>
                            <option value="M">남자</option>
                            <option value="F">여자</option>
                        </select>                            
                    </span>
                   
                </div>
                <div id="gender_check">
                
                </div>
                
                <!-- <input type="hidden" id="ageResult" name="ageResult"> -->

                <!-- EMAIL -->
                <div>
                	
                    <h3 class="join_title"><label for="email">본인확인 이메일<span class="optional"></span></label></h3>                    
                    <span class="box int_email">
                        <input type="text" name="email" id="email" class="int" maxlength="100" >
                    </span>
                     <div id="email_check">
               	
               		</div>
                    <span>
                    	<input style="margin-top: 30px; background-color: #f29f05; border-style: none; color:white; height: 30px; width: 150px; font-weight: 400;" type="button" name="emailBtn" class="emailBtn" id="emailBtn" onclick="emailSend()" value="인증번호 발송하기"/>
                    </span>
                             
                </div>
                
                
               
				
				<!--EAMIL CONFIRM -->
                <div>
                	
                    <h3 class="join_title"><label for="email_confirm">본인확인 이메일 인증번호<span class="optional"></span></label></h3>                    
                    <span class="box int_email">
                        <input type="text" id="email_confirm" class="int" maxlength="100" >
                    </span>  
                </div>
                <div id="email_confirmCheck">
               	
               	</div> 
                <input type="hidden" name="emailCheckHidden" id="emailCheckHidden" value=""/>
                
                
               
            
                <!-- JOIN BTN-->
                <div class="btn_area">
                    <button type="submit" id="signUpBtn" style="background: #F29F05; cursor: pointer;">
                        	가입하기
                    </button>
                </div>

                

            </div> 
            <!-- content-->

        </div> 
        <!-- wrapper -->
    	</form>
		<script type="text/javascript">
		
		$(function(){
			
			$("#signUpBtn").prop("disabled", true);
			$("#signUpBtn").css("background-color", "#E2E2E2");
		});
		
		
		
		
		function disabeldSignUpBtn(){
			
			$("#signUpBtn").prop("disabled", true);
			$("#signUpBtn").css("background-color", "#E2E2E2");
			
		}
		//아이디 유효성 검사 
	     $('#user_id').change(function(){
		
		var user_id = $('#user_id');
		

		var user_id_length = 0;
		var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		var specialCheck = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
	
		
		
		 for (var i = 0; i < user_id.val().length; i++) {
    	 	ch = user_id.val().charAt(i);
            if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')&&!(ch >= 'A' && ch <= 'Z')) {
            	
           	
        		$("#id_check").text("아이디는 영문및 숫자만 가능합니다. ");
    			$("#id_check").css("color", "red");
        		disabeldSignUpBtn();
				
				return false;
            }
        }
		
		

		if(user_id.val()==null || user_id.val().length < 4){
			
			
			$("#id_check").text("아이디는 최소 4자리 이상이어야 합니다. ");
			$("#id_check").css("color", "red");
			disabeldSignUpBtn();
		}	
		
		
		
		if(user_id.val().search(/\s/) !=-1){
			
			
			$("#id_check").text("아이디에는 공백을 포함할 수 없습니다.");
			$("#id_check").css("color", "red");
			disabeldSignUpBtn();
		
		
			
		}else if(specialCheck.test(user_id.val())){
			
			
			$("#id_check").text("아이디에는 특수문자를 포함할 수없습니다.");
			$("#id_check").css("color", "red");
			disabeldSignUpBtn();
			
			
			
		
		}else{
			
			var user_id = $('#user_id').val();
			
			$.ajax({
   			url : "idCheck.me?user_id=" + user_id,
   			type : "get",
   			success : function(data) {
   				
   				if(data == 1){
   					
   					$("#id_check").text("사용중이거나 탈퇴한 아이디 입니다. ");
   					$("#id_check").css("color", "red");
   					disabeldSignUpBtn();
						
						return false;
						
						
   				}else{
   					$("#id_check").text("사용 가능한 아이디 입니다.");
						$("#id_check").css("color", "green");
						$("#signUpBtn").prop("disabled",false);
						
						
   				}

				}

   		});
			
		
		}

	});
	
	     	//비밀번호 유효성 검사 
       	
       	$("#pass01").blur(function(){
       		
       		var pass01 = $('#pass01').val();
       		
       		 var num = pass01.search(/[0-9]/g);
       		 var eng = pass01.search(/[a-z]/ig);
       		 var spe = pass01.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
       		 
       		 if(pass01.length<8 || pass01.length >20){
       			 
       			 
       			 $("#pass01_check").text("8~20 자리 이내로 입력해주세요. ");
     			 $("#pass01_check").css("color", "red");
       			 disabeldSignUpBtn();
   				
       			 
       		 }else if(pass01.search(/\s/) !=-1){
       			 
       			 
       			 $("#pass01_check").text("비밀번호는 공백 없이 입력해주세요. ");
       			$("#pass01_check").css("color", "red");
       			 disabeldSignUpBtn();
       		 
       		 }else if(num <0 || eng<0 || spe <0){
       			 
       			 
       			 $("#pass01_check").text("영문 , 숫자 , 특수문자를 혼합하여 입력해주세요. ");
       			$("#pass01_check").css("color", "red");
       			 disabeldSignUpBtn();
       		 
       		 }else{
       			 $("#pass01_check").text("사용 가능한 비밀번호 입니다. ");
   				 $("#pass01_check").css("color", "green");
   				 $("#signUpBtn").prop("disabled", false);
					
       		 }
       		 
       		
       		
       		
       	});
       	
       	
       	//비밀번호 재확인 유효성 검사 
       	
       	$("#pass02").blur(function(){
       		var pass01 = $('#pass01').val();
       		var pass02 = $('#pass02').val();
       		
       		if(pass01 != pass02){
       			
       	
       			$("#pass02_check").text("비밀번호가 일치하지 않습니다. ");
       			$("#pass02_check").css("color", "red");
       			disabeldSignUpBtn();
       		
       		}else{
       			$("#pass02_check").text("비밀번호가 일치합니다. ");
   				$("#pass02_check").css("color", "green");
   				$("#signUpBtn").prop("disabled", false);
					
       		}

       	});
       	
       	//이름 유효성 검사 
       	
       	$("#name").blur(function(){
       		
       		var name = $('#name').val();
       		var krNameCheck = /([^가-힣ㄱ-ㅎㅏ-ㅣ\x20])/i;
       		var specialCheck = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
       								
       		
       		if(name== null || name.length <2){
       			
       	
       			$("#name_check").text("이름은 최소 2글자를 입력해야 합니다. ");
       			$("#name_check").css("color", "red");
       			disabeldSignUpBtn();
   				
       		}else if(krNameCheck.test(name)){
       			
       	
       			$("#name_check").text("이름은 한글만 입력 가능합니다. ");
       			$("#name_check").css("color", "red");
       			disabeldSignUpBtn();
       		
       		}else if(specialCheck.test(name)){
       			
       			$('.focused-input').focus();
       			$("#name_check").text("이름에 특수문자를 사용할 수 없습니다. ");
       			$("#name_check").css("color", "red");
       			disabeldSignUpBtn();
       		
       			
       		}else
   	    		$("#name_check").text("사용 가능한 이름입니다 ");
   				$("#name_check").css("color", "green");
   				$("#signUpBtn").prop("disabled", false);
					

       	});
       	
       	
       	
   		//닉네임 유효성 검사 
   		$('#nickName').change(function(){
       		
       		var nickName = $('#nickName');
       		
     
       		var nickName_length = 0;
   	   		var engCheck = /[a-z]/;
   	   		var numCheck = /[0-9]/;
   	    		
       		
       		var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
       		var specialCheck = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
   			
       		//한글과 영문 길이를 2와 1로 바꾸기
       		//한글은 2, 영문은 1로 치환
       		for(var i=0; i < nickName.val().length;i++){
       			
       			nick = nickName.val().charAt(i);
       			
       			if(escape(nick).length > 4){
       				nickName_length += 2;
       			}else{
       				nickName_length += 1;
       			}
       			
       		}
       		
       	   
   			if(nickName.val()==null || nickName.val().length < 2){
       			
   				
   			
       			$("#nickName_check").text("닉네임은 최소 2자리 이상이어야 합니다. ");
       			$("#nickName_check").css("color", "red");
       			disabeldSignUpBtn();
   				
   			
       		
   			}else if(nickName.val().search(/\s/) !=-1){
   				
   			
   				$("#nickName_check").text("닉네임에는 공백을 포함할 수 없습니다.");
   				$("#nickName_check").css("color", "red");
   				disabeldSignUpBtn();
   			
       		
   				
   			}else if(nickName_length<2||nickName_length>20){
   				
   	
   				$("#nickName_check").text("닉네임은 한글  2~10자 , 영문 및 숫자 2~20자 입니다.");
   				$("#nickName_check").css("color", "red");
   				disabeldSignUpBtn();
   			
   			}else if(specialCheck.test(nickName.val())){
   				
   			
   				$("#nickName_check").text("닉네임에는 특수문자를 포함할 수없습니다.");
   				$("#nickName_check").css("color", "red");
   				disabeldSignUpBtn();
   			
   			
   			}else{
   				
   				var nickName = $('#nickName').val();
   				
   				$.ajax({
   	    			url : "nickNameCheck.me?nickName=" + nickName,
   	    			type : "get",
   	    			success : function(data) {
   	    				
   	    				if(data == 1){
   	    					
   	    					$('.focused-input').focus();
   	    					$("#nickName_check").text("사용중이거나 탈퇴한 닉네임 입니다. ");
   	    					$("#nickName_check").css("color", "red");
   	    					disabeldSignUpBtn();
   	    				}else{
   	    					$("#nickName_check").text("사용 가능한닉네임 입니다.");
   							$("#nickName_check").css("color", "green");
   							$("#signUpBtn").prop("disabled", false);
           				
   	    				}

   					}

   	    		});
   				
   			
   			}

       	});
       	
       	//년도 유효성 검사 

       	$("#yy").blur(function(){
       		
       		var yy = $('#yy').val();
       		var yearPattern = /[0-9]{4}/;
       		
       		var now = new Date();	// 현재 날짜 및 시간
       		var nowYear = now.getFullYear();	// 연도
       		
       		if(!yearPattern.test(yy)){
       			$("#yy_check").text("태어난 년도 4자리를 정확히 입력해주세요.");
       			$("#yy_check").css("color", "red");
       			disabeldSignUpBtn();
				return false;
       		
       		}else if(yy > nowYear){
       			$("#yy_check").text("태어난 년도 4자리를 정확히 입력해주세요.");
       			$("#yy_check").css("color", "red");
       			disabeldSignUpBtn();
       			return false;
       		}else
       			$("#yy_check").text("생년월일을 사용하실수 있습니다.");
   				$("#yy_check").css("color", "green");
   				$("#signUpBtn").prop("disabled", false);
			    console.log(yy);
   				return true;
       		

       	});
       	
       	
       	
       	//날짜 : 일 유효성 검사 
       	
       	$("#dd").blur(function(){
       		
       		var dd = $('#dd').val();
       		
       		
       		
       		
       		if(!(dd>=1 || dd<=31)){
       			$("#yy_check").text("태어난 일(날짜) 를 정확히 입력해주세요.");
       			$("#yy_check").css("color", "red");
       			disabeldSignUpBtn();
       		
       		
       		}else
       			$("#yy_check").text("태어난 일(날짜) 를 사용할 수 있습니다.");
   				$("#yy_check").css("color", "green");
   				$("#signUpBtn").prop("disabled",false);
			
       		

       	});
       	
       	// 남/ 여 선택 유효성 검사 
       	
		function handleOnChange(e){
       		//선택된 데이터 가져오기
       		const value = e.value;
       		
       		//데이터 출력 
       		document.getElementById('ageResult').innerText = value;
       		
       	}
       	
       		
       	
       	
       	//이메일 유효성 검사 
       	$("#email").blur(function(){
       		
       		var email = $('#email').val();
       		var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/; //이메일 유효성 코드
       		
		
       		
       		if(email =="" || email==null){
       			
       			$("#email_check").text("이메일은 필수 입력 사항입니다.");
       			$("#email_check").css("color", "red");
       			disabeldSignUpBtn();
       		
       		}else if(email.search(/\s/) !=-1){
   				
   			
   				$("#email_check").text("이메일에는 공백을 포함할 수 없습니다.");
   				$("#email_check").css("color", "red");
   				disabeldSignUpBtn();
   				
       		
       		}else if(!regex.test(email)){
   			
   			$("#email_check").text("이메일 형식을 정확히 입력해주세요.");
   			$("#email_check").css("color", "red");
   			disabeldSignUpBtn();
   			
    			
    		}else{
    			
    			
				var email = $('#email').val();
   				
   				$.ajax({
   	    			url : "emailCheck.me?email=" + email,
   	    			type : "get",
   	    			success : function(data) {
   	    				
   	    				if(data == 1){
   	    					
   	    					
   	    					$("#email_check").text("사용중이거나 탈퇴한 이메일 입니다. ");
   	    					$("#email_check").css("color", "red");
   	    					disabeldSignUpBtn();
   	    				}else{
   	    					$("#email_check").text("사용 가능한닉네임 입니다.");
   							$("#email_check").css("color", "green");
   							$("#signUpBtn").prop("disabled", false);
           				
   	    				}

   					}

   	    		});
 
    		}
   			
 		
   			

       	}); 		
   		
	
   	//이메일 인증관련 소스 
   	
   	
   	var globalEmailCheckNum = 0;
   	
   	
   	function emailSend(){
   		
   		var email = $('#email').val();
   		var userName = $('#name').val();
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
	        				disabeldSignUpBtn();
	    					
	    				
	        				
	        			}
						
					});

   			}
   			
   			
   			
		
   		});
   		
   	
   	
   		
   	

   	}
		
		
		
		
		
		
		
		
		
		
		</script>
	  
    	

	
    </body>
</html>