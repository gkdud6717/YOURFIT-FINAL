<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery.min.js"></script>
<html>
<head>
   <meta charset="UTF-8">
   <title>Your_Fit</title>
   
<style>

   @font-face {
    font-family: 'InfinitySans-RegularA1';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/InfinitySans-RegularA1.woff') format('woff');
    font-weight: normal;
    font-style: normal;
    }
    
   body, h2, p, a {
    font-family: 'InfinitySans-RegularA1';
   }
   
   .no_btn {position: absolute; right: 14px; top: 3px;}
   
  /* .link-widget {border: 1px solid grey;}*/
  
  .section {border-top: 1px dashed #dadada;}
  
  .card {border:none!important; margin-bottom: 30px; width: 360px!important;}
  
  .card-body > h4, a, p {text-align: center;} 
  .card-body > h4 {margin-top: 10px;}
  .card-body > p {font-size: medium;}
  
  .widget_d {margin-left: 20px; border: 1px solid white; background-color: #f8e9e2;}
  
  #diet {text-align:left; color:black; font-family: 'InfinitySans-RegularA1'; margin: 0;}
  
   .carousel-indicators > li { box-shadow : 2px 2px 2px 2px #a2a2a2; }
  
</style>

</head>

<body>
      <c:import url="common/header.jsp"/>


        <section class="section" style="padding-top: 40px;">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding: 0;">
                
                        <div class="row">
                            <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
     
                                 <div class="blog-box">
                                  <div class="single-post-media">
                                     <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                                         <div class="carousel-inner" role="listbox">
                                         	<div class="carousel-item active">
                                                 <img class="d-block img-fluid" src="${pageContext.request.contextPath}/resources/images/main1.png" alt="First slide" style="width: 750px; height: 430px;">
                                             </div>
                                         	<c:forEach items="${adlist}" var="ad" varStatus="vs">
                                             <div class="carousel-item">
                                             	<a id="ad_move" onclick="move_ad('${ad.ad_No}')">
                                               		<img class="d-block img-fluid" src="${pageContext.request.contextPath}/resources/adboardUpload/${ad.files[0].f_Cname}" style="width: 750px; height: 430px;">
                                                </a>
                                             </div>
                                             </c:forEach>
                                         </div>
                                         <ol class="carousel-indicators">
                                             <li data-target="#carouselExampleControls" data-slide-to="0" class="active"></li>
                                         	 <c:forEach items="${adlist}" var="ad" varStatus="vs">
                                             	<li data-target="#carouselExampleControls" data-slide-to="${vs.count}"></li>
                                             </c:forEach>
                                         </ol>
                                     </div>
                                 </div><!-- end post-media -->
  
                                <hr class="invis">
                            </div><!-- end col -->                             
                           
                    <div class="row">
                     <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                        <div class="widget">
                            <h2 class="widget-title" style="margin-left: 30px; font-family: 'InfinitySans-RegularA1';">오늘의 베스트</h2>
                            <div class="no_btn">
                                <a href="${pageContext.request.contextPath}/dtboard/dtBoardList.do">
                                    <i class="fa fa-plus-square-o" aria-hidden="true" style="font-size: xx-large;"></i>
                                </a>
                            </div>
                            
                            <div class="link-widget">
                                <ul>
                                  <c:forEach items="${dlist}" var="d" varStatus="vs">
                                    <input type="hidden" name="dt_no" value="${d.dt_No}" readonly>
                                    <li style="text-align:left;"><a href="${pageContext.request.contextPath}/dtboard/dtBoardView.do?no=${d.dt_No}">${d.dt_Title} <span>(${d.dt_Count})&nbsp;</span></a></li>
                                   </c:forEach>
                                </ul>
                            </div><!-- end link-widget -->
                        </div><!-- end widget -->
                    </div><!-- end col -->
                    
                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                        <div class="widget">
                            <h2 class="widget-title" style="margin-left: 30px; font-family: 'InfinitySans-RegularA1';">오늘의 추천영상</h2>
                             <div class="no_btn">
                                <a href="${pageContext.request.contextPath}/HomeTraining/htList.do">
                                    <i class="fa fa-plus-square-o" aria-hidden="true" style="font-size: xx-large;"></i>
                                </a>
                            </div>
                    
                            <div class="link-widget">
                                <ul>
                                    <c:forEach items="${hlist}" var="h" varStatus="vs">   
                                    <input type="hidden" name="ht_no" value="${h.ht_No}" readonly>      
                                    <li style="text-align:left;"><a href="${pageContext.request.contextPath}/HomeTraining/boardView.do?no=${h.ht_No}">[${h.ht_Type}] ${h.ht_Title} <span>(${h.ht_Count})&nbsp;</span></a></li>
                                   </c:forEach>
                                </ul>
                            </div><!-- end link-widget -->
                        </div><!-- end widget -->
                    </div><!-- end col -->
                  </div>      
                            
                </div><!-- end row -->
                    

                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                      
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12" style="padding-right: 0;">
                                <div class="blog-box">
                                    <div class="post-media">
                                        <a href="${pageContext.request.contextPath}/diet/bmi.do" title="">
                                            <img src="${pageContext.request.contextPath}/resources/images/BMI.png" alt="" class="img-fluid">
                                        </a>          
                                    </div><!-- end media -->                                   
                                </div><!-- end blog-box -->
                             </div><!-- end col -->

                                <hr class="invis">
                            
                             <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12" style="padding-left: 0;">
                                <div class="blog-box">
                                    <div class="post-media">
                                        <a href="${pageContext.request.contextPath}/calorie/calorie_detail.do" title="칼로리처방">
                                            <img src="${pageContext.request.contextPath}/resources/images/CAL.png" alt="" class="img-fluid">                                           
                                        </a>
                                    </div><!-- end media -->
                                </div><!-- end blog-box -->
                            </div><!-- end col -->
                            
                            <hr class="invis">
                         
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-top: 15px;">
                        <div class="widget">
                            <h2 class="widget-title" style="margin-left: 30px; font-family: 'InfinitySans-RegularA1';">NOTICE</h2>
                            <div class="no_btn">
                                <a href="${pageContext.request.contextPath}/notice/notice_list.do">
                                    <i class="fa fa-plus-square-o" aria-hidden="true" style="font-size: xx-large;"></i>
                                </a>
                            </div>
                            <div class="link-widget">
                              
                                <ul>
                                  <c:forEach items="${list}" var="n">
                                   <input type="hidden" name="n_no" value="${n.n_no}" readonly>
                                   <input type="hidden" name="n_date" value="${n.n_date}" readonly>
                                    <li style="text-align:left;"><a href="${pageContext.request.contextPath}/notice/notice_detail.do?n_no=${n.n_no}">${n.n_title}<span>(${n.n_count})&nbsp;</span></a></li>
                                  </c:forEach>
                                 
                                </ul>
                            </div><!-- end link-widget -->
                        </div><!-- end widget -->
                    </div><!-- end col -->
                    
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-top:95px;">
                        <div class="widget_d">
                           <h3 class="widget-title" style="margin-left: 30px; margin-top: 10px; font-family: 'InfinitySans-RegularA1';">Top5 Dieters </h3>
                          <div class="row">
                            <div class="col-md-6">                        
                                <div style="margin-left: 40px; margin-bottom: 20px;">
                                   <c:forEach items="${mlist}" var="m" varStatus="vs">         
                                    <p id="diet">[${vs.count}위] &nbsp;&nbsp; ${m.m_Nick } </p>
                                   </c:forEach>
                                </div>
                            </div><!-- end link-widget -->
                            <div class="col-md-6" style="padding: 0; padding-bottom: 20px;">
                                 <img src="${pageContext.request.contextPath}/resources/images/2nd.png" style="width: 135px; height: 130px;">
                            </div>
                            </div>
                        </div><!-- end widget -->
                    </div><!-- end col -->
                    
                   </div><!-- end row -->
                   
               </div><!-- end col -->
           </div><!-- end row -->
           </div><!-- end col -->
          </div>


                <hr class="invis" style="color: #f8e9e2; font-size: large;">
                <hr class="invis1">

                <div class="row">
           <div class="product-list-content">
            <!-- 카드뷰 -->
            <div class="product-card">
               <div class="row">
                   <c:forEach items="${plist}" var="p" >
                     <div class="pcard" style="margin: auto;">
                        <div class="col" style="">
                           <div class="card">
                                 <c:if test="${ ! empty p.files }">
                                    <a href="${pageContext.request.contextPath}/product/productView.do?no=${p.p_No}" style="width: 360px!important;">
                                       <img src="${pageContext.request.contextPath}/resources/productUpload/${p.files[0].i_ChangeName}"
                                       
                                          class="card-img-top" alt="대표이미지" width="360" height="300">
                                 </a>
                                 </c:if> 
                                 <c:if test="${ empty p.files }">
                                        사진 없음	
                                 </c:if>
                              </a>
                              <div class="card-body">
                                 <h4><a href="${pageContext.request.contextPath}/product/productView.do?no=${p.p_No}" title="">${p.p_Name }</a></h4>
                                <p>
                                <a href="${pageContext.request.contextPath}/product/productView.do?no=${p.p_No}">
                                	<fmt:formatNumber value="${p.p_Price}" pattern="###,###,###"/>원 &nbsp; <i id="td_icon" class="fa fa-eye" aria-hidden="true"></i> ${p.p_Count }</a>
                                </p>      
                              </div>
                           </div>
                        </div>
                     </div>

                  </c:forEach>
               </div>
            </div>
         </div>
         
   
                </div>
              </div> 
             </div>
           </div><!-- end container -->
        </section>

        

        <div class="dmtop">Scroll to Top</div>
        
    </div><!-- end wrapper -->
    
    <c:import url="common/footer.jsp"/>

    <!-- Core JavaScript
    ================================================== -->
    <script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
    <script src="<c:url value="/resources/js/tether.min.js"/>"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
    <script src="<c:url value="/resources/js/custom.js"/>"></script>
    
     <script>
   function move_ad(ad_No){
      url = "${pageContext.request.contextPath}/adboard/adBoardView.do?"+ad_No;

      window.open(url,'_blank');
   }
   </script>

</body>
</html>