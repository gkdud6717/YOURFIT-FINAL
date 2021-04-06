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

.color-red { color: red; }
.product-img { border-radius: 3px;}
.go {
	line-height:0px;
	height: 30px;
	margin: 0px;
}
.tit {
	text-align: left;
}
.noo td { text-align: left; line-height: 40px;}

.table tr:nth-child(3) {line-height: 60px;}
.check, .btn-back {
	height: 50px;
	width: 100px;
	background: #f8e9e2;
	border: 1px solid rgba(92, 92, 92,0.2);
	border-radius: 15px;
}
.check:hover, .btn-back:hover {
	box-shadow: 2px 4px 4px 3px rgba(227, 134, 118,0.2);
	background: #fcdfd2;
	cursor: pointer;
	transition: 0.4s;
	border: 2px solid #e0c7bf;
}
</style>
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
                        	<table class="table">
                        	<tr>
                        		<td class="tit">주문 내역</td>
                        	</tr>
									<tr>
										<th>주문번호</th>
										<th>주문일자</th>
										<th>상품</th>
										<th>상품명</th>
										<th>결제방법</th>
										<th>상태</th>
										<th>결제금액</th>
									</tr>
									
									<c:forEach items="${list}" var="orders" >
									
									<tr>
										<td>O${orders.o_No }</td>
										<td>${orders.o_Date}</td>
										<td>
											<img src="${pageContext.request.contextPath}/resources/productUpload/${orders.files[0].i_ChangeName}"
												class="product-img" alt="대표이미지" width="75" height="75">
										</td>
										<td>${orders.p_Name}</td>
										<c:if test="${orders.o_Paymethod eq 'card' }">
											<td>카드결제</td>
										</c:if>
										<c:choose>
											<c:when test="${orders.o_Paystatus eq 'N' }"><td>결제 완료</td></c:when>
											<c:otherwise><td>접수 완료</td></c:otherwise>
										</c:choose>
										
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${orders.o_Payamount}" />원</td>
					                </tr>
					                <tr style=height: 40px;"></tr>
					                <tr style="border:none; height: 40px;">
					                	<td class="tit">주문자 정보</td>
					                </tr>
					                <tr class="noo">
										<th>주문자명</th>
										<td colspan="3">${orders.m_Name}</td>	
									</tr>
									
									<tr class="noo">
										<th>이메일</th>
										<td colspan="3">${orders.m_Email}</td>
										
									</tr class="noo">
									<tr class="noo">
										<th>연락파</th>
										<td colspan="3">${orders.m_Phone}</td>
									</tr>
									<tr class="noo" id="${orders.o_No}">
										<th>주소</th>
										<td colspan="3">${orders.m_Address}</td>
										<td colspan="3" style="text-align: right;">
											<c:if test="${orders.o_Paystatus eq 'N'}">
												<button class="check" onclick="location.href='${pageContext.request.contextPath}/mypage/confirmOrder.do?o_No=${orders.o_No }'">주문 접수</button>
											</c:if>
										</td>
									</tr>
					            	</c:forEach>
								</table>
								<div style="text-align: center;" class="back">
									<button class="btn-back" onclick="location.href='${pageContext.request.contextPath}/mypage/managementOrders.do'">돌아가기</button>
                       			</div>
                       			
                        </div><!-- end page-wrapper -->
                    </div><!-- end col -->
                </div><!-- end row -->
            </div><!-- end container -->
        </section>
<c:import url="../../common/footer.jsp"/>
</body>
</html>