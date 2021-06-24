<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link href="../../../style.css/index.css" rel="stylesheet" type="text/css">
<link href="noticeDetail.css" rel="stylesheet" type="text/css">
</head>
<body>
	<c:import url="../../common/header.jsp"/>
	<div class="noticeDetail_main" align="center">
		<div class="noticeDetail">
			<table id="noticeDetail_table">
				<tr>
					<td class="title_td">제목</td>
					<td class="second_td" colspan="3">[안내] 콕콕 쿡쿡 접속 장애 안내<label>조회:2</label></td>
				</tr>
				<tr>
					<td class="title_td">작성자</td>
					<td class="second_td">관리자</td>
					<td class="title_td">3</td>
					<td class="second_td">4</td>
				</tr>
				<tr>
					<td class="third_td">내용</td>
					<td class="fourth_td" colspan="3">
						<label>
							안녕하세요.<br>
							콕콕 쿡쿡 입니다.<br>
							<br>
							2021년 1월 31일 오후 1시경에 발생한 홈페이지 접속 장애로 인해<br>
							서비스 이용에 불편을 끼쳐드려 대단히 죄송합니다.<br>
							<br>
							현재 문제에 대한 조치가 완료되어 정상적인 서비스 이용이 가능합니다.<br>
							이후 원활한 서비스 제공을 위해 지속적으로 확인해<br>
							<br>
							서비스 이용에 불편이 없도록 최선을 다하겠습니다.<br>
							<br>
							다시 한번 서비스 이용에 불편을 드려 죄송합니다.<br>
						</label>
					</td>
				</tr>
			</table>
		</div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button>삭제</button> 
		<button id="button1">수정</button>
	</div>
	<c:import url="../../common/footer.jsp"/>
</body>
</html>