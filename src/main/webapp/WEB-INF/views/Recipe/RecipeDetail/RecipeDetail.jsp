<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 상세보기</title>
<!-- 서민기 점검용 이슈 #245에서 작성된 점검용 주석 -->
<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/style.css/slick/slick.css">
<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/style.css/slick/slick-theme.css">
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.6.0.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/js/slick/slick.js" />"></script>

<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/index.css" rel="stylesheet" type="text/css">
<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/Recipe/RecipeDetail.css?ver=1.0" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
</head>
<body>
	<div class="popUp_box">
		<div class="recipe_name"><span>${r_info.recipe_title } 레시피</span><img class="bread_cap" src="${ pageContext.servletContext.contextPath }/resources/images/breadCap.png"></div>
		<div class="popUp_contentBox">
			<div class="popUp_contentBox_leftBox">
				<div class="popUp_contentBox_leftBox_recipeImg">
					<img id= "rp_thum" src ="${pageContext.request.contextPath}/resources/uploadFiles/${rp_thum.changeName }"name= "titleImg" width="400px" height="400px">
						
				</div>
				<div class="popUp_contentBox_leftBox_recipeSubImg">
					<div class="image_list">
						<!-- <div class="left_btn">
							<button class="left_btn_2"></button>
						</div> -->
					<!-- 슬라이드 -->
					<div class="item_wrapper">
					
						<div class="rp_subitem_list" data-slick='{"slidesToShow": 4, "slidesToScroll": 4}'>
						
							<ul class="slick">
							
							<c:forEach var="image" items="${rp_files }">
								<li><img class="rp_listImage" src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/${image.changeName}"></li>
							</c:forEach>
								<li><img class="rp_listImage" src="${ pageContext.servletContext.contextPath }/resources/images/recipe/nut1.png"></li>
								<li><img class="rp_listImage" src="${ pageContext.servletContext.contextPath }/resources/images/recipe/nut1.png"></li>
								<li><img class="rp_listImage" src="${ pageContext.servletContext.contextPath }/resources/images/recipe/nut1.png"></li>
								<li><img class="rp_listImage" src="${ pageContext.servletContext.contextPath }/resources/images/recipe/nut1.png"></li>
								<li><img class="rp_listImage" src="${ pageContext.servletContext.contextPath }/resources/images/recipe/nut1.png"></li>
							</ul>
						</div>
					</div>
						<script>
						$('.slick').slick({
							dots: true,
							arrows:true,
							autoplay:true,
							infinite: false,
							speed: 300,
							autoplaySpeed : 10000,
							pauseOnHover : true,
							vertical : false,
							prevArrow : "<button type='button' class='slick-prev'>Previous</button>",
							nextArrow : "<button type='button' class='slick-next'>Next</button>", //화살표 커스텀

							slidesToShow: 4, //보여질 슬라이드 수
							slidesToScroll: 4, //넘겨질 슬라이드 수

							/* responsive: [
								{
									breakpoint: 1024,
									settings: {
										slidesToShow: 3,
										slidesToScroll: 3,
										infinite: true,
										dots: true
									}
								},{
									breakpoint: 600,// 반응형 ~ 600
									settings:{
										slidesToShow: 2,
										slidesToScroll: 2
									}
								},{
									breakpoint: 480,// 반응형 ~ 480
									settings:{
										 slidesToShow: 1,
										 slidesToScroll: 1
									}
								}
							] */
						});
						</script>
						<!-- <div class="right_btn">
							<button class="right_btn_2"></button>
						</div> -->
					</div>
									
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
				
				<c:forEach var="p" items="${ r_process}" begin="0" end="${fn:length(r_process) }" step="1" varStatus="i">
					<div class="rp_items">
						<!-- if p.rp_no = file.refno -->
						<c:if test="${p.rp_no eq rp_files.get(i.index).refNo} "></c:if>
						<img class="item_images" src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/${rp_files.get(i.index).changeName}"/>
						<p class="item_coment">${p.rp_comment }</p>
					</div>
				</c:forEach>
				
				
				
				</div>
					<div class="popUp_contentBox_leftBox_writeReview">
						<div class="popUp_contentBox_leftBox_reviewTitle">
						댓글 작성
						</div>
						<br>
						
							<c:if test="${loginUser ne null }">
									
									<div class="reply_inputbox">
										<div>
											<textarea rows="4" cols="90" id="reply_area" name="reply_content"></textarea>
										</div>
										<div>
											<button type="button" class="enter_reply">댓글 등록</button>
										</div>
									</div>
									
							</c:if>
							
							<div id="rCount"></div>
						<table class="replyTable" id="rtb">
							<tbody></tbody>
						</table>
						
					</div>	
				
				
				
			</div>
			
			
			<div class="popUp_contentBox_righttBox">
				<div class="popUp_contentBox_righttBox_profileBox">
					 <div class="popUp_contentBox_righttBox_profileBox_innerBox">	
						<div><i class="fas fa-user-circle fa-4x"></i></div>
						<div class="popUp_usreName"><span>${nickname}</span></div>
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
				<div class="rp_mate_guide">
				
					<div class="rp_mate_left">재료명</div>
					<div class="rp_mate_right">수량</div>
				</div>
					<ul class="rp_mate_list">
					
						<c:forEach var="m" items="${r_mate }">
							<li>
								<div class="mate_item">
									<div class="rp_mate_left">${m.material_name }</div>
									<div class="rp_mate_right">${m.per_qnt }</div>
								</div>
							</li>
						</c:forEach>
							
							
						
					</ul>
				</div>
					<!-- 재료 리스트 항목 영역의 경우 백엔드 기능구현 할때 폼형식으로 수정해야함  -->
			
			
			
			
			
			</div>
		
		
		
		
		
		</div>
	
	
	
	
	
	
	
	
	
	</div>

</body>
<script>

		$(function(){
			$('.scrapBtn').on('click', function(){
				var refRid = ${r_info.recipe_no};
				$.ajax({
					url: 'enterScrap.rp',
					data : {Rid : refRid},
					success(data){
						console.log(data);
						//data의 값이 1이면 add 서비스 실행되었음
						var recipe = ${r_info.recipe_title};
						alert(recipe + '의 스크랩 등록에 성공 했습니다');
						
						//data의 값이 2면 delete 서비스 실행되었음
						
					}
				});
			});
			
			
			$(function(){getReplyList();
				setInterval(function(){
					getReplyList();
				}, 1000);
			});
			
			$('.enter_reply').on('click', function(){
				var rContent = $('#reply_area').val();
				var refRid = ${r_info.recipe_no};
				
				$.ajax({
					url: 'addReply.rp',
					data : {rContent : rContent, refRid : refRid},
					success:function(data){
						console.log(data);
						
						if(data="success"){
							$('#reply_area').val('');
							getReplyList();	//댓글 리스트 불러오기
						}
					}
				});
			});
			
			function getReplyList(){
				var rId = ${r_info.recipe_no};
				$.ajax({
					url: 'repList.rp',
					data: {rId: rId },
					dataType: 'json',
					success: function(data){
						console.log(data);
						
						var $tableBody = $('#rtb tbody');
						$tableBody.html('');
						$('#rCount').text('등록된 댓글 :  ' + data.length + '개');
						if(data.length > 0){
							
							for(var i in data){
								var $tr = $('<tr class="rtb_tr">');
								var $rWriter = $('<td width=150>').text(data[i].reply_nick);
								var $rContent = $('<td>').text(data[i].reply_content);
								var $rCreateDate = $('<td width=150>').text(data[i].reply_create_date);
								
								$tr.append($rWriter);
								$tr.append($rContent);
								$tr.append($rCreateDate);
								$tableBody.append($tr);
							}
						}else{
							var $tr = $('<tr>');
							var $rContent = $('<td colspan=3>').text('등록된 댓글이 없습니다');
							
							$tr.append($rContent);
							$tableBody.append($tr);
						}
					}
				});
			}
		});
	
		
		
	
</script>

</html>