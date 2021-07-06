<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재료 관리</title>


<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/admin/admin_Material.css" rel="stylesheet" type="text/css">
<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/admin_index.css" rel="stylesheet" type="text/css">
</head>
<body>
	<c:import url="/WEB-INF/views/admin/admincommon/header.jsp" charEncoding="UTF-8"></c:import>
    <c:import url="/WEB-INF/views/admin/admincommon/Main.jsp" charEncoding="UTF-8"></c:import>
    <div class="page">
	    <h2 id="title"> 재료 목록 </h2>
			
	    	<div class="material_list">
			<br>
	    		<table  class="material_table">
	    	
	    			<tr>
						<th width="100px">번호</th>
						<th width="220px">재료명</th>
						<th width="100px">기준</th>
						<th width="450px">영양성분</th>
						<th width="100px"><input type="checkbox" id="all" value="전체선택" onclick="selectAll();">전체선택</th>
					</tr>
	    			<c:if test="${ list != null }">
	    			<c:forEach var="ad" items="${ list }">	
	    			<tr class= "click">
	    				<td>${ad.materialNo }</td>
	    				<td style="	border-left: 1px solid black">${ad.materialName}</td>
	    				<td style="	border-left: 1px solid black">${ad.standard}</td>
	    				<td style="	border-left: 1px solid black"> 칼로리 : ${ad.kcal}, 단백질 : ${ad.protein}, 지방 : ${ad.fat}, 탄수화물 : ${ad.carbo}, 당 : ${ad.sugar} </td>
	    				<td style="	border-left: 1px solid black"><input type="checkbox" name = "mate_select" onclick="selectOne();" value="${ ad.materialNo }" ></td>
	    			</tr>
	    			</c:forEach>
	    		  	</c:if>		
	    			<c:if test="${ list == null }">
					<tr>
						<td colspan="6">조회된 리스트가 없습니다.</td>
					</tr>
				</c:if>
	    		</table>
	    	<br>
    	</div>
	    	<div class="buttonArea">
				<button id="insert_mate" onclick="mateinsert()">재료 추가</button>
				<button id="delete_mate">재료 삭제</button>
	    	</div>
    	<div id="searchArea" style="float: left">
				<select id="searchCondition" name="searchCondition">
					<option value="mateName">재료명</option>
				</select>
				<input id="searchValue" type="search">
				<button id="searchBtn" onclick="searchBoard();">검색하기</button>
			</div>
			<br><br>
			
			
    	<!-- 페이징 -->
		<div class="pagingArea">
		
				<c:if test="${ pi.currentPage <= 1 }">
					<button>&lt;</button>
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="adminMaterial.ad">
						<c:param name="page" value="${ pi.currentPage - 1 }"/>
					</c:url>
					<a href="${ before }"><button>&lt;</button></a> &nbsp;
				</c:if>
				
               	<!-- 페이지 -->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<font color="red" size="4"><b><button>${ p }</button></b></font>
					</c:if>  
					
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="pagenation" value="adminMaterial.ad">
							<c:param name="page" value="${ p }"/>
						</c:url>
						<a href="${ pagenation }">${ p }</a> &nbsp;
					</c:if>
				</c:forEach>

                <c:if test="${ pi.currentPage >= pi.maxPage }">
					<button>&gt;</button>
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="after" value="adminMaterial.ad">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url> 
					<a href="${ after }"><button>&gt;</button></a>
				</c:if>
                
		</div>
	</div>
	<!-- onclick="location.href='insertMate.ad';" -->
	<script>
	 function mateinsert() { 
		 var url = '<%=request.getContextPath()%>/insertMateForm.ad';
		window.open(url ,"insertMate", "width=500, height=500, left=100, top=50"); 
		}
	 
	 <!-- tr 배경색상 변경-->
	 $('.click').on('mouseover',function(){
			$(this).closest('tr').css({"background":"#efefef85","cursor":"pointer"});
		}).on('mouseout',function(){
			$(this).closest('tr').css({"background":"","color":"","cursor":""});
		});
	 
	 <!-- 전체선택 -->
		 var all = document.getElementById("all");
		var category = document.getElementsByName("mate_select");
		
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
			
			if(count != 10){
				all.checked = false;
			} else {
				all.checked = true;
			}
		}
		<!--체크 후 삭제하기 -->
		$('#delete_mate').on('click', function(){
			var checkArr = [];
			$('input[name="mate_select"]:checked').each(function() {
				checkArr.push($(this).val());
			});
			
			console.log(checkArr);
			if (confirm('해당 재료를  삭제하시겠습니까?')) {
				$.ajax({
					type: 'post',
					url:'deleteMateStatus.ad',
					data:{
						check:checkArr,
					},
					success:function(data){
						window.location.reload();
					}		
				});
			}
		});
	</script>
</body>
</html>