<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
 <link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/admin_main.css" rel="stylesheet" type="text/css">
 
</head>
<body>
	<div class="admin_menu">
		<div class="menu_label" align="center">
			<label class="admin_menu_nav" id="admin_user.me">사용자 관리</label><br><br><br>
			<label class="admin_menu_nav" id="admin_recipe.re">레시피 관리</label><br><br>
			<label class="admin_menu_nav" id="admin_material">재료 관리</label><br><br>
			<label class="admin_menu_nav" id="admin_speciality">지역특산물 관리</label><br><br>
			<label class="admin_menu_nav" id="admin_qaboard">Q&A 게시판 관리</label><br><br>
			<label class="admin_menu_nav" id="admin_board">공지사항 관리</label><br><br>
			<label class="admin_menu_nav" id="admin_event">이벤트 관리</label><br><br>
			<label class="admin_menu_nav" id="admin_survey">설문조사 관리</label><br><br>
			<label class="admin_menu_nav" id="">통계 관리</label><br><br><br>
			<label class="admin_menu_nav" id="logout">관리자 로그아웃</label>
		</div>
	</div>
	
	<script>
		$('.admin_menu_nav').click(function() {
			location.href='<%=request.getContextPath()%>/' + $(this).attr('id');
		});
	</script>
</body>
</html>