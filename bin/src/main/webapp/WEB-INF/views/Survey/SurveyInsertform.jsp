<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/view/Survey/SurveyInsertform.css">
</head>
<body>
<div class="surveyall">
<img id="main_logosurvey" src="${ pageContext.servletContext.contextPath }/images/cccc_logo.PNG">	
	<h2 align="center">설문조사 작성</h2>
	<div class="topservey">
	<textarea name="q1" rows="5" cols="120" style="resize:none;" placeholder="내용을 입력해주세요."></textarea>
</div>
	<div class="insertArea" align="center">
				<table id="SurveyTable">
					<tr>
						<td><textarea id="maintextarea" name="q1" rows="2" cols="60" style="resize:none;" placeholder="질문을 입력해주세요."></textarea>
						</td>
					</tr>
					<tr>
						<th height="80px"></th>
						<td colspan="3">
							<input type="radio" name="chk_insert1" value="1">
							&nbsp;<label>입력</label>
							<input type="radio" name="chk_insert1" value="2">
							&nbsp;<label>입력</label>
							<input type="radio" name="chk_insert1" value="3">
							&nbsp;<label>입력</label>
							<input type="radio" name="chk_insert1" value="4">
							&nbsp;<label>입력</label>
						</td>
					</tr>
					<tr>
						<td><textarea name="q1" rows="2" cols="60" style="resize:none;" placeholder="질문을 입력해주세요."></textarea></td>
					</tr>
					<tr>
						<th height="80px"></th>
						<td colspan="3">
							<input type="radio" name="chk_insert2" value="1">
							&nbsp;<label>입력</label>
							<input type="radio" name="chk_insert2" value="2">
							&nbsp;<label>입력</label>
							<input type="radio" name="chk_insert2" value="3">
							&nbsp;<label>입력</label>
							<input type="radio" name="chk_insert2" value="4">
							&nbsp;<label>입력</label>
						</td>
					</tr>

					<tr>
						<td><textarea name="q1" rows="2" cols="60" style="resize:none;" placeholder="질문을 입력해주세요."></textarea></td>
					</tr>
					<tr>
						<th height="80px"> </th>
						<td colspan="3">
							<input type="radio" name="chk_insert3" value="1">
							&nbsp;<label>입력</label>
							<input type="radio" name="chk_insert3" value="2">
							&nbsp;<label>입력</label>
							<input type="radio" name="chk_insert3" value="3">
							&nbsp;<label>입력</label>
							<input type="radio" name="chk_insert3" value="4">
							&nbsp;<label>입력</label>
						</td>
						
					</tr>
					
					<tr>
					<td><textarea name="q1" rows="2" cols="60" style="resize:none;" placeholder="질문을 입력해주세요."></textarea></td>
					<tr>
						<th height="80px"></th>
						<td colspan="3">
							<input type="radio" name="chk_insert4" value="1">
							&nbsp;<label>입력</label>
							<input type="radio" name="chk_insert4" value="2">
							&nbsp;<label>입력</label>
							<input type="radio" name="chk_insert4" value="3">
							&nbsp;<label>입력</label>
							<input type="radio" name="chk_insert4" value="4">
							&nbsp;<label>입력</label>
						</td>
						
					</tr>
					
					<tr>
						<td><textarea name="q1" rows="2" cols="60" style="resize:none;" placeholder="질문을 입력해주세요."></textarea></td>
					</tr>
					<tr>
						<th height="80px"></th>
						<td colspan="3">
							<input type="radio" name="chk_insert5" value="1">
							&nbsp;<label>입력</label>
							<input type="radio" name="chk_insert5" value="2">
							&nbsp;<label>입력</label>
							<input type="radio" name="chk_insert5" value="3">
							&nbsp;<label>입력</label>
							<input type="radio" name="chk_insert5" value="4">
							&nbsp;<label>입력</label>
						</td>
					</tr>
					
				</table>
			<span>
			<button id= "exit">취소</button>
			<button id= "submit">등록</button>
				</span>
			<br>
			<br>
			
			</div>		
			</div>
</body>
</html>