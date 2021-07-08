<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>특산물 추가</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${ pageContext.servletContext.contextPath }/js/jquery-3.6.0.min.js"></script>
<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/admin/speciality/insertSpeForm.css" rel="stylesheet" type="text/css">
</head>
<body>
	<br><br>
	<div class="Spage">
    <form>
        <div class="Smain">
            <div class="S_title">특산물추가</div>
        </div>
        	<br>  <br>  <br>
        <div class="sp_area">
            <div id="town_textArea" class="spe_label">선택지역 </div> 
            <div class="town_btnArea">
                <button type="button" class="townBtn" id="서울"  value="서울">서 울</button>
                <button type="button" class="townBtn" id="경기도" value="경기도">경 기 도</button>
                <button type="button" class="townBtn" id="강원도" value="강원도">강 원 도</button>
                <button type="button" class="townBtn" id="충청도" value="충청도">충 청 도</button>
                <br><br>
                <button type="button" class="townBtn" id="전라도" value="전라도">전 라 도</button>
                <button type="button" class="townBtn" id="경상도" value="경상도">경 상 도</button>
                <button type="button" class="townBtn" id="제주도" value="제주도">제 주 도</button>
                <button type="button" class="townBtn" id="전국"  value="전국">전 국</button>
            </div><br>
            
            <div class="input_spName">
                <div class="spe_label">특산물 명 :</div>
                <div class="input_blank">
                    <input type="text">
                </div>
            </div>
            
            <div class="choice">
                <select class="s0">
                    <option>대분류</option>
                    <option>고기</option>
                    <option>야채</option>
                    <option>생선</option>
                </select>
                &nbsp;
                <select class="s1">
                    <option>선택하세요.</option>
                    
                </select>
                &nbsp;
                <input type="hidden"> <!-- 컨트롤러에 들어갈 값 -->
                <div class="choice_food">돼지고기</div>
            </div>
            <br>
            <div>
            	<div class="spe_label">특산물 정보</div>
                <textarea rows="10" cols="30" class="sp_info"></textarea>
            </div>
            
            <div class="btn_area">
            
                <button class="cnbtn">취소</button>
                <input type="submit" class="subtn" value="저장">
            </div>
        </div>
    </form>
</div>
</body>
<script>
    $('.townBtn').click(function(){
        var text = $('#town_textArea').html();
        
        console.log(text);
        
        text += $(this).val() + " ";
        
        $('#town_textArea').html(text);
        
    });
    
    $(document).ready(function(){
        var meat =['돼지고기', '소고기' ,'닭고기']
    });
</script>
</html>