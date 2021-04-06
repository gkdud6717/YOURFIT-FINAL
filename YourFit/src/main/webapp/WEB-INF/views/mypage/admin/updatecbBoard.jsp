<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>칼로리 정보 추가</title>
<link href="${pageContext.request.contextPath}/resources/css/cbBoard.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/mypage.css" rel="stylesheet">
<style>
#updateCal {
		font-family: 'InfinitySans-RegularA1';
		text-align: center;
		margin-bottom: 30px;
	}
	
	#updateCal th {
		background: #f8e9e2;
		text-align: center;
		width: 150px;
	}
	
	#updateCal td {
		width: 350px;
	}
	
	#updateCal th, #updateCal td {
		border-bottom: 1px solid #a0a0a0;
		border-top: 1px solid #a0a0a0;
		padding: 7px;
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
                                        <li class="active-sidebar"><a href="${pageContext.request.contextPath}/mypage/managementCB.do">칼로리 사전 관리 <span>></span></a></li>
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
                        	 <h3 class="content">칼로리 정보 수정 화면</h3>
								<form action="${pageContext.request.contextPath}/mypage/updateEnd.do" method="post">
									<input type="hidden" name="cb_no" value="${ cbBoard.cb_no }" />
										<table id="updateCal">
											<tr>
												<th>음식명</th>
												<td><input type="text" class="form-control" id="cb_foodname" name="cb_foodname" value="${cbBoard.cb_foodname}" required></td>
											</tr>
											<tr>
												<th>단위</th>
												<td><input type="text" class="form-control" id="cb_foodname" name="cb_unit" value="${cbBoard.cb_unit}" required></td>
											</tr>
											<tr>
												<th>칼로리</th>
												<td><input type="text" class="form-control" id="cb_unit" name="cb_cal" value="${cbBoard.cb_cal}" required></td>
											</tr>
											<tr>
												<th>탄수화물</th>
												<td><input type="text" class="form-control" id="cb_cal" name="cb_carbohydrate" value="${cbBoard.cb_carbohydrate}"required></td>
											</tr>
											<tr>
												<th>단백질</th>
												<td><input type="text" class="form-control" id="cb_carbohydrate" name="cb_protein" value="${cbBoard.cb_protein}" required></td>
											</tr>
											<tr>
												<th>지방</th>
												<td><input type="text" class="form-control" id="cb_fat" name="cb_fat" value="${cbBoard.cb_fat}" required></td>
											</tr>	
										</table>
										
									<button class="btn btn-primary" id="btn-back" type="button" onclick="location.href='${pageContext.request.contextPath}/mypage/managementCB.do'">돌아가기</button>
									<input type="submit" class="btn btn-primary" id="btn-update" value="수정 완료" />
									<input type="button" class="btn btn-primary" id="btn-back" value="삭제" onclick="location.href='${pageContext.request.contextPath}/mypage/cbBoardDelete.do?cb_no=${cbBoard.cb_no}'"/>
								</form>
								
							<c:out value="${pageBar}" escapeXml="false"/>
                        
                        </div><!-- end page-wrapper -->
                    </div><!-- end col -->
                </div><!-- end row -->
            </div><!-- end container -->
        </section>
<c:import url="../../common/footer.jsp"/>
</body>
</html>