<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>특산물 관리</title>


<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/admin/speciality/admin_Specialty.css" rel="stylesheet" type="text/css">
<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/admin_index.css" rel="stylesheet" type="text/css">
</head>
<body>
	<c:import url="/WEB-INF/views/admin/admincommon/header.jsp" charEncoding="UTF-8"></c:import>
    <c:import url="/WEB-INF/views/admin/admincommon/Main.jsp" charEncoding="UTF-8"></c:import>
    <div class="page">
	    <h2 id="title"> 특산물 목록 </h2>
			
	    	<div class="sepciality_list">
			<br>
	    		<table  class="sepciality_table">
	    	
	    			<tr>
						<th width="100px">번호</th>
						<th width="100px">지역명</th>
						<th width="220px">특산물명</th>
						<th width="450px">특산물정보</th>
						<th width="100px"><input type="checkbox" id="all" value="전체선택" onclick="selectAll();">전체선택</th>
					</tr>
	    			<c:if test="${ list != null }">
	    			<c:forEach var="ad" items="${ list }">	
	    			<tr class= "click">
		    				<td onclick="speInfo'${ ad.specialityNo }')">${ad.specialityNo} </td>
		    				<td style="border-left: 1px solid black" onclick="speInfo('${ ad.specialityNo }')">${ad.specialityRegion}</td>
		    				<td style="border-left: 1px solid black" onclick="speInfo('${ ad.specialityNo }')">${ad.specialityName}</td>
		    				<td style="border-left: 1px solid black" onclick="speInfo('${ ad.specialityNo }')">${ad.specialityInfo}</td>
		    				<td style="border-left: 1px solid black"><input type="checkbox" name = "spe_select" onclick="selectOne();" value="${ ad.specialityNo }" ></td>
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
				<button id="insert_spe" onclick="speinsert()">특산물 추가</button>
				<button id="delete_spe">특산물 삭제</button>
	    	</div>
	    	
    	<div id="searchArea" style="float: left">
				<select id="searchCondition" name="searchCondition">
					<option value="region">지역명</option>
					<option value="speName">특산물명</option>
				</select>
				<input id="searchValue" type="search">
				<button id="searchBtn" onclick="searchMate()">검색하기</button>
		</div>
		<br><br>
			
			
    	<!-- 페이징 -->
		<div class="pagingArea">
			<!-- 이전 -->
				<c:if test="${ pi.currentPage <= 1 }">
					<button>&lt;</button>
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="matelistback" value="${ loc }">
						<c:param name="page" value="${ pi.currentPage - 1 }"/>
						<c:if test="${ value ne null }">
							<c:param name="searchValue" value="${ value }"/>
						</c:if>
					</c:url>
					<a href="${ matelistback }"><button>&lt;</button></a>
				</c:if>
				
               	<!-- 숫자 -->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
					<button style = "background: rgba(242, 159, 5, 0.88); color: white" ><b>${ p }</b></button>
					</c:if>  
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="matelistCheck" value="${ loc }">
							<c:param name="page" value="${ p }"/>
							<c:if test="${ value ne null }">
								<c:param name="searchValue" value="${ value }"/>
							</c:if>
						</c:url>
						<a href="${ matelistCheck }"><button>${ p }</button></a>
					</c:if>
				</c:forEach>
				
				<!-- 다음 -->
                <c:if test="${ pi.currentPage >= pi.maxPage }">
					<button>&gt;</button>
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="matelistNext" value="${loc}">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
						<c:if test="${ value ne null }">
							<c:param name="searchValue" value="${ value }"/>
						</c:if>
					</c:url> 
					<a href="${ matelistNext }"><button>&gt;</button></a>
				</c:if>
                
		</div>
	</div>
	
	
	
	<script>
	
	
	<!-- 재료 상세조회 팝업 실행 -->
	function speInfo(specialityNo){
		var url ='<%=request.getContextPath()%>/specialityDetailForm.ad?no='+ specialityNo;
		window.open(url, 'speInfo',  "width=500, height=800, left=100, top=50");
	}
	
	<!-- 재료추가 팝업 실행-->
	function speinsert() { 
		 var url = '<%=request.getContextPath()%>/insertSpeForm.ad';
		window.open(url ,"speinsert", "width=500, height=800, left=100, top=50"); 
		}
	 
	 <!-- tr 배경색상 변경-->
	 $('.click').on('mouseover',function(){
			$(this).closest('tr').css({"background":"#efefef85","cursor":"pointer"});
		}).on('mouseout',function(){
			$(this).closest('tr').css({"background":"","color":"","cursor":""});
		});
	 
	 <!-- 전체선택 -->
		 var all = document.getElementById("all");
		var category = document.getElementsByName("spe_select");
		
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
		$('#delete_spe').on('click', function(){
			var checkArr = [];
			$('input[name="spe_select"]:checked').each(function() {
				checkArr.push($(this).val());
			});
			
			if(checkArr == "") {
				alert("삭제할 특산물을 선택해주세요");
				return;
			} 
			
			console.log(checkArr);
			if (confirm('해당 특산물을  삭제하시겠습니까?')) {
				$.ajax({
					type: 'post',
					url:'deleteSpeStatus.ad',
					data:{
						check:checkArr,
					},
					success:function(data){
						
						window.location.reload();
					}		
				});
			}
		});
		
		<!-- 검색 기능 -->
		function searchMate(){
			var searchCondition = $("#searchCondition").val();
			var searchValue = $("#searchValue").val();
			
			location.href= "searchSpeciality.ad?searchCondition="+searchCondition+"&searchValue="+searchValue;
		
		}
	</script>
</body>
</html>