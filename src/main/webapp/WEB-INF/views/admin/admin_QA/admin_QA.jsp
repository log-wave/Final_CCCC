<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 관리</title>


<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/admin/admin_QA.css" rel="stylesheet" type="text/css">
<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/admin_index.css" rel="stylesheet" type="text/css">
</head>
<body>
	<c:import url="/WEB-INF/views/admin/admincommon/header.jsp" charEncoding="UTF-8"></c:import>
    <c:import url="/WEB-INF/views/admin/admincommon/Main.jsp" charEncoding="UTF-8"></c:import>
    <div class="page">
	    <h2 id="title"> Q&A 목록 </h2>
	    <br>
	    	<div class="QA_list">
	    	<hr>
			<br>
	    		<table class="QA_Table">
	    			<tr>
	    				<th  width="85px">번호</th>
	    				<th  width="150px">제목</th>
	    				<th  width="500px">내용</th>
	    				<th  width="90px"><input type="checkbox" id="all" value="전체선택" onclick="selectAll();">전체선택</th>
	    			</tr>
	    			<c:if test="${ list != null }">
					<c:forEach var="ad" items="${ list }">
			    		<tr class="click">
			    			<td>${ ad.bNo }</td>
			    			<td style="border-left: 1px solid black" onclick="qaInfo('${ ad.bNo }')">${ ad.bTitle}</td>
			    			<td style="border-left: 1px solid black" onclick="qaInfo('${ ad.bNo }')">${ ad.bContent }</td>
			    			<td width="90px" style="border-left: 1px solid black" ><input type="checkbox" name="qa_select" onclick="selectOne();" value="${ ad.bNo }"></td>
			    		</tr>
			
	    			</c:forEach>
	    		</c:if>
	    		<c:if test="${ list == null }">
					<tr>
						<td colspan="6">조회된 리스트가 없습니다.</td>
					</tr>
				</c:if>
	    			
	    		</table>
	    	<br><hr><br>
	    	<div id="searchArea" style="float: left">
				<label>검색 조건</label>
				<select id="searchCondition" name="searchCondition">
					<option>-------</option>
					<option value="no"<c:if test="${ searchCondition eq 'no' }">selected</c:if>>번호</option>
					<option value="title"<c:if test="${ searchCondition eq 'title' }">selected</c:if>>제목</option>
					<option value="content"<c:if test="${ searchCondition eq 'content' }">selected</c:if>>내용</option>
				</select>
		
				<input id="searchValue" type="search" value="${ searchValue }" onkeyup="searchEnterKey();">
				<button id="searchBtn" onclick="searchBoard();">검색하기</button>
			</div>
	    	<div class="buttonArea">
				<button id="delete_qa">Q&A 삭제</button>
	    	</div>
    	</div>
    	
    	</div>
    	<div align="center">
    		<!-- 페이징 -->
				<table id="pagingArea">	
			<!-- 페이징 처리 -->
				<tr align="center" height="20" id="buttonTab">
					<td colspan="6">
					
						<!-- [이전] -->
						<c:if test="${ pi.currentPage <= 1 }">
							<button>&lt;</button>
						</c:if>
						<c:if test="${ pi.currentPage > 1 }">
							<c:url var="before" value="adminQAboard.ad">
								<c:param name="page" value="${ pi.currentPage - 1 }"/>
							</c:url>
							<a href="${ before }"><button>&lt;</button></a>
						</c:if>
						
						<!-- 페이지 -->
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<c:if test="${ p eq pi.currentPage }">
								<button><font color="red" size="4"><b>${ p }</b></font></button>
							</c:if>
							
							<c:if test="${ p ne pi.currentPage }">
								<c:url var="pagination" value="adminQAboard.ad">
									<button><c:param name="page" value="${ p }"/></button>
								</c:url>
								<a href="${ pagination }"><button>${ p }</button></a>
							</c:if>
						</c:forEach>
						
						<!-- [다음] -->
						<c:if test="${ pi.currentPage >= pi.maxPage }">
							<button>&gt;</button>
						</c:if>
						<c:if test="${ pi.currentPage < pi.maxPage }">
							<c:url var="after" value="adminQAboard.ad">
								<button><c:param name="page" value="${ pi.currentPage + 1 }"/></button>
							</c:url> 
							<a href="${ after }"><button>&gt;</button></a>
						</c:if>
					</td>
				</tr>
			</table>
		</div>
	</div>
	
	<script>
		var all = document.getElementById("all");
		var category = document.getElementsByName("qa_select");
		
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
		
		function qaInfo(qa_no){
			var url ='<%=request.getContextPath()%>/qaDetailForm.ad?id=' + qa_no;
			window.open(url, 'noticeInfo', 'width=1200px, height=820px');
		}
		
		$('.click').on('mouseover',function(){
			$(this).closest('tr').css({"background":"#efefef85","cursor":"pointer"});
		}).on('mouseout',function(){
			$(this).closest('tr').css({"background":"","color":"","cursor":""});
		});
		
		$('#delete_qa').on('click', function(){
			var checkArr = [];
			$('input[name="qa_select"]:checked').each(function() {
				checkArr.push($(this).val());
			});
			if (confirm('해당 Q&A를 삭제하시겠습니까?')) {
				$.ajax({
					type: 'post',
					url:'bdelete.bo',
					data:{
						check:checkArr
						
					},
					success:function(data){
						window.location.reload();
					}		
				});
			}
		});
		
		function searchBoard(){
			var searchCondition = $("#searchCondition").val();
			var searchValue = $("#searchValue").val();
			if(searchCondition == "" || searchValue == ""){
				alert("똑바로 검색 해주세요.");
				window.location.reload();
			} else {
				location.href="searchAdminQA.ad?searchCondition="+searchCondition+"&searchValue="+searchValue;
			}
		}
		
		function searchEnterKey(){
			if (window.event.keyCode == 13) {
				 
	        	$('#searchBtn').click();
	        }
		}
	</script>
</body>
</html>