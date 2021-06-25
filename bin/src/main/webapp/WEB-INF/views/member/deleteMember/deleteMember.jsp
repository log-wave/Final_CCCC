<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>

<link href="../../../style.css/index.css" rel="stylesheet" type="text/css">
<link href="deleteMember.css" rel="stylesheet" type="text/css">

</head>
<body>
	<c:import url="../../common/header.jsp"/>
	
	<div class="deleteMember_main" align="center">
		<div class="deleteMember_text">
			<br><br><br><br><br>
			<h2>회원 탈퇴</h2>
			<br><br><br><br>
			<p>탈퇴하면 앞으로 이 계정으로 로그인할 수 없고 이 계정을 다시 복구할 수 없습니다.</p>
			<br>
			<p>* 가입정보를 변경하고 싶다면 회원정보수정에서 변경할 수 있습니다.</p>
			<br>
			<p>* 회원탈퇴를 원하시면 비밀번호를 입력 후 확인 버튼을 눌러주세요.</p>
			<br><br>
			<input type="password" placeholder="비밀번호를 입력해주세요"><br>
			
			<button>취소</button> &nbsp;&nbsp;&nbsp;
			<button id="button1">확인</button>
		</div>
	</div>
	<c:import url="../../common/footer.jsp"/>
</body>
</html>