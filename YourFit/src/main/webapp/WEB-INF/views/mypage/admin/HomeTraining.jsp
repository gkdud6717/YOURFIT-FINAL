<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈트레이닝영상 통계 관리</title>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/mypage.css" rel="stylesheet">

<style>
.content {
	border-bottom: 2px solid black;
	padding-bottom: 20px;
	margin-bottom: 20px;
	display: inline-block;
	width: 100%;
}

.firstchart1 {
	width: 100%;
}

.firstchart2>div{
	display: inline-block;
	width: 50%;
}

.chart {
	margin-left: 40px;
	width: 500px;
	height: 260px;
	border-bottom: 1px solid #a2a2a2;
}

.li {
	margin: 15px 0px 30px 0px;
}
.chart th {
	text-align: center!important;
	border-top: 1px solid #a2a2a2;
	border-bottom: 1px solid #a2a2a2;
}

.chart tr:nth-child(2) {
	background: rgba(230, 198, 112, 0.1);
	border: 2px solid red;
}

.gall-list01>li{
	float:left;
	width:170px;
	height:100px;
	margin-right:30px;
	list-style:none;
}
</style>
</head>
<body>
	<c:import url="../../common/header.jsp" />
	<section class="section wb">
		<div class="container">
			<h2 class="content">
				홈트레이닝 영상 통계 <span style="float: right"><a
					href="${pageContext.request.contextPath}/mypage/managementHT.do">돌아가기</a></span>
			</h2>

			<div class="first-group">
				<div class="firstchart firstchart1">
				<li class="li">영상 분류별 통계</li>
					<canvas id="canvas"></canvas>
					
					<script>
						var type = [];
	                    var total = [];
	                    var count = [];
	                    
	                    $.getJSON("http://localhost:8088/yourfit/HomeTrainingCount", function(data){
	                       
	                       $.each(data, function(inx, obj){
	                    	   type.push(obj.type);
	                    	   total.push(obj.total);
	                    	   count.push(obj.count);
	
	                       });

	                       createChart();
	                       
	                     });
	                     
	                     var lineChartData = {
	                           labels : type,
	                           datasets : [{
	                                 label : "총 게시글 수",
	                                 backgroundColor: "rgba(230, 198, 112, 0)",
	                                 strokeColor : "rgba(255, 217, 112, 0.5)",
	                                 pointColor : "rgba(54, 162, 235, 0.7)",
	                                 borderColor: 'rgba(54, 162, 235, 0.7)',
	                                 data : total
	                              },{
	                            	  label : "총 조회수",
	                            	  backgroundColor: "rgba(255, 186, 184, 0.1)",
	                                  pointColor : "rgba(255, 99, 132, 1)",
	                                  borderColor: 'rgba(255, 99, 132, 0.7)',
	                                  pointStrokeColor : "rgba(255, 99, 132, 0.4)",
	                                  data : count
	                        	 }]
	                        }
	                     
	                     function createChart(){
	                        var ctx = document.getElementById("canvas").getContext("2d");
	                        LineChartDemo = Chart.Line(ctx,{
	                           data : lineChartData,
	                           options :{
	                              animation: {
	                              animateScale: true,
	                              duration: 1000,
	                              onComplete: function () {
	                                 var chartInstance = this.chart,
	                                    ctx = chartInstance.ctx;
	                                 ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize, Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);
	                                 ctx.fillStyle = 'black';
	                                 ctx.textAlign = 'center';
	                                 ctx.textBaseline = 'bottom';
	                  
	                                 this.data.datasets.forEach(function (dataset, i) {
	                                    var meta = chartInstance.controller.getDatasetMeta(i);
	                                    meta.data.forEach(function (bar, index) {
	                                       var data = dataset.data[index];                     
	                                       ctx.fillText(data, bar._model.x, bar._model.y - 5);
	                                    });
	                                 });
	                              }
	                           },
	                              scales : {
	                                 yAxes : [{
	                                    ticks :{
	                                       beginAtZero : true,
	                                       stepSize : 10
	                                    }
	                                 }]
	                              }
	                           }
	                        })
	                     
	                     }
	                  </script>
	             	  <div class="firstchart firstchart2">
	             	  <li class="li">타입별 최다 조회수</li>
	             	  <div style="width: 45%;">
	             	  	<canvas id="myChart" width="500"></canvas>

	                     <script>
		                     var bestcount = [];
			                 var besttype = [];
			                    
			                    $.getJSON("http://localhost:8088/yourfit/bestHomeTraining", function(data){
			                       
			                       $.each(data, function(inx, obj){
			                    	   bestcount.push(obj.count);
			                    	   besttype.push(obj.type);
			
			                       });

			                       var ctx = document.getElementById('myChart');
				                     var myChart = new Chart(ctx, {
				                         type: 'bar',
				                         data: {
				                            labels: besttype,
				                           datasets: [{
				                              label: '최다 조회수',
				                              data: bestcount,
				                              backgroundColor: [
				                                    'rgba(255, 46, 74, 0.8)',
				                                    'rgba(255, 46, 74, 0.6)',
				                                    'rgba(252, 85, 48, 0.8)',
				                                    'rgba(252, 85, 48, 0.5)',
				                                    'rgba(255, 206, 86, 0.7)'
				                              ],
				                              borderWidth: 2
				                           }]
				                        },
				                        options: {
				                           responsive: false,
				                           legend: {
				                                 display: false
				                             },
				                           hover: {
				                              animationDuration: 800
				                           },
				                           animation: {
				                              animateScale: true,
				                              duration: 1000,
				                              onComplete: function () {
				                                 var chartInstance = this.chart,
				                                    ctx = chartInstance.ctx;
				                                 ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize, Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);
				                                 ctx.fillStyle = 'black';
				                                 ctx.textAlign = 'center';
				                                 ctx.textBaseline = 'bottom';
				                  
				                                 this.data.datasets.forEach(function (dataset, i) {
				                                    var meta = chartInstance.controller.getDatasetMeta(i);
				                                    meta.data.forEach(function (bar, index) {
				                                       var data = dataset.data[index];                     
				                                       ctx.fillText(data, bar._model.x, bar._model.y - 5);
				                                    });
				                                 });
				                              }
				                           },
				                           scales: {
				                              yAxes: [{
				                                 ticks: {
				                                    beginAtZero: true,
				                                    stepSize : 2,
				                                    fontSize : 14,
				                                 }
				                              }]
				                           }
				                        }
				                     });
			                       
			                     });
			                     
		                  
		                     </script>
	             	  	</div>
	             	  	<div>
		             	  	<table class="chart" style="text-align: center;">
		             	  		<tr>
		             	  			<th>순위</th>
		             	  			<th>분류</th>
		             	  			<th>영상 제목</th>
		             	  			<th>조회수</th>
		             	  		</tr>
		             	  	<c:forEach items="${list}" var="ht" varStatus="vs">
		             	  		<tr>	
		             	  			<td>${vs.count }</td>
		             	  			<td>${ht.type }</td>
		             	  			<td>${ht.title }</td>
		             	  			<td>${ht.count }</td>
		             	  		</tr>
		             	  	</c:forEach>
		             	  	</table>
	             	  	</div>
	             	  </div>
	             	  <div>
	             	  	<div class="bestList"  style="width: 100%; height: 200px; margin-top: 50px;">
							<li class="li">각 타입 중 최다 조회수 영상</li>
							<ul class="gall-list01 clfix">
							
								<c:forEach items="${list}" var="best"> 
								<li id="${best.no }">
									<div class="pic">
										<img src="https://img.youtube.com/vi/${best.src}/0.jpg" alt="" style="width:170px; height:97px;"/>
										<span class="ico-play"></span>
									</div>
									<div class="tit"> <span class="besttitle">${best.type}</span> <img src="${pageContext.request.contextPath}/resources/images/see.PNG"> ${best.count} </div>
								</li>
							 	</c:forEach>
							 	
							</ul>
						</div>

				</div>
			</div>
			<div class="two-group"></div>
		</div>
		<!-- end container -->
	</section>
	<c:import url="../../common/footer.jsp" />
</body>
</html>