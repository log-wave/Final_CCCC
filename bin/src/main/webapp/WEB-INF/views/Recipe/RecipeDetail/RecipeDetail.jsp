<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 상세보기</title>


<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/index.css" rel="stylesheet" type="text/css">
<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/Recipe/RecipeDetail.css?ver=1.0" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
</head>
<body>
	<div class="popUp_box">
		<div class="recipe_name"><span>${r_info.recipe_title } 레시피</span><img class="bread_cap" src="../../../images/빵모자.png"></div>
		<div class="popUp_contentBox">
			<div class="popUp_contentBox_leftBox">
				<div class="popUp_contentBox_leftBox_recipeImg">
					
					 메인 사진 영역	
				</div>
				<div class="popUp_contentBox_leftBox_recipeSubImg">
				
					메인 사진 밑 서브 이미지 영역 
				
				</div>
				<div class="nutritionFacts_listTitle">영양정보</div>
				<div class="popUp_contentBox_leftBox_list">
					<table class="nutTable">
						<tr>
							<td class="nut_items_top" id="ni_1">칼로리</td>
							<td class="nut_items_top" id="ni_2">단백질</td>
							<td class="nut_items_top" id="ni_3">지방</td>
							<td class="nut_items_top" id="ni_4">탄수화물</td>
							<td class="nut_items_top" id="ni_5">당</td>
						</tr>
						<tr>
							<td class="nut_items_bot" background="${ pageContext.servletContext.contextPath }/resources/images/recipe/nut1.png">${nutArr.get(0) }</td>
							<td class="nut_items_bot" background="${ pageContext.servletContext.contextPath }/resources/images/recipe/nut2.png">${nutArr.get(1) }</td>
							<td class="nut_items_bot" background="${ pageContext.servletContext.contextPath }/resources/images/recipe/nut3.png">${nutArr.get(2) }</td>
							<td class="nut_items_bot" background="${ pageContext.servletContext.contextPath }/resources/images/recipe/nut4.png">${nutArr.get(3) }</td>
							<td class="nut_items_bot" background="${ pageContext.servletContext.contextPath }/resources/images/recipe/nut5.png">${nutArr.get(4) }</td>
						</tr>
					</table>
				
				
				</div>
				
				<div class="popUp_contentBox_leftBox_recipeTitle">레시피</div>
				<div class="popUp_contentBox_leftBox_recipeDetail">
					
					레시피 작성 순서 영역
				
				<c:forEach var="p" items="${ r_process}">
					<div class="rp_items">
						<img class="item_images" src="${ pageContext.servletContext.contextPath }/resources/images/event/event2.png"/>
						<p>${p.rp_comment }</p>
					</div>
				</c:forEach>
				
				
				
				</div>
				<div class="popUp_contentBox_leftBox_reviewTitle">댓글 작성</div>	
				<div class="popUp_contentBox_leftBox_writeReview">
				
					댓글 작성
				
				
				
				</div>	
				
				
			</div>
			
			
			<div class="popUp_contentBox_righttBox">
				<div class="popUp_contentBox_righttBox_profileBox">
					 <div class="popUp_contentBox_righttBox_profileBox_innerBox">	
						<div><i class="fas fa-user-circle fa-4x"></i></div>
						<div class="popUp_usreName"><span>강건강</span></div>
					</div>
				</div>
				<div class="popUp_contentBox_righttBox_title"><span>${r_info.recipe_explain }</span></div>
				<div class="popUp_contentBox_righttBox_cookTime"><i class="far fa-clock"></i><span>조리시간</span><span style="black">${r_info.cooking_time }분</span></div>
				<div class="popUp_contentBox_righttBox_scrapBtnBox"><button class="scrapBtn"><i class="far fa-heart"></i><span>스크랩</span></button></div>
				<div class="popUp_contentBox_righttBox_snsLogo">
					<i class="fab fa-facebook-square fa-2x"></i>
					<i class="fab fa-twitter-square fa-2x"></i>
					<i class="fab fa-youtube-square fa-2x"></i>
				
				</div>
				<div class="popUp_contentBox_righttBox_listTitle"><span>재료 리스트</span></div>
				<div class="popUp_contentBox_righttBox_list">
					<ul class="rp_mate_list">
						<c:forEach var="m" items="${r_mate }">
							<li>${m.material_name }</li>
						</c:forEach>
						
					</ul>
				</div>
					<!-- 재료 리스트 항목 영역의 경우 백엔드 기능구현 할때 폼형식으로 수정해야함  -->
			
			
			
			
			
			</div>
		
		
		
		
		
		</div>
	
	
	
	
	
	
	
	
	
	</div>

</body>
</html>