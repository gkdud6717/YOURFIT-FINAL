<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
<link href="${pageContext.request.contextPath}/resources/css/list_default.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>

</head>

<body>
     <c:import url="../common/header.jsp"/>
     
     <section class="page-title wb">
	      <div class="container">
	        <div class="row">
			 <div class="col-lg-7 col-md-7">
                <h2 class="no-category" style="margin-left: 10px; margin-top: 10px;">
                <i id="icon" class="fa fa-list-alt" aria-hidden="true"></i>공지사항</h2>
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
       
                <!-- table -->               
                     <table id="tbl-board" class="table table table-hover">
                       <tr>
						   <th>번호</th>
						   <th>제목</th>
						   <th>작성자</th>
						   <th>작성일</th>
					   </tr> 
					   <c:forEach items="${list}" var="n">
					   <tr id="${n.n_no}">
					      <td>${n.n_no}</td>
					      <td><a href="${pageContext.request.contextPath}/notice/notice_detail.do?n_no=${n.n_no}">${n.n_title}</td>
					      <td readonly><!--  ${n.n_mno} ${member.m_Nick} -->관리자</td>
					      <td>${n.n_date}</td>
					   </tr>
					   </c:forEach>
					  </table>
					  
					  <br>
			   <c:out value="${pageBar}" escapeXml="false"/>
			   
               <c:if test="${member.m_Id eq 'admin'}">
				  <input type="button" value="글쓰기" id="btn-add" class="btn btn-outline-success" onclick="fn_goNoticeForm();"/>
			   </c:if>
		     </div>
         </section>
      
      <c:import url="../common/footer.jsp"/>
      
      <script>
      
     $(function(){
      $("tr[id]").on("click",function(){
           var n_no = $(this).attr("id");
           console.log("noticeNo"+n_no);
           location.href = "${pageContext.request.contextPath}/notice/notice_detail.do?no="+n_no;
          });
      });

 	     document.getElementById("searchBtn").onclick = function(){
	    
		 var searchType = document.getElementsByName("searchType")[0].value;
		 var keyword =  document.getElementsByName("keyword")[0].value;
						
		 console.log(searchType)
		 console.log(keyword)
	   					
	     location.href = "${pageContext.request.contextPath}/notice/notice_search.do?searchType=" + searchType + "&keyword=" + keyword;
	  };

	  function fn_goNoticeForm(){
	         location.href = "${pageContext.request.contextPath}/notice/notice_form.do";
	      
	      }

      </script>
      <!-- Core JavaScript
    ================================================== -->
    <script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
    <script src="<c:url value="/resources/js/tether.min.js"/>"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
    <script src="<c:url value="/resources/js/custom.js"/>"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>

</body>
</html>