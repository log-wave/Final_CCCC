<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 등록</title>
<link rel="stylesheet" href="<c:url value='/resources/css/style.css/index.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/Notice/insertNotice/insertNotice.css?ver=1.0'/>">
</head>
<body>
	<c:import url="../../common/header.jsp"/>
	<form action="binsert.bo" method="post">
	<div class="insertNotice_main" align="center">
		<div class="insertNotice">
		<h4>공지사항 등록</h4>
		<br><br><br>
			<table id="insertNotice_table">
				<tr>
					<td class="title_td">제목</td>
					<td class="second_td"><input type="text" placeholder="제목을 입력해주세요" name="bTitle"></td>
				</tr>
				<tr>
					<td class="third_td">내용</td>
					<td class="fourth_td"><textarea rows="30" cols="110" name="bContent"></textarea></td>
				</tr>
			</table>
		</div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button onclick="location.href='blist.bo'">목록으로</button>
		<button id="button1">등록</button>
	</div>
	</form>
	<c:import url="../../common/footer.jsp"/>
</body>
</html>