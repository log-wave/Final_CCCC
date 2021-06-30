<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 등록</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/index.css" rel="stylesheet" type="text/css">
 <link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/Event/InsertEvent.css" rel="stylesheet" type="text/css">
</head>
<body>
	<c:import url="../../common/header.jsp?ver=1.0" charEncoding="UTF-8"></c:import>
	<form action="insertEvent.ev" method="post" enctype="multipart/form-data">
		<div class="mainArea">
			<p class="title">이벤트 등록</p>
			
			<table class="insert_form">
				<tr class="insert_title">
					<th>제목</th>
					<td>
						<input type="text" placeholder="제목을 입력해주세요" class="inputtitle" name="eventTitle">
						<input type="hidden">
					</td>
				</tr>
				<tr class="insert_date">
					<th>기간</th>
					<td>
						<input type="date" class="inputdate" name="eventStart" >
						~
						<input type="date" class="inputdate" name="eventEnd">
						<input type="hidden">
					</td>
				</tr>
				
				<tr class="insert_titleimage">
					<th>썸네일 이미지</th>
					<td>
						<div class="titleimage_upload">
							<img id= "titleImg" name= "titleImg" width="600px" height="225px">
						</div>
						<input type="hidden">
					</td>
				</tr>
				
				<tr class="insert_image">
					<th>세부 이미지</th>
					<td>
						<div class="image_upload">
							<img id= "contentImg"name="image_upload" width="600px" height="900px">
						</div>
						<input type="hidden">
					</td>
				</tr>
				
				<tr class="insert_content">
					<th>내용</th>
					<td>
						<textarea style="width: 600px; height: 300px" id="insert_ta"  name="eventContent"></textarea>
						<input type="hidden">
					</td>
				</tr>
			</table>
			<!-- 파일 업로드 -->
			<div id="fileArea">
				<input type="file" id="thumbnailImg1" multiple="multiple" name="eventImg" onchange="LoadImg(this,1)">
				<input type="file"  id="thumbnailImg2" multiple="multiple" name="eventImg" onchange="LoadImg(this,2)">
			</div>
			<div class="btn_area">
			
				<button class="cnbtn">취소</button>
				<input type="submit" class="subtn" value="저장">
			</div>
		</div>

	</form>
	<br><br><br>
	
			
	<c:import url="../../common/footer.jsp" charEncoding="UTF-8"></c:import>
	
	
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