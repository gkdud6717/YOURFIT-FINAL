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
<title>커뮤니티 목록</title>
<link href="${pageContext.request.contextPath}/resources/css/list_default.css" rel="stylesheet">

</head>
<body>
      <c:import url="../common/header.jsp"/>
      
        <section class="page-title wb">
	      <div class="container">
	        
			<div class="row">
			 <div class="col-lg-7 col-md-7">
                <h2 class="co-category" style="margin-left: 10px; margin-top: 10px;">
                <i id="icon" class="fa fa-comments-o" aria-hidden="true" style="margin-bottom: 3px;"></i>커뮤니티</h2>
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
            
				<table id="tbl-board" class="table table table-hover">
					<tr>
						<th>게시판</th>
						<th>제목</th>
						<th>작성자</th>
						<th>조회수</th>
						<th>작성일</th>
					</tr>
					<c:forEach items="${list}" var="co"> 
					<tr id="${co.co_No}">
						<td>[${co.co_Type}]</td>
						<td>${co.co_Title} (${co.commentcount})</td>
						<td>${co.nick}</td>
						<td>${co.co_Count}</td>
						<td>${co.co_Date }</td>
					</tr>
					</c:forEach>
				</table>
				<br>
				
				<c:out value="${pageBar}" escapeXml="false"/>
			 <c:if test="${member ne null}">
				<input type="button" value="글쓰기" id="btn-add" class="btn btn-outline-success" onclick="fn_goBoardForm();"/> 
				</c:if>
	
	     </div>
	   </section>
	 
	  <div class="dmtop">Scroll to Top</div>
	 
	 <c:import url="../common/footer.jsp"/>
	 
	 <script>
	       document.getElementById("searchBtn").onclick = function(){
		    
		   var searchType = document.getElementsByName("searchType")[0].value;
		   var keyword =  document.getElementsByName("keyword")[0].value;
						
		    console.log(searchType)
		    console.log(keyword)
						
	        location.href = "${pageContext.request.contextPath}/board/boardSearch.do?searchType=" + searchType + "&keyword=" + keyword;
		 };

	 
		function fn_goBoardForm(){
			location.href = "${pageContext.request.contextPath}/board/coboardForm.do";
		}
		
		$(function(){
			$("tr[id]").on("click",function(){
				var co_No = $(this).attr("id");
				location.href = "${pageContext.request.contextPath}/board/boardView.do?no="+co_No;
			});
		});
	</script>
	
</body>
</html>