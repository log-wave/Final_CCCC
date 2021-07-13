<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 관리</title>


<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/admin/admin_Event.css" rel="stylesheet" type="text/css">
<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/admin_index.css" rel="stylesheet" type="text/css">
</head>
<body>
	<c:import url="/WEB-INF/views/admin/admincommon/header.jsp" charEncoding="UTF-8"></c:import>
    <c:import url="/WEB-INF/views/admin/admincommon/Main.jsp" charEncoding="UTF-8"></c:import>
    <div class="page">
	    <h2 id="title"> 이벤트 목록 </h2>
	    <br>
	    	<div class="event_list" align="center">
			<br>
	    		<table class="event_table">
		    		<tr>
						<th width="100px">번호</th>
						<th width="150px">제목</th>
						<th width="700px">내용</th>
						<th width="100px"><input type="checkbox" id="all" value="전체선택" onclick="selectAll();">전체선택</th>
					</tr>
				
				<c:if test="${ list != null }">
					<c:forEach var="ad" items="${ list }">
			    		<tr class="click">
			    			<td>${ ad.eventNo }</td>
			    			<td style="border-left: 1px solid black" onclick="eventInfo('${ ad.eventNo }')">${ ad.eventTitle }</td>
			    			<td style="border-left: 1px solid black" onclick="eventInfo('${ ad.eventNo }')">${ ad.eventContent}</td>
			    			<td style="border-left: 1px solid black"><input type="checkbox" name="event_select" onclick="selectOne();" value="${ ad.eventNo }"></td>
			    		</tr>
				
	    			
	    		
	    			<%-- <c:url var="bdetail" value="bdetail.bo"> --%>
						<%-- <c:param name="bId" value="${  }"/>
						<c:param name="page" value="${ pi.currentPage }"/> --%>
					<%-- </c:url> --%>
					<%-- <a href="${ bdetail }">${ b.bTitle }</a> --%>
	    			</c:forEach>
	    		</c:if>
	    		<c:if test="${ list == null }">
					<tr>
						<td colspan="6">조회된 리스트가 없습니다.</td>
					</tr>
				</c:if>
				
	    			
	    		</table>
	    		<br>
	    	<div class="buttonArea">
	    		<button id="insert_ev">이벤트 추가</button>
				<button id="delete_ev">이벤트 삭제</button>
	    	</div>
	    	
	    	<div id="searchArea" style="float: left">
				<select id="searchCondition" name="searchCondition">
					<option value="no"<c:if test="${ searchCondition eq 'no' }">selected</c:if>>번호</option>
					<option value="title"<c:if test="${ searchCondition eq 'title' }">selected</c:if>>제목</option>
					<option value="content"<c:if test="${ searchCondition eq 'content' }">selected</c:if>>내용</option>
				</select>
		
				<input id="searchValue" type="search" value="${ searchValue }" onkeyup="searchEnterKey();">
				<button id="searchBtn" onclick="searchBoard();">검색하기</button>
			</div>
    	</div>
    	
		<div align="center" style="margin-top: 110px;">
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
							<c:url var="before" value="adminEvent.ad">
								<c:param name="page" value="${ pi.currentPage - 1 }"/>
							</c:url>
							<a href="${ before }"><button>&lt;</button></a>
						</c:if>
						
						<!-- 페이지 -->
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<c:if test="${ p eq pi.currentPage }">
								<button style = "background: rgba(242, 159, 5, 0.88); color: white" ><b>${ p }</b></button>
							</c:if>
							
							<c:if test="${ p ne pi.currentPage }">
								<c:url var="pagination" value="adminEvent.ad">
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
							<c:url var="after" value="adminEvent.ad">
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
		var category = document.getElementsByName("event_select");
		
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
		
		function eventInfo(eventNo){
			var url ='<%=request.getContextPath()%>/edetail.ev?eventNo=' + eventNo;
			window.open(url, 'eventInfo', 'width=1200px, height=820px');
		}
		
		$('.click').on('mouseover',function(){
			$(this).closest('tr').css({"background":"#efefef85","cursor":"pointer"});
		}).on('mouseout',function(){
			$(this).closest('tr').css({"background":"","color":"","cursor":""});
		});
		
		$('#insert_ev').on('click', function(){
			var url ='<%=request.getContextPath()%>/insertEventView.ev';
			window.open(url, 'eventInsert', 'width=1200px, height=820px');
		});
		
		$('#delete_ev').on('click', function(){
			var checkArr = [];
			$('input[name="event_select"]:checked').each(function() {
				checkArr.push($(this).val());
			});
			if (confirm('해당 이벤트를 삭제하시겠습니까?')) {
				$.ajax({
					type: 'post',
					url:'evdelete.ad',
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
			if(searchCondition == "-------" || searchValue == ""){
				alert("똑바로 검색 해주세요.");
				window.location.reload();
			} else {
				location.href="searchAdminEvent.ad?searchCondition="+searchCondition+"&searchValue="+searchValue;
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