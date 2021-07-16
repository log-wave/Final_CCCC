<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/index.css" rel="stylesheet" type="text/css">
<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/Event/EventList.css" rel="stylesheet" type="text/css">
</head>
<body>
	<c:import url="../../common/header.jsp?ver=1.0" charEncoding="UTF-8"></c:import>
	<div class="total_area">
	
		<!-- 제목 -->
		<h2 class="title">이벤트</h2>
		<br><br><br>
		<!-- 아이템 하나당 한개씩 -->
			<div class="item" >
					<c:url var="surveydetail" value="surveydetail.sv">
						<c:param name="eventNo" value="${e.eventNo}"/>
						<c:param name ="page" value="${pi.currentPage}"/>
					</c:url>
						<!-- 이벤트 썸네일 -->
						<div class="left">
							<img src="${pageContext.request.contextPath}/resources/uploadFiles/survey2.png" class="event_img">
						</div>
						<!-- 이벤트 제목, 기간 -->
						
						<div class="right">
							<a class="event_Title"  href="${ surveydetail }" > [설문조사] 콕콕 쿡쿡 설문조사에 참여해주세요</a>
							<br><br>
						</div>
			</div>
					
			<c:forEach var="e" items="${ elist }" >
					<div class="item" >
					<c:url var="edetail" value="edetail.ev">
						<c:param name="eventNo" value="${e.eventNo}"/>
						<c:param name ="page" value="${pi.currentPage}"/>
					</c:url>
						<!-- 이벤트 썸네일 -->
						<div class="left">
						<c:forEach var="f" items="${files}"> 
						<c:if test ="${e.eventNo eq f.refNo}">
							<img src="${pageContext.request.contextPath}/resources/uploadFiles/${f.changeName}" class="event_img">
						</c:if>
						</c:forEach>
						</div>
						<!-- 이벤트 제목, 기간 -->
						<div class="right">
							<a class="event_Title" href="${ edetail }">${ e.eventTitle }</a>
							<br><br>
							<p class="event_period">참여기간: ${e.eventStart} ~ ${e.eventEnd}</p>
						</div>
					</div>
			</c:forEach>
		
		
		
		<!-- 페이징 -->
		<div class="pagingArea">
		
				<c:if test="${ pi.currentPage <= 1 }">
					<button>&lt;</button>
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="eventList.ev">
						<c:param name="page" value="${ pi.currentPage - 1 }"/>
					</c:url>
					<a href="${ before }"><button>&lt;</button></a> 
				</c:if>
				
               	<!-- 페이지 -->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<button style = "background: rgba(242, 159, 5, 0.88); color: white" ><b>${ p }</b></button>
					</c:if>  
					
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="pagenation" value="eventList.ev">
							<c:param name="page" value="${ p }"/>
						</c:url>
						<a href="${ pagenation }"><button>${ p }</button></a>
					</c:if>
				</c:forEach>

                <c:if test="${ pi.currentPage >= pi.maxPage }">
					<button>&gt;</button>
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="after" value="eventList.ev">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url> 
					<a href="${ after }"><button>&gt;</button></a>
				</c:if>
                
		</div>
	</div>
	
	
	<c:import url="../../common/footer.jsp" charEncoding="UTF-8"></c:import>
</body>
</html>