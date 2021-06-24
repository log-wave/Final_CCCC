<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 등록</title>
 <link href="../../../style.css/index.css" rel="stylesheet" type="text/css">
 <link href="InsertEvent.css" rel="stylesheet" type="text/css">
</head>
<body>
	<c:import url="../../common/header.jsp?ver=1.0" charEncoding="UTF-8"></c:import>
	<form>
		<div class="mainArea">
			<p class="title">이벤트 등록</p>
			
			<table class="insert_form">
				<tr class="insert_title">
					<th>제목</th>
					<td>
						<input type="text" placeholder="제목을 입력해주세요" class="inputtitle">
						<input type="hidden">
					</td>
				</tr>
				
				<tr class="insert_image">
					<th>이미지</th>
					<td>
						<div class="image_upload"></div>
						<input type="hidden">
					</td>
				</tr>
				
				<tr class="insert_content">
					<th>내용</th>
					<td>
						<textarea rows="40" cols="80" id="insert_ta"></textarea>
						<input type="hidden">
					</td>
				</tr>
			</table>
			
			<div class="btn_area">
			
				<button class="cnbtn">취소</button>
				<input type="submit" class="subtn" value="저장">
			</div>
		</div>
	</form>
	<c:import url="../../common/footer.jsp" charEncoding="UTF-8"></c:import>
</body>
</html>