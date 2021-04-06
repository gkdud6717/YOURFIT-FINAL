<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>

<link href="${pageContext.request.contextPath}/resources/css/cbBoard.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/mypage.css" rel="stylesheet">
<style>

#centered {display: table; margin-left: auto; margin-right: auto;}

#updateNotice {
	font-family: 'InfinitySans-RegularA1';
	text-align: center;
	margin-bottom: 30px;
	border-right: 0.5px solid lightgray;
	width: -webkit-fill-available;
}
	
#updateNotice th {
	background: #f8e9e2;
	text-align: center;
	width: 100px;
	border: 0.5px solid lightgrey;
}
	
#updateNotice td {
	width: 350px;
}
	
#update_td, #updateNotice td {
	border-bottom: 1px solid lightgrey;
	border-top: 1px solid lightgrey;
	padding: 7px;
	text-align: left;
}

#n_content {height: 350px; resize: none;}

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
                                        <li><a href="${pageContext.request.contextPath}/mypage/managementDT.do">다이어트 팁 관리 <span>></span></a></li>
                                        <li ><a href="${pageContext.request.contextPath}/mypage/managementCB.do">칼로리 사전 관리 <span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/managementHT.do">홈 트레이닝 관리 <span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/managementCO.do">커뮤니티 관리 <span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/managementQuestion.do">문의 관리 <span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/managementOrders.do">주문 관리 <span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/managementAD.do">광고 관리 <span>></span></a></li>
                                        <li class="active-sidebar"><a href="${pageContext.request.contextPath}/mypage/managementNotice.do">공지사항 관리 <span>></span></a></li>
                                    </ul>
                                </div><!-- end link-widget -->
                            </div><!-- end widget -->
                        </div><!-- end sidebar -->
                    </div><!-- end col -->

                    <div class="col-lg-9 col-md-12 col-sm-12 col-xs-12">
                        <div class="page-wrapper">
                        	 <h3 class="content">공지사항 수정 화면</h3>
                        	 <form action="${pageContext.request.contextPath}/mypage/update_end.do" method="post" onsubmit="return validate();" enctype="multipart/form-data">
										<table id="updateNotice">
											<tr>
												<th>제목</th>
												<td>
												    <input type="hidden" name="n_no" value="${ notice.n_no }"/>
												    <input type="text" class="form-control" id="n_title" name="n_title" value="${notice.n_title }" required>
												</td>
											</tr>						 
											<tr>
												<th>작성자</th>
												<td readonly style="padding-left: 17px;">
													${ member.m_Name }
													<input type="hidden" name="n_mno" value="${ member.m_No }"/>
												</td>   
											</tr>
											<tr>
												<th>작성일</th>
												<td style="padding-left: 15px;"><input type="date" id="myDate" /></td>
											</tr>
											
											<tr>
												<th>내용</th>
												<td>
												   <textarea class="form-control" id="n_content" name="n_content" value="${notice.n_content }" required></textarea>
												</td>
											</tr>
										</table>
										
									<button class="btn btn-primary" id="btn-back" type="button" onclick="location.href='${pageContext.request.contextPath}/mypage/managementNotice.do'">돌아가기</button> &nbsp;
									<input type="button" class="btn btn-outline-danger" value="삭제" onclick="location.href='${pageContext.request.contextPath}/mypage/notice_delete.do?n_no=${notice.n_no}'"/> &nbsp;
									<input type="submit" class="btn btn-primary" id="btn-update" value="수정 하기" />
								</form>
								
							<c:out value="${pageBar}" escapeXml="false"/>
                        
                        </div><!-- end page-wrapper -->
                    </div><!-- end col -->
                </div><!-- end row -->
            </div><!-- end container -->
        </section>
        
   <c:import url="../../common/footer.jsp"/>
   
   
 <script>
	function validate(){
		var content = $("[name=n_Content]").val();
		var title = $("[name=n_title]").val();
		if(content.trim().length==0) && (title.trim().length==0){
			alert("내용을 입력하세요");
			return false;
		}
		return true;
	}

	_today: function () {
		  var myDate = document.querySelector(myDate);
		  var today = new Date();
		  myDate.value = today.toISOString().substr(0, 10);
		},
	
	/*
	function date(){

		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth()+1; //January is 0!
		var yyyy = today.getFullYear();

		if(dd<10) {
		    dd='0'+dd
		} 

		if(mm<10) {
		    mm='0'+mm
		} 

		today = yyyy+'/'+mm+'/'+dd;
		document.write(today);
	}
	*/
	
</script>
        
</body>
</html>