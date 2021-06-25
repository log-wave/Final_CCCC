<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 나중에 이벤트 제목으로 변경할것 -->
<title>이벤트 상세보기</title>

 <link href="../../../style.css/index.css" rel="stylesheet" type="text/css">
 <link href="EventDetail.css" rel="stylesheet" type="text/css">
</head>
<body>
	<c:import url="../../common/header.jsp?ver=1.0" charEncoding="UTF-8"></c:import>
	<!-- 관리자용 -->
	<form>
	<div class="mainArea">
		<p class="title">이벤트 등록</p>
			
		<table class="detail_form">
			<tr class="detail_title">
				<th>제목</th>
				<td class="detail_text">
					나만의 감자요리 레시피를 올려주세요~
					<input type="hidden" name="">
				</td>
				
			</tr>
			
			<tr class="detail_image">
				<th>이미지</th>
				<td>
					<div class="detail_image"></div>
					<input type="hidden" name="">
				</td>
			</tr>
			
			<tr class="detail_content">
				<th>내용</th>
				<td class="detail_text">
				<input type="hidden" name="">
				<!-- 
					textarea에서 추가되면 이를 개행구분문자를 넣고 서블렛에서 view로 보내줄때
					개행구분문자를 array에 하나씩 받아서 arrayList의 길이만큼<p>를 반복하는 식
					아무값도 없는 엔터나 arrayList에 들어가면 <br>을 추가
				 -->
					<p>안녕하세요~쿡쿡 콕콕입니다.</p> 
					<p>요즘 감자가 제철이라고 해요~ 마트나 시장에 가면 햇감자가 많이 나오더라구요.</p> 
					<p>나만의 비법이 담긴 감자 활용 레시피를 알려주세요!</p> 
					<p><br></p>
					<p>레시피를 올려주신 분들 중 추첨을 통해 소정의 상품을 증정합니다.</p> 
					<p>노하우가 담긴 특별한 레시피를 기대합니다.</p> 
					<p><br></p>
 					<p>주변 분들에게 쿡쿡 콕콕 이벤트 입소문 많이 내주시길 부탁드려요 :)</p>
				</td>
			</tr>
		</table>
		<!-- 로그인유저가 admin이 아닐경우 등장하지 않음
			또는 유저용 view를 하나 더 만들기 -->
		<div class="btn_area">
			<button class="cnbtn">취소</button>
			<input type="submit" class="subtn" value="저장">
		</div>
	</div>
	</form>
	<br clear ="all">
	<!-- 이용자용 -->
	↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓이용자일때만 등장합니다↓↓↓↓↓↓↓↓↓↓↓↓↓
	<div class="u_mainArea">
		<p class="u_title">나만의 감자 레시피를 올려주세요</p>
		
		<div>
			<div class="u_top">
				<img src="${pageContext.request.contextPath}/images/event/event_139_thum.png" class="u_t_img">
			</div>
			<div class="u_bottom">
				<!-- 이미지 슬라이드로 구현? -->
				<!-- 스토리보드대로 -->
				
				<!-- 하나당 하나씩 -->
				<div class="u_items">
					<img src="${pageContext.request.contextPath}/images/event/sample1.png">
				</div>
				<div class="u_items">
					<img src="${pageContext.request.contextPath}/images/event/sample2.png">
				</div>
				<div class="u_items">
					<img src="${pageContext.request.contextPath}/images/event/sample3.png">
				</div>
				<div class="u_items">
					<img src="${pageContext.request.contextPath}/images/event/sample4.png">
				</div>
				<div class="u_items">
					<img src="${pageContext.request.contextPath}/images/event/sample4.png">
				</div>
				
			</div>
			
			<div class="u_e_text">
				<div class="u_detail_text">
				<!-- 
					textarea에서 추가되면 이를 개행구분문자를 넣고 서블렛에서 view로 보내줄때
					개행구분문자를 array에 하나씩 받아서 arrayList의 길이만큼<p>를 반복하는 식
					아무값도 없는 엔터나 arrayList에 들어가면 <br>을 추가
				 -->
					<p>안녕하세요~쿡쿡 콕콕입니다.</p>
					<p>요즘 감자가 제철이라고 해요~ 마트나 시장에 가면 햇감자가 많이 나오더라구요.</p>
					<p>나만의 비법이 담긴 감자 활용 레시피를 알려주세요!</p>
					<p><br></p>
					<p>*단 , 레시피 제목에 '감자' 또는 '감자 연상단어' 단어가 꼭 포함이 되어야 참여 인정*</p>
					<p><br></p>
					<p>레시피를 올려주신 분들 중 추첨을 통해 위의 상품에서 원하는 상품을  증정합니다.</p>
					<p>노하우가 담긴 특별한 레시피를 기대합니다.</p>
					<p><br></p>
					<p><br></p>
					<p><br></p>
					<p>◎ 기간</p>
					<p>-응모 : 2021년 5월 31일~2021년 6월 30일 오후 6시</p>
					<p>-발표 : 2021년 7월 5일</p>
					<p><br></p>
					<p>◎ 선정기준</p>
					<p>- 인기상 (3명) : 주제에</p>
					<p>맞는 레시피의 리뷰와 의견, 스크랩수를 종합적으로 취합하여 선정.</p>
					<p><br></p>
					<p>- 쉐프상 (3명) : 재료</p>
					<p>계량, 과정 설명, 과정 이미지가 잘 된 레시피와 아이디어가 돋보이는 레시피 대상으로 선정.</p>
				</div>
			</div>
		</div>
	</div>
	<c:import url="../../common/footer.jsp" charEncoding="UTF-8"></c:import>
</body>
</html>