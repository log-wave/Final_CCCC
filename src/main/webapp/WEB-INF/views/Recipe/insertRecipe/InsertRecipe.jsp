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
	<form action="insertRecipe.rp" method="post" enctype="multipart/form-data" id="frm">
	<!-- user_no는 이후 수정해야함 -->
	<input type="hidden" name="user_no" value="${ loginUser.user_no }">
		<div class="insertRecipe_main">
			<div class="rp_insert_area">
				<div class="insertRecipe_subTitile">제목 입력하기</div>
				<div class="insertRecipe_inputBox">			
					<input type="text" class="rp_insert_inputbox" name="recipe_title" id = "recipe_title" placeholder="레시피 제목을 입력해주세요">
				</div>
			</div>
			
			<div class="rp_insert_area">
				<div class="insertRecipe_subTitile">한줄설명 입력하기</div>
				<div class="insertRecipe_inputBox">			
					<input type="text" class="rp_insert_inputbox" name="recipe_explain" id="recipe_explain" placeholder="한줄설명을 입력해주세요">
				</div>
			</div>
			
			<div class="rp_insert_area">
				<div class="insertRecipe_subTitile">썸네일 업로드</div>
				<div class="insertRecipe_inputBox">			
					<input type="file" name="recipe_thum" multiple="multiple" id="reicpe_thum">
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
				<select name="secCate" class="secCate" id="seccate">
					<option>1차 카테고리를 선택해주세요</option>
				</select>
					<button type="button" class="rp_addMate_btn" id="add_Mate">재료 추가</button>
					<p>*재료추가를 클릭시 선택한 재료가 추가되며 수량을 정해주시면 됩니다.</p>
					<p>*분량은 목표 n인분에 맞게 적어주시면 됩니다. ex)4인분 김치찜/ 돼지고기 4인분</p>
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
					<tbody align="center">
					</tbody>
				</table>
			</div>
			
			<div class="rp_insert_area">
				<div class="insertRecipe_subTitile">특산물추가하기</div>
				<div class="insertRecipe_inputBox">
				<p>*특산물은 추가 하지 않으셔도 됩니다!</p>
					<select name="spec_first"class="select_Mate" onchange="setspecArea(this.value)">
						<option>지역을 선택해주세요</option>
						<option value="서울">서울</option>
						<option value="경기도">경기도</option>
						<option value="강원도">강원도</option>
						<option value="충청도">충청도</option>
						<option value="전라도">전라도</option>
						<option value="경상도">경상도</option>
						<option value="제주도">제주도</option>
					</select>
					<select name="specsecCate" class="specsecCate" id="specsecCate" onchange="setinfoArea(this.value)">
						<option value="0" >지역 카테고리를 선택해주세요</option>
					</select>
					<input type="text" name="spec_qnt" class="spec_qnt" value="0">
					<div class="expl"><p class="explfont">특산물 설명!</p></div>
				</div>
				
			</div>
			
			
			<div class="spec_info">
					
			</div>
			<div class="rp_insert_area">
				<div class="insertRecipe_subTitile">조리과정 추가</div>
				<div class="insertRecipe_inputBox">			
					조리시간 <input type="text" class="rp_insert_inputbox_min" name="cooking_time" placeholder="00" id="cooking_time">&nbsp;분&nbsp;&nbsp;&nbsp;
				</div>
				
			</div>
			
			<div class="recipe_process_area">
				<div class="added_process">
					<p>영역을 클릭하면 이미지를 업로드 할 수 있습니다.</p><br>
				</div>
				<br>
				<button type="button" class="rp_addProcess_btn" id="add_process"></button>
				<br>
			</div>
			
			<div id="fileArea">
	
			</div>	
			<div class="rp_insert_area">
				<div class="insertRecipe_subTitile_2">레시피 태그정보</div>
				<div class="rp_tag_main">
					<div class="rp_tag_top">
						<div class="tag_title"><p>주제별요리</p></div>
						<div class="tag_btn">
							<button type="button"value="1" class="subj_btn">일반 요리</button>
							<button type="button"value="2" class="subj_btn">간식/야식</button>
							<button type="button"value="3" class="subj_btn">술안주</button>
							<button type="button"value="4" class="subj_btn">해장요리</button>
							<button type="button"value="5" class="subj_btn">손님 접대 요리</button>
							<button type="button"value="6" class="subj_btn">나들이 요리</button>
							<button type="button"value="7" class="subj_btn">편의점 요리</button>
							<button type="button"value="8" class="subj_btn">파티/명절요리</button>
						</div>
					</div>
					<div class="rp_tag_mid">
						<div class="tag_title"><p>재료별요리</p></div>
						<div class="tag_btn">
							<button type="button"value="1" class="mate_btn">과일류</button>
							<button type="button"value="2" class="mate_btn">어패류</button>
							<button type="button"value="3" class="mate_btn">고기류</button>
							<button type="button"value="4" class="mate_btn">채소류</button>
							<button type="button"value="5" class="mate_btn">유제품/치즈류</button>
							<button type="button"value="6" class="mate_btn">감자/고구마류</button>
							<button type="button"value="7" class="mate_btn">햄/소세지</button>
							<button type="button"value="8" class="mate_btn">기타</button>
						</div>
					</div>
					<div class="rp_tag_bot">
						<div class="tag_title"><p>지역별 특산물</p></div>
						<div class="tag_btn">
							<button type="button"value="1" class="spec_btn">서울</button>
							<button type="button"value="2" class="spec_btn">경기도</button>
							<button type="button"value="3" class="spec_btn">강원도</button>
							<button type="button"value="4" class="spec_btn">충청도</button>
							<button type="button"value="5" class="spec_btn">전라도</button>
							<button type="button"value="6" class="spec_btn">경상도</button>
							<button type="button"value="7" class="spec_btn">제주도</button>
						</div>
					</div>
				</div>
			</div>
			<input type="hidden" class="sort_sub" value="0" name="sort_sub">
			<input type="hidden" class="sort_mate" value="0" name="sort_mate">
			<input type="hidden" class="sort_spec" value="0" name="sort_spec">
			<div class="insert_rp_btnArea">
				<button type="button" class="subtn" onclick="subcheck()">저장</button>
			</div>
		</div>
	
	
	
	
	
	</form>
	
	
	<c:import url="../../common/footer.jsp"/>

</body>

<script>
var mate_flag = 0;
var proc_flag = 0;
function subcheck(){
	var sub_flag = true;
	var output_text=""
	if($('#recipe_title').val()==""){
			output_text += "제목";
			sub_flag=false;
	}
	
	if($('#recipe_explain').val()==""){
		if(!sub_flag){
			output_text += ", ";
		}
		output_text += "한줄 설명";
		sub_flag=false;
	}
	
	if($('#reicpe_thum').val()==""){
		if(!sub_flag){
			output_text += ", ";
		}
		output_text += "썸네일";
		
		sub_flag=false;
	}
	
	if(mate_flag == 0){
		if(!sub_flag){
			output_text += ", ";
		}
		output_text += "재료 추가";
		
		sub_flag=false;
	}
	
	if($('#cooking_time').val()==""){
		if(!sub_flag){
			output_text += ", ";
		}
		output_text += "요리시간";
		
		sub_flag=false;
	}
	
	if(proc_flag == 0){
		if(!sub_flag){
			output_text += ", ";
		}
		output_text += "조리 과정";
		
		sub_flag=false;
	}
	
	if($('.sort_sub').val()=="0"){
		if(!sub_flag){
			output_text += ", ";
		}
		output_text += "주제별 태그";
		
		sub_flag=false;
	}
	
	if($('.sort_mate').val()=="0"){
		if(!sub_flag){
			output_text += ", ";
		}
		output_text += "재료별 태그";
		
		sub_flag=false;
	}
	
	
	if(!sub_flag){
		alert(output_text + "이(가) 입력하지 않았습니다");
	}
	
	if(sub_flag){
		$('#frm').submit();
	}
}

var file_flag = 1;
	$(function(){
		$("#fileArea").hide();
		
		
		$(document).on("click",".rp_img_area",function(){
			var num = file_flag-1;
			var files = '#fileNo' + num;
			console.log(files);
			$(files).click();
			proc_flag += 1;
		});
		
		//주제별 클릭시
		$('.subj_btn').on("click", function(){
			$('.subj_btn').css("background-color", 'white');
			$('.sort_sub').val(this.value);
			$(this).css("background-color", '#F29F05');
		});
		
		//재료별 클릭시
		$('.mate_btn').on("click", function(){
			$('.mate_btn').css("background-color", 'white');
			$('.sort_mate').val(this.value);
			$(this).css("background-color", '#F29F05');
		});
		
		//특산물 클릭시
		$('.spec_btn').on("click", function(){
			$('.spec_btn').css("background-color", 'white');
			$('.sort_spec').val(this.value);
			$(this).css("background-color", '#F29F05');
		});
		
		//재료추가 클릭시
		$('#add_Mate').click(function(){
			var area = $('.rp_Mate_area');
			
			var addedMate_name = $('#seccate option:selected').text();	//재료이름
			var addedMate_val = $('#seccate option:selected').val();	//재료의 DB번호
			
			//버튼 클릭시 추가로 들어갈 내용들
			$tableBody = $('#tb tbody');
			var $tr =   $('<tr>');
			var $addedMate_name = $('<td>').text($('#seccate option:selected').text());
			var $inputarea = $('<td>').html('<input type="text" name="mate_amount">');
			
			$tr.append($addedMate_name);
			$tr.append($inputarea);
			$tableBody.append($tr);
			
			area.append('<input type="hidden" value="'+addedMate_val+'" name="rp_mate">');
			mate_flag += 1;
		});
		
		
		//조리과정 추가 클릭시
		$('#add_process').click(function(){
			var area = $('.added_process');
			
			area.append('<div class="rp_img_area">'+
							'<img id="rp_img'+file_flag+'" name="rp_img" width="600px" height="350px"></img>'+
						'</div>'+
						'<textarea style="width:600px; height:100px; resize:none;" name="rp_content" id="rp_content">');
			
			var farea = $('#fileArea');
			
			farea.append('<input type="file" multiple="multiple" name="RecipeImg" id="fileNo'+file_flag+'" onchange="LoadImg(this,'+(file_flag++)+')">');
			
			
		});
	});

	//1차 카테고리 선택시
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
					target.append('<option value="' + data[i].materialNo + '" class="addedMate">' + data[i].materialName +'</option>' );
				}
			}
			
		}); 
	}
	//특산물
	function setspecArea(f){
		var target =$("select[name='specsecCate']");
		
		target.empty();
		//에이젝스로 가져오기
		 $.ajax({
			 type:'POST',
			url:'SList.rp',
			data:{sNo:f},
			success:function(data){
				
				for(var i in data){
					target.append('<option value="' + data[i].specialityNo + '" class="addedSpce">' + data[i].specialityName +'</option>' );
				}
			}
			
		}); 
	}
	
	function setinfoArea(f){
		var target= $('.spec_info');
		
		target.empty();
		$.ajax({
			url:'Sinfo.rp',
			data:{sNo : f},
			success(data){
				console.log(data);
				target.append(data);
			}
		});
	}
	function LoadImg(value, num){
		if(value.files && value.files[0]){
			
			var reader = new FileReader(); 
			console.log(file_flag);
			reader.onload = function(e){
				for(var i = 1; i < file_flag; i++){
					if(i == num){
						var files = '#rp_img' + num;
						console.log(files);
						$(files).attr("src", e.target.result);
					}
				}
			}
			
			reader.readAsDataURL(value.files[0]);
		}
	}
	
	
</script>
</html>