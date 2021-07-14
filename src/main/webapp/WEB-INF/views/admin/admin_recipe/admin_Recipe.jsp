<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<!DOCTYPE html>
<html>
<% String strReferer = request.getHeader("referer"); %>
	<% if(strReferer == null) { %>
	
	<script>
		alert("정상적인 경로를 통해 다시 접근해 주십시오.");
		document.location.href= 'index.jsp';
	</script>

	<% return;
	}%>
<head>
<meta charset="UTF-8">
<title>레시피 관리</title>


<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/admin/admin_Recipe.css" rel="stylesheet" type="text/css">
<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/admin_index.css" rel="stylesheet" type="text/css">
</head>
<body>
	<c:import url="/WEB-INF/views/admin/admincommon/header.jsp" charEncoding="UTF-8"></c:import>
    <c:import url="/WEB-INF/views/admin/admincommon/Main.jsp" charEncoding="UTF-8"></c:import>
    <div class="page">
	    <h2 id="title"> 레시피 목록 </h2>
	    <br>
			<div class="menu">
					<label id="recipe_num">번호</label>
					<label id="recipe_name">레시피 명</label>
					<label id="recipe_cate">카테고리</label>
					<label id="recipe_cate2">하위 카테고리</label>
					<label id="recipe_menu">레시피</label>
					<label><input type="checkbox">전체선택</label>
			</div>
	    	<div class="recipe_list">
	    	<hr>
			<br>
	    		<table class="recipe_Table">
	    		
	    			<tr>
	    				<td  width="70px">1</td>
	    				<td  width="150px">부대라면</td>
	    				<td  width="130px">주제별</td>
	    				<td  width="160px">편의점요리</td>
	    				<td  width="500px">1.컵라면에 일정량보다 더 물을 받아놓습니다.</td>
	    				<td  width="100px"><input type="checkbox"></td>
	    			</tr>
	    			<tr>
	    				<td  width="70px">1</td>
	    				<td  width="150px">부대라면</td>
	    				<td  width="130px">주제별</td>
	    				<td  width="160px">편의점요리</td>
	    				<td  width="500px">1.컵라면에 일정량보다 더 물을 받아놓습니다.</td>
	    				<td  width="100px"><input type="checkbox"></td>
	    			</tr>
	    			<tr>
	    				<td  width="70px">1</td>
	    				<td  width="150px">부대라면</td>
	    				<td  width="130px">주제별</td>
	    				<td  width="160px">편의점요리</td>
	    				<td  width="500px">1.컵라면에 일정량보다 더 물을 받아놓습니다.</td>
	    				<td  width="100px"><input type="checkbox"></td>
	    			</tr>
	    			<tr>
	    				<td  width="70px">1</td>
	    				<td  width="150px">부대라면</td>
	    				<td  width="130px">주제별</td>
	    				<td  width="160px">편의점요리</td>
	    				<td  width="500px">1.컵라면에 일정량보다 더 물을 받아놓습니다.</td>
	    				<td  width="100px"><input type="checkbox"></td>
	    			</tr>
	    			<tr>
	    				<td  width="70px">1</td>
	    				<td  width="150px">부대라면</td>
	    				<td  width="130px">주제별</td>
	    				<td  width="160px">편의점요리</td>
	    				<td  width="500px">1.컵라면에 일정량보다 더 물을 받아놓습니다.</td>
	    				<td  width="100px"><input type="checkbox"></td>
	    			</tr>
	    			<tr>
	    				<td  width="70px">1</td>
	    				<td  width="150px">부대라면</td>
	    				<td  width="130px">주제별</td>
	    				<td  width="160px">편의점요리</td>
	    				<td  width="500px">1.컵라면에 일정량보다 더 물을 받아놓습니다.</td>
	    				<td  width="100px"><input type="checkbox"></td>
	    			</tr>
	    			<tr>
	    				<td  width="70px">1</td>
	    				<td  width="150px">부대라면</td>
	    				<td  width="130px">주제별</td>
	    				<td  width="160px">편의점요리</td>
	    				<td  width="500px">1.컵라면에 일정량보다 더 물을 받아놓습니다.</td>
	    				<td  width="100px"><input type="checkbox"></td>
	    			</tr>
	    			<tr>
	    				<td  width="70px">1</td>
	    				<td  width="150px">부대라면</td>
	    				<td  width="130px">주제별</td>
	    				<td  width="160px">편의점요리</td>
	    				<td  width="500px">1.컵라면에 일정량보다 더 물을 받아놓습니다.</td>
	    				<td  width="100px"><input type="checkbox"></td>
	    			</tr>
	    			<tr>
	    				<td  width="70px">1</td>
	    				<td  width="150px">부대라면</td>
	    				<td  width="130px">주제별</td>
	    				<td  width="160px">편의점요리</td>
	    				<td  width="500px">1.컵라면에 일정량보다 더 물을 받아놓습니다.</td>
	    				<td  width="100px"><input type="checkbox"></td>
	    			</tr>
	    			<tr>
	    				<td  width="70px">1</td>
	    				<td  width="150px">부대라면</td>
	    				<td  width="130px">주제별</td>
	    				<td  width="160px">편의점요리</td>
	    				<td  width="500px">1.컵라면에 일정량보다 더 물을 받아놓습니다.</td>
	    				<td  width="100px"><input type="checkbox"></td>
	    			</tr>
	    		</table>
	    	<br><hr><br>
	    	<div class="buttonArea">
				<button id="insert_re">레시피 추가</button>
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