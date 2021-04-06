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
<title>다이어트 팁 관리</title>
<link href="${pageContext.request.contextPath}/resources/css/mypage.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/managementDT.css" rel="stylesheet">
<script>
$(function(){
	$(".status").on("change",function(){
		var dt_No = $(this).attr("id");
		var status = $(this).val();
		
		location.href = "${pageContext.request.contextPath}/mypage/updateStatus.do?dt_No="+dt_No+"&status="+status;
	});
});

$(function(){
	$(".statusYN").on("change",function(){
		var yn = $(this).val();

		if(yn == 'all'){
			location.href = "${pageContext.request.contextPath}/mypage/managementDT.do";
		} else if(yn == 'Y') {
			location.href = "${pageContext.request.contextPath}/mypage/managementDTY.do";
		} else {
			location.href = "${pageContext.request.contextPath}/mypage/managementDTN.do";
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
                                        <li><a href="${pageContext.request.contextPath}/mypage/managementMember.do">회원 관리 <span>></span></a></li>
                                        <li class="active-sidebar"><a href="${pageContext.request.contextPath}/mypage/managementDT.do">다이어트 꿀팁 관리 <span>></span></a></li>
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
                        	<div class="title-group">
	                        	<h2 class="content content-title"><i class="fa fa-info-circle" style="margin-right: 10px"></i>다이어트 꿀팁 관리</h2>

	        						<p id="totlecontent">(총 : ${totalContents}건 | 게시중 : ${totalContentsY}건 | 가려짐 : ${totalContentsN}건)</p>
									
									<fieldset class="sch2 clfix">
										<select id="statusYN" class="statusYN">
											<option value="all" selected="selected">전체</option>
											<option value="Y">게시중</option>
											<option value="N">가려짐</option>
										</select>
									</fieldset>
							</div>
						</div>
								<div class="product-list-content"> <!-- 카드뷰 -->
						         	<div class="product-card">
							            <div class="row">
							            
							              <c:forEach items="${list}" var="dtboard"> 
								               <div class="pcard">
								                  <div class="col">
								                        <div class="card">
								                            <a href="${pageContext.request.contextPath}/dtboard/dtBoardView.do?no=${dtboard.dt_No}">
												                <c:if test="${ ! empty dtboard.files }">	
					                                            	<img src="${pageContext.request.contextPath}/resources/dtboardUpload/${dtboard.files[0].f_Cname}" class="card-img-top" alt="대표이미지" width="190" height="158">
					                                            </c:if>
																<c:if test="${ empty dtboard.files }">
																	 사진 없음
																</c:if>
								                            </a>
								                            <div class="card-body">
								                            	<h5 class="card-title font-bold">${dtboard.dt_Title}</h5>
								                                <p class="card-text"> 상태 : 
								                                	<c:choose>
																		<c:when test="${dtboard.status eq 'Y'}">게시중</c:when>
																		<c:when test="${dtboard.status eq 'N'}"><span class="sapn-red">가려짐</span></c:when>
																	</c:choose>
																</p>
								                                	<select class="status" name="status" id="${dtboard.dt_No}">
																		<option value="Y" ${dtboard.status=='Y'?'selected':'' }>게시중</option>
																		<option value="N" ${dtboard.status=='N'?'selected':'' }>가려짐</option>			
									               						 <input type="hidden" name="dt_No" value="${dtboard.dt_No}"/>
																	</select>
								                             </div>
								                       	 </div>
								                     </div>
								                  </div>
							                 
							                 </c:forEach>
						            	</div>
						         	</div>
						      	</div>
                    	<c:out value="${pageBar}" escapeXml="false"/>
                        </div><!-- end page-wrapper -->

                    </div><!-- end col -->
                </div><!-- end row -->
            </div><!-- end container -->
        </section>
<c:import url="../../common/footer.jsp"/>
</body>
</html>