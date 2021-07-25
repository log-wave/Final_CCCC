<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 검색 결과</title>

<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/index.css" rel="stylesheet" type="text/css">
<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/Recipe/searchRecipe.css" rel="stylesheet" type="text/css">

</head>
<body>
	<c:import url="../../common/header.jsp"/>
	<div class="searchRecipe_main">
		<div class="searchRecipe_option" align="right">
			<select id="search_option" name="search_option">
			    <option value="option1">인기 순</option>
			    <option value="option2">좋아요 순</option>
			    <option value="option3">최신 순</option>
			    <option value="option4">무 순</option>
			</select>
		</div>
		<br><br>
		<div class="searchRecipe_thumnail">
			<h3>조건에 맞는 레시피가 ${rList.size() }개 있습니다.</h3>
			<div class="recipeList">
				
				<!-- 반복문으로  레시피리스트 돌려버리기 -->
					<c:forEach var="r" items="${rList }" begin="0" end="${ fn:length(rList)}" step="1" varStatus="i">
					
					
						<c:url var="rDetail" value="rDetail.rp">
							<c:param name="recipeNo" value="${r.recipe_no }"/>
						</c:url>
						<div class="recipe_items" onclick="window.open('${rDetail}')">
						
							<div class="recipe_img">
								<img src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/${fList.get(i.index).changeName}">
							</div>
							<div>
								<div class="recipe_name" align="center">${r.recipe_title }</div>
							</div>
						
						</div>
					
					</c:forEach>
					
					
					<div class="pagingArea">
						<!-- 이전  -->
						<c:if test="${ pi.currentPage <= 1 }">
							<button>&lt;</button>
						</c:if>
						<c:if test="${ pi.currentPage > 1 }">
							<c:url var="before" value="RList.rp">
								<c:param name="sort_no" value="${ sort_no}"/>
								<c:param name="type" value="${ type}"/>
								<c:param name="page" value="${ pi.currentPage - 1 }"/>
							</c:url>
							<a href="${ before }"><button>&lt;</button></a> 
						</c:if>
						
		               	<!-- 페이지 -->
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage}">
							<c:if test="${ p eq pi.currentPage }">
								<button style = "background: rgba(242, 159, 5, 0.88); color: white" ><b>${ p }</b></button>
							</c:if>  
							
							<c:if test="${ p ne pi.currentPage }">
								<c:url var="pagenation" value="RList.rp">
									<c:param name="sort_no" value="${ sort_no}"/>
									<c:param name="type" value="${ type}"/>
									<c:param name="page" value="${ p }"/>
								</c:url>
								<a href="${ pagenation }"><button>${ p }</button></a>
							</c:if>
						</c:forEach>
		
		                <c:if test="${ pi.currentPage >= pi.maxPage }">
							<button>&gt;</button>
						</c:if>
						<c:if test="${ pi.currentPage < pi.maxPage }">
							<c:url var="after" value="RList.rp">
								<c:param name="sort_no" value="${ sort_no}"/>
								<c:param name="type" value="${ type}"/>
								<c:param name="page" value="${ pi.currentPage + 1 }"/>
							</c:url> 
							<a href="${ after }"><button>&gt;</button></a>
						</c:if>
		                
					</div>
			</div>
		</div>
		
	</div>
	<c:import url="../../common/footer.jsp"/>
</body>
</html>