<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="<c:url value='/resources/css/style.css/index.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/Notice/noticeDetail/noticeDetail.css?ver=1.0'/>">
</head>
<body>

	<div class="noticeDetail_main" align="center">
		<div class="noticeDetail">
			<table id="noticeDetail_table">
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
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" onclick="window.close();">돌아가기</button>
		<button id="button1">수정</button>
	 	
	</div>
	
	<script>
		$('#button1').on('click', function(){
			location.href = '<%=request.getContextPath()%>/bupView.bo?bNo=' + '${ board.bNo }';
		});
	</script>
	
</body>
</html>