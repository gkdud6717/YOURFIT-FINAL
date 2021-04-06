<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
<head>
<title>이벤트 리스트</title>
<link href="${pageContext.request.contextPath}/resources/css/DtList.css"
	rel="stylesheet">
<style>
#searchBtn, #searchType {
	font-family: 'InfinitySans-RegularA1';
	
}
.event_cont>div {
	display: inline-block;
	text-align: left;
}

.board_img {
	width: 480px;
	height: 230px;
}

.js_image_load {
	box-shadow: 1px 1px 3px 2px #e3e3e3;
}

.js_image_load:hover {
	-webkit-transform: scale(1.1); /*  크롬 */
	-moz-transform: scale(1.1); /* FireFox */
	-o-transform: scale(1.1); /* Opera */
	transform: scale(1.1);
	transition: transform .35s;
	-o-transition: transform .35s;
	-moz-transition: transform .35s;
	-webkit-transition: transform .35s;
}
.btn-group {
	float: right;
}
.title {
	display: inline-block;
}

#icon {font-size: 35px; margin-right: 5px!important;}
</style>
<script>
	function insertEvent() {
		location.href = "${pageContext.request.contextPath}/event/insertEventForm.do";
	}
</script>
</head>
<body>
	<c:import url="../common/header.jsp" />

	<section class="page-title wb">
		<div class="container">
			<div class="row">
				<div class="col-lg-7 col-md-7" id="slide-right">
					<h2 class="title"
						style="margin-left: 10px; margin-top: 10px; margin-bottom: 10px;">
						<i id="icon" class="fa fa-calendar"></i>EVENT</h2>
					
				</div>
				
				<div class="col-lg-5 col-md-5"  style="text-align: right;">
                <form class="orm-inline search-form">
				    <select name="searchType" id="searchType">
				        <option value="title_content">전체</option>		
				        <option value="title">제목</option>		
				        <option value="content">내용</option>
				    </select>
				    <input name="keyword" id="keyword" style="width: 60%;">
				   <button type="button" id="searchBtn">조회</button>
				</form>
			  </div>
			</div>
	        <br>
			 <hr style="background-color: #f8e9e2; height: 3px; margin-top: 6px!important;">
               <div class="page-wrapper">  
			   <div class="event_list" style="width: 100%">

				<c:forEach items="${list}" var="event">
				
					<div class="event_cont">
						<div class="board_img">
							<a
								href="${pageContext.request.contextPath}/event/eventView.do?e_No=${event.e_No}">
								<img
								src="${pageContext.request.contextPath}/resources/eventUpload/${event.files[0].f_Cname}"
								width="450" height="200" class="js_image_load" />
							</a>
						</div>
						<div class="event_info_cont">

							<div class="board_title">
								<c:set var="today" value="<%=new java.util.Date()%>" />
								<c:set var="beginDt" value="${event.e_Start }" />
								<c:set var="finishDt" value="${event.e_End }" />

								<fmt:formatDate var="now" type="date" value="${today}"
									pattern="yyyy.MM.dd" />
								<fmt:formatDate var="_from" type="date" value="${beginDt}"
									pattern="yyyy.MM.dd" />
								<fmt:formatDate var="_to" type="date" value="${finishDt}"
									pattern="yyyy.MM.dd" />


								<!-- Wed Jul 09 00:00:00 KST 2014 형태이므로 yyyy-MM-dd로 다시 변환 -->

								<c:choose>
									<c:when test="${now ge _from && now le _to}">
										<h3>[진행중] ${event.e_Title }</h3>
									</c:when>
									<c:otherwise>
										<h4>
											<span style="color: red;">[종료]</span> ${event.e_Title }
										</h4>
									</c:otherwise>
								</c:choose>
							</div>

							<div class="board_event_day" style="font-size: 18px;">
								<span><strong>이벤트기간</strong> ${event.e_Start} ~
									${event.e_End}</span>
							</div>
							<div class="board_likeit_hits">
								<span class="board_hits"><i id="td_icon" class="fa fa-eye"></i> ${event.e_Count}</span>
							</div>
						</div>
						<!-- //event_info_cont -->
					</div>
					<hr style="margin-top: 0">
				</c:forEach>
			</div>
		</div>
		<br>
	<c:out value="${pageBar}" escapeXml="false"/>
	<br>
	        <c:if test="${member.m_Id eq 'admin'}">
			   <div class="btn-group" style="float:left;">
				   <button class="btn btn-primary" id="btn-add" type="button" onclick="insertEvent();">이벤트 추가</button>
			   </div>
			</c:if>
	</section>

	<div class="dmtop">Scroll to Top</div>
     <br><br>

	<c:import url="../common/footer.jsp" />
	<!-- Core JavaScript
    ================================================== -->
    <script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
    <script src="<c:url value="/resources/js/tether.min.js"/>"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
    <script src="<c:url value="/resources/js/custom.js"/>"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
    <script>

          document.getElementById("searchBtn").onclick = function(){
	    
		  var searchType = document.getElementsByName("searchType")[0].value;
		  var keyword =  document.getElementsByName("keyword")[0].value;
		
		   console.log(searchType)
		   console.log(keyword)
		
		   location.href = "${pageContext.request.contextPath}/event/eventSearch.do?searchType=" + searchType + "&keyword=" + keyword;
		};
    </script>
</body>
</html>