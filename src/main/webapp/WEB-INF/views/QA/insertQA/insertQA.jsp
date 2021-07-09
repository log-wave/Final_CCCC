<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&amp;A등록</title>
<link rel="stylesheet" href="<c:url value='/resources/css/style.css/index.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/QA/insertQA/insertQA.css?ver=1.0'/>">
</head>
<body>
	<c:import url="../../common/header.jsp"/>
	<form action="qinsert.qa" method="post" onsubmit="return check();">
	<div class="insertQA_main" align="center">
		<div class="insertQA">
		<input type="hidden" name="buserNo" value="${ loginUser.user_no }">
		<h4>Q&amp;A등록</h4>
		<br><br><br>
			<table id="insertQA_table">
				<tr>
					<td class="title_td">제목</td>
					<td class="second_td"><input type="text" placeholder="제목을 입력해주세요" id="title" name="bTitle"></td>
				</tr>
				<tr>
					<td class="third_td">내용</td>
					<td class="fourth_td"><textarea rows="30" cols="110" id="content" name="bContent"></textarea></td>
				</tr>
			</table>
		</div>
		
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" onclick="location.href='qlist.qa'">목록으로</button> 
		<button id="button1">등록</button>
	</div>
	</form>
	<c:import url="../../common/footer.jsp"/>
	<script>	
		function check() {
			var title = $('#title').val().trim();
			var content = $('#content').val().trim();

			if (title == "") {
				alert('제목을 입력해주세요');
				$('#title').focus();
				return false;
			} else if (content == "") {
				alert('내용을 입력해주세요');
				$('#content').focus();
				return false;
			} else {
				return true;
			}
		}
	</script>
</body>
</html>