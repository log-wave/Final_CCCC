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
		
		<div class="countarea">
			<div class="counttext">
				<ul>
					<li style="font-size: 40px;">누적 레시피 수</li><br>
					<li style="font-size: 80px;">5 0 0 0 </li>
					
				</ul>
			</div>
		</div>
		<div class="main_mapBox">
			<div class="main_mapBox_title"><span><span class="green">지역 특산물</span>로 만들 수 있는 레시피</span><img class="bread_cap"  src="resources/images/breadCap.png"></div>	
			<div class="main_mapBox_contentBox">
				<div class="main_mapBox_leftBox">
					<img class="main_image" class="map_image" src="resources/images/경기도.png"/>
					
				</div>
				<div class="main_mapBox_rightBox">
					<div class="main_mapBox_rightBox_localTable">
						<table class="localTable">
							<tr>
								<th>서울</th>
								<th>경기도</th>
							</tr>
							<tr>
								<th>강원도</th>
								<th>충청도</th>
							</tr>
							<tr>
								<th>전라도</th>
								<th>경상도</th>
							</tr>
							<tr>
								<th>제주도</th>
								<th>전국</th>
							</tr>
	
						</table>
 						
					</div>
					<div class="main_mapBox_rightBox_localFoodImage">
						<img class="main_image" class="map_image" src="resources/images/돌솥밥.jpg"/>
					
					</div>				
				
				
				
				</div>
			</div>	
		
		</div>
		<br>
		
		<div style="height:100px;">
		
		</div>
		
		<br clear ="all">
		
		<div class="main_mapBox_title"><span><span class="pink">집에 있는 재료</span>로 만들 수 있는 레시피</span><img class="bread_cap"  src="resources/images/breadCap.png"></div>	
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
		
		<br clear ="all">
		
	</div>
</body>
</html>