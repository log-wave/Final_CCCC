<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재료 관리</title>


<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/admin/admin_Food.css" rel="stylesheet" type="text/css">
<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/admin_index.css" rel="stylesheet" type="text/css">
</head>
<body>
	<c:import url="/WEB-INF/views/admin/admincommon/header.jsp" charEncoding="UTF-8"></c:import>
    <c:import url="/WEB-INF/views/admin/admincommon/Main.jsp" charEncoding="UTF-8"></c:import>
    <div class="page">
	    <h2 id="title"> 재료 목록 </h2>
	    <br>
			<div class="menu">
					<label id="food_num">번호</label>
					<label id="food_name">재료 명</label>
					<label id="food_standard">기준</label>
					<label id="nutrient">영양성분</label>
					<label><input type="checkbox">전체선택</label>
			</div>
	    	<div class="food_list">
	    	<hr>
			<br>
	    		<table class="food_Table">
	    		
	    			<tr>
	    				<td  width="80px">1</td>
	    				<td  width="130px">감자</td>
	    				<td  width="90px">100g</td>
	    				<td  width="500px">칼로리 90kcal , 탄수화물 20.5g, 단백질 2.43g, 지질 0.09g</td>
	    				<td  width="80px"><input type="checkbox"></td>
	    			</tr>
	    			<tr>
	    				<td  width="80px">1</td>
	    				<td  width="130px">감자</td>
	    				<td  width="90px">100g</td>
	    				<td  width="500px">칼로리 90kcal , 탄수화물 20.5g, 단백질 2.43g, 지질 0.09g</td>
	    				<td  width="80px"><input type="checkbox"></td>
	    			</tr>
	    			<tr>
	    				<td  width="80px">1</td>
	    				<td  width="130px">감자</td>
	    				<td  width="90px">100g</td>
	    				<td  width="500px">칼로리 90kcal , 탄수화물 20.5g, 단백질 2.43g, 지질 0.09g</td>
	    				<td  width="80px"><input type="checkbox"></td>
	    			</tr>
	    			<tr>
	    				<td  width="80px">1</td>
	    				<td  width="130px">감자</td>
	    				<td  width="90px">100g</td>
	    				<td  width="500px">칼로리 90kcal , 탄수화물 20.5g, 단백질 2.43g, 지질 0.09g</td>
	    				<td  width="80px"><input type="checkbox"></td>
	    			</tr>
	    			<tr>
	    				<td  width="80px">1</td>
	    				<td  width="130px">감자</td>
	    				<td  width="90px">100g</td>
	    				<td  width="500px">칼로리 90kcal , 탄수화물 20.5g, 단백질 2.43g, 지질 0.09g</td>
	    				<td  width="80px"><input type="checkbox"></td>
	    			</tr>
	    			<tr>
	    				<td  width="80px">1</td>
	    				<td  width="130px">감자</td>
	    				<td  width="90px">100g</td>
	    				<td  width="500px">칼로리 90kcal , 탄수화물 20.5g, 단백질 2.43g, 지질 0.09g</td>
	    				<td  width="80px"><input type="checkbox"></td>
	    			</tr>
	    			<tr>
	    				<td  width="80px">1</td>
	    				<td  width="130px">감자</td>
	    				<td  width="90px">100g</td>
	    				<td  width="500px">칼로리 90kcal , 탄수화물 20.5g, 단백질 2.43g, 지질 0.09g</td>
	    				<td  width="80px"><input type="checkbox"></td>
	    			</tr>
	    			<tr>
	    				<td  width="80px">1</td>
	    				<td  width="130px">감자</td>
	    				<td  width="90px">100g</td>
	    				<td  width="500px">칼로리 90kcal , 탄수화물 20.5g, 단백질 2.43g, 지질 0.09g</td>
	    				<td  width="80px"><input type="checkbox"></td>
	    			</tr>
	    			<tr>
	    				<td  width="80px">1</td>
	    				<td  width="130px">감자</td>
	    				<td  width="90px">100g</td>
	    				<td  width="500px">칼로리 90kcal , 탄수화물 20.5g, 단백질 2.43g, 지질 0.09g</td>
	    				<td  width="80px"><input type="checkbox"></td>
	    			</tr>
	    			<tr>
	    				<td  width="80px">1</td>
	    				<td  width="130px">감자</td>
	    				<td  width="90px">100g</td>
	    				<td  width="500px">칼로리 90kcal , 탄수화물 20.5g, 단백질 2.43g, 지질 0.09g</td>
	    				<td  width="80px"><input type="checkbox"></td>
	    			</tr>
	    			
	    				
	    		</table>
	    	<br><hr><br>
	    	<div class="buttonArea">
				<button id="insert_fo">재료 추가</button>
				<button id="delete_fo">재료 삭제</button>
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