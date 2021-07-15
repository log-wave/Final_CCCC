<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="<c:url value='/resources/css/style.css/index.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/Notice/updateNotice/updateNotice.css?ver=1.0'/>">
</head>
<body>

	<div class="insertNotice_main" align="center">
		<div class="insertNotice">
		<input type="hidden" id="bNo" value="${ board.bNo }">
		<h4>공지사항 수정</h4>
		<br><br><br>
			<table id="insertNotice_table">
				<tr>
					<td class="title_td">제목</td>
					<td class="second_td"><input type="text" id="bTitle" value="${ board.bTitle }"></td>
				</tr>
				<tr>
					<td class="third_td">내용</td>
					<td class="fourth_td"><textarea rows="30" cols="110" id="bContent">${ board.bContent }</textarea></td>
				</tr>
			</table>
		</div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" onclick="location.href='javascript:history.go(-1);'">이전페이지로</button>
		<button id="button1">수정하기</button>
	</div>
	
	<script>
		$('#button1').on('click', function(){
			var bNo = $('#bNo').val();
			var title = $('#bTitle').val();
			var content = $('#bContent').val();
			
			$.ajax({
				type : 'post',
				url : 'bupdate.bo',
				data : {
					bNo:bNo,
					bTitle:title,
					bContent:content
				},
				success : function(data) {
					alert(data);
					if (data == '수정 성공') {
						opener.parent.location.reload();
						window.close();
					}
				}
			});
		});
	</script>
	
</body>
</html>