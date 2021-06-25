<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 관리</title>


<link href="admin_Member.css" rel="stylesheet" type="text/css">
<link href="../../style.css/admin_index.css" rel="stylesheet" type="text/css">
</head>
<body>
	<c:import url="../admincommon/header.jsp?ver=1.0" charEncoding="UTF-8"></c:import>
    <c:import url="../admincommon/menu.jsp?ver=1.0" charEncoding="UTF-8"></c:import>
    <div class="page">
	    <h2 id="title"> 회원 목록 </h2>
	    <br>
			<div class="menu">
					<label id="mem_num">번호</label>
					<label id="mem_id">아이디</label>
					<label id="mem_email">이메일</label>
					<label id="mem_nick">닉네임</label>
					<label id="mem_gender">성별</label>
					<label><input type="checkbox">전체선택</label>
			</div>
	    	<div class="member_list">
	    	<hr>
			<br>
	    		<table class="member_Table">
	    		
	    		<!-- 추후에 멤버 등록하면 테이블이 쌓이는 기능을 추가 -->
	    			<tr>
	    				<td  width="70px">1</td>
	    				<td  width="250px">Kang123</td>
	    				<td  width="330px">Kang123@iei.or.kr</td>
	    				<td  width="260px">강건강</td>
	    				<td  width="100px">여</td>
	    				<td  width="100px"><input type="checkbox"></td>
	    			</tr>
	    			
	    		</table>
	    	<br><hr><br>
	    	<div class="buttonArea">
				<button id="stop_mem">활동 정치</button>
				<button id="break_mem">회원 탈퇴</button>
	    	</div>
    	</div>
    	
    		<!-- 페이징 -->
			<div class="pagingArea">
			<button>&lt;</button>
                <!-- 버튼이 클릭되었을때 기능도 넣어줘야함  -->
                <button>1</button>
                <button>2</button>
                <button>3</button>
                <button>&gt;</button>
			</div>
	</div>
</body>
</html>