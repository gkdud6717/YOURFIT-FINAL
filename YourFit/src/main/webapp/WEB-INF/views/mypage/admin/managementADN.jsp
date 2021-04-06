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
<title>광고 관리</title>
<link href="${pageContext.request.contextPath}/resources/css/mypage.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/managementDT.css" rel="stylesheet">
<script>
$(function(){
	$(".status").on("change",function(){
		var ad_No = $(this).attr("id");
		var status = $(this).val();
		
		location.href = "${pageContext.request.contextPath}/mypage/adupdateStatus.do?ad_No="+ad_No+"&status="+status;
	});
});

$(function(){
	$(".statusYN").on("change",function(){
		var yn = $(this).val();

		if(yn == 'all'){
			location.href = "${pageContext.request.contextPath}/mypage/managementAD.do";
		} else if(yn == 'Y') {
			location.href = "${pageContext.request.contextPath}/mypage/managementADY.do";
		} else {
			location.href = "${pageContext.request.contextPath}/mypage/managementADN.do";
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
                                        <li><a href="${pageContext.request.contextPath}/mypage/managementDT.do">다이어트 꿀팁 관리 <span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/managementCB.do">칼로리 사전 관리 <span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/managementHT.do">홈 트레이닝 관리 <span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/managementCO.do">커뮤니티 관리 <span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/managementQuestion.do">문의 관리 <span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/managementOrders.do">주문 관리 <span>></span></a></li>
                                        <li class="active-sidebar"><a href="${pageContext.request.contextPath}/mypage/managementAD.do">광고 관리 <span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/managementNotice.do">공지사항 관리 <span>></span></a></li>
                                    </ul>
                                </div><!-- end link-widget -->
                            </div><!-- end widget -->
                        </div><!-- end sidebar -->
                    </div><!-- end col -->

                    <div class="col-lg-9 col-md-12 col-sm-12 col-xs-12">
                        <div class="page-wrapper">
                        	<div class="title-group">
	                        	<h2 class="content content-title"><i class="fa fa-info-circle" style="margin-right: 10px"></i>비활성화 광고 관리</h2>
	        					
	        					<p id="totlecontent">(가려짐 : ${totalContents}건)</p>
	        					
										<fieldset class="sch2 clfix">
											<select id="statusYN" class="statusYN">
												<option value="all">전체</option>
												<option value="Y">활성화</option>
												<option value="N" selected="selected">비활성화</option>
											</select>
										</fieldset>
								</div>
							</div>
								<div class="product-list-content"> <!-- 카드뷰 -->
						         	<div class="product-card">
							            <div class="row">
							            
							              <c:forEach items="${list}" var="adboard"> 
								               <div class="pcard">
								                  <div class="col">
								                        <div class="card">
								                            <a href="${pageContext.request.contextPath}/adboard/adBoardView.do?no=${adboard.ad_No}">
												                <c:if test="${ ! empty adboard.files }">	
					                                            	<img src="${pageContext.request.contextPath}/resources/adboardUpload/${adboard.files[0].f_Cname}" class="card-img-top" alt="대표이미지" width="190" height="158">
					                                            </c:if>
																<c:if test="${ empty adboard.files }">
																	 사진 없음
																</c:if>
								                            </a>
								                            <div class="card-body">
								                            	<h5 class="card-title font-bold">${adboard.ad_Title}</h5>
								                                    <select class="status" name="status" id="${adboard.ad_No}">
																		<option value="Y" ${adboard.status=='Y'?'selected':'' }>활성화</option>
																		<option value="N" ${adboard.status=='N'?'selected':'' }>비활성화</option>			
									               						 <input type="hidden" name="ad_No" value="${adboard.ad_No}"/>
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
	                    <div class="col-11" id="button area" style="text-align: right;">
							<input type="button" class="btn btn-primary" value="글쓰기" id="btn-add" class="btn btn-outline-success" onclick="fn_goADForm();"/>                    	
    	                </div>
                        </div><!-- end page-wrapper -->
                    </div><!-- end col -->
                </div><!-- end row -->
            </div><!-- end container -->
        </section>
        <script>
			function fn_goADForm(){

				window.open('${pageContext.request.contextPath}/mypage/adBoardForm.do','_blank','height=800');
				
			};

			function pop_move(){

				url = "${pageContext.request.contextPath}/adboard/adBoardView.do?no=${adboard.ad_No}";

				window.open(url,'_blank');

			}
        </script>
<c:import url="../../common/footer.jsp"/>
</body>
</html>