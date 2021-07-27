<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경 </title>
<link rel="stylesheet" href="<c:url value='/resources/css/style.css/index.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/member/login/login.css?ver=1.0'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/member/login/loginUtil.css'/>">
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.6.0.min.js" />"></script>


<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">  
</head>
<body>
   <c:import url="/WEB-INF/views/common/header.jsp?ver=1.0" charEncoding="UTF-8"></c:import>
   <form action="updatepwdwwww.me" method="post">
   <div class="login_box">
      <div class="limiter">
      <div class="container-login100">
         <div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-50">
            
               <span class="login100-form-title p-b-33">
                  비밀번호 변경 
               </span>
               <p style="text-align: center; margin-bottom: 20px;   "><span>01. 아이디 이메일 입력</span>&nbsp;> &nbsp; 02. 본인 확인 &nbsp;>&nbsp; 03.비밀번호 재설정</p>
            <div>
            ${ membervo.user_name }님의 비밀번호를 변경합니다.
            </div>
             <!-- UpdatePwd -->
                <div>
                    <h3 class="join_title"><label for="pswd2">비밀번호 변경</label></h3>
                    <span class="box int_updatepass2_check">
                        <input type="password" id="updatepass" class="int"  maxlength="20">
                    </span>
                    <div style="margin-top: 20px"></div>
                </div>
                 <div id="pass01_check">
                
                
                </div>
                <input type="hidden" value=   ${ membervo.user_id } id="user_id" name="user_id">
                <!-- UpdatePwd2 -->
                <div>
                    <h3 class="join_title"><label for="pswd2">비밀번호 변경 확인</label></h3>
                    <span class="box int_updatepass2_check">
                        <input type="password" id="updatepass2" class="int" name="updatepass2"  maxlength="20">
                    </span>
                    <div style="margin-top: 20px"></div>
                </div>
                 <div id="updatepass2_check">
                </div>
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
   
   /* $('#find_userPassword_btn').on('click', function(){
      var user_pwd = $("#updatepass2").val();
      var user_id = $("#user_id").val();
      console.log(user_id);
      console.log(user_pwd);
      location.href="updatepwdwwww.me;
   });
    */

    
   </script>
   
      
      
   
</body>
</html>