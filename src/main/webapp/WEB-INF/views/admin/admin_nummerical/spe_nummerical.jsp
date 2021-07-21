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

<link href="${ pageContext.servletContext.contextPath }/resources/css/style.css/admin/nummerical/spe_nummerical.css" rel="stylesheet" type="text/css">
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
	    			<!-- 	<h3>재료별 특산물 등록 통계</h3> -->
		    		<!-- 	<h3>월별 레시피 등록 통계</h3> -->
						 <div id="chart_div1" style="width: 480px; height: 300px"></div>
		    		</div>
		    		<div class="member_list">
						 <div id="chart_div2" style="width: 480px; height: 300px"></div>
		    		</div>
		    		<div class="member_list">	
		    			 <div id="curve_chart" style="width: 1000px; height: 500px"></div>
	    			</div>
				</div>
			</div>
	</div>
	
	
	
	
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Year', '월별 게시글 등록 평균수'],
          ['1',  10],
          ['2',  10],
          ['3',  6],
          ['4',  10],
          ['5',  13],
          ['6',  14],
          ['7',   9],
          ['8',  4],
          ['9',  6],
          ['10',  10],
          ['11',  13],
          ['12',  15]
        ]);

        var options = {
          title: '',
          curveType: 'none',
          legend: { position: 'bottom' },
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      }
      
    </script>	
	
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script>
	google.charts.load('current', {packages:['corechart']});
</script>


<script>
	// 로딩 완료시 함수 실행하여 차트 생성
	google.charts.setOnLoadCallback(drawChart);
	
	function drawChart() {
	
		// 차트 데이터 설정
		var data = google.visualization.arrayToDataTable([
		   	['항목', '다리수'], // 항목 정의
			['고양이', 4], // 항목, 값 (값은 숫자로 입력하면 그래프로 생성됨)
			['메뚜기', 6],
			['문어', 8],
			['오징어', 10],
			['운영자', 2],
			['달팽이', 0], // ?
			['랜덤', Math.round(Math.random() * 10)],
		]);
	
		// 그래프 옵션
		var options = {
			title : '가장 많이 사용된 재료', // 제목
			fontSize: 10,
			bar : {
				groupWidth : '80%' // 그래프 너비 설정 %
			},
			legend : {
				position : 'none' // 항목 표시 여부 (현재 설정은 안함)
			}
		};
	
		var chart = new google.visualization.ColumnChart(document.getElementById('chart_div1'));
		chart.draw(data, options);
	}

</script>
	
<script>
	// 로딩 완료시 함수 실행하여 차트 생성
	google.charts.setOnLoadCallback(drawChart);
	
	function drawChart() {
	
		// 차트 데이터 설정
		var data = google.visualization.arrayToDataTable([
			['항목', '다리수'], // 항목 정의
			['고양이', 4], // 항목, 값 (값은 숫자로 입력하면 그래프로 생성됨)
			['메뚜기', 6],
			['문어', 8],
			['오징어', 10],
			['운영자', 2],
			['달팽이', 0], // ?
			['랜덤', Math.round(Math.random() * 10)],
		]);
	
		// 그래프 옵션
		var options = {
			title : '가장 많이 사용된 특산물 ', // 제목
			fontSize: 10,
			bar : {
				groupWidth : '80%' // 그래프 너비 설정 %
			},
			legend : {
				position : 'none' // 항목 표시 여부 (현재 설정은 안함)
			}
		};
	
		var chart = new google.visualization.ColumnChart(document.getElementById('chart_div2'));
		chart.draw(data, options);
	}

</script>


</body>
</html>