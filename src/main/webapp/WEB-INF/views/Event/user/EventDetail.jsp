<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>${ event.eventTitle }</title>

<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/index.css" rel="stylesheet" type="text/css">
 <link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/admin/termsOfService.css" rel="stylesheet" type="text/css">
 
</head>
<body>
	<!-- 관리자용 -->
	<c:if test="${ loginUser.authority eq 'Y' }">
	<div class="mainArea">
		<p class="title">이벤트 조회</p>
			
		<table class="detail_form">
			<tr class="detail_title">
				<th>제목</th>
				<td class="detail_text">
					${ event.eventTitle }
					<input type="hidden" id="eventNo" name="eventNo" value="${ event.eventNo }">
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
							<img id= "titleImg" src ="${pageContext.request.contextPath}/resources/uploadFiles/${files.get(0).changeName}"name= "titleImg" width="600px" height="225px">
						</div>
						<input type="hidden">
					</td>
			</tr>
			<tr class="detail_image">
				<th>세부 이미지</th>
				<td>
					<div class="image_upload">
					<img id= "contentImg" src="${pageContext.request.contextPath}/resources/uploadFiles/${files.get(1).changeName}"name="image_upload" width="600px" height="900px">
					</div>
					<input type="hidden" name="">
				</td>
			</tr>
			
			<tr class="detail_content">
					<th>내용</th>
					<td>
						<textarea style="width: 600px; height: 300px" id="detail_ta"  name="eventContent" readonly="readonly" disabled>${event.eventContent}</textarea>
						<input type="hidden">
					</td>
			</tr>
			
			
		</table>
		<div class="btn_area">
			<button type="button" class="cnbtn" onclick="window.close();">돌아가기</button>
			<button type="button" class="cnbtn" onclick="location.href='<%=request.getContextPath()%>/updateEventView.ev?no=' + ${ event.eventNo }" style="background: #F29F05;">수정하기</button>
		</div>
	</div>
	</c:if>
	<br clear ="all">
	
	
	<c:if test="${ loginUser.authority ne 'Y' }">
	<!-- 이용자용 -->
	<c:import url="../../common/header.jsp?ver=1.0" charEncoding="UTF-8"></c:import>
	<div class="u_mainArea">
		<p class="u_title">${event.eventTitle }</p>
		
		<div>
			<div class="u_top">
				<img src="${pageContext.request.contextPath}/resources/uploadFiles/${files.get(1).changeName}" class="u_t_img" width="600px" height="900px">	
			</div>
			<br><br>
			<div class="u_e_text">
				<div class="u_detail_text">
				<!-- 
					textarea에서 추가되면 이를 개행구분문자를 넣고 서블렛에서 view로 보내줄때
					개행구분문자를 array에 하나씩 받아서 arrayList의 길이만큼<p>를 반복하는 식
					아무값도 없는 엔터나 arrayList에 들어가면 <br>을 추가
				 -->
					<textarea style="width: 600px; height: 300px" id="detail_ta"  name="eventContent" readonly="readonly" disabled>${event.eventContent}</textarea>
					
				</div>
			</div>
			<div class="btn_area">
				<button class="cnbtn" onclick="location.href='eventList.ev'">목록</button>
			</div>
		</div>
	</div>
	<c:import url="../../common/footer.jsp" charEncoding="UTF-8"></c:import>
	</c:if>
</body>
</html>