<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<script src="${pageContext.request.contextPath }/resources/js/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/product_list.css" rel="stylesheet">
<html>
<head>
<meta charset="UTF-8">
<title>Your Fit SHOP</title>
</head>

<script>
   function fn_productForm() {
      location.href = "${pageContext.request.contextPath}/product/productForm.do";
   }
</script>
<body>
   <c:import url="../common/header.jsp" />
   
   <section class="page-title wb">
     <div class="container">

      <div class="title-group">
         <div class="slide-right">
             <h2 class="shop" style="margin-left: 10px; margin-top: 10px;">
                <i id="icon" class="fa fa-shopping-basket" aria-hidden="true"></i>SHOP</h2>
           </div>
          
           <div class="search">
           <form class="orm-inline search-form">

                <select name="searchType" id="searchType" style="height: 40px">
                    <option value="title_content">전체</option>      
                    <option value="title">상품명</option>      
                    <option value="content">내용</option>
                </select>
                <input name="keyword" id="keyword" style="width: 50%; height: 40px;">
               <button type="button" id="searchBtn"><i class="fa fa-search"></i></button>

            <!--   <input type="submit" id="searchBtn" value="조회"> -->
            <script>
               document.getElementById("searchBtn").onclick = function() {

                  var searchType = document
                        .getElementsByName("searchType")[0].value;
                  var keyword = document.getElementsByName("keyword")[0].value;

                  console.log(searchType)
                  console.log(keyword)

                  location.href = "${pageContext.request.contextPath}/product/productSearch.do?searchType="
                        + searchType + "&keyword=" + keyword;
               };
            </script>
         </form>
         
           
         </div>
          <c:if test="${member.m_Id eq 'admin'}">
             <div class="add-product">   
                 <input type="button" value="상품 추가" id="add-product"
                     class="btn btn-outline-success" onclick="fn_productForm();"/>
               </div>
          </c:if>
        </div>
      <div class="category">
         <a href="${pageContext.request.contextPath}/product/productList.do"><div class="menuCategory">All</div></a>
         <a href="${pageContext.request.contextPath}/product/productListLiv.do"><div class="menuCategory">Living</div></a>
         <a href="${pageContext.request.contextPath}/product/productListFh.do"><div class="menuCategory">Food/Health</div></a>
         <a href="${pageContext.request.contextPath}/product/productListBea.do"><div class="menuCategory">Beauty</div></a>
      </div>
      

      <div>
         <div class="product-list-content">
            <!-- 카드뷰 -->
            <div class="product-card">
               <div class="row">
                   <c:forEach items="${list}" var="p" >
                     <div class="pcard">
                        <div class="col">
                           <div class="card">
                                 <c:if test="${ ! empty p.files }">
                                    <a href="${pageContext.request.contextPath}/product/productView.do?no=${p.p_No}">
                                       <img src="${pageContext.request.contextPath}/resources/productUpload/${p.files[0].i_ChangeName}"
                                       
                                          class="card-img-top" alt="대표이미지" width="300" height="300">
                                 </a>
                                 </c:if> 
                                 <c:if test="${ empty p.files }">
                                        사진 없음
                                 </c:if>
                              </a>
                              <div >
                              <br>
                                 <h5>[무료배송] ${p.p_Name} </h5>
                                 <div style="padding: 0 20px">
                                   <p style="margin: 0px">${p.p_Content}</p>
                                 </div>
                                 <div clsss="card-body">
                                   <p>
                                     <a><fmt:formatNumber value="${p.p_Price}" pattern="###,###,###"/>원
                                	<i id="td_icon" class="fa fa-eye" aria-hidden="true"></i> ${p.p_Count }</a>
                                   </p>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>

                  </c:forEach>
               </div>
            </div>
         </div>
         <c:out value="${pageBar}" escapeXml="false" />
  
      </div>

   </div>
  </section>
  
   <c:import url="../common/footer.jsp" />
</body>
</html>