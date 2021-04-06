<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
<html>
<head>
<meta charset="UTF-8">
<title>주문 내역 관리</title>
<link href="${pageContext.request.contextPath}/resources/css/mypage.css" rel="stylesheet">
<style>
.content {
		border-bottom: 2px solid black;
		margin-bottom: 20px;
		display: inline-block;
		width: 800px;
}
.content-title {
	font-family: 'InfinitySans-RegularA1'!important;
	display: inline-block;
}

.table {
	width: 800px !important;
	font-family: 'InfinitySans-RegularA1';
	text-align: center;
}

.table th {
	text-align: center;
	background: #f8e9e2;
}
.table td { line-height: 60px;}
.color-red { color: red; }
.go {
	line-height:0px;
	height: 30px;
	margin: 0px;
}
.category-group {
	display: inline-block;
	margin-bottom: 10px;
}
.category-actice { background: #f8e9e2; font-weight: 700;}
.category1, .category2, .category3 {border: 5px solid #f8e9e2; padding: 10px 20px;}
.category4 {margin-left: 250px;}
.category1:hover, .category2:hover, .category3:hover {
	background: #f8e9e2;
	border: 5px solid #fadfd9;
	transition: 1s;
	color: #404040;
	cursor: pointer;
}
</style>
<script>

$(function(){
	$("tr[id]").mouseenter(function(){
        $(this).css({"background-color" : "rgba( 248, 233, 226, 0.5)", "cursor" : "pointer"});
    }).mouseout(function(){
       $(this).css({"background" : "white"});
    }).on("click",function(){
		var o_No = $(this).attr("id");
		location.href = "${pageContext.request.contextPath}/mypage/OrderView.do?o_No="+o_No;
	});
});

</script>
</head>
<body>
<c:import url="../../common/header.jsp"/>
	<section class="section wb">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-12 col-sm-12 col-xs-12">
                        <div class="sidebar">
                            <div class="widget widget-sidebar">
                                <h2 class="widget-title">관리자 페이지</h2>
                                <div class="link-widget">
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/mypage/managementMember.do">회원 관리 <span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/managementDT.do">다이어트 꿀팁 관리 <span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/managementCB.do">칼로리 사전 관리 <span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/managementHT.do">홈 트레이닝 관리 <span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/managementCO.do">커뮤니티 관리 <span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/managementQuestion.do">문의 관리 <span>></span></a></li>                                     
                               			<li class="active-sidebar"><a href="${pageContext.request.contextPath}/mypage/managementOrders.do">주문 관리 <span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/managementAD.do">광고 관리 <span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/managementNotice.do">공지사항 관리 <span>></span></a></li>
                                    </ul>
                                </div><!-- end link-widget -->
                            </div><!-- end widget -->
                        </div><!-- end sidebar -->
                    </div><!-- end col -->

                    <div class="col-lg-9 col-md-12 col-sm-12 col-xs-12">
                        <div class="page-wrapper">
                        	<div class="content">
	                        	<h2 class="content-title">주문 관리</h2>
                        	</div>
                        	
                        	<div class="category-group">
                        		<div class="category-group category1" onclick="go_all();">전체</div>
                        		<div class="category-group category2 category-actice" onclick="go_N();">접수 미완료</div>
                        		<div class="category-group category3" onclick="go_Y();">접수 완료</div>
                        		<div class="category-group category4">총 <span class="color-red">${totalContents}건</span>의 주문 미완료건이 있습니다.</div>
                        	</div>
							
							<script>
								function go_all(){
									location.href='${pageContext.request.contextPath}/mypage/managementOrders.do';
								}
								function go_N(){
									location.href='${pageContext.request.contextPath}/mypage/managementOrdersN.do';
								}
								function go_Y(){
									location.href='${pageContext.request.contextPath}/mypage/managementOrdersY.do';
								}
							</script>
						
                        	<table class="table">
									<tr>
										<th>주문번호</th>
										<th>주문일자</th>
										<th>상품</th>
										<th>상품명</th>
										<th>사용자</th>
										<th>결제방법</th>
										<th>상태</th>
										<th>결제금액</th>
									</tr>
									
									<c:forEach items="${list}" var="orders" >
									
									<tr id="${orders.o_No}">
										<td>O${orders.o_No }</td>
										<td>${orders.o_Date}</td>
										<td style="padding: 10px; width: 90px;">
											<img src="${pageContext.request.contextPath}/resources/productUpload/${orders.files[0].i_ChangeName}"
												class="product-img" alt="대표이미지" width="70" height="70">
										</td>
										<td style="text-align: left;">${orders.p_Name}</td>
										
										<c:if test="${orders.o_Paymethod eq 'card' }">
											<td>카드결제</td>
										</c:if>
										<td>${orders.m_Name }</td>
										<c:choose>
											<c:when test="${orders.o_Paystatus eq 'N' }">
												<td>결제 완료</td>
											</c:when>
											<c:otherwise>
												<td><span class="color-red">접수 완료</span></td>
											</c:otherwise>
										</c:choose>
										
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${orders.o_Payamount}" />원</td>
					                </tr>
					            	</c:forEach>
								</table>
							<c:out value="${pageBar}" escapeXml="false"/>
                        </div><!-- end page-wrapper -->
                    </div><!-- end col -->
                </div><!-- end row -->
            </div><!-- end container -->
        </section>
<c:import url="../../common/footer.jsp"/>
</body>
</html>