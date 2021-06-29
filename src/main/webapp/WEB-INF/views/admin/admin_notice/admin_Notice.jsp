<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 관리</title>


<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/admin/admin_Notice.css" rel="stylesheet" type="text/css">
<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/admin_index.css" rel="stylesheet" type="text/css">
</head>
<body>
	<c:import url="/WEB-INF/views/admin/admincommon/header.jsp" charEncoding="UTF-8"></c:import>
    <c:import url="/WEB-INF/views/admin/admincommon/Main.jsp" charEncoding="UTF-8"></c:import>
    <div class="page">
	    <h2 id="title"> 공지사항 목록 </h2>
	    <br>
	    	<div class="notice_list">
	    	<hr>
			<br>
	    		<table class="notice_Table">
	    			<tr>
	    				<th  width="80px">번호</th>
	    				<th  width="150px">제목</th>
	    				<th  width="500px">내용</th>
	    				<th  width="90px"><input type="checkbox">전체선택</th>
	    			</tr>
	    			<c:if test="${ list != null }">
					<c:forEach var="ad" items="${ list }">
			    		<tr>
			    			<td>${ ad.bNo }</td>
			    			<td style="border-left: 1px solid black">${ ad.bTitle}</td>
			    			<td style="border-left: 1px solid black">${ ad.bContent }</td>
			    			<td width="90px" style="border-left: 1px solid black"><input type="checkbox" name="mem_select" onclick="selectone();"></td>
			    		</tr>
				
	    			
	    		
	    			<%-- <c:url var="bdetail" value="bdetail.bo"> --%>
						<%-- <c:param name="bId" value="${  }"/>
						<c:param name="page" value="${ pi.currentPage }"/> --%>
					<%-- </c:url> --%>
					<%-- <a href="${ bdetail }">${ b.bTitle }</a> --%>
	    			</c:forEach>
	    		</c:if>
	    		<c:if test="${ list == null }">
					<tr>
						<td colspan="6">조회된 리스트가 없습니다.</td>
					</tr>
				</c:if>
	    			
	    		</table>
	    	<br><hr><br>
	    	<div class="buttonArea">
				<button id="delete_no">공지 삭제</button>
	    	</div>
    	</div>
    	
    	<!-- 페이징 -->
			<table id="pagingArea">	
		<!-- 페이징 처리 -->
			<tr align="center" height="20" id="buttonTab">
				<td colspan="6">
				
					<!-- [이전] -->
					<c:if test="${ pi.currentPage <= 1 }">
						<button>&lt;</button>
					</c:if>
					<c:if test="${ pi.currentPage > 1 }">
						<c:url var="before" value="adminBoard.ad">
							<c:param name="page" value="${ pi.currentPage - 1 }"/>
						</c:url>
						<a href="${ before }"><button>&lt;</button></a>
					</c:if>
					
					<!-- 페이지 -->
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:if test="${ p eq pi.currentPage }">
							<button><font color="red" size="4"><b>${ p }</b></font></button>
						</c:if>
						
						<c:if test="${ p ne pi.currentPage }">
							<c:url var="pagination" value="adminBoard.ad">
								<button><c:param name="page" value="${ p }"/></button>
							</c:url>
							<a href="${ pagination }"><button>${ p }</button></a>
						</c:if>
					</c:forEach>
					
					<!-- [다음] -->
					<c:if test="${ pi.currentPage >= pi.maxPage }">
						<button>&gt;</button>
					</c:if>
					<c:if test="${ pi.currentPage < pi.maxPage }">
						<c:url var="after" value="adminBoard.ad">
							<button><c:param name="page" value="${ pi.currentPage + 1 }"/></button>
						</c:url> 
						<a href="${ after }"><button>&gt;</button></a>
					</c:if>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>