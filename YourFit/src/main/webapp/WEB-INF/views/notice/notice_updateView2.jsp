<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정화면</title>

<style>

#centered {display: table; margin-left: auto; margin-right: auto;}

th, td {color: black; border: 1px solid lightgrey; font-family: 'InfinitySans-RegularA1';}

th {background-color: #f8e9e2; text-align: center;}

</style>
</head>

<body>
     <c:import url="../common/header.jsp"/>
     
        <section class="section">
             <div class="container">
               
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                 <h2 id="centered" style="font-family: 'InfinitySans-RegularA1';">공지사항 목록</h2>
                 <hr style="margin-bottom: 30px; width: 80%; border-top: 4px solid #f8e9e2;">
       
                <!-- table -->
                 <div class="col-lg-10 col-md-10" style="display: table; margin-left: auto; margin-right: auto;">
                     <table class="table table-hover">
                       <tr>
						   <th>번호</th>
						   <th>제목</th>
						   <th>작성자</th>
						   <th>작성일</th>
					   </tr> 
					   
					   <tr id="${n.n_no}">
					      <td>${n.n_no}</td>
					      <td>${n.n_title}</td>
					      <td>${n.n_mno}</td>
					      <td>${n.n_date}</td>
					   </tr>
					   
					  </table>
					<c:out value="${pageBar}" escapeXml="false"/>
                    
                </div>
               </div>
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
     
      </script>

</body>
</html>