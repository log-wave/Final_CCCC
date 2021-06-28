<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="header">
		<img id="main_logo" src="${ pageContext.servletContext.contextPath }/resources/images/cccc_logo.PNG">
		<div class="header_topBox">
			<select id="search_recipe" name="search_recipe">
			    <option value="">레시피 명</option>
			    <option value="recipe1">민트초코파인애플피자</option>
			    <option value="recipe2">솔의눈박카스라면</option>
			    <option value="recipe3">매운카레순대국</option>
			</select>
			<input type="text">
			<button>검색</button>
			<img name="main_header_img" src="${ pageContext.servletContext.contextPath }/resources/images/add.PNG">
			<c:if test="${empty loginUser}">
			
			<img name="main_header_img" src="${ pageContext.servletContext.contextPath }/resources/images/login.PNG">
			<label onclick="location.href='loginPage.me'">Login</label>
			
			</c:if>
			
			
			<c:if test="${!empty loginUser }">
			<div>
				<p style="font-size: 16px;">${loginUser.getNickname()}</p>
			</div>
			<div style="margin-left: 30px;">
				<p style="font-size: 16px" onclick="location.href='logoutPage.me'">logout</p>
			</div>
			</c:if>
			</div>
		
		<div id="container">
	<ul class="myMenu">
		<li class="menu1">주제별 레시피
			<ul class="submenu">
				<li>편의점 요리</li>
				<li>간식/야식</li>
				<li>술안주</li>
				<li>해장요리</li>
				<li>손님 접대 요리</li>
				<li>나들이 요리</li>
				<li>파티/명절요리</li>
			</ul>
		</li>
		<li class="menu2">재료별 레시피
			<ul class="submenu">
				<li>과일류</li>
				<li>어패류</li>
				<li>고기류</li>
				<li>채소류</li>
				<li>유제품/치즈류</li>
				<li>감자/고구마류</li>
				<li>햄/소시지</li>
			</ul>
		</li>
		<li class="menu3">특산물별 레시피
			<ul class="submenu">
				<li>서울</li>
				<li>경기도</li>
				<li>강원도</li>
				<li>충청도</li>
				<li>전라도</li>
				<li>경상도</li>
				<li>제주도</li>
			</ul>
		</li>
		<li class="menu4">공지사항/Q&amp;A
			<ul class="submenu">
				<li>공지사항</li>
				<li>Q&amp;A</li>
			</ul>
		</li>
		<li class="menu5">이벤트
			<ul class="submenu">
				<li>이벤트</li>
			</ul>
		</li>
	</ul>
	</div>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	</div>
</body>
</html>