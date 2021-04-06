<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<head>
<title>다이어트 꿀팁(전체)</title>  
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script> 
<link href="${pageContext.request.contextPath}/resources/css/DtList.css" rel="stylesheet">
<style>
	#con_box{
		 overflow: hidden;
		 text-overflow: ellipsis;
		  
	}
</style>
</head>
<body>
    <c:import url="../common/header.jsp"/>

        <section class="page-title wb">
            <div class="container">
              <div class="row">
                <div class="col-lg-7 col-md-7">
                <h2 class="dt-category" style="margin-left: 10px; margin-top: 10px;">
                <i id="icon" class="fa fa-thumbs-o-up" aria-hidden="true"></i>다이어트 꿀팁</h2>
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
				    <script>
			      function fn_goBoardForm(){
			         location.href = "${pageContext.request.contextPath}/dtboard/dtBoardForm.do";
			      }
			
			      document.getElementById("searchBtn").onclick = function(){
			  	    
					  var searchType = document.getElementsByName("searchType")[0].value;
					  var keyword =  document.getElementsByName("keyword")[0].value;
					
					   console.log(searchType)
					   console.log(keyword)
					
					   location.href = "${pageContext.request.contextPath}/dtboard/dtBoardSearch.do?searchType=" + searchType + "&keyword=" + keyword;
					};
			
			   </script>
				</form>
			  </div>
			</div>
		    <br>
		    <hr style="background-color: #f8e9e2; height: 3px;">
		         <div class="page-wrapper">
                            <div class="blog-list clearfix">
                       		<c:forEach items="${list}" var="b"> 
                                <div class="blog-box row">
                                    <div class="col-md-5">
                                        <div class="post-media">
                                            <a href="${pageContext.request.contextPath}/dtboard/dtBoardView.do?no=${b.dt_No}" title="">
                                                <c:if test="${ ! empty b.files }">	
                                                <img src="${pageContext.request.contextPath}/resources/dtboardUpload/${b.files[0].f_Cname}" id="img_dt" >
                                              </c:if>
											  <c:if test="${ empty b.files }">
												  <img src="${pageContext.request.contextPath}/resources/images/no_image.png" id="img_dt">
											  </c:if>
											 
                                                <div class="hovereffect"></div>
                                            </a>
                                        </div><!-- end media -->
                                     
                                  </div><!-- end col -->
                                     <div class="col-md-7">
                                        <h3><a href="${pageContext.request.contextPath}/dtboard/dtBoardView.do?no=${b.dt_No}" title="">${b.dt_Title}</a></h3>
                                       <div id="con_box">
                                         <p><a href="${pageContext.request.contextPath}/dtboard/dtBoardView.do?no=${b.dt_No}" title="">${b.dt_Content}</a></p>                                    
                                       </div>
                                       <div style="margin-top: 8px;">
                                         <p>${b.dt_Type}</p><img src="${pageContext.request.contextPath}/resources/images/bar.PNG">
                                         <p>by ${b.nick}</p><img src="${pageContext.request.contextPath}/resources/images/bar.PNG">
                                         <p><i id="td_icon" class="fa fa-eye"></i>  ${b.dt_Count }</a></p>
                                      </div>
                                   </div>
                                </div><!-- end blog-box -->
                                <hr class="invis">
								</c:forEach>
                            </div>
                        </div>     
                    <br>
					<c:out value="${pageBar}" escapeXml="false" /> 
					<input type="button" value="글쓰기" id="btn-add" class="btn btn-outline-success" onclick="fn_goBoardForm();"/>
               </div>
            </section>

        <div class="dmtop">Scroll to Top</div>
        
    <c:import url="../common/footer.jsp"/>

   <!-- Core JavaScript
    ================================================== -->
    <script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
    <script src="<c:url value="/resources/js/tether.min.js"/>"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
    <script src="<c:url value="/resources/js/custom.js"/>"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
   
    
</body>
</html>