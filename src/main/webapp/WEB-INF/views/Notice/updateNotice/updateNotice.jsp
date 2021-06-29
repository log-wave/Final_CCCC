<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
<link rel="stylesheet" href="<c:url value='/resources/css/style.css/index.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/Notice/updateNotice/updateNotice.css?ver=1.0'/>">
</head>
<body>
	<c:import url="../../common/header.jsp"/>
	<form action="bupdate.bo" method="post">
	<div class="insertNotice_main" align="center">
		<div class="insertNotice">
		<input type="hidden" name="page" value="${ page }">
		<input type="hidden" name="bNo" value="${ board.bNo }">
		<h4>공지사항 수정</h4>
		<br><br><br>
			<table id="insertNotice_table">
				<tr>
					<td class="title_td">제목</td>
					<td class="second_td"><input type="text" name="bTitle" value="${ board.bTitle }"></td>
				</tr>
				<tr>
					<td class="third_td">내용</td>
					<td class="fourth_td"><textarea rows="30" cols="110" name="bContent">${ board.bContent }</textarea></td>
				</tr>
			</table>
		</div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" onclick="location.href='javascript:history.go(-1);'">이전페이지로</button>
		<button id="button1">수정하기</button>
		<c:url var="blist" value="blist.bo">
			<c:param name="page" value="${ page }"/>
		</c:url>
	</div>
	</form>
	<c:import url="../../common/footer.jsp"/>
</body>
</html>