<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 관리</title>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.0.min.js"></script>

<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/admin/admin_Member.css" rel="stylesheet" type="text/css">
<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/admin_index.css" rel="stylesheet" type="text/css">
</head>
<body>
	<c:import url="/WEB-INF/views/admin/admincommon/header.jsp" charEncoding="UTF-8"></c:import>
    <c:import url="/WEB-INF/views/admin/admincommon/Main.jsp" charEncoding="UTF-8"></c:import>
    <div class="page">
	    <h2 id="title"> 회원 목록 </h2>
	    <br>
	    	<div class="member_list">
	    	<hr>
			<br>
	    		<table class="member_table">
		    		<tr>
						<th width="80px">번호</th>
						<th width="150px">아이디</th>
						<th width="150px">닉네임</th>
						<th width="200px">가입일</th>
						<th width="60px">상태</th>
						<th width="90px"><input type="checkbox" id="all" value="전체선택" onclick="selectAll();">전체선택</th>
					</tr>
				
				<c:if test="${ list != null }">
					<c:forEach var="ad" items="${ list }">
			    		<tr class="click">
			    			<td>${ ad.user_no }</td>
			    			<td style="border-left: 1px solid black" onclick="memberInfo('${ ad.user_id }')">${ ad.user_id }</td>
			    			<td style="border-left: 1px solid black" onclick="memberInfo('${ ad.user_id }')">${ ad.nickname }</td>
			    			<td style="border-left: 1px solid black" onclick="memberInfo('${ ad.user_id }')">${ ad.user_date}</td>
			    			<%-- <c:if test="${ ad.gender eq 'M'}">
			    				<td style="border-left: 1px solid black">남</td>
			    			</c:if>
			    			<c:if test="${ ad.gender eq 'Y'}">
			    				<td style="border-left: 1px solid black">여</td>
			    			</c:if> --%>
			    			<c:if test="${ ad.status eq 'Y'}">
			    				<td style="border-left: 1px solid black">정상</td>
			    			</c:if>
			    			<c:if test="${ ad.status eq 'N'}">
			    				<td style="border-left: 1px solid black">탈퇴</td>
			    			</c:if>
			    			<c:if test="${ ad.status eq 'S'}">
			    				<td style="border-left: 1px solid black">정지</td>
			    			</c:if>
			    			<td width="90px" style="border-left: 1px solid black"><input type="checkbox" name="mem_select" onclick="selectOne();" value="${ ad.user_no}"></td>
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
	    	<br><hr><br>
	    	<div class="buttonArea">
				<button id="changeStatus">활동 상태 변경</button>
				<select id="status_select_box" name="status_select_box">
					<option value="Y">정상</option>
					<option value="N">탈퇴</option>
					<option value="S">정지</option>
				</select>
	    	</div>
    	</div>
    	
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
						<c:url var="before" value="adminMember.ad">
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
							<c:url var="pagination" value="adminMember.ad">
								<button><c:param name="page" value="${ p }"/></button>
							</c:url>
							<a href="${ pagination }"><button>${ p }</button></a> &nbsp;
						</c:if>
					</c:forEach>
					
					<!-- [다음] -->
					<c:if test="${ pi.currentPage >= pi.maxPage }">
						<button>&gt;</button>
					</c:if>
					<c:if test="${ pi.currentPage < pi.maxPage }">
						<c:url var="after" value="adminMember.ad">
							<button><c:param name="page" value="${ pi.currentPage + 1 }"/></button>
						</c:url> 
						<a href="${ after }"><button>&gt;</button></a>
					</c:if>
				</td>
			</tr>
		</table>
	</div>
	
	<script>
		var all = document.getElementById("all");
		var category = document.getElementsByName("mem_select");
		
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
		
		function memberInfo(member_id){
			var url ='<%=request.getContextPath()%>/memberDetailForm.ad?id=' + member_id;
			window.open(url, 'memberInfo', 'width=300px, height=320px');
		}
		
		$('.click').on('mouseover',function(){
			$(this).closest('tr').css({"background":"#efefef85","cursor":"pointer"});
		}).on('mouseout',function(){
			$(this).closest('tr').css({"background":"","color":"","cursor":""});
		});
		
		$('#changeStatus').on('click', function(){
			 /* var element = $("select")[0], worked = false; */
			    /* if (document.createEvent) { // all browsers
			        var e = document.createEvent("MouseEvents");
			        e.initMouseEvent("mousedown", true, true, window, 0, 0, 0, 0, 0, false, false, false, false, 0, null);
			        worked = element.dispatchEvent(e);
			    } else if (element.fireEvent) { // ie
			        worked = element.fireEvent("onmousedown");
			    }
			    if (!worked) { // unknown browser / error
			        alert("It didn't worked in your browser.");
			    } */
			var checkArr = [];
			$('input[name="mem_select"]:checked').each(function() {
				checkArr.push($(this).val());
			});
			
			if (confirm('해당 회원들의 상태를 변경하시겠습니까?')) {
				$.ajax({
					type: 'post',
					url:'updateMemberStatus.ad',
					data:{
						check:checkArr
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