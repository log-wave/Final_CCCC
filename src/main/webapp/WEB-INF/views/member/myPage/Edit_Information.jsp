<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>내 정보수정</title>

<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.6.0.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/js/member/member.js" />"></script>


<link rel="stylesheet" href="<c:url value='/resources/css/member/myPage/Edit_Information.css?ver=1.0'/>">

</head>
<body>
        <!-- header -->
        <div id="header">
           <img class="main_image" class="map_image" src="resources/images/cccc_logo.PNG	"/>
        </div>

		<form name="frm" action="Edit_MyInform.me" method="post">
        <!-- wrapper -->
        <div id="wrapper">

            <!-- content-->
            <div id="content">

                <!-- ID -->
                <div>
                    <h3 class="join_title">
                        <label for="id">아이디(변경 불가)</label>
                    </h3>
                    <span class="box int_id">
                        <input type="text"  name="user_id" id="user_id" class="int" maxlength="20" value=${ loginUser.user_id } readonly>
                    </span>
                </div>
                <div id="id_check">
                
                
                </div>
                

                <!-- PW1 -->
                <div>
                	<input type="hidden" id="SessionPwd" name="SessionPwd" value=${ loginUser.user_password }>
                    <h3 class="join_title"><label for="pswd1">현재 비밀번호</label></h3>
                    <span class="box int_pass">
                        <input type="password" name="user_password" id="pass01" class="int" maxlength="20">
                    </span>
                   <div style="margin-top: 20px"></div>
                </div>
                 <div id="pass01_check">
                
                
                </div>

 				<!-- NAME -->
                <div>
               		<input type="hidden" id="Sessionname" name="Sessionname" value=${ loginUser.user_name }>
                    <h3 class="join_title"><label for="name">이름</label></h3>
                    <span class="box int_name">
                        <input type="text" name="user_name" id="name" class="int"  maxlength="20" value=${ loginUser.user_name }>
                    </span>		
                </div>
                 <div id="name_check">
                
                
                </div>
                
                <!-- NICKNAME -->
                <div>
               		<input type="hidden" id="SessionNick" name="SessionNick" value=${ loginUser.nickname }>
                    <h3 class="join_title"><label for="nickName">닉네임</label></h3>
                    <span class="box int_nickName">
                        <input type="text" name="nickname" id="nickName" class="int" maxlength="20" value=${ loginUser.nickname }>
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
				<c:url var="myPage" value="myPage.me">
				<c:param name="page" value="${ page }"/>
				</c:url>
         
            
                <!-- JOIN BTN-->
                <div class="btn_area">
                    <button type="submit" id="signUpBtn" style="background: #F29F05; cursor: pointer;">
                        	수정하기
                    </button>
                    <button type="button" id="cancelBtn" style="background: #F29F05; border-top:1px solid black; cursor: pointer;" onclick="location.href='${ myPage }'">
                        	뒤로가기
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

		//비밀번호 유효성 검사 
       	$("#pass01").blur(function(){
       		
       		var pass01 = $('#pass01').val();
       		var sessionPwd = $('#SessionPwd').val();
       		 if(pass01 != sessionPwd){
       			 $("#pass01_check").text("비밀번호가 올바르지 않습니다.");
     			 $("#pass01_check").css("color", "red");
       			 disabeldSignUpBtn();
       			$("#pass01_check").focus();
   				
       		 }else{
       			 $("#pass01_check").text("비밀번호가 일치합니다. ");
   				 $("#pass01_check").css("color", "green");
   				 $("#signUpBtn").prop("disabled", false);
					
       		 }
       		 
       		
       		
       		
       	});
       	
       	//이름 유효성 검사 
       	
       	$("#name").blur(function(){
       		var sessionname = $('#Sessionname').val();
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
       		
       			
       		}else if(name == sessionname){
   	    		$("#name_check").text("이름을 변경하지 않습니다.");
   				$("#name_check").css("color", "green");
   				$("#signUpBtn").prop("disabled", false);
       		}else{
       			$("#name_check").text("사용 가능한 이름입니다. ");
   				$("#name_check").css("color", "green");
   				$("#signUpBtn").prop("disabled", false);
       		}

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
   				return true;
       		

       	});
       	
       	
       	
       	//날짜 : 일 유효성 검사 
       	
       	$("#dd").keyup(function(){
       		
       		var cc = $('#dd').val();
       		var dd = parseInt(cc);
       		console.log("dd는 :" +  dd);
       		
       		
       		
       		if(!(dd>=1 || dd<=31)){
       			$("#yy_check").text("태어난 일(날짜) 를 정확히 입력해주세요.");
       			$("#yy_check").css("color", "red");
       			disabeldSignUpBtn();
       		
       		
       		}else
       			$("#yy_check").text("태어난 일(날짜) 를 사용할 수 있습니다.");
   				$("#yy_check").css("color", "green");
   				$("#signUpBtn").prop("disabled", false);
				$("#signUpBtn").css("background-color", "rgb(242, 159, 5)");
			
       		

       	});
       	
		</script>
	  
    	

	
    </body>
</html>