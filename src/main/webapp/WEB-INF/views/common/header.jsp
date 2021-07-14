<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!-- 다시 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/style.css/index.css'/>">
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.6.0.min.js" />"></script>

</head>
<body>

	<div class="header">
		<img id="main_logo" src="${ pageContext.servletContext.contextPath }/resources/images/logo2.png" onclick = "location.href='${pageContext.servletContext.contextPath}'" >
		<div class="header_topBox">
			<select id="search_recipe" name="search_recipe">
			    <option value="">레시피 명</option>
			    <option value="recipe1">민트초코파인애플피자</option>
			    <option value="recipe2">솔의눈박카스라면</option>
			    <option value="recipe3">매운카레순대국</option>
			</select>
			<input type="text">
			<button id="searchBtn">검색</button>
			<img name="main_header_img" src="${ pageContext.servletContext.contextPath }/resources/images/add.PNG"
			onclick="location.href='insertRecipeForm.rp'">
			
			
			<c:choose>
				<c:when test="${!empty loginUser }">
					<div>
						<p style="font-size: 16px;" onclick="location.href='myPage.me'">${loginUser.getNickname()}</p>
					</div>
					<div style="margin-left: 30px;">
						<p style="font-size: 16px" onclick="location.href='logoutPage.me'">logout</p>
					</div>
				</c:when>
				<c:when test="${!empty naverMember }">
					<div>
						<p style="font-size: 16px;" onclick="location.href='myPage.me'">${naverMember.getNickname()}</p>
					</div>
					<div style="margin-left: 30px;">
						<p style="font-size: 16px" onclick="location.href='logoutPage.me'">logout</p>
					</div>
				</c:when>
				<c:otherwise>
					<img name="main_header_img" src="${ pageContext.servletContext.contextPath }/resources/images/login.PNG">
					<label  style="cursor: pointer" onclick="location.href='loginPage.me'">Login</label>
				
				</c:otherwise>
	
			</c:choose>
	
			
			
			<c:if test="${!empty loginUser }">
			<div>
				<p style="font-size: 16px; cursor: pointer;" onclick="location.href='myPage.me'">${loginUser.getNickname()}</p>
			</div>
			<div style="margin-left: 30px;">
				<p style="font-size: 16px; cursor: pointer;" onclick="location.href='logoutPage.me'">logout</p>
			</div>
			</c:if>
		</div>
		
		<div id="container">
	<ul class="myMenu">
		<li class="menu1">주제별 레시피
			<ul class="submenu">
				<li><a href="RList.rp?sort_no=1&&type=1">편의점 요리</a></li>
				<li><a href="RList.rp?sort_no=2&&type=1">간식/야식</a></li>
				<li><a href="RList.rp?sort_no=3&&type=1">술안주</a></li>
				<li><a href="RList.rp?sort_no=4&&type=1">해장요리</a></li>
				<li><a href="RList.rp?sort_no=5&&type=1">손님 접대 요리</a></li>
				<li><a href="RList.rp?sort_no=6&&type=1">나들이 요리</a></li>
				<li><a href="RList.rp?sort_no=7&&type=1">파티/명절요리</a></li>
				<li><a href="RList.rp?sort_no=8&&type=1">일반요리</a></li>
			</ul>
		</li>
		<li class="menu2">재료별 레시피
			<ul class="submenu">
				<li><a href="RList.rp?sort_no=1&&type=2">과일류</a></li>
				<li><a href="RList.rp?sort_no=2&&type=2">어패류</a></li>
				<li><a href="RList.rp?sort_no=3&&type=2">고기류</a></li>
				<li><a href="RList.rp?sort_no=4&&type=2">채소류</a></li>
				<li><a href="RList.rp?sort_no=5&&type=2">유제품/치즈류</a></li>
				<li><a href="RList.rp?sort_no=6&&type=2">감자/고구마류</a></li>
				<li><a href="RList.rp?sort_no=7&&type=2">햄/소시지</a></li>
			</ul>
		</li>
		<li class="menu3">특산물별 레시피
			<ul class="submenu">
				<li><a href="RList.rp?sort_no=1&&type=3">서울</a></li>
				<li><a href="RList.rp?sort_no=2&&type=3">경기도</a></li>
				<li><a href="RList.rp?sort_no=3&&type=3">강원도</a></li>
				<li><a href="RList.rp?sort_no=4&&type=3">충청도</a></li>
				<li><a href="RList.rp?sort_no=5&&type=3">전라도</a></li>
				<li><a href="RList.rp?sort_no=6&&type=3">경상도</a></li>
				<li><a href="RList.rp?sort_no=7&&type=3">제주도</a></li>
			</ul>
		</li>
		<li class="menu4">공지사항/Q&amp;A
			<ul class="submenu">
				<li><a href="blist.bo">공지사항</a></li>
				<li><a href="qlist.qa">Q&amp;A</a></li>
			</ul>
		</li>
		<li class="menu5">이벤트
			<ul class="submenu">
				<li id="eventsubmenu"><a href="eventList.ev">이벤트</a></li>
			</ul>
		</li>
	</ul>
	</div>

	</div>
</body>
</html>