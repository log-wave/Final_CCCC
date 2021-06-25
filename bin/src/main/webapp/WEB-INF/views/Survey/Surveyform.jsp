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
	<div class="surveyArea" align="center">
				<table id="SurveyTable">
					<tr>
						<td><span class="spans">1. 하루에, 집에서 밥 먹는 횟수는?</span></td>
					</tr>
					<tr>
						<th height="80px"></th>
						<td colspan="3">
							<input type="radio" name="chk_info1" value="1"> 아주만족 &nbsp;
							<input type="radio" name="chk_info1" value="2"> 2 &nbsp;
							<input type="radio" name="chk_info1" value="3"> 3 &nbsp;
							<input type="radio" name="chk_info1" value="4"> 4 &nbsp;
						</td>
					</tr>
					
					
					
					<tr>
						<td><span class="spans">2. 직접 요리해서 먹는 걸 좋아하시나요?</span></td>
					</tr>
					<tr>
						<th height="80px"></th>
						<td colspan="3">
							<input type="radio" name="chk_info2" value="1"> 1 &nbsp;
							<input type="radio" name="chk_info2" value="2"> 2 &nbsp;
							<input type="radio" name="chk_info2" value="3"> 3 &nbsp;
							<input type="radio" name="chk_info2" value="4"> 4 &nbsp;
						</td>
					</tr>
					
					<tr>
						<td><span class="spans">3. 집에서 요리하는 횟수는?</span></td>
					</tr>
					<tr>
						<th height="80px"></th>
						<td colspan="3">
							<input type="radio" name="chk_info3" value="1"> 1 &nbsp;
							<input type="radio" name="chk_info3" value="2"> 2 &nbsp;
							<input type="radio" name="chk_info3" value="3"> 3 &nbsp;
							<input type="radio" name="chk_info3" value="4"> 4 &nbsp;
						</td>
					</tr>

					<tr>
						<td><span class="spans">4. 좋아하는 음식은?</span></td>
					</tr>
					<tr>
						<th height="80px"> </th>
						<td colspan="3">
							<input type="radio" name="chk_info4" value="1"> 1 &nbsp;
							<input type="radio" name="chk_info4" value="2"> 2 &nbsp;
							<input type="radio" name="chk_info4" value="3"> 3 &nbsp;	
							<input type="radio" name="chk_info4" value="4"> 4 &nbsp;
						</td>
						
					</tr>
					
					<tr>
					<td><span class="spans">5. 콕콕 쿡쿡 사이트 이용 후 도움이 되셨나요? </span></td>
					<tr>
						<th height="80px"></th>
						<td colspan="3">
							<input type="radio" name="chk_info5" value="1"> 1 &nbsp;
							<input type="radio" name="chk_info5" value="2"> 2 &nbsp;
							<input type="radio" name="chk_info5" value="3"> 3 &nbsp;	
							<input type="radio" name="chk_info5" value="4"> 4 &nbsp;
						</td>
						
					</tr>
					
				</table>
			<span>
			<button id= "exit">취소</button>
			<button id= "submit">제출</button>
				</span>
			<br>
			<br>
			
			</div>		
			</div>
</body>
</html>