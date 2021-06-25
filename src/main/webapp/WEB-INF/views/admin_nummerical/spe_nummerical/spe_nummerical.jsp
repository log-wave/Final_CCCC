<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통계 관리</title>


<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/admin/nummerical/spe_nummerical.css" rel="stylesheet" type="text/css">
<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/admin_index.css" rel="stylesheet" type="text/css">
</head>
<body>
	<c:import url="/WEB-INF/views/admincommon/header.jsp" charEncoding="UTF-8"></c:import>
    <c:import url="/WEB-INF/views/admincommon/Main.jsp" charEncoding="UTF-8"></c:import>
    <div class="page">
	    <h2 id="title"> 설문조사 통계 </h2>
	    <br><br>
	    	<hr>
	    	<div class="buttonArea">
	    	   <br>
	    	   	<button>레시피&재료 관련 통계</button>
				<button>설문조사 통계</button>
				<button>사용자 통계</button>
    		</div>
    		<br><br>
    		<div class="spe_nummerical">
    			<div class="spe_list">
	    			<h3>재료별 특산물 등록 통계</h3>
	    			<img src="${ pageContext.servletContext.contextPath }/resources/images/sep_nummerical.png" width="500" height="300">
    			</div>
    			<div class="spe_list">
	    			<h3>지역 특산물 통계</h3>
	    			<img src="${ pageContext.servletContext.contextPath }/resources/images/sep_nummerical.png" width="500" height="300">
    			</div>
    			<div class="spe_list">
	    			<h3>월별 레시피 등록 통계</h3>
	    			<img src="${ pageContext.servletContext.contextPath }/resources/images/sep_nummerical.png" width="500" height="300">
    			</div>
			</div>
	   
    		
    		
    		
	</div>
</body>
</html>