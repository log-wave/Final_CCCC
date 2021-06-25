<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 등록하기</title>
<link href="../../../style.css/index.css" rel="stylesheet" type="text/css">
<link href="InsertRecipe.css?ver=1.2" rel="stylesheet" type="text/css">
<script src="https://kit.fontawesome.com/307ff02242.js" crossorigin="anonymous"></script>
</head>
<body>
	<c:import url="../../common/header.jsp"/>
	
	<div class="insertRecipe_pageTitle">레시피 등록하기</div>
	<div class="insertRecipe_subTtitleBox">
		<div class="insertRecipe_subTitile">제목 입력하기</div>
		<div class="insertRecipe_inputBox">
		
			레시피 제목 입력하는 영역 
		
		</div>
	</div>
	<div class="insertRecipe_subTtitleBox">
		<div class="insertRecipe_subTitile">한줄 설명 입력</div>
		<div class="insertRecipe_inputBox">
		
			레시피를 설명할 수 있는 한줄 설명 입력 영역 
		
		</div>
	</div>
	<div class="insertRecipe_foodInfoBox">
		<div class="insertRecipe_foodInfoTitle">음식 정보</div>
		<div class="insertRecipe_foodContentBox">
			<div class="insertRecipe_foodName">음식 이름</div>
			<div class="insertRecipe_food_inputBox">
			
				음식명 입력과 조리분량을 입력하는 영역
			
			</div>
			<div class="insertRecipe_food_ingredient_title">재료 정보</div>
			<div class="insertRecipe_food_ingredient_subTitle">콤마로 구분한 재료리스트를 붙여넣기 해보세요 (예. 마늘 8개, 달걀 2개, 소금 약간, 후추 조금)</div>
			<div class="insertRecipe_food_ingredient_contentBox">
				재료 추가 영역 
			
			
			</div>
			<div class="insertRecipe_food_ingredient_plusBtn"><i class="fas fa-plus"></i>재료추가</div>
		</div>
	

	</div>
	
	<div class="insertRecipe_recipeInfoBox">
		<div class="insertRecipe_recipeInfoTitle">레시피 정보 </div>
		<div class="insertRecipe_recioeInfoContentBox">
			<div class="insertRecipe_recipe_makeTime">
				조리시간 영역 
			</div>
			<div class="insertRecipe_recipe_explaination">저용량 JPG/JPEG 만 올려주세요.(용량이 많을 경우 업로드가 안될 수 있습니다.)</div>
			<div class="insertRecipe_recipe_insertImg">
			
			레시피 이미지 추가 영역
			
			
			</div>
			<div class="insertRecipe_recipe_insertImgBtn"><i class="fas fa-camera-retro fa-2x"></i><div  class="insertRecipe_recipe_btnDetail"><span>조리 과정 추가히기</span></div></div>		
		
		</div>	
	
	
	
	
	
	
	
	</div>
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<c:import url="../../common/footer.jsp"/>

</body>
</html>