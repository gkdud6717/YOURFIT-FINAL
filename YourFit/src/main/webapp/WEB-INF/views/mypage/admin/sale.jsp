<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/libs/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/vendor/vector-map/jqvmap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/vendor/jvectormap/jquery-jvectormap-2.0.2.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/vendor/fonts/flag-icon-css/flag-icon.min.css">
    <title>매출 통계</title>
</head>
<style>
@font-face {
    font-family: 'InfinitySans-RegularA1';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/InfinitySans-RegularA1.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
h1, h2, h3, h4, h5, span, p, th, td {font-family: 'InfinitySans-RegularA1'!important;}
.mb-2 {
	font-size: 22pt;
	display: inline-block;
	border-bottom: 4px solid #a2a2a2;
	padding-bottom: 30px;
	margin-bottom: 20px;
	width: 100%
}
.mb-3 { font-size: 18pt; }
</style>
<body>
<c:import url="../../common/header.jsp"/>
	<hr />
    <!-- ============================================================== -->
    <!-- main wrapper -->
    <!-- ============================================================== -->
    <div class="dashboard-main-wrapper">
        
        <!-- ============================================================== -->
        <!-- wrapper  -->
        <!-- ============================================================== -->
        <div class="container">
            <div>
                <!-- ============================================================== -->
                <!-- pagehader  -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="page-header">
                            <h3 class="mb-2"><i class="fa fa-shopping-cart"></a></i> 매출 통계   
                            <a href="${pageContext.request.contextPath }/mypage/managementOrders.do">(돌아가기)</a></h3>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- pagehader  -->
                <!-- ============================================================== -->
                <div class="row row-my">
                    <!-- metric -->
                    <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="text-muted">오늘 주문 수</h5>
                                <div class="metric-value d-inline-block">
                                    <h1 class="mb-1 text-primary">${todayOrders } 건</h1>
                                </div>
                                <div class="metric-label d-inline-block float-right">
                                	<c:choose>
                                		<c:when test="${todayOrders gt yesterdayOrders}">
                                			<i class="fa fa-fw fa-caret-up text-success"></i>
                                			<span class="text-success">
                                				<fmt:formatNumber value="${((todayOrders / yesterdayOrders)-1)*100}" pattern="0.0"/>%
                                			</span>
                                		</c:when>
                                		<c:when test="${todayOrders lt yesterdaySale}">
                                			<i class="fa fa-fw fa-caret-down text-danger"></i>
                                			<span class="text-danger">
                                				<fmt:formatNumber value="${(1-(todayOrders / yesterdayOrders))*100}" pattern="0.0"/>%
                                			</span>
                                		</c:when>
                                		<c:when test="${todayOrders eq yesterdayOrders}">
                                			<i class="fa fa-fw fa-caret-up text-success"></i>
                                				 <i class="fa fa-fw fa-minus" style="color: #a2a2a2;"></i>
                                		</c:when>
                                	</c:choose>
                                </div>
                            </div>
                            <div id="sparkline-1"></div>
                        </div>
                    </div>
                    <!-- /. metric -->
                    <!-- metric -->
                    <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="text-muted">오늘 매출액</h5>
                                <div class="metric-value d-inline-block">
                                    <h1 class="mb-1 text-primary">￦<fmt:formatNumber type="number" maxFractionDigits="3" value="${todaySale}" /></h1>
                                </div>
                                <div class="metric-label d-inline-block float-right text-danger">
                                   <c:choose>
                                		<c:when test="${todaySale gt yesterdaySale}">
                                			<i class="fa fa-fw fa-caret-up text-success"></i>
                                			<span class="text-success">
                                				<fmt:formatNumber value="${((todaySale / yesterdaySale)-1)*100}" pattern="0.0"/>%
                                			</span>
                                		</c:when>
                                		<c:when test="${todaySale lt yesterdaySale}">
                                			<i class="fa fa-fw fa-caret-down text-danger"></i>
                                			<span class="text-danger">
                                				<fmt:formatNumber value="${(1-(todaySale / yesterdaySale))*100}" pattern="0.0"/>%
                                			</span>
                                		</c:when>
                                			<c:when test="${todaySale eq yesterdaySale}">
                                			<i class="fa fa-fw fa-caret-up text-success"></i>
                                				 <i class="fa fa-fw fa-minus" style="color: #a2a2a2;"></i>
                                		</c:when>
                                	</c:choose>
                                </div>
                            </div>
                            <div id="sparkline-2"></div>
                        </div>
                    </div>
                    <!-- /. metric -->
                    <!-- metric -->
                    <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="text-muted">한달 매출액 (1월)</h5>
                                <div class="metric-value d-inline-block">
                                    <h1 class="mb-1 text-primary">￦<fmt:formatNumber type="number" maxFractionDigits="3" value="${monthSale}" /></h1>
                                </div>
                                <div class="metric-label d-inline-block float-right">
                                    <i class="fa fa-fw fa-minus" style="color: #A2A2A2;"></i><span></span>
                                </div>
                            </div>
                            <div id="sparkline-3">
                            </div>
                        </div>
                    </div>
                    <!-- /. metric -->
                    <!-- metric -->
                    <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="text-muted">목표 매출액 달성률</h5>
                                <div class="metric-value d-inline-block">
                                    <h1 class="mb-1 text-primary">
										<fmt:formatNumber value="${(monthSale / 5000000)*100}" pattern="0.00"/>%
									</h1>
                                </div>
                            </div>
                            <div id="sparkline-4"></div>
                        </div>
                    </div>
                    <!-- /. metric -->
                </div>
                <!-- ============================================================== -->
                <!-- revenue  -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-xl-8 col-lg-12 col-md-8 col-sm-12 col-12">
                        <div class="card">
                            <h5 class="card-header">주간 수익</h5>
                            <div class="card-body">
                                <canvas id="revenue" width="400" height="150"></canvas>
                            </div>
                            <div class="card-body border-top">
                                <div class="row">
                                    <div class="offset-xl-1 col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12 p-3">
                                        <h4> Today's Earning : <br> 
                                        ￦<fmt:formatNumber type="number" maxFractionDigits="3" value="${todaySale}" /></h4>
                                    </div>
                                    <div class="offset-xl-1 col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12 p-3">
                                        <h2 class="font-weight-normal mb-3"><span>￦<fmt:formatNumber type="number" maxFractionDigits="3" value="${weekendSaleSum}" /></span>                                                    </h2>
                                        <div class="mb-0 mt-3 legend-item">
                                            <span class="fa-xs text-primary mr-1 legend-title "><i class="fa fa-fw fa-square-full"></i></span>
                                            <span class="legend-text">최근 일주일 수익</span></div>
                                    </div>
                                    <div class="offset-xl-1 col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12 p-3">
                                        <h2 class="font-weight-normal mb-3"><span>￦<fmt:formatNumber type="number" maxFractionDigits="3" value="${previousweekendSum}" /></span>
                                        </h2>
                                        <div class="text-muted mb-0 mt-3 legend-item"> 
                                        	<span class="fa-xs text-secondary mr-1 legend-title"><i class="fa fa-fw fa-square-full"></i></span>
                                        	<span class="legend-text">지난 주 수익</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- end reveune  -->
                    <!-- ============================================================== -->
                    <!-- ============================================================== -->
                    <!-- total sale  -->
                    <!-- ============================================================== -->
                    <div class="col-xl-4 col-lg-12 col-md-4 col-sm-12 col-12">
                        <div class="card">
                            <h5 class="card-header">카테고리별 수익</h5>
                            <div class="card-body">
                                <canvas id="total-sale" width="220" height="155"></canvas>
                                <script>
                                $(function() {
	                                var ctx = document.getElementById("total-sale").getContext('2d');
	                                var myChart = new Chart(ctx, {
	                                    type: 'doughnut',
	                                    
	                                    data: {
	                                        labels: ["Living", " Food/Health", "Beauty"],
	                                        datasets: [{
	                                            backgroundColor: [
	                                                "#5969ff",
	                                                "#ff407b",
	                                                "#fac937"
	                                            ],
	                                            data: [${livingSale}, ${foodSale}, ${beautySale}]
	                                        }]
	                                    },
	                                    options: {
	                                        legend: {
	                                            display: false
	
	                                        }
	                                    }
	
	                                });
                                });
                                </script>
                                <div class="chart-widget-list">
                                    <p>
                                        <span class="fa-xs text-primary mr-1 legend-title"><i class="fa fa-fw fa-square-full"></i></span><span class="legend-text">Living</span>
                                        <span class="float-right">￦ <fmt:formatNumber type="number" maxFractionDigits="3" value="${livingSale}" /></span>
                                    </p>
                                    <p>
                                        <span class="fa-xs text-secondary mr-1 legend-title"><i class="fa fa-fw fa-square-full"></i></span>
                                        <span class="legend-text">Food/Health</span>
                                        <span class="float-right">￦ <fmt:formatNumber type="number" maxFractionDigits="3" value="${foodSale}" /></span>
                                    </p>
                                    <p>
                                        <span class="fa-xs text-brand mr-1 legend-title"><i class="fa fa-fw fa-square-full"></i></span> <span class="legend-text">Beauty</span>
                                        <span class="float-right">￦ <fmt:formatNumber type="number" maxFractionDigits="3" value="${beautySale}" /></span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- end total sale  -->
                    <!-- ============================================================== -->
                </div>
                <div class="row">
                    <!-- ============================================================== -->
                    <!-- top selling products  -->
                    <!-- ============================================================== -->
                    <div class="col-xl-7 col-lg-12 col-md-12 col-sm-12 col-12"> 
                        <div class="card">
                            <h5 class="card-header">1월 BEST5 상품</h5>
                            <div class="card-body p-0">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead class="bg-light">
                                            <tr class="border-0">
                                                <th class="border-0">순위</th>
                                                <th class="border-0">상품명</th>
                                                <th class="border-0">주문량</th>
                                                <th class="border-0">상품가격</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                          <c:forEach items="${list}" var="orders" varStatus="vs" begin="0" end="4">
												<tr>
													<td>${vs.count}위</td>
													<td>${orders.p_Name}</td>
													<td>${orders.o_Amount }</td>
													<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${orders.p_Price }" /> 원</td>
								                </tr>
					            			</c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- end top selling products  -->
                    <!-- ============================================================== -->
                    <!-- ============================================================== -->
                    <!-- start -->
                    <!-- ============================================================== -->
                    <div class="col-xl-5 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="card">
                            <h5 class="card-header">1월 주문 남녀 비율</h5>
                            <div class="card-body">
                                <div id="locationmap" style="width:100%; height:280px">
                                <canvas id="manwoman" height="300" width="400"></canvas>

			                     <script>
			                     $(function() {
				                     var ctx = document.getElementById('manwoman');
				                     var myChart = new Chart(ctx, {
				                         type: 'bar',
				                         data: {
				                            labels: ["여성 주문 수", "남성 주문 수", "총주문 수"],
				                           datasets: [{
				                              label: '회원 성비',
				                              data: [${womanOrders}, ${manOrders}, ${allOrders}],
				                              backgroundColor: [
				                                    'rgba(255, 99, 132, 0.4)',
				                                    'rgba(54, 162, 235, 0.4)',
				                                    'rgba(255, 206, 86, 0.4)'
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
			                     });
			                     </script>
			                     </div>
                            </div>
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- end  -->
                    <!-- ============================================================== -->
                   
                </div>
            </div>
        </div>
             <c:import url="../../common/footer.jsp"/>
        <!-- ============================================================== -->
        <!-- end wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- end main wrapper  -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->
    <!-- jquery 3.3.1 js-->
    <script src="${pageContext.request.contextPath }/resources/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <!-- bootstrap bundle js-->
    <script src="${pageContext.request.contextPath }/resources/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <!-- slimscroll js-->
    <script src="${pageContext.request.contextPath }/resources/assets/vendor/slimscroll/jquery.slimscroll.js"></script>
    <!-- chartjs js-->
    <script src="${pageContext.request.contextPath }/resources/assets/vendor/charts/charts-bundle/Chart.bundle.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/vendor/charts/charts-bundle/chartjs.js"></script>
   
    <!-- main js-->
    <script src="${pageContext.request.contextPath }/resources/assets/libs/js/main-js.js"></script>
    <!-- jvactormap js-->
    <!-- sparkline js-->
    <script src="${pageContext.request.contextPath }/resources/assets/vendor/charts/sparkline/jquery.sparkline.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/vendor/charts/sparkline/spark-js.js"></script>
     <!-- dashboard sales js-->
    <script src="${pageContext.request.contextPath }/resources/assets/libs/js/dashboard-sales.js"></script>
</body>
 
</html>