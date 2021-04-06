<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/co_detail.css" rel="stylesheet">
<html>
<head>
<meta charset="UTF-8">
<title>광고 상세보기</title>	
	
</head>
<body>

	 <c:import url="../common/header.jsp"/>
   
        <section class="section wb">
            <div class="container">
                <div class="row">
                   <div class="col-lg-1 col-md-1"></div>
           
                   <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12" style="padding: 0px;">
                    <div class="page-wrapper">
                     <h3 class="content"><i class="fa fa-file-text-o" aria-hidden="true" style="margin-right: 10px;"></i>다이어트 꿀팁</h3>

                   <table class="tableDetail">
                     <tr>
			     	   	<td style="background-color:#e4efeb; color:#333;">
			     	   	   <h4 id="h4">${adboard.ad_Title}</h4>
			     	   	</td>
			     	 </tr>
			     	 <tr>
			     	   	<td>
			     	   	  <i id="td_icon" class="fa fa-user-o" aria-hidden="true"></i>${member.m_Nick } &nbsp;&nbsp;
			     	   	  <i id="td_icon" class="fa fa-eye" aria-hidden="true"></i>${adboard.ad_Count } &nbsp;&nbsp;
			     	   	  <i id="td_icon" class="fa fa-clock-o" aria-hidden="true"></i>${adboard.ad_Date } 까지&nbsp;&nbsp;
			  	    	</td>						
			  	      </tr>  
			  	      <tr>
			  	         <td>
			  	            <div class="single-post-media" style="height: 500px;">
			  	              <a>
                              <c:forEach items="${boardfileList }" var="a" varStatus="vs">
                            	<c:if test="${ ! empty a.f_Cname }">
                                  <img src="${pageContext.request.contextPath}/resources/adboardUpload/${a.f_Cname}" class="img-fluid" style="height:100%; width:100%; object-fit: contain;">
                                </c:if>
							    <c:if test="${ empty a.f_Cname }">
								  <img src="${pageContext.request.contextPath}/resources/images/no_image.png" id="img_dt">
							    </c:if>
							   </c:forEach>
                            </div><!-- end media -->
                            </a>
			  	         </td>
			  	      </tr>
			  	      <tr>
			  	      	<td>
			  	      		${adboard.ad_Content }
			  	      	</td>
			  	      </tr>
			  	    </table>
                       
                    <br>
                    <div class="col-12" style="text-align: right;">
					<c:if test="${member.m_No eq adboard.ad_Mno }">
						<button class="btn btn-outline-info" type="button" id="btnSave" onclick="location.href='${pageContext.request.contextPath}/adboard/adBoardUpdateView.do?${adboard.ad_No}'">수정</button>
					</c:if>        
					</div>

                    </div>
                    
		      </div>
           </div>
         </div>
      </section>
      
       <div class="dmtop">Scroll to Top</div>
      
  <c:import url="../common/footer.jsp"/>

</body>
</html>