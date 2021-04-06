<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<script src="${pageContext.request.contextPath }/resources/js/jquery.min.js"></script>
<html>
<head>
<meta charset="UTF-8">
<title>홈트레이닝 목록</title>
<link href="${pageContext.request.contextPath}/resources/css/HtList.css" rel="stylesheet">


</head>
<body>

      <c:import url="../common/header.jsp"/>
      
        <section class="page-title wb">
	      <div class="container">
	
			<div class="row">
			 <div class="col-lg-7 col-md-7">
                <h2 class="ht-category" style="margin-left: 10px; margin-top: 10px;">
                <i id="icon" class="fa fa-youtube-play" aria-hidden="true"></i>홈트레이닝</h2>
             </div><!-- end col -->
            
             <div class="col-lg-5 col-md-5">
                <form class="orm-inline search-form" style="margin-left: 75px;">
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
			
				<div class="row">
				  <div class="col-md-12">
					<div class="gall-list01 clfix">
						<c:forEach items="${list}" var="ht"> 
						<li id="${ht.ht_No }">
							<div class="pic">
								<img src="https://img.youtube.com/vi/${ht.ht_Src}/0.jpg" alt="" style="width:100%; height:100%;"/>
								<span class="ico-play"></span>
							</div>
							<div class="tit">${ht.ht_Title} (${ht.commentcount})</div>
							<div class="tit2">${ht.ht_Part} <img src="${pageContext.request.contextPath}/resources/images/bar.PNG"><img src="${pageContext.request.contextPath}/resources/images/see.PNG"> ${ht.ht_Count} </div>
						</li>
					 	</c:forEach>
					</div>
				  </div>
				</div>
				<br><br>
			 <c:out value="${pageBar}" escapeXml="false"/>
			 <c:if test="${member.m_Id eq 'admin'}">
			  <input type="button" value="글쓰기" id="btn-add" class="btn btn-outline-success" onclick="fn_goBoardForm();"/> 
		     </c:if>
			</div>
	    </section> 
       
       <div class="dmtop">Scroll to Top</div>
	
	 <c:import url="../common/footer.jsp"/>
	 
	 	<script>
		function fn_goBoardForm(){
			location.href = "${pageContext.request.contextPath}/HomeTraining/htboardForm.do";
		}
		
		$(function(){
			$("li[id]").on("click",function(){
				var ht_No = $(this).attr("id");
				location.href = "${pageContext.request.contextPath}/HomeTraining/boardView.do?no="+ht_No;
			});
		});
		
		  document.getElementById("searchBtn").onclick = function(){
		    
			 var searchType = document.getElementsByName("searchType")[0].value;
			 var keyword =  document.getElementsByName("keyword")[0].value;
							
			console.log(searchType)
			 console.log(keyword)
							
		   location.href = "${pageContext.request.contextPath}/HomeTraining/boardSearch.do?searchType=" + searchType + "&keyword=" + keyword;
	    };

		
	</script>
</body>
</html>