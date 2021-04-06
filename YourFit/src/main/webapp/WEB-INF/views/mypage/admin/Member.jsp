<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 통계 관리</title>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
   
<link href="${pageContext.request.contextPath}/resources/css/mypage.css" rel="stylesheet">
<style>
.content {
   border-bottom: 2px solid black;
   padding-bottom: 20px;
   margin-bottom: 20px;
   display: inline-block;
   width:100%;
}

.first-group {
   padding: 20px;
   margin-bottom: 30px;
}

.firstchart {
   width: 30%;
   height: 300px;
   padding: 20px;
   margin: 10px;
}


.firstchart1, .firstchart2, .firstchart3 {
   display: inline-block;
}

.div-font, .li {
   font-size: 15pt;
   font-weight: 600;
}

.two-group {
   	width: 100%;
   	margin-top: 20px;
}
.resultdiv {
	margin-top: 50px;
	padding: 10px;
  	box-shadow: 2px 2px 5px 2px #d1d1d1;
}

.resultTable th {
	font-size: 13pt;
	padding: 10px;
	width: 150px;
}
.resultTable td {
	font-size: 13pt;
	width: 70px;
	text-align: right;
}
</style>
</head>
<body>
<c:import url="../../common/header.jsp"/>
   <section class="section wb">
      <div class="container">
           <h2 class="content">회원 통계 <span style="float: right"><a href="${pageContext.request.contextPath}/mypage/managementMember.do">돌아가기</a></span> </h2>
                     
            <li class="li">회원 성비</li>
               <div class="first-group">
                  <div class="firstchart firstchart1">
                  <canvas id="myChart" height="300" width="300"></canvas>

                     <script>
                     var ctx = document.getElementById('myChart');
                     var myChart = new Chart(ctx, {
                         type: 'bar',
                         data: {
                            labels: ["여성", "남성", "총 회원"],
                           datasets: [{
                              label: '회원 성비',
                              data: [${womanMember}, ${manMember}, ${totalMember}],
                              backgroundColor: [
                                    'rgba(255, 99, 132, 0.4)',
                                    'rgba(54, 162, 235, 0.4)',
                                    'rgba(64, 58, 58, 0.5)'
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
                                    stepSize : 10,
                                    fontSize : 14,
                                 }
                              }]
                           }
                        }
                     });
                     </script>
                     </div>
                     
                  <div class="firstchart firstchart2" style="padding-left: 70px; padding-top: 70px;">
                  <canvas id="doughnut" width="180" height="180"></canvas>
                     <script>
                     var woman = ${womanMember/totalMember*100};
                     var man = ${manMember/totalMember*100};
                     
                     var ctx = document.getElementById('doughnut');
                     var myChart = new Chart(ctx, {
                         type: 'doughnut',
                         data: {
                            labels: ["여성", "남성"],
                           datasets: [{
                              label: '회원 성비',
                              data: [woman.toFixed(2), man.toFixed(2)],
                              backgroundColor: [
                                    'rgba(255, 99, 132, 0.4)',
                                    'rgba(54, 162, 235, 0.4)'
                              ],
                              borderWidth: 2
                           }]
                        },
                        options: {
                           responsive: false,
                           pieceLabel: { 
                              mode:"label", 
                              position:"default", 
                              fontSize: 11, 
                              fontStyle: 'bold' 
                           },
                           hover: {
                              animationDuration: 800
                           },
                           animation: {
                              animateScale: true
                           }
                        }
                     });
                     </script>
                  </div>
                  <div class="firstchart firstchart3">
                  	<div class="resultdiv">
                     <table class="resultTable">
                        <tr>
                           <th>Today's Join</th>
                           <td>${todayJoinMember}</td>
                        </tr>
                        <tr>
                           <th>Toal Member</th>
                           <td>${totalMember}</td>
                        </tr>
                        <tr>
                        	 <td colspan="2">
                           		여성 : <fmt:formatNumber type="number"  pattern="0.0" value="${womanMember/totalMember*100}" />%
                           		남성 : <fmt:formatNumber type="number"  pattern="0.0" value="${manMember/totalMember*100}" />%
                           </td>
                        </tr>
                     </table>   
                  </div>
               </div>
         	</div>
            <li class="li">최근 일별 가입자 추이</li>
               <div class="two-group">
                  <canvas id="canvas" height="250" width="400"></canvas>
                  
                  <script>
                     var chartLabels = [];
                     var chartData = [];
                     var chartWomanData = [];
                     var chartManData = [];
                     
                     $.getJSON("http://localhost:8088/yourfit/dataJoinList", function(data){

                        $.each(data, function(inx, obj){
                           chartLabels.push(obj.dayJoin);
                           chartData.push(obj.dayJoinCnt);
                           chartWomanData.push(obj.womanCount);
                           chartManData.push(obj.manCount);

                        });
                     
                        createChart();
                     
                     });
                     
                     var lineChartData = {
                           labels : chartLabels,
                           datasets : [{
                                 label : "일별 가입자 추이",
                                 backgroundColor: "rgba(230, 198, 112, 0)",
                                 strokeColor : "rgba(255, 217, 112, 0.5)",
                                 pointColor : "rgba(255, 217, 112, 1)",
                                 borderColor: 'rgba(64, 58, 58, 0.7)',
                                 pointStrokeColor : "#fff",
                                 pointHighlightFill : "rgba(255, 217, 112, 0.5)",
                                 pointHighlightStroke : "rgba(255, 217, 112, 0.5)",
                                 data : chartData
                              },{ 
                            	  label : "일별 여성 가입자 추이",
                            	  backgroundColor: "rgba(230, 198, 112, 0)",
                                  pointColor : "rgba(255, 99, 132, 1)",
                                  borderColor: 'rgba(255, 99, 132, 0.7)',
                                  pointStrokeColor : "rgba(255, 99, 132, 0.4)",
                                  data : chartWomanData
                        	 },{
	                          	  label : "일별 남성 가입자 추이",
	                        	  backgroundColor: "rgba(230, 198, 112, 0)",
	                              pointColor : "rgba(255, 99, 132, 1)",
	                              borderColor: 'rgba(54, 162, 235, 0.7)',
	                              pointStrokeColor : "rgba(255, 99, 132, 0.4)",
	                              data : chartManData
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
                                 ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize, 
                                         	Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);
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
                                       stepSize : 1
                                    }
                                 }]
                              }
                           }
                        })
                     
                     }
                  </script>
               </div>
            </div><!-- end container -->
        </section>
<c:import url="../../common/footer.jsp"/>
</body>
</html>