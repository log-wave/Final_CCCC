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
					<!-- 페이징 처리 -->
		<tr align="center" height="20" id="buttonTab">
			<td colspan="6">
			
				<!-- [이전] -->
				<c:if test="${ pi.currentPage <= 1 }">
					[이전] &nbsp;
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="blist.bo">
						<c:param name="page" value="${ pi.currentPage - 1 }"/>
					</c:url>
					<a href="${ before }">[이전]</a> &nbsp;
				</c:if>
				
				<!-- 페이지 -->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<font color="red" size="4"><b>[${ p }]</b></font>
					</c:if>
					
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="pagination" value="blist.bo">
							<c:param name="page" value="${ p }"/>
						</c:url>
						<a href="${ pagination }">${ p }</a> &nbsp;
					</c:if>
				</c:forEach>
				
				<!-- [다음] -->
				<c:if test="${ pi.currentPage >= pi.maxPage }">
					[다음]
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="after" value="blist.bo">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url> 
					<a href="${ after }">[다음]</a>
				</c:if>
			</td>
		</tr>
		</div>
	</div>
	<c:import url="../../common/footer.jsp"/>
</body>
</html>