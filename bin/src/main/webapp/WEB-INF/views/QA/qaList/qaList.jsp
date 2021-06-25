<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A</title>

<link href="../../../style.css/index.css" rel="stylesheet" type="text/css">
<link href="qaList.css" rel="stylesheet" type="text/css">

</head>
<body>
	<c:import url="../../common/header.jsp"/>
	<div class="qaList_main" align="center">
		<div class="qaList">
			<h2>Q&A</h2><br><br><br><br><br><br>
			<table id="qa_one">
			<%-- <c:forEach var="b" items="${ list }"> 여기다가 반복문 돌려서 뽑아내면 됨 --%>
				<tr>
					<td class="qa_first_row">5.  레시피 리뷰는 어떻게 등록하나요?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><p>회원1</p></td>
					<td><p>2021-05-31</p></td>
					<td class="qa_last_row"><p>2</p></td>
				</tr>
				<tr>
					<td class="qa_first_row">4.  레시피를 삭제하고 싶어요</td>
					<td><p>회원1</p></td>
					<td><p>2021-05-31</p></td>
					<td class="qa_last_row"><p>2</p></td>
				</tr>
				<tr>
					<td class="qa_first_row">3.  회원가입은 어떻게 하나요?</td>
					<td><p>회원1</p></td>
					<td><p>2021-05-31</p></td>
					<td class="qa_last_row"><p>2</p></td>
				</tr>
				<tr>
					<td class="qa_first_row">2.  닉네임은 어떻게 변경하나요?</td>
					<td><p>회원1</p></td>
					<td><p>2021-05-31</p></td>
					<td class="qa_last_row"><p>2</p></td>
				</tr>
				<tr>
					<td class="qa_first_row">1.  회원 탈퇴 방법을 알려주세요</td>
					<td><p>회원1</p></td>
					<td><p>2021-05-31</p></td>
					<td class="qa_last_row"><p>2</p></td>
				</tr>
			</table>
			<div class="qa_question">
				<button>질문하기</button>
			</div>
			<br><br><br><br>
			
			<div class="pagingArea">
				<button>&lt;</button>
				<!-- 버튼이 클릭되었을때 기능도 넣어줘야함  -->
				<button>1</button>
				<button>2</button>
				<button>3</button>
				<button>&gt;</button>
			</div>
		</div>
	</div>
	<c:import url="../../common/footer.jsp"/>
</body>
</html>