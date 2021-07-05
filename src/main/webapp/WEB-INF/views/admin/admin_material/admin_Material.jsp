<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재료 관리</title>


<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/admin/admin_Material.css" rel="stylesheet" type="text/css">
<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/admin_index.css" rel="stylesheet" type="text/css">
</head>
<body>
	<c:import url="/WEB-INF/views/admin/admincommon/header.jsp" charEncoding="UTF-8"></c:import>
    <c:import url="/WEB-INF/views/admin/admincommon/Main.jsp" charEncoding="UTF-8"></c:import>
    <div class="page">
	    <h2 id="title"> 재료 목록 </h2>
	    <br>
			
	    	<div class="material_list">
	    	<hr>
			<br>
	    		<table  class="material_table">
	    	
	    			<tr>
						<th width="100px">번호</th>
						<th width="200px">재료명</th>
						<th width="80px">기준</th>
						<th width="420px">영양성분</th>
						<th width="100px"><input type="checkbox" id="all" value="전체선택" onclick="selectAll();">전체선택</th>
					</tr>
	    			<c:if test="${ list != null }">
	    			<c:forEach var="ad" items="${ list }">	
	    			<tr>
	    				<td>${ad.materialNo }</td>
	    				<td style="	border-left: 1px solid black">${ad.materialName}</td>
	    				<td style="	border-left: 1px solid black">${ad.standard}</td>
	    				<td style="	border-left: 1px solid black">${ad.standard}</td>
	    				<td style="	border-left: 1px solid black"><input type="checkbox"></td>
	    			</tr>
	    			</c:forEach>
	    		  	</c:if>		
	    			<c:if test="${ list == null }">
					<tr>
						<td colspan="6">조회된 리스트가 없습니다.</td>
					</tr>
				</c:if>
	    		</table>
	    	<br><hr><br>
	    	<div class="buttonArea">
				<button id="insert_mate" onclick="location.href='insertMate.ad';">재료 추가</button>
				<button id="delete_mate">재료 삭제</button>
	    	</div>
    	</div>
    	<div id="searchArea" style="float: left">
				<label>검색 조건</label>
				<select id="searchCondition" name="searchCondition">
					<option>-------</option>
					<option value="writer">작성자</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select>
		
				<input id="searchValue" type="search">
				<button onclick="searchBoard();">검색하기</button>
			</div>
			<br>
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