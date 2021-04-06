<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
<html>
<head>
<meta charset="UTF-8">
<title>문의 관리</title>
<link href="${pageContext.request.contextPath}/resources/css/mypage.css"
	rel="stylesheet">
<style>
.content {
	border-bottom: 2px solid black;
	padding-bottom: 20px;
	margin-bottom: 20px;
	display: inline-block;
	width: 800px;
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

.suspension {
	display: inline-block;
}

#btn-update, .tab, a, .btn {
	font-family: 'InfinitySans-RegularA1'!important;
}

.btn {
	background: #f8e9e2!important;
	color: #4d4d4d;
}

.btn:hover {
	background: #fad4ca!important;
	cursor: pointer;
}

.checkbox {
	width: 20px;
	height: 20px;
}

.td-title {
	width: 80px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

.td-content {
	width: 250px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

.tab_ {
	display: inline-block;
	margin-bottom: 15px;
	padding: 15px 40px;
}

.tab1 {
	border: 3px solid #f7d8d0;
}

.tab2 {
	background: #f8e9e2;
	border: 3px solid #f7d8d0;
}

.td-title {
	width: 80px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

.td-content {
	width: 250px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}
</style>
</head>
<body>
	<c:import url="../../common/header.jsp" />
	<section class="section wb">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-12 col-sm-12 col-xs-12">
					<div class="sidebar">
						<div class="widget widget-sidebar">
							<h2 class="widget-title">관리자 페이지</h2>
							<div class="link-widget">
								<ul>
									<li><a
										href="${pageContext.request.contextPath}/mypage/managementMember.do">회원
											관리 <span>></span>
									</a></li>
									<li><a
										href="${pageContext.request.contextPath}/mypage/managementDT.do">다이어트
											꿀팁 관리 <span>></span>
									</a></li>
									<li><a
										href="${pageContext.request.contextPath}/mypage/managementCB.do">칼로리
											사전 관리 <span>></span>
									</a></li>
									<li><a
										href="${pageContext.request.contextPath}/mypage/managementHT.do">홈
											트레이닝 관리 <span>></span>
									</a></li>
									<li><a
										href="${pageContext.request.contextPath}/mypage/managementCO.do">커뮤니티
											관리 <span>></span>
									</a></li>
									<li class="active-sidebar"><a
										href="${pageContext.request.contextPath}/mypage/managementQuestion.do">문의
											관리 <span>></span>
									</a></li>
									<li><a href="${pageContext.request.contextPath}/mypage/managementOrders.do">주문 관리 <span>></span></a></li>
									<li><a href="${pageContext.request.contextPath}/mypage/managementAD.do">광고 관리 <span>></span></a></li>
									<li><a
										href="${pageContext.request.contextPath}/mypage/managementNotice.do">공지사항
											관리 <span>></span>
									</a></li>
								</ul>
							</div>
							<!-- end link-widget -->
						</div>
						<!-- end widget -->
					</div>
					<!-- end sidebar -->
				</div>
				<!-- end col -->

				<div class="col-lg-9 col-md-12 col-sm-12 col-xs-12">
					<div class="page-wrapper">
						<h2 class="content content-title">문의 관리</h2>
						<div class="tab-group">
							<a
								href="${pageContext.request.contextPath}/mypage/managementQuestion.do"><div
									class="tab_ tab1">커뮤니티 문의 관리</div></a> <a
								href="${pageContext.request.contextPath}/mypage/managementPQuestion.do"><div
									class="tab_ tab2">상품 문의 관리</div></a>
						</div>
						<div class="reviewlist">
							<table id="tbl-board" class="table table table-hover">
								<tr>
									<th style="width: 50px;"></th>
									<th>제목</th>
									<th>작성일</th>
									<th>작성자</th>
								</tr>
								<c:forEach items="${list}" var="q">
									<tr>
										<td> <img
											src="${pageContext.request.contextPath}/resources/images/open.png"
											class="glyphicon glyphicon-plus plusIcon" /> <img
											src="${pageContext.request.contextPath}/resources/images/close.png"
											class="glyphicon glyphicon-minus plusIcon"
											style="display: none" />
										<td>${q.q_Title}</td>
										<td>${q.q_Date}</td>
										<td>${q.q_Nick}</td>
										</td>
									</tr>
									<tr style="display: none; margin-left: 15px;">
										<form action="${pageContext.request.contextPath}/mypage/insertAnswer.do">
											<td colspan="4">
												<p>문의 내용</p>
												<p>${q.q_Content}</p>
												<textarea name="q_Answer" id="q_Answer" cols="30" rows="10" placeholder="답변 내용을 입력하세요." required="required" style="width: 100%"></textarea>
												<input type="hidden" name="q_No" value="${q.q_No }"/>
												<input type="submit" class="btn" value="등록" />
											</td>
										</form>
									</tr>

								</c:forEach>
							</table>
						</div>
						<script>
							$(".plusIcon").on("click", function() {
								var obj = $(this);
								console.log(obj);
								if (obj.hasClass("glyphicon-plus")) {
									obj.hide();
									obj.next().show();
									obj.parent().parent().next().show();
								} else {
									obj.hide();
									obj.prev().show();
									obj.parent().parent().next().hide();
								}
							});
						</script>
						<c:out value="${pageBar}" escapeXml="false" />
					</div>
					<!-- end page-wrapper -->

				</div>
				<!-- end col -->
			</div>
			<!-- end row -->
		</div>
		<!-- end container -->
	</section>
	<c:import url="../../common/footer.jsp" />
</body>
</html>