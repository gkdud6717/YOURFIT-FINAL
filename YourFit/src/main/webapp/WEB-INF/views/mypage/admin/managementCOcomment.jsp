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
<title>커뮤니티 관리</title>
<link href="${pageContext.request.contextPath}/resources/css/mypage.css" rel="stylesheet">
<style>
.content {
		border-bottom: 2px solid black;
		padding-bottom: 20px;
		margin-bottom: 20px;
		display: inline-block;
		width: 800px;
}
	
.table {
	width: 800px!important;
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

#btn-update, .tab_ {
	font-family: 'InfinitySans-RegularA1';
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
	padding: 10px 40px;
}
.tab3 {
	background:  #f8e9e2;
	border: 3px solid  #f7d8d0;
}

.tab2, .tab1 {
	border: 3px solid  #f7d8d0;
}

.tab1:hover, .tab2:hover, .tab3:hover {
	font-weight: 700;
	background: #f8e9e2;
	transition: 0.5s;
}
</style>
<script>
$(function(){
	$("tr[id]").mouseenter(function(){
        $(this).css({"background-color" : "rgba( 248, 233, 226, 0.5)", "cursor" : "pointer"});
    }).mouseout(function(){
       $(this).css({"background" : "white"});
    }).on("click",function(){
		var co_No = $(this).attr("id");
		location.href = "${pageContext.request.contextPath}/board/boardView.do?no="+co_No;
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
                                        <li class="active-sidebar"><a href="${pageContext.request.contextPath}/mypage/managementCO.do">커뮤니티 관리 <span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/managementQuestion.do">문의 관리 <span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/managementOrders.do">주문 관리 <span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/managementAD.do">광고 관리 <span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/managementNotice.do">공지사항 관리 <span>></span></a></li>
                                    </ul>
                                </div><!-- end link-widget -->
                            </div><!-- end widget -->
                        </div><!-- end sidebar -->
                    </div><!-- end col -->

                    <div class="col-lg-9 col-md-12 col-sm-12 col-xs-12">
                        <div class="page-wrapper">
                        	<h2 class="content content-title">커뮤니티 관리</h2>
                        	
                        	<div class="tab-group">
	                        	<a href="${pageContext.request.contextPath}/mypage/managementCO.do"><div class="tab_ tab1">최신 순</div></a>
	                        	<a href="${pageContext.request.contextPath}/mypage/managementCOcount.do"><div class="tab_ tab2">조회수</div></a>
	                        	<a href="${pageContext.request.contextPath}/mypage/managementCOcomment.do"><div class="tab_ tab3">댓글</div></a>
                        	</div>
                        	
                        	<p style="float: right; margin-right: 25px; margin-bottom:5px; font-family: 'InfinitySans-RegularA1';">총 ${totalContents}건이 게시글이 있습니다.</p>
                        	
								<table class="table">
									<tr>
										<th style="width: 50px">No.</th>
										<th style="width: 150px">커뮤니티분류</th>
										<th style="width: 50px">제목</th>
										<th style="width: 200px">내용</th>
										<th style="width: 150px">작성자</th>
										<th style="width: 100px">조회수</th>
										<th style="width: 100px">댓글수</th>
									</tr>
									
									<c:forEach items="${list}" var="coBoard" varStatus="vs">
									
									<tr id="${coBoard.co_No}">
										<td>${vs.count}</td>
										<td>[${coBoard.co_Type}]</td>
										<td><div class="td-title">${coBoard.co_Title}</div></td>
										<td><div class="td-content">${coBoard.co_Content}</div></td>
										<td>${coBoard.nick}</td>
										<td>${coBoard.co_Count}</td>
										<td>${coBoard.commentcount}</td>
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