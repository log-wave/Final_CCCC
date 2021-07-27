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
					<label id="member" onclick="location.href='adminummerical.ad'">사용자 통계</label>
		    	   	<label id="recipe" onclick="location.href='spe_nummerical.ad'">레시피&재료 관련 통계</label>
					<label id="nummerical" onclick="location.href='survey_nummerical.ad'">설문조사 통계</label>
	    		</div>
	    	<div class="nummericalArea">
    		<br><br>
	    		<div class="member_nummerical">
	    			<div class="member_list">
		    			 <div id="piechart" style="width: 500px; height: 400px;"></div>  
	    			</div>
	    			<div class="member_list">
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
          ${result1},
          ${result}
        ]);

        var options = {
          title: '사용자 성별',
          titleTextStyle: {
              fontSize: 17
           },
       	 colors:['#4c9ad3','#e64c2c']
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
          ${result3}
        ]);

        var options = {
          title: '사용자 연령대',
          titleTextStyle: {
          fontSize: 17
          },
          pieHole: 0.4,
        
        };

        var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
        chart.draw(data, options);
      }
    </script>
    
    	<script>
		$("label[class*=admin_menu_nav]").eq(7).css({"color" : "white" , "font-weight" : "bold"}); 
	</script>
</body>
</html>