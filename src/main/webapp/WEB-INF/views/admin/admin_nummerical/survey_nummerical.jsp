<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<meta charset="UTF-8">
<title>통계관리</title>

<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/admin/nummerical/survey_nummerical.css" rel="stylesheet" type="text/css">
<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/admin_index.css" rel="stylesheet" type="text/css">
</head>
<body>
	<c:import url="/WEB-INF/views/admin/admincommon/header.jsp" charEncoding="UTF-8"></c:import>
    <c:import url="/WEB-INF/views/admin/admincommon/Main.jsp" charEncoding="UTF-8"></c:import>
    <div class="page">
	    <h2 id="title"> 통계 관리 </h2>
	    <br><br>
		    	<div class="labelArea">
					<label id="member" onclick="location.href='adminummerical.ad'">사용자 통계</label>
		    	   	<label id="recipe" onclick="location.href='spe_nummerical.ad'">레시피&재료 관련 통계</label>
					<label id="nummerical" onclick="location.href='survey_nummerical.ad'">설문조사 통계</label>
	    		</div>
	    	<div class="nummericalArea">
    		<br><br>
	    		<div class="member_nummerical">
	    			<div class="surbey_list">
	    				<!-- <h3 align="center">설문조사 통계</h3> -->
	    				    <div id="donutchart1" style="width: 450px; height: 300px;"></div>
	    				    <div id="donutchart2" style="width: 450px; height: 300px;"></div>
	    				    <div id="donutchart3" style="width: 450px; height: 300px;"></div>
	    					<div id="donutchart4" style="width: 450px; height: 300px;"></div>
	    					<div id="donutchart5" style="width: 450px; height: 300px;"></div>
	    			</div>
				</div>
			</div>
	</div>
	
	
	
	<script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
         ${result}
        ]);

        var options = {
          title: '얼마나 자주 집에서 식사하시나요?',
          pieHole: 0.4,
          sliceVisibilityThreshold:0,
          titleTextStyle: {
              fontSize: 15
              }
        };

        var chart = new google.visualization.PieChart(document.getElementById('donutchart1'));
        chart.draw(data, options);
      }
    </script>
    
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ${result2}
        ]);

        var options = {
          title:'직접 요리하는 것을 좋아하시나요?',
          pieHole: 0.4,
          sliceVisibilityThreshold:0,
          titleTextStyle: {
              fontSize: 15
              }
        };

        var chart = new google.visualization.PieChart(document.getElementById('donutchart2'));
        chart.draw(data, options);
      }
    </script>
    
   <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ${result3}
        ]);

        var options = {
          title: '하루에 집에서 요리하는 횟수는?',
          pieHole: 0.4,
          sliceVisibilityThreshold:0,
          titleTextStyle: {
              fontSize: 15
              }
        };

        var chart = new google.visualization.PieChart(document.getElementById('donutchart3'));
        chart.draw(data, options);
      }
    </script>
    
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ${result4}
        ]);

        var options = {
          title: '하루에 몇끼를 드시나요?',
          pieHole: 0.4,
          sliceVisibilityThreshold:0,
          titleTextStyle: {
              fontSize: 15
              }
        };

        var chart = new google.visualization.PieChart(document.getElementById('donutchart4'));
        chart.draw(data, options);
      }
    </script>
    
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ${result5}
        ]);

        var options = {
          title: '사이트 이용 후 도움이 되셨나요?',
          pieHole: 0.4,
          sliceVisibilityThreshold:0,
          titleTextStyle: {
              fontSize: 15
              }
        };

        var chart = new google.visualization.PieChart(document.getElementById('donutchart5'));
        chart.draw(data, options);
      }
    </script>
    
    <script>
		$("label[class*=admin_menu_nav]").eq(7).css({"color" : "white" , "font-weight" : "bold"}); 
    </script>
    
    
</body>
</html>