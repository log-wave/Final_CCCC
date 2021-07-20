<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 조회</title>

<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>

<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/admin/admin_mypage.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="outer" align="center">
	<h1>회원 정보</h1>
	<label id="info_id">${ m.user_id }</label><label>님의 회원 정보입니다.</label><br>
	<label>회원정보는 개인정보처리방침에 따라 안전하게 보호됩니다.</label><br><br><br>
	<table>
					<tr>
						<td class="letter" width="140px" align="center">아이디</td>
						<td width="220px">&nbsp;&nbsp;&nbsp;&nbsp;${ m.user_id }</td>
					</tr>
					<tr>
						<td class="letter" align="center">이름</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;${ m.user_name }</td>
					</tr>
					<tr>
						<td class="letter" align="center">닉네임</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;${ m.nickname }</td>
					</tr>
					<tr>
						<td class="letter" align="center">성별</td>
						<c:if test="${ m.gender eq 'F'}">
							<td>&nbsp;&nbsp;&nbsp;&nbsp;여</td>
						</c:if>
						<c:if test="${ m.gender eq 'M'}">
							<td>&nbsp;&nbsp;&nbsp;&nbsp;남</td>
						</c:if>
					</tr>
					<%-- <tr>
						<td>생일</td>
						<td><input type="date" id="birth"
							value="${ m.user_id }"></td>
					</tr> --%>
					<tr>
						<td class="letter" align="center">나이</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;${ m.age }</td>
					</tr>
					<tr>
						<td class="letter" align="center">이메일</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;${ m.email }</td>
					</tr>
					<tr>
						<td class="letter" align="center">가입일</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;${ m.u_cre_date }</td>
					</tr>
					<tr>
						<td class="letter" align="center">상태</td>
						<c:if test="${ m.status eq 'Y'}">
							<td>&nbsp;&nbsp;&nbsp;&nbsp;정상</td>
						</c:if>
						<c:if test="${ m.status eq 'S'}">
							<td>&nbsp;&nbsp;&nbsp;&nbsp;정지</td>
						</c:if>
						<c:if test="${ m.status eq 'N'}">
							<td>&nbsp;&nbsp;&nbsp;&nbsp;탈퇴</td>
						</c:if>
					</tr>
					<tr>
						<td class="letter" align="center">설문조사</td>
						<c:if test="${ m.survey_yn eq 'Y'}">
							<td>&nbsp;&nbsp;&nbsp;&nbsp;함</td>
						</c:if>
						<c:if test="${ m.survey_yn eq 'N'}">
							<td>&nbsp;&nbsp;&nbsp;&nbsp;안함</td>
						</c:if>
					</tr>
				</table>
				<br>
				</div>
				<br>
				<div align="center">
				<button class="button1" onclick="window.close();" style="width: 100px; height: 40px; font-weight: bold; border-style: none; border-radius: 4px; margin-top: 20px; cursor: pointer;">돌아가기</button>
				</div>
				<script>
				$('.button1').hover(function(){
					$(this).css('background', 'white');
				}, function() {
				    $(this).css('background', '');
				});

				</script>
	
</body>
</html>