<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 등록하기</title>
<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/index.css" rel="stylesheet" type="text/css">
<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/Recipe/InsertRecipe.css?ver=1.0" rel="stylesheet" type="text/css">
<script src="https://kit.fontawesome.com/307ff02242.js" crossorigin="anonymous"></script>
</head>
<body>
	<c:import url="../../common/header.jsp"/>
	
	<div class="insertRecipe_pageTitle">레시피 등록하기</div>
	<form>
	
		<div class="insertRecipe_main">
			<div class="rp_insert_area">
				<div class="insertRecipe_subTitile">제목 입력하기</div>
				<div class="insertRecipe_inputBox">			
					<input type="text" class="rp_insert_inputbox" name="" placeholder="레시피 제목을 입력해주세요">
				</div>
			</div>
			
			<div class="rp_insert_area">
				<div class="insertRecipe_subTitile">한줄설명 입력하기</div>
				<div class="insertRecipe_inputBox">			
					<input type="text" class="rp_insert_inputbox" name="" placeholder="한줄설명을 입력해주세요">
				</div>
			</div>
			
			<div class="rp_insert_area">
				
				<div class="insertRecipe_subTitile">재료 추가하기</div>
				<div class="insertRecipe_inputBox">
				<select name="firstCate"class="select_Mate" onchange="setArea2(this.value)"><!--  -->
					<option>카테고리를 선택해주세요</option>
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
				<select name="secCate" class="secCate">
					<option>1차 카테고리를 선택해주세요</option>
				</select>
					<button type="button" class="rp_addMate_btn" id="add_Mate">재료 추가</button>
					<p>*재료추가를 클릭시 선택한 재료가 추가되며 수량을 정해주시면 됩니다.</p>
				</div>
			</div>
			
			<div class="rp_Mate_area">
				<table id ="tb">
					<thead>
						<tr>
							<th>선택한 재료</th>
							<th>분량</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
			
			<div class="rp_insert_area">
				<div class="insertRecipe_subTitile">한줄설명 입력하기</div>
				<div class="insertRecipe_inputBox">			
					<input type="text" class="rp_insert_inputbox_min" name="" placeholder="00">&nbsp;분&nbsp;&nbsp;&nbsp;
				</div>
				
			</div>
			
			<div class="recipe_process_area">
					<button type="button" class="rp_addProcess_btn" id="add_process"></button>
			</div>
		</div>
	
		<button type="submit">저장</button>
	</form>
		
	
	<c:import url="../../common/footer.jsp"/>

</body>

<script>
	$(function(){
		$('#add_Mate').click(function(){
			var area = $('.rp_Mate_area');
			
			var addedMate_name = $('#addedMate').text();	//재료이름
			var addedMate_val = $('#addedMate').val();		//재료의 DB번호
			
			//버튼 클릭시 추가로 들어갈 내용들
			$tableBody = $('#tb tbody');
			var $tr =   $('<tr>');
			var $addedMate_name = $('<td>').text($('#addedMate').text());
			var $inputarea = $('<td>').html('<input type="text" name="mate_amount">');
			
			$tr.append($addedMate_name);
			$tr.append($inputarea);
			$tableBody.append($tr);
			
			area.append('<input type="hidden" value="'+addedMate_val+'" name="rp_mate">');
		});
		
		
		$('add_process').click(function(){
			var Child_w = window.open("about:blank", "_blank");
			
			$area = $('.recipe_process_area');
			
			$.ajax({
				
			});
		});
	});
	
	function setArea2(f){
		var target =$("select[name='secCate']");
		
		target.empty();
		//에이젝스로 가져오기
		 $.ajax({
			 type:'POST',
			url:'MList.rp',
			data:{mNo:f},
			success:function(data){
				
				for(var i in data){
					target.append('<option value="' + data[i].materialNo + '" id="addedMate">' + data[i].materialName +'</option>' );
				}
			}
			
		}); 
	}
</script>
</html>