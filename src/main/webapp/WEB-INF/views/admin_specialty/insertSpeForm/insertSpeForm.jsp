<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>특산물 등록</title>

<link href="../../../style.css/index.css" rel="stylesheet" type="text/css">
<link href="insertSpeForm.css" rel="stylesheet" type="text/css">

</head>
<body>
	
	<div class="insertSpe_main" align="center">
		<div class="insertSpe_text">
			<br><br><br><br><br>
			<h2>특산물 등록</h2>
			<br><br><br>
			<p>지역 선택</p>
			<br>
			<table class="regionTable" border="1">
				<tr>
					<td width="80px" height="20px">서울</td>
					<td width="80px" height="20px">경기도</td>
					<td width="80px" height="20px">강원도</td>
					<td width="80px" height="20px">충청도</td>
				</tr>
				<tr>
					<td width="80px" height="20px">전라도</td>
					<td width="80px" height="20px">경상도</td>
					<td width="80px" height="20px">제주도</td>
					<td width="80px" height="20px">전국</td>
				</tr>
			</table>
			<br><br><br>
			<p>특산물 재료 종류</p>
			<br>
				<table class="regionTable" border="1">
				<tr>
					<td width="80px" height="20px">과일류</td>
					<td width="80px" height="20px">어패류</td>
					<td width="80px" height="20px">고기류</td>
					<td width="80px" height="20px">채소류</td>
				</tr>
				<tr>
					<td width="80px" height="20px">유제품/치즈류</td>
					<td width="80px" height="20px">감자/고구마류</td>
					<td width="80px" height="20px">햄/소세지</td>
					<td width="80px" height="20px">기타</td>
				</tr>
			</table>
			<br><br><br>
			<p>특산물 정보</p>
			<br>
			<textarea rows="15" cols="50"></textarea>	
			<button>목록</button> &nbsp;&nbsp;&nbsp;
			<button id="button1">등록</button>
		</div>
	</div>
</body>
</html>