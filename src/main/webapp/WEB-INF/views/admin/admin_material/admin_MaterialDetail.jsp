<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<title>재료 상세 페이지</title>
</head>
<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/admin/material/detailMateForm.css" rel="stylesheet" type="text/css">
<body>
	<br><br>
    <div class="page">
    <form>
    <div class="mate_main">
        <div class="mate_title">재료 상세보기</div>
		<br>  <br>  <br>
        <div class="input_mateName">
            <div class="mate_label" >재료명 : </div> ${material.materialName }</div>
        <div class="input_mateName">
            <div class="mate_label">기준 : </div> ${material.standard}
        </div>
        
        <div class="input_mateName">
            <div class="mate_label"> 분류 : </div>
            <c:choose>
				<c:when test="${material.classFi eq  '1'}">곡류</c:when>
				<c:when test="${material.classFi eq  '2'}">면/만두류</c:when>
				<c:when test="${material.classFi eq  '3'}">빵류</c:when>
				<c:when test="${material.classFi eq  '4'}">과자류</c:when>
				<c:when test="${material.classFi eq  '5'}">떡류</c:when>
				<c:when test="${material.classFi eq  '6'}">감자/고구마류</c:when>
				<c:when test="${material.classFi eq  '7'}">묵/두부</c:when>
				<c:when test="${material.classFi eq  '8'}">콩/견과류</c:when>
				<c:when test="${material.classFi eq  '9'}">채소류</c:when>
				<c:when test="${material.classFi eq  '10'}">과일류</c:when>
				<c:when test="${material.classFi eq  '11'}">고기류</c:when>	
				<c:when test="${material.classFi eq  '12'}">햄/소시지</c:when>
				<c:when test="${material.classFi eq  '13'}">계란류</c:when>
				<c:when test="${material.classFi eq  '14'}">어패류</c:when>
				<c:when test="${material.classFi eq  '15'}">해조류</c:when>
				<c:when test="${material.classFi eq  '16'}">유제품/치즈류</c:when>
				<c:when test="${material.classFi eq  '17'}">양념류</c:when>
				<c:when test="${material.classFi eq  '18'}">초콜렛/사탕</c:when>
				<c:when test="${material.classFi eq  '19'}">음주/주류</c:when>
				<c:when test="${material.classFi eq  '20'}">가공재료</c:when>
				<c:when test="${material.classFi eq  '21'}">기타</c:when>
				<c:when test="${material.classFi eq  '22'}">버섯류</c:when>
				<c:when test="${material.classFi eq  '23'}">향신료</c:when>
				<c:otherwise> - </c:otherwise>
			</c:choose>
        </div>
        <div class="mate_ingre">
            <br><br><br>
            <div class="input_mateName">
           			 <div class="mate_label">칼로리 : </div>${ material.kcal }</div>
	         
	         <div class="input_mateName">
           			 <div class="mate_label">단백질 : </div>${ material.protein }
	        </div>
	        
	         <div class="input_mateName">
        		    <div class="mate_label">지방 : </div>${ material.fat }
	        </div>
	        
	        <div class="input_mateName">
           			 <div class="mate_label">탄수화물 : </div>${ material.carbo }
	        </div>
	        
	        <div class="input_mateName">
            		<div class="mate_label">당류 : </div>${ material.sugar }
	        </div>
		<br>
        </div>
    </div>
    </form>
    	<div class="btn_area">
            <button class="cnbtn" onclick="window.close()">닫기</button>
        </div>
    </div>
</body>
</html>