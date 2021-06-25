<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 관리</title>


<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/admin/admin_Event.css" rel="stylesheet" type="text/css">
<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/admin_index.css" rel="stylesheet" type="text/css">
</head>
<body>
	<c:import url="/WEB-INF/views/admincommon/header.jsp" charEncoding="UTF-8"></c:import>
    <c:import url="/WEB-INF/views/admincommon/Main.jsp" charEncoding="UTF-8"></c:import>
    <div class="page">
	    <h2 id="title"> 이벤트 목록 </h2>
	    <br>
			<div class="menu">
					<label id="ev_num">번호</label>
					<label id="ev_title">제목</label>
					<label id="ev_content">내용</label>
					<label><input type="checkbox">전체선택</label>
			</div>
	    	<div class="event_list">
	    	<hr>
			<br>
	    		<table class="event_Table" >
	    		
	    			<tr>
	    				<td  width="50px">1</td>
	    				<td  width="250px">나만의 봄나물 레시피를 알려</td>
	    				<td  width="500px">봄이 왔어요~ 마트에 나가보니 봄나물이 많이 나왔 더라구요</td>
	    				<td  width="100px"><input type="checkbox"></td>
	    			</tr>
	    			<tr>
	    				<td  width="50px">1</td>
	    				<td  width="250px">나만의 봄나물 레시피를 알려</td>
	    				<td  width="500px">봄이 왔어요~ 마트에 나가보니 봄나물이 많이 나왔 더라구요</td>
	    				<td  width="100px"><input type="checkbox"></td>
	    			</tr>
	    			<tr>
	    				<td  width="50px">1</td>
	    				<td  width="250px">나만의 봄나물 레시피를 알려</td>
	    				<td  width="500px">봄이 왔어요~ 마트에 나가보니 봄나물이 많이 나왔 더라구요</td>
	    				<td  width="100px"><input type="checkbox"></td>
	    			</tr>
	    			<tr>
	    				<td  width="50px">1</td>
	    				<td  width="250px">나만의 봄나물 레시피를 알려</td>
	    				<td  width="500px">봄이 왔어요~ 마트에 나가보니 봄나물이 많이 나왔 더라구요</td>
	    				<td  width="100px"><input type="checkbox"></td>
	    			</tr>
	    			<tr>
	    				<td  width="50px">1</td>
	    				<td  width="250px">나만의 봄나물 레시피를 알려</td>
	    				<td  width="500px">봄이 왔어요~ 마트에 나가보니 봄나물이 많이 나왔 더라구요</td>
	    				<td  width="100px"><input type="checkbox"></td>
	    			</tr>
	    			<tr>
	    				<td  width="50px">1</td>
	    				<td  width="250px">나만의 봄나물 레시피를 알려</td>
	    				<td  width="500px">봄이 왔어요~ 마트에 나가보니 봄나물이 많이 나왔 더라구요</td>
	    				<td  width="100px"><input type="checkbox"></td>
	    			</tr>
	    			<tr>
	    				<td  width="50px">1</td>
	    				<td  width="250px">나만의 봄나물 레시피를 알려</td>
	    				<td  width="500px">봄이 왔어요~ 마트에 나가보니 봄나물이 많이 나왔 더라구요</td>
	    				<td  width="100px"><input type="checkbox"></td>
	    			</tr>
	    			<tr>
	    				<td  width="50px">1</td>
	    				<td  width="250px">나만의 봄나물 레시피를 알려</td>
	    				<td  width="500px">봄이 왔어요~ 마트에 나가보니 봄나물이 많이 나왔 더라구요</td>
	    				<td  width="100px"><input type="checkbox"></td>
	    			</tr>
	    			<tr>
	    				<td  width="50px">1</td>
	    				<td  width="250px">나만의 봄나물 레시피를 알려</td>
	    				<td  width="500px">봄이 왔어요~ 마트에 나가보니 봄나물이 많이 나왔 더라구요</td>
	    				<td  width="100px"><input type="checkbox"></td>
	    			</tr>
	    			
	    	
	    			
	    		
	    		</table>
	    	<br><hr><br>
	    	<div class="buttonArea">
				<button id="delete_ev">이벤트 삭제</button>
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