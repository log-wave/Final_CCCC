<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&amp;A</title>
<link rel="stylesheet" href="<c:url value='/resources/css/style.css/index.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/QA/qaDetail/qaDetail.css?ver=1.0'/>">
</head>
<body>
	<c:import url="../../common/header.jsp"/>
	<div class="qaDetail_main" align="center">
		<div class="qaDetail">
			<table id="qaDetail_table">
				<tr>
					<td class="title_td">제목</td>
					<td class="second_td" colspan="3">${ board.bTitle }<label>조회 : ${ board.bView }</label></td>
				</tr>
				<tr>
					<td class="title_td">작성자</td>
					<td class="second_td">${ board.nickName }</td>
					<td class="title_td">날짜</td>
					<td class="second_td">${ board.bCreateDate }</td>
				</tr>
				<tr>
					<td class="third_td">내용</td>
					<td class="fourth_td" colspan="3">
						<textarea rows="30" cols="100" style="resize:none;" readonly="readonly" disabled>${ board.bContent }</textarea> 
						<!-- 라벨은 데이터베이스 데이터를 가져와서 뿌리면 띄어쓰기와 엔터가 안먹히므로 textarea로 받아옴 -->
					</td>
				</tr>
			</table>
		</div>
		<c:url var="qupView" value="qupView.qa">
			<c:param name="bNo" value="${ board.bNo }"/>
			<c:param name="page" value="${ page }"/>
		</c:url>
		<c:url var="qdelete" value="qdelete.qa">
			<c:param name="bNo" value="${ board.bNo }"/>
		</c:url>
		<c:url var="qlist" value="qlist.qa">
			<c:param name="page" value="${ page }"/>
		</c:url>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" onclick="location.href='${ qlist }'">목록으로</button>
		<c:if test="${ loginUser != null && loginUser.user_no eq board.bUserNo }">
			<button onclick="location.href='${ qdelete }'">삭제</button> 
			<button id="button1" onclick="location.href='${ qupView }'">수정</button>
	 	</c:if>
	</div>
	<c:import url="../../common/footer.jsp"/>
</body>
</html>