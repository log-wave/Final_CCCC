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
<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/admin/speciality/detailSpeForm.css" rel="stylesheet" type="text/css">
<body>
	<br><br>
    <div class="page">
    <form>
    <div class="spe_main">
        <div class="spe_title">특산물 상세보기</div>
		<br>  <br>  <br>
        <div class="input_speName">
            <div class="spe_label"> 지역명 : </div> ${spe.specialityRegion}</div>
        <div class="input_speName">
            <div class="spe_label"> 특산물명 : </div> ${spe.specialityName}
        </div>
        <div class="input_speName">
            <div class="spe_label"> 특산물 정보  </div> <br>
            <textarea id="speInfo" style= "width: 255px; height: 150px ; resize: none"> ${spe.specialityInfo} </textarea>
        </div>
    </div>
    
    </form>
    	<div class="btn_area">
            <button class="cnbtn" onclick="window.close()">닫기</button>
        </div>
    </div>
</body>
</html>