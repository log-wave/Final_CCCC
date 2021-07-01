<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입/이용약관</title>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>

<link rel="stylesheet" href="<c:url value='/resources/css/style.css/index.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/member/insertMember/insertMemberTerms.css'/>">
	
</head>
<body>
	<div class="insertMember_main" align="center">
		<div>
			<img  src="resources/images/cccc_logo.PNG	"/>
		</div>
		<div class="insertMember_terms">
			<label>이용약관, 개인정보 수집 및 이용에 모두 동의합니다.</label>
			<input type="checkbox" id="all" value="전체선택"  onclick="selectAll();">
			<hr>
			<label>콕콕!쿡쿡! 이용약관 동의</label>
			<input type="checkbox" id="terms" name="category" value="이용약관" onclick="selectOne();" required><br>
			<textarea rows="10" cols="55" readonly>콕콕!쿡쿡! 이용약관은 다음과 같은 내용을 담고 있습니다. (2021년 6월 2일 시행) &#10;제1조(목적) &#10;이 약관은 전기통신사업법령 및 정보통신망이용촉진, 전자상거래 등에 관한 법령에 의하여 (주)콕콕!쿡쿡!(이하 "회사"라 합니다)이 제공하는 콕콕!쿡쿡!의 서비스(이하 “서비스"라 한다) 이용과 관련하여 회사와 회원과의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다. 제 2 조 (용어의 정의)
1. 이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
(1) 서비스 : PC나 스마트폰 등 단말기의 종류와는 상관없이 웹이나 스마트폰 애플리케이션 등을 통하여 회사가 제공하는 ‘쿡쿡콕콕’의 모든 서비스를 의미합니다.
(2) 이용자 : 회사 서비스에 접속하여, 이 약관에 따라 회사가 제공하는 서비스를 이용하는 회원과 비회원을 말합니다.
(3) 회원 : 회사에 개인정보를 제공하여 회원등록을 함으로써 회사와 서비스 이용계약을 체결한 개인 또는 단체을 말합니다. 
(4) 아이디(ID) : 회원의 식별과 서비스 이용을 위하여 회원이 정하고 회사가 승인하는 문자와 숫자의 조합을 말합니다. 
(5) 비밀번호 : 회원이 부여받은 아이디와 일치되는 회원임을 확인하고 비밀보호를 위해 회원 자신이 정한 문자와 숫자의 조합을 말합니다. 
(6) 탈퇴 : 회사 또는 회원이 서비스 개통 후 이용계약을 해지하는 것을 말합니다.
(7) 콘텐츠 : 전자적 형태로 제작 또는 처리된 동영상, 이미지, 텍스트 등의 자료로서, 회사가 제작 또는 회원이 업로드하거나, 제휴사가 제공하는 것을 말합니다.
(8) 게시물 : 회사의 서비스 내에 회원이 올린 콘텐츠 및 각종 파일과 링크, 댓글 등의 정보를 의미합니다. 
(9) 몰(Mall) : 회사가 이용자들로 하여금 PC나 스마트폰 등을 이용하여 상품 또는 서비스를 구매할 수 있도록 설정한 인터넷 상의 가상의 영업장을 말합니다.
(10) 포인트 : 사이트 내의 활동으로 발생되어 회원에게 지급되는 가상의 금액을 말하며, 결제에 직접적으로 사용할 수 없습니다.
(11) 할인쿠폰(Coupon): 프로모션 등의 특수한 상황에서 회사로부터 제공받아 물품 또는 서비스를 구매할 때 입력함으로써 결제 금액을 할인 받을 수 있는 일종의 쿠폰를 말합니다.
2. 이 약관에서 정의되지 않은 용어는 관련법령이 정하는 바에 따르며, 그 외에는 일반적인 상관행에 의합니다.
			</textarea><br>
			
			<label>개인정보 수집 및 이용에 대한 안내</label><a href="${ contextPath }">[전체보기]</a>
			<input type="checkbox" id="info" name="category" value="개인정보" onclick="selectOne();" required><br>
			<textarea rows="8" cols="55" readonly>주식회사 바이탈힌트코리아(이하 ‘회사’라 함)는 쿡쿡콕콕 서비스(이하 ‘서비스’라 함) 제공과 관련하여 습득한 회원들의 개인정보를 취급함에 있어서 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 개인정보 보호법, 전기통신사업법, 통신비밀보호법 등 개인정보와 관련된 국내의 법령 및 지침을 준수하여 회원님들의 개인정보 보호에 최선을 다하고 있습니다.

이하에서 회사가 수집하는 개인정보 항목, 그 정보의 수집방식, 수집된 정보의 이용목적 및 정보의 보유기간 등에 관하여 회원님들의 개인정보를 회사가 어떻게 취급하는지와 개인정보의 보호를 위하여 회사가 어떠한 조치를 취하고 있는지 알려드리고자 합니다.
			
			</textarea>
			<hr>
			
			<label>만 14세 이상입니다.(필수)</label>
			<input type="checkbox" id="ages" name="category" value="연령확인" onclick="selectOne();" required><br>
		</div>
		<button id="button1">동의</button>
		<button id="button2">비동의</button>
	</div>
	
	<script>
		var all = document.getElementById("all");
		var category = document.getElementsByName("category");
		
		function selectAll(){
			if(all.checked){
				for(var i = 0; i < category.length; i++){
					category[i].checked = true;
				}
			} else {
				for(var i = 0; i < category.length; i++){
					category[i].checked = false;
				}
			}
		}
		
		function selectOne(){
			var count = 0;
			
			for(var i = 0; i < category.length; i++){
				if(category[i].checked){
					count++;
				}
			}
			
			if(count != 12){
				all.checked = false;
			} else {
				all.checked = true;
			}
		}
		
		$('#button1').click(function() {
			var terms = $('#terms').is(":checked");
			var info = $('#info').is(":checked");
			var ages = $('#ages').is(":checked");
			if(terms == true && info == true && ages == true){
				location.href='insertMemberForm.me'
			} else {
				alert("모두 동의해주세요!");
			}
			
		});
		$('#button2').click(function() {
			location.href='<%= request.getContextPath() %>'
		});
	</script>
</body>
</html>