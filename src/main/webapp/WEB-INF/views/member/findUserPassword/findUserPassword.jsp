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
   
   
   <form action="PwdupdatePage.me" method="post">
   <div class="login_box">
      <div class="limiter">
      <div class="container-login100">
         <div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-50">
            
               <span class="login100-form-title p-b-33">
                  비밀번호 찾기 
               </span>
               <p style="text-align: center; margin-bottom: 20px;   "><span>01. 아이디 이메일 입력</span>&nbsp;> &nbsp; 02. 본인 확인 &nbsp;>&nbsp; 03.비밀번호 재설정</p>
               <div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
                  <input class="input100 user_id" type="text" name="user_id" id="user_id" placeholder="아이디">
                  <span class="focus-input100-1"></span>
                  <span class="focus-input100-2"></span>
               </div>
                <div id="id_check">
                
                    </div>
   
               <div class="wrap-input100 rs1 validate-input" data-validate="Password is required">
                  <input class="input100 email" type="text"  name="email" id="email" placeholder="이메일" maxlength="100">
                  <span class="focus-input100-1"></span>
                  <span class="focus-input100-2"></span>
               </div>
               <div id="email_check">
                           
                  </div><br>
            

               <div class="container-login100-form-btn m-t-20">
                  <button class="login100-form-btn" id="find_userPassword_confirmBtn" type="button" disabled="disabled" onclick="emailSend()">
                     인증번호 받기
                  </button>
               </div>
               <div class="wrap-input100 validate-input" style="margin-top: 30px;">
                  <input class="input100 email_confirm" type="text" name="email_confirm" placeholder="이메일 인증번호">
                  <span class="focus-input100-1"></span>
                  <span class="focus-input100-2"></span>
               </div>
               <div id="email_confirmCheck"></div>   
               <div class="container-login100-form-btn m-t-20">
               
               <button class="login100-form-btn"  id="find_userPassword_btn" type="submit">
                  입력 완료
               </button>
               
               </div>
         </div>
      </div>
   </div>
   </div>
   </form>
   
   <c:import url="/WEB-INF/views/common/footer.jsp" charEncoding="UTF-8"></c:import>
   <script type="text/javascript">
   
   
   $(function(){
      $("#find_userPassword_btn").prop("disabled", true);
      $("#find_userPassword_btn").css("background-color", "#E2E2E2");
      $("#find_userPassword_confirmBtn").prop("disabled", true);
      $("#find_userPassword_confirmBtn").css("background-color", "#E2E2E2");
   });
   
   function disabeldSignUpBtn(){
      
      $("#find_userPassword_btn").prop("disabled", true);
      $("#find_userPassword_btn").css("background-color", "#E2E2E2");
      
   }
   
   function disabeldemailBtn(){
      
      $("#find_userPassword_confirmBtn").prop("disabled", true);
      $("#find_userPassword_confirmBtn").css("background-color", "#E2E2E2");
      
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
               
               $("#id_check").text("아이디가 정상적으로 입력되었습니다.");
               $("#id_check").css("color", "green");
               
            }else{
               $("#id_check").text("존재하지 않는 아이디입니다.");
               $("#id_check").css("color", "red");
               disabeldSignUpBtn();
               return false;
            }
         }
      });
   }
});
    
   
   
   
   
   
   
    $("#email").blur(function(){
         
         var email = $('#email').val();
         var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/; //이메일 유효성 코드
         console.log(email);
   
         
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
         
         var user_id = $('#user_id').val();
         var email = $('#email').val();
         $.ajax({
            url : 'idEmailCheck.me',
            type : "GET",
            data : { user_id:user_id, email:email },
            success : function(data) {
               
               if(data != 1){
                  $("#email_check").text("아이디와 이메일이 일치하지 않습니다.");
                  $("#email_check").css("color", "red");
                  disabeldSignUpBtn();
                  return false;
                  
                  
               }else{
                  $("#email_check").text("아이디와 이메일이 일치합니다.");
                  $("#email_check").css("color", "green");
                  $("#find_userPassword_confirmBtn").prop("disabled",false);
                  $("#find_userPassword_confirmBtn").css("background-color", "rgb(242, 159, 5)");
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
               $("#find_userPassword_btn").prop("disabled", false);
               
               console.log(data);
                  console.log(data.checkNum);
               
               function trans(){
                  
                  globalEmailCheckNum = data.checkNum;
                  
               }
               
               trans();
               console.log("전역변수:" + globalEmailCheckNum);      
               
               $("#email_confirmCheck").blur(function(){
                  
                  var email_confirm = $('#email_confirmCheck').val();
                   
                   if(email_confirm == globalEmailCheckNum){
                       $("#email_confirmCheck").text("이메일 인증번호가 일치합니다.");
                      $("#email_confirmCheck").css("color", "green");
                      $("#find_userPassword_btn ").prop("disabled", false);
                      $("#find_userPassword_btn").css("background-color", "rgb(242, 159, 5)");
                      
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
   
      
      
   
</body>
</html>