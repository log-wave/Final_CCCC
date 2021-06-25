<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재료 등록</title>

<link href="../../../style.css/index.css" rel="stylesheet" type="text/css">
<link href="insertFoForm.css" rel="stylesheet" type="text/css">

</head>
<body>
	
	<div class="insertFo_main" align="center">
		<div class="insertFo_text">
			<br><br><br><br><br>
			<h2>재료 등록</h2>
			<br><br><br>
			<div class="inputArea">
			<p>재료명 : </p><input type="text" ><br>
			<p>기준 : </p><input type="text"><br>
			<p>영양성분</p>
			<br>
			</div>
			<textarea rows="10" cols="50"></textarea>	
			<br>
			<textarea rows="5" cols="50"></textarea>	
			<button>목록</button> &nbsp;&nbsp;&nbsp;
			<button id="button1">등록</button>
		</div>
	</div>
</body>
</html>