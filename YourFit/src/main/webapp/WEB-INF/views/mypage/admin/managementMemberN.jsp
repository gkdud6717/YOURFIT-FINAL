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
<title>회원 관리</title>
<link href="${pageContext.request.contextPath}/resources/css/mypage.css" rel="stylesheet">
<style>
.content {
		border-bottom: 2px solid black;
		padding-bottom: 20px;
		margin-bottom: 20px;
		display: inline-block;
		width:800px;
}
	
.table {
	width: 800px !important;
	font-family: 'InfinitySans-RegularA1';
	text-align: center;
	line-height: 35px;
}

.table th {
	text-align: center;
	background: #f8e9e2;
}

.suspension{
	display: inline-block;
}

.counttotal {
	font-family: 'InfinitySans-RegularA1';
	margin: 0px;
	padding: 0px;
}

#btn-update, small {
	font-family: 'InfinitySans-RegularA1';
}
.sapn-red {
	color: red;
}

.cntMember {
	margin: 0px 0px 10px 0px;
	border: 1px solid #c9c9c9;
	width: 400px;
	font-family: 'InfinitySans-RegularA1';
}
.cntMember th {
	width: 15%;
	text-align: center;
	background: #f8e9e2;
}

.cntMember td{
	padding-right: 15px;
	text-align: right;
}

small {
	margin-right: 10px;
	float: right;
}

.suspensionYN {
	display: inline-block;
	margin-right: 30px;
	margin-bottom: 15px;
	float: right;
}
</style>
<script>

$(function(){
	$("tr[id]").mouseenter(function(){
        $(this).css({"background-color" : "rgba( 248, 233, 226, 0.5)", "cursor" : "pointer"});
    }).mouseout(function(){
       $(this).css({"background" : "white"});
    }).on("click",function(){
		var m_No = $(this).attr("id");
		location.href = "${pageContext.request.contextPath}/mypage/memberDetail.do?m_No="+m_No;
	});
});

$(function(){
	$(".suspensionYN").on("change",function(){
		var yn = $(this).val();

		if(yn == 'all'){
			location.href = "${pageContext.request.contextPath}/mypage/managementMember.do";
		} else if(yn == 'Y') {
			location.href = "${pageContext.request.contextPath}/mypage/managementMemberY.do";
		} else {
			location.href = "${pageContext.request.contextPath}/mypage/managementMemberN.do";
		}
		
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
                                        <li class="active-sidebar"><a href="${pageContext.request.contextPath}/mypage/managementMember.do">회원 관리 <span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/managementDT.do">다이어트 꿀팁 관리 <span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/managementCB.do">칼로리 사전 관리 <span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/managementHT.do">홈 트레이닝 관리 <span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/managementCO.do">커뮤니티 관리 <span>></span></a></li>
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
                        	<div class="content title-group">
	                        	<h2 style="margin: 0px; padding:0px;"><i class="fa fa-user" style="margin-right: 10px"></i>활동 중인 회원 관리</h2>
							</div>
							
							<table class="cntMember">
								<tr>
									<th>총 회원</th>
									<td>${totalContents}명</td>
									<th>활동중</th>
									<td>${totalContentsN}명</td>
									<th>정지</th>
									<td>${totalContentsY}명</td>
								</tr>
							</table>
							<select id="suspensionYN" class="suspensionYN">
								<option value="all">전체</option>
								<option value="N" selected="selected"><span class="span-red">활동중</span></option>
								<option value="Y">정지</option>
							</select>
							<small>(총 ${totalContents}명의 회원 중 ${totalContentsN}명이 활동중이며, ${totalContentsY}명이 정지된 상태)</small>
								<table class="table">
									<tr>
										<th>No</th>
										<th>회원 아이디</th>
										<th>닉네임</th>
										<th>회원명</th>
										<th>성별</th>
										<th>가입일</th>
										<th colspan="3">회원 상태 (활동중/정지)</th>
									</tr>
									
									<c:forEach items="${list}" var="member">
									
									<tr id="${member.m_No}">
										<td>${member.m_No}</td>
										<td>${member.m_Id}</td>
										<td>${member.m_Nick}</td>
										<td>${member.m_Name}</td>
										<td>
											<c:choose>
												<c:when test="${member.m_Gender eq 'M'}">남성</c:when>
												<c:when test="${member.m_Gender eq 'F'}">여성</c:when>
											</c:choose>
										</td>
										<td>${member.m_Joindate}</td>
										<td>
											<div class="suspension">
											<c:choose>
												<c:when test="${member.m_Suspension eq 'N'}">활동중</c:when>
												<c:when test="${member.m_Suspension eq 'Y'}"><span class="sapn-red">정지</span></c:when>
											</c:choose>
											</div>
										</td>
										<td onclick="event.cancelBubble=true">
											<form action="${pageContext.request.contextPath}/mypage/suspendMember.do" method="post">
												<input type="hidden" name="m_No" value="${member.m_No}"/>
								                <select class="suspension" name="m_Suspension" required>
													<option value="N" ${member.m_Suspension=='N'?'selected':'' }>활동중</option>
													<option value="Y" ${member.m_Suspension=='Y'?'selected':'' }>정지</option>
												</select>
										</td>
										<td>
											<input class="btn" id="btn-update" type="submit" value="수정" />
											</form>
					                  	</td>
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