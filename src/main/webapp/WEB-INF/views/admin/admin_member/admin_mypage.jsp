<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 조회</title>

<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<table>
					<tr>
						<td>아이디</td>
						<td>${ m.user_id }</td>
					</tr>
					<tr>
						<td>이름</td>
						<td>${ m.user_name }</td>
					</tr>
					<tr>
						<td>닉네임</td>
						<td>${ m.nickname }</td>
					</tr>
					<tr>
						<td>성별</td>
						<c:if test="${ m.gender eq 'F'}">
							<td>여</td>
						</c:if>
						<c:if test="${ m.gender eq 'M'}">
							<td>남</td>
						</c:if>
					</tr>
					<%-- <tr>
						<td>생일</td>
						<td><input type="date" id="birth"
							value="${ m.user_id }"></td>
					</tr> --%>
					<tr>
						<td>나이</td>
						<td>${ m.age }</td>
					</tr>
					<tr>
						<td>이메일</td>
						<td>${ m.email }</td>
					</tr>
					<tr>
						<td>가입일</td>
						<td>${ m.u_cre_date }</td>
					</tr>
					<tr>
						<td>상태</td>
						<c:if test="${ m.status eq 'Y'}">
							<td>정상</td>
						</c:if>
						<c:if test="${ m.status eq 'N'}">
							<td>탈퇴</td>
						</c:if>
					</tr>
					<tr>
						<td>설문조사</td>
						<c:if test="${ m.survey_yn eq 'Y'}">
							<td>함</td>
						</c:if>
						<c:if test="${ m.survey_yn eq 'N'}">
							<td>안함</td>
						</c:if>
					</tr>
				</table>
				<br>
				<button class="button1" onclick="window.close();" style="width: 100px; height: 40px; font-weight: bold; border-style: none; border-radius: 4px; margin-top: 20px; cursor: pointer;">돌아가기</button>
				
				<script>
				$('.button1').hover(function(){
					$(this).css('background', 'white');
				}, function() {
				    $(this).css('background', '');
				});

				</script>
	
</body>
</html>