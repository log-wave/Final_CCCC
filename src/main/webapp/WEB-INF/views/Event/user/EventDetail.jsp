<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 나중에 이벤트 제목으로 변경할것 -->
<title>이벤트 상세보기</title>

<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/index.css" rel="stylesheet" type="text/css">
 <link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/Event/EventDetail.css" rel="stylesheet" type="text/css">
 
</head>
<body>
	<c:import url="../../common/header.jsp?ver=1.0" charEncoding="UTF-8"></c:import>
	<!-- 관리자용 -->
	<form>
	<div class="mainArea">
		<p class="title">이벤트 조회</p>
			
		<table class="detail_form">
			<tr class="detail_title">
				<th>제목</th>
				<td class="detail_text">
					${event.eventTitle }
					<input type="hidden" name="">
				</td>
			</tr>
			<tr class="detail_date">
					<th>기간</th>
					<td class="date">
						${ event.eventStart } ~ ${ event.eventEnd }
						<input type="hidden">
					</td>
			</tr>
			<tr class="detail_titleimage">
					<th>썸네일 이미지</th>
					<td>
						<div class="titleimage_upload">
							<img id= "titleImg" name= "titleImg" width="600px" height="225px">
						</div>
						<input type="hidden">
					</td>
			</tr>
			<tr class="detail_image">
				<th>세부 이미지</th>
				<td>
					<div class="image_upload">
					<img id= "contentImg"name="image_upload" width="600px" height="900px">
					</div>
					<input type="hidden" name="">
				</td>
			</tr>
			
			<tr class="detail_content">
					<th>내용</th>
					<td>
						<textarea rows="20" cols="87" id="detail_ta"  name="eventContent" readonly="readonly">${event.eventContent}</textarea>
						<input type="hidden">
					</td>
			</tr>
			
			
		</table>
		<!-- 로그인유저가 admin이 아닐경우 등장하지 않음
			또는 유저용 view를 하나 더 만들기 -->
		<div class="btn_area">
			<button  type="button" class="cnbtn" onclick="location.href='eventList.ev'">목록</button>
			<input type="submit" class="subtn" value="저장">
		</div>
	</div>
	</form>
	<br clear ="all">
	
	
	
	<!-- 이용자용 -->
	↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓이용자일때만 등장합니다↓↓↓↓↓↓↓↓↓↓↓↓↓
	<div class="u_mainArea">
		<p class="u_title">${event.eventTitle }</p>
		
		<div>
			<div class="u_top">
				<img src="${pageContext.request.contextPath}/images/event/event_139_thum.png" class="u_t_img" width="600px" height="900px">	
			</div>
			<br><br>
			<div class="u_e_text">
				<div class="u_detail_text">
				<!-- 
					textarea에서 추가되면 이를 개행구분문자를 넣고 서블렛에서 view로 보내줄때
					개행구분문자를 array에 하나씩 받아서 arrayList의 길이만큼<p>를 반복하는 식
					아무값도 없는 엔터나 arrayList에 들어가면 <br>을 추가
				 -->
					${event.eventContent}
					
				</div>
			</div>
			<div class="btn_area">
				<button class="cnbtn" onclick="location.href='eventList.ev'">목록</button>
			</div>
		</div>
	</div>
	<c:import url="../../common/footer.jsp" charEncoding="UTF-8"></c:import>
</body>
</html>