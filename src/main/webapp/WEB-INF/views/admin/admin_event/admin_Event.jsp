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
	<c:import url="/WEB-INF/views/admin/admincommon/header.jsp" charEncoding="UTF-8"></c:import>
    <c:import url="/WEB-INF/views/admin/admincommon/Main.jsp" charEncoding="UTF-8"></c:import>
    <div class="page">
	    <h2 id="title"> 이벤트 목록 </h2>
	    <br>
	    	<div class="event_list">
	    	<hr>
			<br>
	    		<table class="event_table">
		    		<tr>
						<th width="100px">번호</th>
						<th width="150px">제목</th>
						<th width="700px">내용</th>
						<th width="100px"><input type="checkbox" id="all" value="전체선택" onclick="selectAll();">전체선택</th>
					</tr>
				
				<c:if test="${ list != null }">
					<c:forEach var="ad" items="${ list }">
			    		<tr>
			    			<td>${ ad.eventNo }</td>
			    			<td style="border-left: 1px solid black">${ ad.eventTitle }</td>
			    			<td style="border-left: 1px solid black">${ ad.eventContent}</td>
			    			<td style="border-left: 1px solid black"><input type="checkbox" name="event_select" onclick="selectone();"></td>
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
	
	<script>
		var all = document.getElementById("all");
		var category = document.getElementsByName("event_select");
		
		function selectAll(){
			if(all.checked){
				for(var i = 0; i < category.length; i++){
					category[i].checked = true;
				}
			} else {
				for(var i = 0; i < category.length; i++){
					category[i].checked = false;
				}
			}
		}
		
		function selectOne(){
			var count = 0;
			
			for(var i = 0; i < category.length; i++){
				if(category[i].checked){
					count++;
				}
			}
			
			if(count != 12){
				all.checked = false;
			} else {
				all.checked = true;
			}
		}
	</script>
</body>
</html>