<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>

<link href="../../../style.css/index.css" rel="stylesheet" type="text/css">
<link href="noticeList.css" rel="stylesheet" type="text/css">

</head>
<body>
	<c:import url="../../common/header.jsp"/>
	<div class="noticeList_main" align="center">
		<div class="noticeList">
			<h2>공지사항</h2><br><br><br><br><br><br>
			<table id="notice_one">
			<%-- <c:forEach var="b" items="${ list }"> 여기다가 반복문 돌려서 뽑아내면 됨 --%>
				<tr>
					<td class="notice_first_row">레시피 등록 조치 오류 안내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><p>관리자</p></td>
					<td><p>2021-05-31</p></td>
					<td class="notice_last_row"><p>2</p></td>
				</tr>
				<tr>
					<td class="notice_first_row">개인정보처리방침 안내</td>
					<td><p>관리자</p></td>
					<td><p>2021-05-31</p></td>
					<td class="notice_last_row"><p>2</p></td>
				</tr>
				<tr>
					<td class="notice_first_row">홈페이지 이용안내</td>
					<td><p>관리자</p></td>
					<td><p>2021-05-31</p></td>
					<td class="notice_last_row"><p>2</p></td>
				</tr>
				<tr>
					<td class="notice_first_row">[공지] 02월 04(목) 서버 점검 안내</td>
					<td><p>관리자</p></td>
					<td><p>2021-05-31</p></td>
					<td class="notice_last_row"><p>2</p></td>
				</tr>
				<tr>
					<td class="notice_first_row">[안내] 콕콕 쿡쿡 접속 장애 안내</td>
					<td><p>관리자</p></td>
					<td><p>2021-05-31</p></td>
					<td class="notice_last_row"><p>2</p></td>
				</tr>
			</table>
			<br>
			<br>
			<div class="pagingArea">
				<button>&lt;</button>
				<!-- 버튼이 클릭되었을때 기능도 넣어줘야함  -->
				<button>1</button>
				<button>2</button>
				<button>3</button>
				<button>&gt;</button>
			</div>
		</div>
	</div>
	<c:import url="../../common/footer.jsp"/>
</body>
</html>