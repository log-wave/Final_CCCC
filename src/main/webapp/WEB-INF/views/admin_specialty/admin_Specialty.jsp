<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재료 관리</title>


<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/admin/admin_Specialty.css" rel="stylesheet" type="text/css">
<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/admin_index.css" rel="stylesheet" type="text/css">
</head>
<body>
	<c:import url="/WEB-INF/views/admincommon/header.jsp" charEncoding="UTF-8"></c:import>
    <c:import url="/WEB-INF/views/admincommon/Main.jsp" charEncoding="UTF-8"></c:import>
    <div class="page">
	    <h2 id="title"> 특산물 목록 </h2>
	    <br>
			<div class="menu">
					<label id="spe_num">번호</label>
					<label id="region">지역 명</label>
					<label id="specialty">특산물</label>
					<label id="spe_info">특산물 정보</label>
					<label><input type="checkbox">전체선택</label>
			</div>
	    	<div class="specialty_list">
	    	<hr>
			<br>
	    		<table class="specialty_Table">
	    		
	    			<tr>
	    				<td  width="70px">1</td>
	    				<td  width="100px">서울</td>
	    				<td  width="150px">허브</td>
	    				<td  width="500px">허브는 풍미가 있거나 향이 나는 식물로, 음식의 맛을 내기</td>
	    				<td  width="100px"><input type="checkbox"></td>
	    			</tr>
	    			<tr>
	    				<td  width="70px">1</td>
	    				<td  width="100px">서울</td>
	    				<td  width="150px">허브</td>
	    				<td  width="500px">허브는 풍미가 있거나 향이 나는 식물로, 음식의 맛을 내기</td>
	    				<td  width="100px"><input type="checkbox"></td>
	    			</tr>
	    			<tr>
	    				<td  width="70px">1</td>
	    				<td  width="100px">서울</td>
	    				<td  width="150px">허브</td>
	    				<td  width="500px">허브는 풍미가 있거나 향이 나는 식물로, 음식의 맛을 내기</td>
	    				<td  width="100px"><input type="checkbox"></td>
	    			</tr>
	    			<tr>
	    				<td  width="70px">1</td>
	    				<td  width="100px">서울</td>
	    				<td  width="150px">허브</td>
	    				<td  width="500px">허브는 풍미가 있거나 향이 나는 식물로, 음식의 맛을 내기</td>
	    				<td  width="100px"><input type="checkbox"></td>
	    			</tr>
	    			<tr>
	    				<td  width="70px">1</td>
	    				<td  width="100px">서울</td>
	    				<td  width="150px">허브</td>
	    				<td  width="500px">허브는 풍미가 있거나 향이 나는 식물로, 음식의 맛을 내기</td>
	    				<td  width="100px"><input type="checkbox"></td>
	    			</tr>
	    			<tr>
	    				<td  width="70px">1</td>
	    				<td  width="100px">서울</td>
	    				<td  width="150px">허브</td>
	    				<td  width="500px">허브는 .풍미가 있거나 향이 나는 식물로, 음식의 맛을 내기</td>
	    				<td  width="100px"><input type="checkbox"></td>
	    			</tr>
	    			<tr>
	    				<td  width="70px">1</td>
	    				<td  width="100px">서울</td>
	    				<td  width="150px">허브</td>
	    				<td  width="500px">허브는 풍미가 있거나 향이 나는 식물로, 음식의 맛을 내기</td>
	    				<td  width="100px"><input type="checkbox"></td>
	    			</tr>
	    			<tr>
	    				<td  width="70px">1</td>
	    				<td  width="100px">서울</td>
	    				<td  width="150px">허브</td>
	    				<td  width="500px">허브는 풍미가 있거나 향이 나는 식물로, 음식의 맛을 내기</td>
	    				<td  width="100px"><input type="checkbox"></td>
	    			</tr>
	    			<tr>
	    				<td  width="70px">1</td>
	    				<td  width="100px">서울</td>
	    				<td  width="150px">허브</td>
	    				<td  width="500px">허브는 풍미가 있거나 향이 나는 식물로, 음식의 맛을 내기</td>
	    				<td  width="100px"><input type="checkbox"></td>
	    			</tr>
	    			<tr>
	    				<td  width="70px">1</td>
	    				<td  width="100px">서울</td>
	    				<td  width="150px">허브</td>
	    				<td  width="500px">허브는 풍미가 있거나 향이 나는 식물로, 음식의 맛을 내기</td>
	    				<td  width="100px"><input type="checkbox"></td>
	    			</tr>
	    			
	    		
	    		</table>
	    	<br><hr><br>
	    	<div class="buttonArea">
				<button id="insert_re">특산물 추가</button>
				<button id="delete_re">특산물 삭제</button>
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