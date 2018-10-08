<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.titleArea{
    padding:3%;
    width:70%;
    margin-left:auto;
    margin-right:auto;
}
.chartArea{
    width:70%;
    margin-left:auto;
    margin-right:auto;
}
.outline{
    width:90%;
    margin-top:2%;
    margin-bottom:5%;
    margin-left:auto;
    margin-right:auto;
    border:1px solid lightgray;
    border-style:dotted;
    border-radius: 10px;
}

</style>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Year', 'Sales', 'Expenses'],
          ['2013',  1000,      400],
          ['2014',  1170,      460],
          ['2015',  660,       1120],
          ['2016',  1030,      540]
        ]);

        var options = {
          /* title: 'Company Performance', */
          hAxis: {title: 'Month',  titleTextStyle: {color: '#333'}},
          vAxis: {minValue: 0}
        };

        var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
    
    
</head>
<body>

<jsp:include page="../common/menubar.jsp"/>
	<jsp:include page="../common/adminMenubar.jsp"/>
	<div class="main">
	
	<div class="titleArea">
	<div class="row">
                        <div class="col-md-12">
                            <!--breadcrumbs start -->
                            <ul class="breadcrumb">
                                <li><a href="myPageView.ad"><i class="fa fa-home"></i> Home</a></li>
                                <li><a href="salesStatisticsView.ad">통계</a></li>
                                <li><a href="salesStatisticsView.ad">매출 통계</a></li>
                            </ul>
                            <!--breadcrumbs end -->
                        </div>
                    </div>
	</div>
	
	
	<div class="chartArea" id="salesChart" align="center">
	<span class="label label-warning">매출 통계</span>
	<div class="outline">
	<div id="chart_div" style="width:750px; height: 500px;"></div>
	
	</div>
	</div>
	
	
	</div> 
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
	
	</script>

</body>
</html>