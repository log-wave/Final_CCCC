<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<!-- 다시 -->
<link rel="stylesheet" href="<c:url value='/resources/css/style.css/index.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/Notice/noticeList/noticeList.css?ver=1.0'/>">

</head>
<body>
	<c:import url="../../common/header.jsp"/>
	<br><br>
	<div class="noticeList_main" align="center">
		<div class="noticeList">
			<h2>공지사항</h2><br><br><br><br>
			<table id="notice_one">
			<c:forEach var="b" items="${ list }">
			<tr>
				<td align="left">
					<c:url var="bdetail" value="bdetail.bo">
						<c:param name="bNo" value="${ b.bNo }"/>
						<c:param name="page" value="${ pi.currentPage }"/>
					</c:url>
					<a href="${ bdetail }">${ b.bTitle }</a>
			</td>
			<td align="center">${ b.nickName }</td>
			<td align="center">${ b.bCreateDate }</td>
			<td align="center">${ b.bView }</td>
			</tr>
			</c:forEach>	
			</table>
			<c:if test="${ loginUser.user_id eq 'admin' }">
				<button onclick="location.href='binsertView.bo';">작성하기</button>
	 		</c:if>
			<br>
			<br>
			<br>
			<br>
	</div>
	
		<table class="pagingArea">	
		<!-- 페이징 처리 -->
		<tr align="center" height="20" id="buttonTab">
			<td colspan="6">
			
				<!-- [이전] -->
				<c:if test="${ pi.currentPage <= 1 }">
						<button>&lt;</button>
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="blist.bo">
						<c:param name="page" value="${ pi.currentPage - 1 }"/>
					</c:url>
					<a href="${ before }"><button>&gt;</button></a> 
				</c:if>
				
				<!-- 페이지 -->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<button style = "background: rgba(242, 159, 5, 0.88); color: white" ><b>${ p }</b></button>
					</c:if>
					
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="pagination" value="blist.bo">
							<c:param name="page" value="${ p }"/>
						</c:url>
						<a href="${ pagination }"><button>${ p }</button></a>
					</c:if>
				</c:forEach>
				
				<!-- [다음] -->
				<c:if test="${ pi.currentPage >= pi.maxPage }">
					<button>&gt;</button>
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="after" value="blist.bo">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url> 
					<a href="${ after }"><button>&gt;</button></a>
				</c:if>
			</td>
		</tr>
		</table>
		</div>
	<c:import url="../../common/footer.jsp"/>
</body>
</html>