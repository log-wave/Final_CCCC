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
	    <h2 id="title"> 레시피 목록  </h2>
	    	<div class="recipe_list" align="center">
		<br>
	    		<table class="recipe_table">
	    			<tr>
	    				<th  width="70px">번호</th>
	    				<th  width="150px">레시피 명</th>
	    				<th  width="130px">카테고리</th>
	    				<th  width="160px">닉네임</th>
	    				<th  width="500px">레시피내용</th>
	    				<th width="100px"><input type="checkbox" id="all" value="전체선택" onclick="selectAll();">전체선택</th>
	    			</tr>
	    		<c:if test="${ list != null }">
					<c:forEach var="ad" items="${ list }">
			    		<tr class="click">
			    			<td>${ ad.recipe_no }</td>
			    			<td style="border-left: 1px solid black" onclick="recipeInfo('${ ad.recipe_no }')">${ ad.recipe_title }</td>
			    			<td style="border-left: 1px solid black" onclick="recipeInfo('${ ad.recipe_no }')">${ ad.sort_sub }</td>
			    			<td style="border-left: 1px solid black" onclick="recipeInfo('${ ad.recipe_no }')">${ ad.recipe_no }</td>
			    			<td style="border-left: 1px solid black" onclick="recipeInfo('${ ad.recipe_no }')">${ ad.recipe_explain }</td>
			    			<td style="border-left: 1px solid black"><input type="checkbox" name="recipe_select" onclick="selectOne();" value="${ ad.recipe_no }"></td>
			    		</tr>
	    			</c:forEach>
	    		</c:if>
	    		<c:if test="${ list == null }">
					<tr>
						<td colspan="6">조회된 리스트가 없습니다.</td>
					</tr>
				</c:if>
	    		</table>
	    		<br>
	    	<div class="buttonArea">
				<button id="delete_rp">레시피 삭제</button>
	    	</div>
    	</div>
    		
    		<div id="searchArea" style="float: left">
				<select id="searchCondition" name="searchCondition">
					<option value="no"<c:if test="${ searchCondition eq 'no' }">selected</c:if>>번호</option>
					<option value="title"<c:if test="${ searchCondition eq 'title' }">selected</c:if>>제목</option>
					<option value="content"<c:if test="${ searchCondition eq 'content' }">selected</c:if>>내용</option>
				</select>
		
				<input id="searchValue" type="search" value="${ searchValue }" onkeyup="searchEnterKey();">
				<button id="searchBtn" onclick="searchBoard();">검색하기</button>
			</div>
			
		<div align="center">
			<!-- 페이징 -->
				<table id="pagingArea">	
			<!-- 페이징 처리 -->
				<tr align="center" height="20" id="buttonTab">
					<td colspan="6">
					
						<!-- [이전] -->
						<c:if test="${ pi.currentPage <= 1 }">
							<button>&lt;</button>
						</c:if>
						<c:if test="${ pi.currentPage > 1 }">
							<c:url var="before" value="adminEvent.ad">
								<c:param name="page" value="${ pi.currentPage - 1 }"/>
							</c:url>
							<a href="${ before }"><button>&lt;</button></a>
						</c:if>
						
						<!-- 페이지 -->
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<c:if test="${ p eq pi.currentPage }">
								<button style = "background: rgba(242, 159, 5, 0.88); color: white" ><b>${ p }</b></button>
							</c:if>
							
							<c:if test="${ p ne pi.currentPage }">
								<c:url var="pagination" value="adminEvent.ad">
									<button><c:param name="page" value="${ p }"/></button>
								</c:url>
								<a href="${ pagination }"><button>${ p }</button></a>
							</c:if>
						</c:forEach>
						
						<!-- [다음] -->
						<c:if test="${ pi.currentPage >= pi.maxPage }">
							<button>&gt;</button>
						</c:if>
						<c:if test="${ pi.currentPage < pi.maxPage }">
							<c:url var="after" value="adminEvent.ad">
								<button><c:param name="page" value="${ pi.currentPage + 1 }"/></button>
							</c:url> 
							<a href="${ after }"><button>&gt;</button></a>
						</c:if>
					</td>
				</tr>
			</table>
		</div>
	</div>
	
	
<script>
	var all = document.getElementById("all");
	var category = document.getElementsByName("recipe_select");
	
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
	
	function recipeInfo(recipeNo){
		var url ='<%=request.getContextPath()%>/rDetail.rp?recipeNo=' + recipeNo;
		window.open(url, 'recipeInfo', 'width=1200px, height=820px');
	}
	
	$('.click').on('mouseover',function(){
		$(this).closest('tr').css({"background":"#efefef85","cursor":"pointer"});
	}).on('mouseout',function(){
		$(this).closest('tr').css({"background":"","color":"","cursor":""});
	});
	
	$('#delete_rp').on('click', function(){
		var checkArr = [];
		$('input[name="recipe_select"]:checked').each(function() {
			checkArr.push($(this).val());
		});
		if (confirm('해당 레시피를 삭제하시겠습니까?')) {
			$.ajax({
				type: 'post',
				url:'rpdelete.ad',
				data:{
					check:checkArr
					
				},
				success:function(data){
					window.location.reload();
				}		
			});
		}
	});
	
	function searchBoard(){
		var searchCondition = $("#searchCondition").val();
		var searchValue = $("#searchValue").val();
		if(searchValue == ""){
			alert("검색할 내용을 입력하세요.");
			window.location.reload();
		} else {
			location.href="searchAdminRecipe.ad?searchCondition="+searchCondition+"&searchValue="+searchValue;
		}
	}
	
	function searchEnterKey(){
		if (window.event.keyCode == 13) {
			 
        	$('#searchBtn').click();
        }
	}
	window.onload = function () {
		$("label[class*=admin_menu_nav]").eq(1).css({"color" : "white" , "font-weight" : "bold"}); 
		}
	
</script>
</body>
</html>