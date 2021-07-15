<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>특산물 추가</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/admin/speciality/insertSpeForm.css" rel="stylesheet" type="text/css">
</head>
<body>
	<br><br>
	<div class="Spage">
    <form >
        <div class="Smain">
            <div class="S_title">특산물추가</div>
        </div>
        	<br>  <br>  <br>
        <div class="sp_area">
            <div id="town_textArea" class="spe_label">선택지역</div> 
            <div class="town_btnArea">
                <button type="button" class="townBtn"  id="서울"  value="서울">서 울</button>
                <button type="button" class="townBtn"  id="경기도" value="경기도">경 기 도</button>
                <button type="button" class="townBtn"  id="강원도" value="강원도">강 원 도</button>
                <button type="button" class="townBtn"  id="충청도" value="충청도">충 청 도</button>
                <br><br>
                <button type="button" class="townBtn"  id="전라도" value="전라도">전 라 도</button>
                <button type="button" class="townBtn"  id="경상도" value="경상도">경 상 도</button>
                <button type="button" class="townBtn"  id="제주도" value="제주도">제 주 도</button>
           		<input type ="hidden" class="hiddenBtn" id="specialityRegion" name = "specialityRegion">
            </div><br>
            
             <div class="spe_label">기존 재료 선택</div>
             <div class="insertRecipe_inputBox">
            <select name="firstCate"class="select_Mate" onchange="setArea2(this.value)"><!--  -->
					<option value="1">곡류</option>
					<option value="2">면/만두류</option>
					<option value="3">빵류</option>
					<option value="6">감자/고구마류</option>
					<option value="7">묵/두부</option>
					<option value="8">콩/견과류</option>
					<option value="9">채쇼류</option>
					<option value="10">과일류</option>
					<option value="11">고기류</option>
					<option value="12">햄/소시지</option>
					<option value="13">계란류</option>
					<option value="14">어패류</option>
					<option value="15">해죠류</option>
					<option value="16">유제품/치즈류</option>
					<option value="17">양념류</option>
					<option value="18">초콜렛/사탕</option>
					<option value="19">음료/주류</option>
					<option value="20">가공재료</option>
					<option value="21">기타</option>
					<option value="22">버섯류</option>
					<option value="23">향신료</option>
				</select>
				<select name="materialNo" id="materialNo" class="secCate">
					<option></option>
				</select>
            </div>
            <div class="input_spName">
                <div class="spe_label">특산물 명 :</div>
                <div class="input_blank">
                    <input type="text" name="specialityName" id="specialityName"  >
                </div>
            </div>
            <div id="checkSpeName" disabled></div>
            <br><br>
            <div>
            	<div class="spe_label">특산물 정보</div>
                <textarea name ="specialityInfo" rows="10" cols="30" class="sp_info" id="specialityInfo" ></textarea>
            </div>
            
            <div class="btn_area">
            
                <button class="cnbtn">취소</button>
                
                <input type="submit" id="saveBtn"  value="저장">
            </div>
            </div>
    </form>
    </div>
</body>
<script>

	<!--재료 저장 버튼 비활성화 -->
		$(function(){
			
			$("#saveBtn").prop("disabled", true);
			$("#saveBtn").css("background-color", "#D1CBC2");
		});
		
		function disabeldSignUpBtn(){
			
			$("#saveBtn").prop("disabled", true);
			$("#saveBtn").css("background-color", "#D1CBC2");
			
		}

	<!-- 지역 선택 시 버튼색상 바꾸기-->
		var townBtn = document.getElementsByClassName("townBtn");

		function handleClick(event) {
		  console.log(event.target);
		  // console.log(this);
		  // 콘솔창을 보면 둘다 동일한 값이 나온다
		
		  console.log(event.target.classList);
		
		  if (event.target.classList[1] === "clicked") {
		    event.target.classList.remove("clicked");
		  } else {
		    for (var i = 0; i < townBtn.length; i++) {
		    	townBtn[i].classList.remove("clicked");
		    }
		
		    event.target.classList.add("clicked");
		  }
		}
		
		function init() {
		  for (var i = 0; i < townBtn.length; i++) {
			  townBtn[i].addEventListener("click", handleClick);
		  }
		}
		
		init();
		
	<!-- 분류 관련-->	
		function setArea2(f){
			var target =$("select[name='materialNo']");
			
			target.empty();
			//에이젝스로 가져오기
			 $.ajax({
				 type:'POST',
				url:'mList.ad',
				data:{mNo:f},
				success:function(data){
					
					for(var i in data){
						target.append('<option value="' + data[i].materialNo + '" id="addedMate">' + data[i].materialName +'</option>' );
					}
				}
				
			}); 
		}
		
		
	<!-- 버튼을 누른 value 값을 input hidden에 저장 -->	
         $(".townBtn").click(function(){
			var v = ($(this).attr('value'));
			$('input[name=specialityRegion]').attr('value', v)
         });
         
         <!-- 재료 추가  -->
         $('#saveBtn').on('click' , function() {
     		
     		
     		var speciality = {
     		specialityRegion : $('#specialityRegion').val(),
     		specialityName : $('#specialityName').val(),
     		specialityInfo : $('#specialityInfo').val(),
     		materialNo : $('#materialNo').val()

	     		
     		};
	     	if( speciality.region == "" ){
	     		alert("지역을 선택해주세요.");
	     		return false;
	     	}else if(speciality.mNo == ""){
	     		alert("재료 카테고리를 선택해주세요");
	     		return false;
	     	}else if(speciality.name == ""){ 
	     		alert("특산물명을 입력해주세요");
	     		return false;
	     	}else if(speciality.sInfo=""){
	     		alert("특산물정보를 입력해주세요");
	     		return false;
	     	}
     	
     		console.log(speciality);
     		
     		$.ajax({
     			url : 'insertSpe.ad',
     			data : speciality,
     			traditional : true,
     			success : function (data) {
     				console.log(data)
     				if(data == 'ok'){
     					alert("특산물 추가 성공");
     					window.opener.location.reload();
     					self.close();
     				} else{
     					alert("다시 입력해주세요");
     				}
      			}
     		});
     		
     		
     	});
         
         <!-- 특산물명 중복 체크-->
    	 $("#specialityName").blur(function(){
    		var mate = $("#specialityName").val();
    		$.ajax({
    			url :'checkSpeName.ad',
    			data : {"specialityName" : $("#specialityName").val()},
    			success : function(data) {
    				console.log(data)
    					if(data == "no") {
    						$("#checkSpeName").text("이미 등록된 특산물입니다.");
    						$("#checkSpeName").css("color" , "red" );
    						$("#specialityName").focus(function(){
    							$("#specialityName").val('');
    							$("#checkSpeName").text('');
    						});
    						disabeldSignUpBtn();
    						return false;
    					} else if(data =='yes') {
    							$("#checkSpeName").text("등록 가능한 특산물입니다.");
    							$("#checkSpeName").css("color", "green");
    							$("#saveBtn").css("background-color", "#F29F05");
    							$("#saveBtn").prop("disabled",false);
    							$("#specialityName").focus(function(){
    								$("#specialityName").val('');
    								$("#checkSpeName").text('');
    							});
    					}
    			}
    		})
    	}); 
    	
   
</script>
</html>