<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A등록</title>
<link href="../../../style.css/index.css" rel="stylesheet" type="text/css">
<link href="insertQA.css" rel="stylesheet" type="text/css">
</head>
<body>
	<c:import url="../../common/header.jsp"/>
	<div class="insertQA_main" align="center">
		<div class="insertQA">
		<h4>Q&A등록</h4>
		<br><br><br>
			<table id="insertQA_table">
				<tr>
					<td class="title_td">제목</td>
					<td class="second_td"><input type="text" placeholder="제목을 입력해주세요"></td>
				</tr>
				<tr>
					<td class="third_td">내용</td>
					<td class="fourth_td"><textarea rows="30" cols="110"></textarea></td>
				</tr>
			</table>
		</div>
		
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button>취소</button> 
		<button id="button1">등록</button>
	</div>
	<c:import url="../../common/footer.jsp"/>
</body>
</html>