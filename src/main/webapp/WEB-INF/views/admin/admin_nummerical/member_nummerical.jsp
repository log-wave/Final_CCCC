<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<meta charset="UTF-8">
<title>통계관리</title>

<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/admin/nummerical/member_nummerical.css" rel="stylesheet" type="text/css">
<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/admin_index.css" rel="stylesheet" type="text/css">
</head>
<body>
	<c:import url="/WEB-INF/views/admin/admincommon/header.jsp" charEncoding="UTF-8"></c:import>
    <c:import url="/WEB-INF/views/admin/admincommon/Main.jsp" charEncoding="UTF-8"></c:import>
    <div class="page">
	    <h2 id="title"> 통계 관리 </h2>
	    <br><br>
		    	<div class="labelArea">
					<label >사용자 통계</label>
		    	   	<label>레시피&재료 관련 통계</label>
					<label>설문조사 통계</label>
	    		</div>
	    	<div class="nummericalArea">
    		<br><br>
	    		<div class="member_nummerical">
	    			<div class="member_list">
	    				<h3>사용자 성별 통계</h3>
		    			 <div id="piechart" style="width: 500px; height: 400px;"></div>  
	    			</div>
	    			<div class="member_list">
		    			<h3>사용자 나이 통계</h3>
		    			 <div id="donutchart" style="width: 500px; height: 400px;"></div>
	    			</div>
				</div>
			</div>
	</div>
	
	<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['남자',     11],
          ['여자',    11]
        ]);

        var options = {
          title: ' '
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
    </script>
    
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['10대',  11],
          ['20대',  2],
          ['30대',  20],
          ['40대',  2],
          ['50대 이상', 7]
        ]);

        var options = {
          title: ' ',
          pieHole: 0.4,
        };

        var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
        chart.draw(data, options);
      }
    </script>
</body>
</html>