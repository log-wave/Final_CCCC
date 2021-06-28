<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 관리</title>


<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/admin/admin_Member.css" rel="stylesheet" type="text/css">
<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/admin_index.css" rel="stylesheet" type="text/css">
</head>
<body>
	<c:import url="/WEB-INF/views/admin/admincommon/header.jsp" charEncoding="UTF-8"></c:import>
    <c:import url="/WEB-INF/views/admin/admincommon/Main.jsp" charEncoding="UTF-8"></c:import>
    <div class="page">
	    <h2 id="title"> 회원 목록 </h2>
	    <br>
	    	<div class="member_list">
	    	<hr>
			<br>
	    		<table class="member_table">
		    		<tr>
						<th width="100px">번호</th>
						<th width="100px">아이디</th>
						<th width="300px">이메일</th>
						<th width="100px">닉네임</th>
						<th width="100px">성별</th>
						<th width="150px"><input type="checkbox">전체선택</th>
					</tr>
				
				<c:if test="${ list != null }">
					<c:forEach var="ad" items="${ list }">
			    		<tr>
			    			<td>${ ad.user_no }</td>
			    			<td>${ ad.user_id }</td>
			    			<td>${ ad.email}</td>
			    			<td>${ ad.nickname }</td>
			    			<td>${ ad.gender }</td>
			    			<td width="150px"><input type="checkbox"></td>
			    		</tr>
				
	    			
	    		
	    			<%-- <c:url var="bdetail" value="bdetail.bo"> --%>
						<%-- <c:param name="bId" value="${  }"/>
						<c:param name="page" value="${ pi.currentPage }"/> --%>
					<%-- </c:url> --%>
					<%-- <a href="${ bdetail }">${ b.bTitle }</a> --%>
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
				<button id="stop_mem">활동 상태 변경</button>
				<button id="break_mem">회원 탈퇴</button>
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