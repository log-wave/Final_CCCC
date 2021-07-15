<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div class="main">
		<div class="main_imgBox">
			<div class="main_image" style="background-image: url(resources/images/main5.png); background-size: 100%">
			<button id="startBtn" onclick="location.href='insertMemberForm.me'"> 시작하기 </button>
			</div>
		</div>
		
		<div class="main_mapBox">
			<div class="main_mapBox_title"><span style="font-weight: bold"><span class="orange">콕콕 쿡쿡 </span> 인기 레시피</span><img class="bread_cap"  src="resources/images/breadCap.png"></div>	
			<br><br><br>
			<div class="main_mapBox_contentBox">
					<div class="PopularFoodImageArea">
						<img class="PopularFoodImage" src="resources/images/돌솥밥.jpg"/>
						<div class="recipeTitle">이천 쌀을 이용한 돌솥밥</div><br>
						<div class="recipeInfo">이천 쌀의 특산물 경복궁 쌀로 만든 돌솥밥이에요</div><br><br>
						<div class="recipeWriter">쿠킹 마마</div><br>
					</div>
					<div class="PopularFoodImageArea">
						<img class="PopularFoodImage" src="resources/images/돌솥밥.jpg"/>
						<div class="recipeTitle">이천 쌀을 이용한 돌솥밥</div><br>
						<div class="recipeInfo">이천 쌀의 특산물 경복궁 쌀로 만든 돌솥밥이에요</div><br><br>
						<div class="recipeWriter">쿠킹 마마</div>
					</div>
					<div class="PopularFoodImageArea">
						<img class="PopularFoodImage" src="resources/images/돌솥밥.jpg"/>
						<div class="recipeTitle">이천 쌀을 이용한 돌솥밥</div><br>
						<div class="recipeInfo">이천 쌀의 특산물 경복궁 쌀로 만든 돌솥밥이에요</div><br><br>
						<div class="recipeWriter">쿠킹 마마</div>
					</div>
					<div class="PopularFoodImageArea">
						<img class="PopularFoodImage" src="resources/images/돌솥밥.jpg"/>
						<div class="recipeTitle">이천 쌀을 이용한 돌솥밥</div><br>
						<div class="recipeInfo">이천 쌀의 특산물 경복궁 쌀로 만든 돌솥밥이에요</div><br><br>
						<div class="recipeWriter">쿠킹 마마</div>
					</div>
					
								
			</div>
		</div>	
		
		<div class="main_mapBox">
			<div class="main_mapBox_title"><span style="font-weight: bold"><span class="green">지역 특산물을</span> 이용한 레시피</span><img class="bread_cap"  src="resources/images/breadCap.png"></div>	
			<br><br><br>
			<div class="main_mapBox_contentBox">
					<div class="SpeFoodImageArea">
						<img class="PopularFoodImage" src="resources/images/돌솥밥.jpg"/>
						<div class="recipeTitle">이천 쌀을 이용한 돌솥밥</div><br>
						<div class="recipeInfo">이천 쌀의 특산물 경복궁 쌀로 만든 돌솥밥이에요</div><br><br>
						<div class="recipeWriter">쿠킹 마마</div><br>
					</div>
					<div class="SpeFoodImageArea">
						<img class="PopularFoodImage" src="resources/images/돌솥밥.jpg"/>
						<div class="recipeTitle">이천 쌀을 이용한 돌솥밥</div><br>
						<div class="recipeInfo">이천 쌀의 특산물 경복궁 쌀로 만든 돌솥밥이에요</div><br><br>
						<div class="recipeWriter">쿠킹 마마</div>
					</div>
					<div class="SpeFoodImageArea">
						<img class="PopularFoodImage" src="resources/images/돌솥밥.jpg"/>
						<div class="recipeTitle">이천 쌀을 이용한 돌솥밥</div><br>
						<div class="recipeInfo">이천 쌀의 특산물 경복궁 쌀로 만든 돌솥밥이에요</div><br><br>
						<div class="recipeWriter">쿠킹 마마</div>
					</div>
					<div class="SpeFoodImageArea">
						<img class="PopularFoodImage" src="resources/images/돌솥밥.jpg"/>
						<div class="recipeTitle">이천 쌀을 이용한 돌솥밥</div><br>
						<div class="recipeInfo">이천 쌀의 특산물 경복궁 쌀로 만든 돌솥밥이에요</div><br><br>
						<div class="recipeWriter">쿠킹 마마</div>
					</div>			
			</div>
		</div>	
		<br><br><br>
		
		<div class="materialRecipe">
		<br><br>
		<div class="main_mapBox_title"><span style="font-weight: bold"><span class="pink">집에 있는 재료</span>로 만들 수 있는 레시피</span><img class="bread_cap"  src="resources/images/breadCap.png"></div>	
		<br>
		<div class="main_myRecipe" >
	      <div class="left_area">
	         <div class="left_box_find">
	         	<input type="text"class="srchIng">
	         </div>
	         <div class="left_box_sort">
	            <div class="bigsort">
	            	<ul>
	            		<li class="selected_li">곡물류</li>
	            		<li>어류</li>
	            		<li>육류</li>
	            		<li>채소류</li>
	            		<li>유제품</li>
	            		<li>감자/고구마</li>
	            		<li>편의점</li>
	            		<li>몰라</li>
	            		<li>와따시</li>
	            		<li>모오</li>
	            		<li>시니타쿠</li>
	            	</ul>
	            </div>
	            <div class="smallsort">
					<div class="sortcontent">
						<button class="selecteditems">1번</button>
						<button class="items">2번</button>
						<button class="items">3번</button>
						<button class="items">4번</button>
						<button class="items">5번</button>
						<button class="items">6번</button>
						<button class="items">7번</button>
						<button class="items">8번</button>
						<button class="items">9번</button>
						<button class="items">9번</button>
						<button class="items">9번</button>
						<button class="items">9번</button>
						<button class="items">9번</button>
						<button class="items">9번</button>
						<button class="items">9번</button>
						<button class="items">9번</button>
						<button class="items">9번</button>
						<button class="items">9번</button>
						<button class="items">9번</button>
						<button class="items">9번</button>
						<button class="items">9번</button>
						<button class="items">9번</button>
						<button class="items">9번</button>
						<button class="items">9번</button>
						<button class="items">9번</button>
						
					</div>
				</div>
	
	         </div>
	      
	      </div>
	      <div class="right_area">
	         <div class="right_box_title">내가 선택한 재료</div>
	         <div class="right_box_content">
	         	<button class="selecteditems">1번</button>
	         </div>
	         <div class="right_box_bottomTitle">
				<button class="recomBtn">이재료로 추천받기</button>
			</div>      
	      </div>
		</div>
		<br><br>
		
		</div>
	</div>
</body>
</html>