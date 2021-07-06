<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 등록</title>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="<c:url value='/resources/css/style.css/index.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/Notice/insertNotice/insertNotice.css?ver=1.0'/>">
</head>
<body>
	
	<div class="insertNotice_main" align="center">
		<div class="insertNotice">
		<h4>공지사항 등록</h4>
		<br><br><br>
			<table id="insertNotice_table">
				<tr>
					<td class="title_td">제목</td>
					<td class="second_td"><input type="text" placeholder="제목을 입력해주세요" id="title" name="bTitle"></td>
				</tr>
				<tr>
					<td class="third_td">내용</td>
					<td class="fourth_td"><textarea rows="30" cols="110" id="content" name="bContent"></textarea></td>
				</tr>
			</table>
		</div>
		<c:url var="blist" value="blist.bo">
			<c:param name="page" value="${ page }"/>
		</c:url>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" onclick="window.close()">돌아가기</button>
		<button id="button1">등록</button>
	</div>
	
	<script>	
		function check() {
			var title = $('#title').val().trim();
			var content = $('#content').val().trim();

			if (title == "") {
				alert('제목을 입력해주세요');
				$('#title').focus();
				return false;
			} else if (content == "") {
				alert('내용을 입력해주세요');
				$('#content').focus();
				return false;
			} else {
				return true;
			}
		}

		$('#button1').on('click', function(){
			var title = $('#title').val().trim();
			var content = $('#content').val();

			if (check()) {
				$.ajax({
					type : 'post',
					url : 'binsert.bo',
					data : {
						bTitle:title,
						bContent:content
					},
					success : function(data) {
						alert(data);
						if (data == '등록 성공') {
							opener.parent.location.reload();
							window.close();
						}
					}
				});
			}
		});
	</script>
	
</body>
</html>