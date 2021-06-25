<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 관리</title>


<link href="admin_Notice.css" rel="stylesheet" type="text/css">
<link href="../../style.css/admin_index.css" rel="stylesheet" type="text/css">
</head>
<body>
	<c:import url="../admincommon/header.jsp?ver=1.0" charEncoding="UTF-8"></c:import>
    <c:import url="../admincommon/menu.jsp?ver=1.0" charEncoding="UTF-8"></c:import>
    <div class="page">
	    <h2 id="title"> 공지사항 목록 </h2>
	    <br>
			<div class="menu">
					<label id="no_num">번호</label>
					<label id="no_title">제목</label>
					<label id="no_content">내용</label>
					<label><input type="checkbox">전체선택</label>
			</div>
	    	<div class="notice_list">
	    	<hr>
			<br>
	    		<table class="notice_Table">
	    		
	    			<tr>
	    				<td  width="80px">1</td>
	    				<td  width="250px">콕콕 쿡쿡 접속 장애 안내</td>
	    				<td  width="530px">2021년 2월 1일 오후 1시경에 발생한 홈페이지 접속 장애로 인해</td>
	    				<td  width="100px"><input type="checkbox"></td>
	    			</tr>
	    			<tr>
	    				<td  width="80px">1</td>
	    				<td  width="250px">콕콕 쿡쿡 접속 장애 안내</td>
	    				<td  width="530px">2021년 2월 1일 오후 1시경에 발생한 홈페이지 접속 장애로 인해</td>
	    				<td  width="100px"><input type="checkbox"></td>
	    			</tr>
	    			<tr>
	    				<td  width="80px">1</td>
	    				<td  width="250px">콕콕 쿡쿡 접속 장애 안내</td>
	    				<td  width="530px">2021년 2월 1일 오후 1시경에 발생한 홈페이지 접속 장애로 인해</td>
	    				<td  width="100px"><input type="checkbox"></td>
	    			</tr>
	    			<tr>
	    				<td  width="80px">1</td>
	    				<td  width="250px">콕콕 쿡쿡 접속 장애 안내</td>
	    				<td  width="530px">2021년 2월 1일 오후 1시경에 발생한 홈페이지 접속 장애로 인해</td>
	    				<td  width="100px"><input type="checkbox"></td>
	    			</tr>
	    			<tr>
	    				<td  width="80px">1</td>
	    				<td  width="250px">콕콕 쿡쿡 접속 장애 안내</td>
	    				<td  width="530px">2021년 2월 1일 오후 1시경에 발생한 홈페이지 접속 장애로 인해</td>
	    				<td  width="100px"><input type="checkbox"></td>
	    			</tr>
	    			<tr>
	    				<td  width="80px">1</td>
	    				<td  width="250px">콕콕 쿡쿡 접속 장애 안내</td>
	    				<td  width="530px">2021년 2월 1일 오후 1시경에 발생한 홈페이지 접속 장애로 인해</td>
	    				<td  width="100px"><input type="checkbox"></td>
	    			</tr>
	    			<tr>
	    				<td  width="80px">1</td>
	    				<td  width="250px">콕콕 쿡쿡 접속 장애 안내</td>
	    				<td  width="530px">2021년 2월 1일 오후 1시경에 발생한 홈페이지 접속 장애로 인해</td>
	    				<td  width="100px"><input type="checkbox"></td>
	    			</tr>
	    			<tr>
	    				<td  width="80px">1</td>
	    				<td  width="250px">콕콕 쿡쿡 접속 장애 안내</td>
	    				<td  width="530px">2021년 2월 1일 오후 1시경에 발생한 홈페이지 접속 장애로 인해</td>
	    				<td  width="100px"><input type="checkbox"></td>
	    			</tr>
	    			<tr>
	    				<td  width="80px">1</td>
	    				<td  width="250px">콕콕 쿡쿡 접속 장애 안내</td>
	    				<td  width="530px">2021년 2월 1일 오후 1시경에 발생한 홈페이지 접속 장애로 인해</td>
	    				<td  width="100px"><input type="checkbox"></td>
	    			</tr>
	    			<tr>
	    				<td  width="80px">1</td>
	    				<td  width="250px">콕콕 쿡쿡 접속 장애 안내</td>
	    				<td  width="530px">2021년 2월 1일 오후 1시경에 발생한 홈페이지 접속 장애로 인해</td>
	    				<td  width="100px"><input type="checkbox"></td>
	    			</tr>
	    			
	    			
	    			
	    		
	    		</table>
	    	<br><hr><br>
	    	<div class="buttonArea">
				<button id="delete_no">공지 삭제</button>
	    	</div>
    	</div>
    	
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
</body>
</html>