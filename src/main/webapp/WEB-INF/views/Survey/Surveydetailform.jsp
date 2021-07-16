<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 나중에 이벤트 제목으로 변경할것 -->
<title>이벤트 상세보기</title>

<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/index.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="<c:url value='/resources/css/Survey/Surveyform/Surveydetailform.css?ver=1.0'/>">
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.6.0.min.js" />"></script> 
</head>
<body>
	<c:import url="../common/header.jsp?ver=1.0" charEncoding="UTF-8"></c:import>
	<input type="hidden" name="survey_yn" id="survey_yn" value="${ loginUser.survey_yn }">
	

	<!-- 이용자용 -->
	<div class="u_mainArea">
		<p class="u_title">콕콕 쿡쿡 설문조사에 참여해주세요 ! </p>
		
		<div>
			<div class="u_top">
				<img src="${pageContext.request.contextPath}/resources/uploadFiles/surveyImg.png" class="u_t_img" width="600px" height="900px">	
			</div>
			<br><br>
			<div class="u_e_text">
				<div class="u_detail_text">
				<!-- 
					textarea에서 추가되면 이를 개행구분문자를 넣고 서블렛에서 view로 보내줄때
					개행구분문자를 array에 하나씩 받아서 arrayList의 길이만큼<p>를 반복하는 식
					아무값도 없는 엔터나 arrayList에 들어가면 <br>을 추가
				 -->
					<textarea style="width: 600px; height: 150px" id="detail_ta"  name="eventContent" readonly="readonly" disabled>
본 조사는 콕콕 쿡쿡 사이트 이용자를대상으로 다양한 식생활과 사이트에 관련된 의견을 수렴하여 사이트 서비스 개선방안을 모색하는데 목적을 두고 있습니다.

응답해 주신 여러분의 소중한 답변은 저희 콕콕 쿡쿡 사이트의 서비스 통계자료에 귀중하게 사용될 것이며 , 수집정보는 통계분석 이외의 타 목적으로 활용하거나 공개하지 않습니다.
					</textarea>
				</div>
			</div>
			<div class="btn_area">
				<button class="cnbtn" style="cursor: pointer;" onclick="location.href='eventList.ev'">목록</button>
				<button class="surbtn" style="cursor: pointer;" onclick="joinsv()">설문조사 참여하기</button>
			</div>
			
		</div>
	</div>
	<script>
	var count = 0;
	function joinsv() {
		var survey_yn = $('#survey_yn').val();		
		if(survey_yn == "Y") {
			alert("이미 설문조사에 참여하셨습니다.");
			location.reload();
		} else {
			location.href='svinsertView.sv';
		}
	}
	
	</script>
	<c:import url="../common/footer.jsp" charEncoding="UTF-8"></c:import>
</body>
</html>