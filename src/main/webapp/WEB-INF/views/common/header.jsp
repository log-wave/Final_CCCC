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
			<img name="main_header_img" src="${ pageContext.servletContext.contextPath }/resources/images/documents.PNG">
			
			<c:if test="${empty loginUser}">
			
			<img name="main_header_img" src="${ pageContext.servletContext.contextPath }/resources/images/login.PNG">
			<label onclick="location.href='loginPage.me'">Login</label>
			
			</c:if>
			
			
			<c:if test="${!empty loginUser }">
			<div>${loginUser.getNickname()}</div>
			</c:if>
			
			
			
			
			
		</div>
		<div class="header_downBox">
			<label>주제별 레시피</label>
			<label>재료별 레시피</label>
			<label>특산물별 레시피</label>
			<label>공지사항/Q&A</label>
			<label onclick="location.href='eventList.ev'">이벤트로 이동합니다</label>
		</div>
	</div>
</body>
</html>