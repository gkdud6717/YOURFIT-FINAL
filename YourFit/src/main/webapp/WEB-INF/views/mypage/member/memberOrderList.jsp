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

.color-red {
	color: red;
}

.table td {
	line-height: 120px;
}
.go {
	line-height:0px;
	height: 30px;
	margin: 0px;
}

</style>
<script>

$(function(){
	$("tr[id]").mouseenter(function(){
        $(this).css({"background-color" : "rgba( 248, 233, 226, 0.5)", "cursor" : "pointer"});
    }).mouseout(function(){
       $(this).css({"background" : "white"});
    }).on("click",function(){
		var o_Pno = $(this).attr("id");
		location.href = "${pageContext.request.contextPath}/product/productView.do?no="+o_Pno;
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
                                <h2 class="widget-title">마이페이지</h2>
                                <div class="link-widget">
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/mypage/memberMypage.do?m_No=${member.m_No}">회원 정보<span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/selectPostList.do?m_No=${member.m_No}">작성 글 관리 <span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/selectCommentList.do?m_No=${member.m_No}">작성 댓글 관리 <span>></span></a></li>
                                        <li class="active-sidebar"><a href="${pageContext.request.contextPath}/mypage/memberOrderList.do?m_No=${member.m_No}">주문 내역 <span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/memberQuestionList.do?m_No=${member.m_No}">문의 내역 <span>></span></a></li>
                                    </ul>
                                </div><!-- end link-widget -->
                            </div><!-- end widget -->
                        </div><!-- end sidebar -->
                    </div><!-- end col -->

                    <div class="col-lg-9 col-md-12 col-sm-12 col-xs-12">
                        <div class="page-wrapper">
                        	<div class="content">
	                        	<h2 class="content-title">주문 내역</h2>
                        	</div>
							<p style="text-align: right; margin-right: 30px;">총 <span class="color-red">${totalContents}건</span>의 주문 내역이 있습니다.</p>
						
                        	<table class="table">
									<tr>
										<th>상품</th>
										<th style="width: 30%;">상품명</th>
										<th>결제일</th>
										<th>결제방법</th>
										<th>결제금액</th>
										<th>상태</th>
									</tr>
									
									<c:forEach items="${list}" var="orders" >
									
									<tr id="${orders.o_Pno}">
										<td style="padding: 10px; width: 120px;">
											<img src="${pageContext.request.contextPath}/resources/productUpload/${orders.files[0].i_ChangeName}"
												class="product-img" alt="대표이미지" width="100" height="100">
										</td>
										<td style="text-align: left;">${orders.p_Name}</td>
										<td>${orders.o_Date}</td>
											<c:if test="${orders.o_Paymethod eq 'card' }">
												<td>카드결제</td>
											</c:if>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${orders.o_Payamount}" />원</td>
					                	
					                	<c:choose>
					                		<c:when test="${orders.o_Paystatus eq 'N'}"><td>주문 접수중</td></c:when>
					                		<c:otherwise><td><strong>상품 준비중</strong></td></c:otherwise>
					                	</c:choose>
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