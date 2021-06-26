<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 관리</title>


<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/admin/admin_QA.css" rel="stylesheet" type="text/css">
<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/admin_index.css" rel="stylesheet" type="text/css">
</head>
<body>
	<c:import url="/WEB-INF/views/admin/admincommon/header.jsp" charEncoding="UTF-8"></c:import>
    <c:import url="/WEB-INF/views/admin/admincommon/Main.jsp" charEncoding="UTF-8"></c:import>
    <div class="page">
	    <h2 id="title"> 문의 목록 </h2>
	    <br>
			<div class="menu">
					<label id="no_num">번호</label>
					<label id="no_title">제목</label>
					<label id="no_content">내용</label>
					<label><input type="checkbox">전체선택</label>
			</div>
	    	<div class="QA_list">
	    	<hr>
			<br>
	    		<table class="QA_Table">
	    		
	    			<tr>
	    				<td  width="80px">1</td>
	    				<td  width="250px">회원 탈퇴 방법을 알려주세요</td>
	    				<td  width="560px">오른쪽 상단 [사람모양 아이콘>회원가입]을 통해 가입이 가능합니다.</td>
	    				<td  width="100px"><input type="checkbox"></td>
	    			</tr>
	    			<tr>
	    				<td  width="80px">1</td>
	    				<td  width="250px">회원 탈퇴 방법을 알려주세요</td>
	    				<td  width="560px">오른쪽 상단 [사람모양 아이콘>회원가입]을 통해 가입이 가능합니다.</td>
	    				<td  width="100px"><input type="checkbox"></td>
	    			</tr><tr>
	    				<td  width="80px">1</td>
	    				<td  width="250px">회원 탈퇴 방법을 알려주세요</td>
	    				<td  width="560px">오른쪽 상단 [사람모양 아이콘>회원가입]을 통해 가입이 가능합니다.</td>
	    				<td  width="100px"><input type="checkbox"></td>
	    			</tr><tr>
	    				<td  width="80px">1</td>
	    				<td  width="250px">회원 탈퇴 방법을 알려주세요</td>
	    				<td  width="560px">오른쪽 상단 [사람모양 아이콘>회원가입]을 통해 가입이 가능합니다.</td>
	    				<td  width="100px"><input type="checkbox"></td>
	    			</tr><tr>
	    				<td  width="80px">1</td>
	    				<td  width="250px">회원 탈퇴 방법을 알려주세요</td>
	    				<td  width="560px">오른쪽 상단 [사람모양 아이콘>회원가입]을 통해 가입이 가능합니다.</td>
	    				<td  width="100px"><input type="checkbox"></td>
	    			</tr><tr>
	    				<td  width="80px">1</td>
	    				<td  width="250px">회원 탈퇴 방법을 알려주세요</td>
	    				<td  width="560px">오른쪽 상단 [사람모양 아이콘>회원가입]을 통해 가입이 가능합니다.</td>
	    				<td  width="100px"><input type="checkbox"></td>
	    			</tr><tr>
	    				<td  width="80px">1</td>
	    				<td  width="250px">회원 탈퇴 방법을 알려주세요</td>
	    				<td  width="560px">오른쪽 상단 [사람모양 아이콘>회원가입]을 통해 가입이 가능합니다.</td>
	    				<td  width="100px"><input type="checkbox"></td>
	    			</tr><tr>
	    				<td  width="80px">1</td>
	    				<td  width="250px">회원 탈퇴 방법을 알려주세요</td>
	    				<td  width="560px">오른쪽 상단 [사람모양 아이콘>회원가입]을 통해 가입이 가능합니다.</td>
	    				<td  width="100px"><input type="checkbox"></td>
	    			</tr><tr>
	    				<td  width="80px">1</td>
	    				<td  width="250px">회원 탈퇴 방법을 알려주세요</td>
	    				<td  width="560px">오른쪽 상단 [사람모양 아이콘>회원가입]을 통해 가입이 가능합니다.</td>
	    				<td  width="100px"><input type="checkbox"></td>
	    			</tr><tr>
	    				<td  width="80px">1</td>
	    				<td  width="250px">회원 탈퇴 방법을 알려주세요</td>
	    				<td  width="560px">오른쪽 상단 [사람모양 아이콘>회원가입]을 통해 가입이 가능합니다.</td>
	    				<td  width="100px"><input type="checkbox"></td>
	    			</tr>
					    			
	    			
	    		
	    		</table>
	    	<br><hr><br>
	    	<div class="buttonArea">
				<button id="delete_QA">문의 삭제</button>
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