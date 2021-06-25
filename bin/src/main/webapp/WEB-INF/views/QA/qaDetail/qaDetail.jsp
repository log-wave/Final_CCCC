<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A</title>
<link href="../../../style.css/index.css" rel="stylesheet" type="text/css">
<link href="qaDetail.css" rel="stylesheet" type="text/css">
</head>
<body>
	<c:import url="../../common/header.jsp"/>
	<div class="qaDetail_main" align="center">
		<div class="qaDetail">
			<table id="qaDetail_table">
				<tr>
					<td class="title_td">제목</td>
					<td class="second_td" colspan="3">회원 가입 방법을 알려주세요<label>조회:2</label></td>
				</tr>
				<tr>
					<td class="title_td">작성자</td>
					<td class="second_td">회원1</td>
					<td class="title_td">3</td>
					<td class="second_td">4</td>
				</tr>
				<tr>
					<td class="third_td">내용</td>
					<td class="fourth_td" colspan="3">
						<label>
							회원가입을 하고 싶은데... 회원가입 방법을 알려주세요!!
						</label>
					</td>
				</tr>
			</table>
		</div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button>삭제</button> 
		<button id="button1">수정</button>
		
		<!-- 관리자 부분 -->
		<div class="qaDetail_answer">
		<br><br>
			<h4 align="left">답변</h4>
			<br>
			<textarea rows="4" cols="100" placeholder="내용을 입력해주세요."></textarea>
			<br>
			<div style="margin-right: 80px;">
				<button>취소</button>
				<button id="button1">등록</button>
			</div>
		<!-- 사용자 부분 -->
		
		</div>
		
		
		
	</div>
	<c:import url="../../common/footer.jsp"/>
</body>
</html>