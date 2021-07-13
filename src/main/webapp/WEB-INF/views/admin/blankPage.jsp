<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		alert("이벤트 추가 완료하였습니다.");
		window.opener.location.reload();    //부모창 reload
		window.close();    //현재 팝업창 Close
	</script>
</body>
</html>