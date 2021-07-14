<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>${ event.eventTitle }</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/index.css" rel="stylesheet" type="text/css">
 <link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/Event/EventDetail.css" rel="stylesheet" type="text/css">
 
</head>
<body>
<form action="updateEvent.ev" method="post" enctype="multipart/form-data">
	<div class="mainArea">
		<p class="title">이벤트 수정</p>
			
		<table class="detail_form">
			<tr class="detail_title">
				<th>제목</th>
				<td class="detail_text">
					<input type="hidden" name="eventNo" value="${ event.eventNo }">
					<input type="text" name="eventTitle" value="${ event.eventTitle }">
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
							<input type="hidden" name="file_no_0" value="${ files.get(0).fileNo }">
						</div>
						<input type="hidden">
					</td>
			</tr>
			<tr class="detail_image">
				<th>세부 이미지</th>
				<td>
					<div class="image_upload">
					<img id= "contentImg" src="${pageContext.request.contextPath}/resources/uploadFiles/${files.get(1).changeName}"name="image_upload" width="600px" height="900px">
					<input type="hidden" name="file_no_1" value="${ files.get(1).fileNo }">
					</div>
					<input type="hidden" name="">
				</td>
			</tr>
			
			<tr class="detail_content">
					<th>내용</th>
					<td>
						<textarea style="width: 600px; height: 300px" id="detail_ta"  name="eventContent" >${event.eventContent}</textarea>
						<input type="hidden">
					</td>
			</tr>
			
			
		</table>
		<div id="fileArea">
				<input type="file" id="thumbnailImg1" multiple="multiple" name="eventImg" onchange="LoadImg(this,1)">
				<input type="file"  id="thumbnailImg2" multiple="multiple" name="eventImg" onchange="LoadImg(this,2)">
		</div>
		<div class="btn_area">
			<button type="button" class="cnbtn" onclick="window.close();">돌아가기</button>
			<button type="submit" class="cnbtn" style="background: #F29F05;">저장</button>
		</div>
	</div>
</form>	
	<script>
	<!-- 파일 선택 후 화면에 보여지도록 -->
	$(function(){
		$("#fileArea").hide();
		
		$(".titleimage_upload").click(function(){
			$("#thumbnailImg1").click();
		});
		$(".image_upload").click(function(){
			$("#thumbnailImg2").click();
		});
	});
	
	function LoadImg(value, num){
		if(value.files && value.files[0]){
			var reader = new FileReader(); 
			
			reader.onload = function(e){
				switch(num) {
				case 1:
					$("#titleImg").attr("src", e.target.result);
					break;
				case 2:
					$("#contentImg").attr("src", e.target.result);
					break;
				}
			}
			
			reader.readAsDataURL(value.files[0]); 
		}
	}

	</script>
	
</body>
</html>