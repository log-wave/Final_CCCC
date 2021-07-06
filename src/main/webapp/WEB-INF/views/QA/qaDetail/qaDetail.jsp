<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&amp;A</title>
<link rel="stylesheet" href="<c:url value='/resources/css/style.css/index.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/QA/qaDetail/qaDetail.css?ver=1.0'/>">
</head>
<body>
	<c:import url="../../common/header.jsp"/>
	<div class="qaDetail_main" align="center">
		<div class="qaDetail">
			<table id="qaDetail_table">
				<tr>
					<td class="title_td">제목</td>
					<td class="second_td" colspan="3">${ board.bTitle }<label>조회 : ${ board.bView }</label></td>
				</tr>
				<tr>
					<td class="title_td">작성자</td>
					<td class="second_td">${ board.nickName }</td>
					<td class="title_td">날짜</td>
					<td class="second_td">${ board.bCreateDate }</td>
				</tr>
				<tr>
					<td class="third_td">내용</td>
					<td class="fourth_td" colspan="3">
						<textarea rows="30" cols="100" style="resize:none;" readonly="readonly" disabled>${ board.bContent }</textarea> 
						<!-- 라벨은 데이터베이스 데이터를 가져와서 뿌리면 띄어쓰기와 엔터가 안먹히므로 textarea로 받아옴 -->
					</td>
				</tr>
			</table>
		</div>
		<c:url var="qupView" value="qupView.qa">
			<c:param name="bNo" value="${ board.bNo }"/>
			<c:param name="page" value="${ page }"/>
		</c:url>
		<c:url var="qdelete" value="qdelete.qa">
			<c:param name="bNo" value="${ board.bNo }"/>
		</c:url>
		<c:url var="qlist" value="qlist.qa">
			<c:param name="page" value="${ page }"/>
		</c:url>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" onclick="location.href='${ qlist }'">목록으로</button>
		<c:if test="${ loginUser != null && loginUser.user_no eq board.bUserNo }">
			<button onclick="location.href='${ qdelete }'">삭제</button> 
			<button id="button1" onclick="location.href='${ qupView }'">수정</button>
	 	</c:if>
	</div>
	<c:if test="${loginUser.authority eq 'Y'}">
	<table class="replyTable">
		<tr>
			<td><textarea cols="55" rows="3" id="rContent" style="resize:none;"></textarea></td>
			<td><br><button id="rSubmit">등록하기</button></td>
		</tr>
	</table>
	</c:if>
			<table class="answerTable" id="rtb">
		<thead>
			<tr>
				<td colspan="2"><img src="${ pageContext.servletContext.contextPath }/resources/images/add.PNG" style="width: 25px;height: 25px;"><b id="rCount"></b></td>
			</tr>
		</thead>
		<tbody></tbody>
	</table>
	<br><br>
	<script>
		
		$(function(){
			getAnswerList()
			$('#rSubmit').on('click', function(){
				var rContent = $('#rContent').val();
				var refBno = ${board.bNo};
				console.log("값 : " + rContent + refBno);
				$.ajax({
					url: 'addAnswer.qa',
					data: {rContent:rContent, refBno:refBno},
					success: function(data){
						console.log(data);
						
						if(data == 'success'){
							$('#rContent').val('');
							getAnswerList(); // 답변 리스트 불러오기
						} 
					}
				});
			});
		});
		
		function getAnswerList(){
			var bNo = ${board.bNo};
			
			$.ajax({
				url: 'qaList.qa',
				data: {bNo:bNo},
				dataType: 'json',
				success: function(data){
					console.log(data);
					var $tableBody = $('#rtb tbody');
					$tableBody.html('');
					
					$('#rCount').text(' 관리자님의 답변');
					if(data.length > 0){
						for(var i in data) {
							var $tr = $('<tr>');
							var $td = $('<td>');
							var $rContent = $('<textarea cols="55" rows="10" style="resize:none; overflow:visible;" readonly="readonly" disabled id="AtextA">').text(data[i].Answer_Content);
							var $rCreateDate = $('<td width=100 id="ACD">').text(data[i].As_Create_Date);
							
							$tableBody.append($tr);
							$tableBody.append($td);
							$tr.append($rContent);
							$tr.append($rCreateDate);
						}
					} else {
						var $tr = $('<tr>');
						var $rContent = $('<td colspan=3>').text('등록된 답변이 없습니다.');
						
						$tr.append($rContent);
						$tableBody.append($tr);
					}
				}
			});
		}
	</script>
	<c:import url="../../common/footer.jsp"/>
</body>
</html>