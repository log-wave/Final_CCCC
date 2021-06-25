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
		<div class="title"><p>이벤트<p></div>
		
		<!-- 아이템 하나당 한개씩 -->
		<div class="item">
			<!-- 이벤트 썸네일 -->
			<div class="left">
				<img src="${ pageContext.servletContext.contextPath }/resources/images/event/event1.png" class="event_img">
			</div>
			
			<!-- 이벤트 제목, 기간 -->
			<div class="right">
				<p class="event_Title">나만의 감자요리 레시피를 알려주세요</p>
				<p class="event_period">참여기간:2021.06.05 ~ 2021.07.05</p>
			</div>
		</div>
		
		<c:forEach var="e" items="${ elist }">
		<div class="item">
			<div class="left">
				<img src="${ pageContext.servletContext.contextPath }/resources/images/event/event2.png" class="event_img">
			</div>
			<div class="right">
				<p class="event_Title">${e.eventTitle}</p>
				<p class="event_period">참여기간:${e.eventStart} ~ ${e.eventEnd}</p>
			</div>
		</div>
		</c:forEach>
		
		
		
		<!-- 페이징 -->
		<div class="pagingArea">
			<button>&lt;</button>
                <!-- 버튼이 클릭되었을때 기능도 넣어줘야함  -->
                <button>1</button>
                <button>2</button>
                <button>3</button>
                <button>&gt;</button>
		</div>
	</div>
	
	
	<c:import url="../../common/footer.jsp" charEncoding="UTF-8"></c:import>
</body>
</html>