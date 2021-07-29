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
				
			</div>
		</div>	
		
		<div class="main_mapBox">
			<div class="main_mapBox_title"><span style="font-weight: bold"><span class="green">지역 특산물을</span> 이용한 레시피</span><img class="bread_cap"  src="resources/images/breadCap.png"></div>	
			<br><br><br>
			<div class="main_mapBox_contentBox2">
					
					
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
	         	<input type="search" id="searchValue1" class="srchIng" onkeyup="searchEnterKey();">
	         </div>
	         <div class="left_box_sort">
	            <div class="bigsort">
	            	<ul class="sortUl">
	            		<li class="1">곡물류</li>
	            		<li class="2">면/만두류</li>
	            		<li class="3">빵류</li>
	            		<li class="6">감자/고구마류</li>
	            		<li class="7">묵/두부</li>
	            		<li class="8">콩/견과류</li>
	            		<li class="9">채소류</li>
	            		<li class="10">과일류</li>
	            		<li class="11">고기류</li>
	            		<li class="12">햄/소시지</li>
	            		<li class="13">계란류</li>
	            		<li class="14">어패류</li>
	            		<li class="15">해조류</li>
	            		<li class="16">유제품/치즈</li>
	            		<li class="17">양념류</li>
	            		<li class="18">초콜렛/사탕</li>
	            		<li class="19">음료/주류</li>
	            		<li class="20">가공재료</li>
	            		<li class="21">기타</li>
	            		<li class="22">버섯류</li>
	            		<li class="23">향신료</li>
	            	</ul>
	            </div>
	            <div class="smallsort">
					<div class="sortcontent">
					</div>
				</div>
	
	         </div>
	      
	      </div>
	      <div class="right_area">
	         <div class="right_box_title">내가 선택한 재료</div>
	         <div class="right_box_content">
	         </div>
	         <div class="right_box_bottomTitle">
				<button class="recomBtn">이재료로 추천받기</button>
			</div>      
	      </div>
		</div>
		<br><br>
		
		</div>
	</div>
	
	<script>
		
		$('.recomBtn').on('click', function(){
			var mateArr = [];
			var selectedRight = $('.right_box_content').children();
			
			for(var i = 0; i < selectedRight.length; i++){
				mateArr.push(selectedRight.eq(i).text());
				
			}
			location.href="materialSelectRecipe.rp?mateArr="+mateArr;
		});
		
		$('.sortUl > li').on('mouseover',function(){
			$(this).closest('li').css({"background":"rgba(239, 182, 176, 0.74)","cursor":"pointer"});
		}).on('mouseout',function(){
			$(this).closest('li').css({"background":"","color":"","cursor":""});
		}).on('click', function(){
			var f = $(this).attr('class');
			var target = $('.sortcontent');
			var selected = $('.right_box_content');
			
			target.empty();
			
			$.ajax({
				type:'POST',
				url:'MList.rp',
				data:{mNo:f},
				success:function(data){
					for(var i in data){
						target.append('<button value="' + data[i].materialNo + '" class="items">' + data[i].materialName +'</button>' );
					}
					
					target.children().closest('button').on('click', function(){
						if($(this).attr('class') != 'items'){
							$(this).attr('class', 'items');
							if(selected.children().val() == $(this).val()){
								selected.children().remove();
							} 
						} else {
							$(this).attr('class', 'selecteditems');
							selected.append($(this).clone());
							selected.children().closest('button').on('click', function(){
								this.remove();
							});
						}
					});
				}
			}); 
		});
		
		function searchEnterKey(){
			var target = $('.sortcontent');
			var selected = $('.right_box_content');
			if (window.event.keyCode == 13) {
				var searchValue = $("#searchValue1").val();
				if(searchValue == ""){
					alert("검색할 내용을 입력하세요.");
					window.location.reload();
				} else {
					target.empty();
					$.ajax({
						url : 'searchMate.rp',
						data:{sv:searchValue},
						success : function(data) {
							for(var i in data){
								target.append('<button value="' + data[i].materialNo + '" class="items">' + data[i].materialName +'</button>' );
							}
							
							target.children().closest('button').on('click', function(){
								if($(this).attr('class') != 'items'){
									$(this).attr('class', 'items');
									if(selected.children().val() == $(this).val()){
										selected.children().remove();
									} 
								} else {
									$(this).attr('class', 'selecteditems');
									selected.append($(this).clone());
									selected.children().closest('button').on('click', function(){
										this.remove();
									});
								}
							});
						}
					});
				}
	        }
		}
		
		//메인 인기 레시피
		$(function() {
			$.ajax({
				url : "mainPopularRecipe.rp",
				success : function(data) {
					  console.log("통신성공");
					  console.log(data);
					  
					  $main_mapBox_contentBox = $('.main_mapBox_contentBox');   
		               $main_mapBox_contentBox.html('');
		                
		
		                for(var key in data){
			                var $div = $('<div class="PopularFoodImageArea">');
			                var $img =   $('<img class="PopularFoodImage">').attr("src" , "resources/uploadFiles/"+data[key].file);
			                var $title = $('<div class= "recipeTitle">').text(data[key].rTitle);
			       			var $explan = $('<div class= "recipeInfo">').text(data[key].rexplain);
			       			var $time = $('<div class= "recipeTime">').text("소요시간 : " + data[key].cookingtime +"분");
			                var $br = $('<br>');
			       			$div.append($img);
			                $div.append($title);
			                $div.append($br);
			                $div.append($explan);
			                $div.append($br);
			                $div.append($time);
			                $main_mapBox_contentBox.append($div);
			                
			                $('.PopularFoodImageArea img').eq(0).on('click', function(){
		                        location.href='<%=request.getContextPath()%>/rDetail.rp?recipeNo='+ data[0].rNo;
		                     });
			                $('.PopularFoodImageArea img').eq(1).on('click', function(){
		                        location.href='<%=request.getContextPath()%>/rDetail.rp?recipeNo='+ data[1].rNo;
		                     });
			                
			                $('.PopularFoodImageArea img').eq(2).on('click', function(){
		                        location.href='<%=request.getContextPath()%>/rDetail.rp?recipeNo='+ data[2].rNo;
		                     });
			                
			                $('.PopularFoodImageArea img').eq(3).on('click', function(){
		                        location.href='<%=request.getContextPath()%>/rDetail.rp?recipeNo='+ data[3].rNo;
		                     });
		             }
				}
			});
		});
		
		//지역 특산물을 이용한 레시피
		$(function() {
			$.ajax({
				url : "mainSpecialityRecipe.rp",
				success : function(data) {
					  console.log("통신성공");
					  console.log(data);
					  
					  $main_mapBox_contentBox2 = $('.main_mapBox_contentBox2');   
		               $main_mapBox_contentBox2.html('');
		                
		
		                for(var key in data){
			                var $div = $('<div class="SpeFoodImageArea">');
			                var $img =   $('<img class="SpeFoodImage">').attr("src" , "resources/uploadFiles/"+data[key].file);
			                var $title = $('<div class= "sperecipeTitle">').text(data[key].rTitle);
			       			var $explan = $('<div class= "sperecipeInfo">').text(data[key].rexplain);
			       			var $time = $('<div class= "speTime">').text("소요시간 : " + data[key].cookingtime +"분");
			       			var $br = $('<br>');
			       			$div.append($img);
			                $div.append($title);
			                $div.append($br);
			                $div.append($explan);
			                $div.append($br);
			                $div.append($time);
			                $main_mapBox_contentBox2.append($div);
			                
			                $('.SpeFoodImageArea img').eq(0).on('click', function(){
		                        location.href='<%=request.getContextPath()%>/rDetail.rp?recipeNo='+ data[0].rNo;
		                     });
			                $('.SpeFoodImageArea img').eq(1).on('click', function(){
		                        location.href='<%=request.getContextPath()%>/rDetail.rp?recipeNo='+ data[1].rNo;
		                     });
			                
			                $('.SpeFoodImageArea img').eq(2).on('click', function(){
		                        location.href='<%=request.getContextPath()%>/rDetail.rp?recipeNo='+ data[2].rNo;
		                     });
			                
			                $('.SpeFoodImageArea img').eq(3).on('click', function(){
		                        location.href='<%=request.getContextPath()%>/rDetail.rp?recipeNo='+ data[3].rNo;
		                     });
		             }
				}
			});
		});
	</script>
</body>
</html>