<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재료추가</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/admin/insertMateForm/insertMateForm.css" rel="stylesheet" type="text/css">

</head>
<body>
	<br><br>
    <div class="page">
    <form>
    <div class="mate_main">
        <div class="mate_title">재료추가</div>
		<br>  <br>  <br>
        <div class="input_mateName">
            <div class="mate_label" >재료명 :</div>
            <div class="input_blank">
            <input type="text" name="materialName" id="materialName">
            </div>
        </div>
        <div class="input_mateName">
            <div class="mate_label">기준 : </div>
            <div class="input_blank">
            <input type="text" name="standard" id="standard">
            </div>
        </div>
        
        <div class="input_mateName">
            <div class="mate_label"> 분류 : </div>
            <div class="input_blank">
            <select id="classFi" name="classFi">
            	<option value="1">곡류</option>
            	<option value="2">면/만두류</option>
            	<option value="3">빵류</option>
            	<option value="4">과자류</option>
            	<option value="5">떡류</option>
            	<option value="6">감자/고구마류</option>
            	<option value="7">묵/두부</option>
            	<option value="8">콩/견과류</option>
            	<option value="9">채소류</option>
            	<option value="10">과일류</option>
            	<option value="11">고기류</option>
            	<option value="12">햄/소시지</option>
            	<option value="13">계란류</option>
            	<option value="14">어패류</option>
            	<option value="15">해조류</option>
            	<option value="16">유제품/치즈류</option>
            	<option value="17">양념류</option>
            	<option value="18">초콜렛/사탕</option>
            	<option value="19">음료/주류</option>
            	<option value="20">가공재료</option>
            	<option value="21">기타</option>
            	<option value="22">버섯류</option>
            	<option value="23">향신료</option>
            </select>
            </div>
        </div>
        <br><br>
        <div class="mate_ingre">
            <div class="labels">* 영양성분 (숫자만 입력) *</div>
            <br>
            <div class="input_mateName">
            <div class="mate_label">칼로리 : </div>
	        <div class="input_blank">
	        <input type="text" name="kcal" id="kcal">
	        </div>
	        </div>
	         
	         <div class="input_mateName">
            <div class="mate_label">단백질 : </div>
	        <div class="input_blank">
	        <input type="text" name="protein" id="protein">
	        </div>
	        </div>
	        
	         <div class="input_mateName">
            <div class="mate_label">지방 : </div>
	        <div class="input_blank">
	        <input type="text" name="fat" id="fat">
	        </div>
	        </div>
	        
	        <div class="input_mateName">
            <div class="mate_label">탄수화물 : </div>
	        <div class="input_blank">
	        <input type="text" name="carbo" id="carbo">
	        </div>
	        </div>
	        
	        <div class="input_mateName">
            <div class="mate_label">당류 : </div>
	        <div class="input_blank">
	        <input type="text" name="sugar" id="sugar">
	        </div>
	        </div>
        </div>
		<br>
        <div class="btn_area">
            <button class="cnbtn" onclick="window.close()">취소</button>
            <input type="button" class="subtn" value="저장" id="saveBtn">
        </div>
    </div>
    </form>
    </div>
</body>

<script>


	$('#saveBtn').on('click' , function() {
		
		var material = {
		 materialName : $('#materialName').val(),
		 standard : $('#standard').val(),
		 classFi : $('#classFi').val(),
		 kcal : $('#kcal').val(),
		 protein : $('#protein').val(),
		 fat : $('#fat').val(),
		 carbo : $('#carbo').val(),
		 sugar : $('#sugar').val()

		};
	
		
		console.log(material);
		
		$.ajax({
			url : 'insertMate.ad',
			data : material,
			traditional : true,
			success : function (data) {
				console.log(data)
				if(data == 'ok'){
					alert("재료 추가 성공");
					window.opener.location.reload();
					self.close();
				} else{
					alert("다시 입력해주세요");
				}
 			}
		});
		
		
	});
</script>
</html>