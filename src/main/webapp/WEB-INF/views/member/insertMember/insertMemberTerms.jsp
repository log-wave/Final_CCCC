<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입/이용약관</title>

<link rel="stylesheet" href="<c:url value='/resources/css/style.css/index.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/member/insertMember/insertMemberTerms.css'/>">
	
</head>
<body>
	<c:import url="../../common/header.jsp"/>
	<div class="insertMember_main" align="center">
		<div class="insertMember_terms">
			<label>이용약관, 개인정보 수집 및 이용에 모두 동의합니다.</label>
			<input type="checkbox" id="all" value="전체선택"  onclick="selectAll();">
			<hr>
			<label>콕콕!쿡쿡! 이용약관 동의</label>
			<input type="checkbox" id="terms" name="category" value="이용약관" onclick="selectOne();" required><br>
			<textarea rows="10" cols="60" readonly></textarea><br>
			
			<label>개인정보 수집 및 이용에 대한 안내</label><a href="${ contextPath }">[전체보기]</a>
			<input type="checkbox" id="info" name="category" value="개인정보" onclick="selectOne();" required><br>
			<textarea rows="8" cols="60" readonly></textarea>
			<hr>
			
			<label>만 14세 이상입니다.(필수)</label>
			<input type="checkbox" id="ages" name="category" value="연령확인" onclick="selectOne();" required><br>
		</div>
		<button id="button1">동의</button>
		<button id="button2">비동의</button>
	</div>
	
	<c:import url="../../common/footer.jsp"/>
	
	<script>
		var all = document.getElementById("all");
		var category = document.getElementsByName("category");
		
		function selectAll(){
			if(all.checked){
				for(var i = 0; i < category.length; i++){
					category[i].checked = true;
				}
			} else {
				for(var i = 0; i < category.length; i++){
					category[i].checked = false;
				}
			}
		}
		
		function selectOne(){
			var count = 0;
			
			for(var i = 0; i < category.length; i++){
				if(category[i].checked){
					count++;
				}
			}
			
			if(count != 12){
				all.checked = false;
			} else {
				all.checked = true;
			}
		}
	</script>
</body>
</html>