<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/view/Survey/Surveyform.css">
</head>
<body>
	<div class="surveyall">
<img align="top" id="main_logosurvey" src="${ pageContext.servletContext.contextPath }/images/cccc_logo.PNG">	
	<h2 align="center">설문조사</h2>
	<div class="topservey">
	<textarea name="q1" rows="5" cols="120" style="resize:none;" placeholder="본 조사는 콕콕 쿡쿡 사이트 이용자를대상으로 다양한 식생활과 사이트에 관련된 의견을 수렴하여 사이트 서비스 개선방안을 모색하는데 목적을 두고 있습니다.>
	
응답해 주신 여러분의 소중한 답변은 저희 콕콕 쿡쿡 사이트의 서비스 통계자료에 귀중하게 사용될 것이며 , 수집정보는 통계분석 이외의 타 목적으로 활용하거나 공개하지 않습니다."></textarea>
</div>
	
	<form action="svSubmit.sv" method="post">
	<div class="surveyArea" align="center">
				<input type="hidden" name="user_no" value="${ loginUser.user_no }">
				<table id="SurveyTable">
					<tr>
						<td><span class="spans">1. 하루에, 집에서 밥 먹는 횟수는?</span></td>
					</tr>
					<tr>
						<th height="80px"></th>
						<td colspan="3">
							<input type="radio" name="chk_info1" value="자주 먹는다"> 자주 먹는다 &nbsp;
							<input type="radio" name="chk_info1" value="가끔 먹는다"> 가끔 먹는다 &nbsp;
							<input type="radio" name="chk_info1" value="거의 안먹는다"> 거의 안먹는다 &nbsp;
							<input type="radio" name="chk_info1" value="안먹는다"> 안먹는다 &nbsp;
						</td>
					</tr>
					
					
					
					<tr>
						<td><span class="spans">2. 직접 요리해서 먹는 걸 좋아하시나요?</span></td>
					</tr>
					<tr>
						<th height="80px"></th>
						<td colspan="3">
							<input type="radio" name="chk_info2" value="아주 좋아한다"> 아주 좋아한다 &nbsp;
							<input type="radio" name="chk_info2" value="좋아한다"> 좋아한다 &nbsp;
							<input type="radio" name="chk_info2" value="보통이다"> 보통이다 &nbsp;
							<input type="radio" name="chk_info2" value="싫어한다"> 싫어한다 &nbsp;
						</td>
					</tr>
					
					<tr>
						<td><span class="spans">3. 하루에 집에서 요리하는 횟수는?</span></td>
					</tr>
					<tr>
						<th height="80px"></th>
						<td colspan="3">
							<input type="radio" name="chk_info3" value="3회"> 3회 &nbsp;
							<input type="radio" name="chk_info3" value="2회"> 2회 &nbsp;
							<input type="radio" name="chk_info3" value="1회"> 1회 &nbsp;
							<input type="radio" name="chk_info3" value="0회"> 0회 &nbsp;
						</td>
					</tr>

					<tr>
						<td><span class="spans">4. 하루에 몇끼 드시나요?</span></td>
					</tr>
					<tr>
						<th height="80px"> </th>
						<td colspan="3">
							<input type="radio" name="chk_info4" value="4끼 이상"> 4끼 이상 &nbsp;
							<input type="radio" name="chk_info4" value="3끼"> 3끼 &nbsp;
							<input type="radio" name="chk_info4" value="2끼"> 2끼 &nbsp;	
							<input type="radio" name="chk_info4" value="1끼"> 1끼 &nbsp;
						</td>
						
					</tr>
					
					<tr>
					<td><span class="spans">5. 콕콕 쿡쿡 사이트 이용 후 도움이 되셨나요? </span></td>
					<tr>
						<th height="80px"></th>
						<td colspan="3">
							<input type="radio" name="chk_info5" value="매우 도움"> 매우 도움 &nbsp;
							<input type="radio" name="chk_info5" value="도움이 됨"> 도움이 됨 &nbsp;
							<input type="radio" name="chk_info5" value="보통"> 보통 &nbsp;	
							<input type="radio" name="chk_info5" value="도움 안됨"> 도움 안됨 &nbsp;
						</td>
						
					</tr>
					
				</table>
			<span>
			<input type="button" onclick="cancel()" value="취소">
			<button id= "submit">제출</button>
				</span>
			<br>
			<br>
			
			</div>
			</form>		
			</div>
			
</body>
</html>