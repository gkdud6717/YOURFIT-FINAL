<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<script
	src="${pageContext.request.contextPath }/resources/js/jquery.min.js"></script>
<html>
<head>
<title>이벤트 상세 보기</title>
<link href="${pageContext.request.contextPath}/resources/css/co_detail.css" rel="stylesheet">
<style>
h1, h2, h3, h4, small, p, #btn-back {
	font-family: 'InfinitySans-RegularA1' !important;
}
.container {
	align: center;
}
.page-wrapper {
	text-align: center;
}

.board_view_info, .board_view_tit {
	text-align: left;
	
}
#btn-back, #btn-update, #btn-delete {
	margin: 5px;
	background: #f8e9e2;
	color: #464646;
	marginr-top: 100px;
}
#btn-back:hover, #btn-update:hover, #btn-delete:hover {
	cursor: pointer;
	background: #f5a89f;
}
</style>
</head>
<body>
	<c:import url="../common/header.jsp" />
	<section class="section wb">
		<div class="container">
			<div class="row">
			   <div class="col-lg-1 col-md-1"></div>	
					<div class="col-lg-10 col-md-10 col-sm-12 col-xs-12" style="padding: 0px;">
					   <div class="page-wrapper">
					     <h3 class="content" style="text-align: left; margin-bottom: 0;">
					      <i id="icon" class="fa fa-calendar"></i> 이벤트</h3>
					  </div>
				
				<table class="tableDetail">
                     <tr>
			     	   	<td style="background-color:#e4efeb; color:#333;">
			     	   	   <div class="board_view_tit" style="padding-top: 5px;">
							<c:set var="today" value="<%=new java.util.Date()%>" />
							<c:set var="beginDt" value="${event.e_Start }" />
							<c:set var="finishDt" value="${event.e_End }" />
	
							<fmt:formatDate var="now" type="date" value="${today}" pattern="yyyy.MM.dd" />
							<fmt:formatDate var="_from" type="date" value="${beginDt}" pattern="yyyy.MM.dd" />
							<fmt:formatDate var="_to" type="date" value="${finishDt}" pattern="yyyy.MM.dd" />
								<c:choose>
									<c:when test="${now ge _from && now le _to}"><h3>[진행중] ${event.e_Title }</h3></c:when>
									<c:otherwise><h3><span style="color: red;">[종료]</span> ${event.e_Title }</h3></c:otherwise>
								</c:choose>
						</div>
			     	   	</td>
			     	 </tr>
			     	 <tr> 
			     	   <td>
			     	      <span class="view_info_idip"><i id="td_icon" class="fa fa-user-o" aria-hidden="true"></i><strong>${event.nick } &nbsp;&nbsp;</strong></span> 
							<span class="view_info_day"><i id="td_icon" class="fa fa-calendar-check-o" aria-hidden="true"></i>${event.e_Date} &nbsp;&nbsp;</span> 
							<span class="view_info_hits"><i id="td_icon" class="fa fa-eye" aria-hidden="true" style="margin-right: 3px;"></i> ${event.e_Count }</span>
			     	   </td>   	
			     	 </tr>
			     	  <tr>
			     	     <td style="font-size: 17px;">
			     	        [이벤트 기간] : ~ ${event.e_End }
			     	     </td>
			     	 </tr>
			     	 <tr>
			     	    <td>
			     	       <div class="seem_cont">
								<div style="margin: 10px 0 10px 0">
									<c:forEach items="${board_file }" var="e" varStatus="vs">
										<img
											src="${pageContext.request.contextPath}/resources/eventUpload/${e.f_Cname}"
											alt="" class="img-fluid" style="width: 100%; height: 100%;">
									</c:forEach>
								</div>
							</div>
			     	    </td>
			     	 </tr>			 
			     	 <tr>
			  	         <td style="height: 350px;">
			  	            <textarea id="dt_content" class="form-control" name="co_Content" readonly required style="font-size: 17px;">${event.e_Content }</textarea>
			  	         </td>
			  	      </tr>
			  	    </table>
			          <br>
		
						<div>
							<button class="btn btn-primary" id="btn-back" type="button" onclick="location.href='${pageContext.request.contextPath}/event/eventList.do'">목록으로</button>
							<c:if test="${member.m_Id eq 'admin'}">
								<button class="btn btn-primary" id="btnSave" type="button" style="float:right;"onclick="location.href='${pageContext.request.contextPath}/event/updateEventView.do?e_No=${event.e_No}'">수정</button>
								<button class="btn btn-primary" id="btnReset" type="button" onclick="location.href='${pageContext.request.contextPath}/event/deleteEvent.do?e_No=${event.e_No}'">삭제</button>
							</c:if>
						</div>
					</div>
					<!-- end page-wrapper -->
				</div>
				<!-- end col -->
			</div>
			<!-- end row -->
	</section>
	<c:import url="../common/footer.jsp" />
</body>
</html>

</body>
</html>