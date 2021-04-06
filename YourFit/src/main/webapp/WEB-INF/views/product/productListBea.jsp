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
<title>SHOP_Beauty</title>
</head>
<style>
.img-fluid {
   width: auto;
   height: auto;
   max-width: 100px;
   max-height: 100px;
}

.category {
   text-align: center;
   margin: 50px 0px;
}

.menuCategory {
   padding: 10px 30px;
   display: inline-block;
   border: 1px solid #d1d1d1;
   margin: 0px 4px;
   font-size: 13pt;
}

.menuCategory:hover {
   background: #f8e9e2;
   color: #2e2e2e;
   transition: 1s;
   
}

.content, h1, h2, h3, h4, h5, span, p, #card-text, li, .menuCategory, #add-product, select, button {
   font-family: 'InfinitySans-RegularA1'!important;
}

.card {   
   border: none!important;
}

/* card-view */

.product-card {
   padding: 30px 0;
}

.product-card h3 a {
    position: absolute;
    font-weight: 400;
    font-size: 14px;
    right: 30px;
    padding: 10px;

}

.product-card .pcard {
   cursor: pointer;
    padding: 0;
    margin: 0 15px;
    flex-grow: 0;
}

.product-card .card {
   text-align: center;
   color: #4A5059;
   width: 300px;
   margin: 0 auto 30px auto;
}
.card-body {
   margin: 5px auto;
}
.product-card .card .card-body h5 {
   text-overflow: ellipsis;
    white-space: nowrap;
    width: 198px;
    overflow: hidden;
}

.product-card .card .card-body h5, p{
   margin-bottom: 0;   
}
.card-text {
   margin-top: 0px;
   margin-bottom: 0px;
}

.menuCategory, .product-list-content  {
   animation: fadein 2s;
   -moz-animation: fadein 2s;
   /* Firefox */
   -webkit-animation: fadein 2s;
   /* Safari and Chrome */
   -o-animation: fadein 2s;
   /* Opera */
}
 
@keyframes fadein {
from { opacity: 0; }
to { opacity: 1; }
} 
@-moz-keyframes fadein {
/* Firefox */
from { opacity: 0; }
to { opacity: 1; }
} 
@-webkit-keyframes fadein {
/* Safari and Chrome */
from { opacity: 0; }
to { opacity: 1; }
} 
@-o-keyframes fadein {
/* Opera */
from { opacity: 0; }
to { opacity: 1; }
}

.slide-right {
   overflow: hidden;
}
.slide-right h2 {
   animation: 2s slide-right;
   font-size: 24pt;
}
@keyframes slide-right {
    from {
       margin-left: -200px;
    }
    to {
       margin-left: 0%;
    }
 }
 .slide-right, .add-product, .search {
    display: inline-block;
 }
 
.search,  .add-product {
   margin-top: 10px;
    float:right;
 }
 
 .search {
    margin-left: 15px;
       
 }
 
 #add-product, #searchBtn {
   background: #f8e9e2;
   color: #2e2e2e;
 }
 #searchBtn {
    border: none;
    width: 50px;
   height: 50px;
 }
</style>
<script>
   function fn_productForm() {
      location.href = "${pageContext.request.contextPath}/product/productForm.do";
   }
</script>
<body>
   <c:import url="../common/header.jsp" />
   <div class="container">
      <hr />
      <div class="title-group">
         <div class="slide-right">
             <h2 class="shop" style="margin-left: 10px; margin-top: 10px;">
                      <i id="icon" class="fa fa-shopping-basket" aria-hidden="true" style="margin-right: 15px;"></i>SHOP</h2>
           </div>
          
           <div class="search">
           <form class="orm-inline search-form">

                <select name="searchType" id="searchType" style="height: 40px">
                    <option value="title_content">전체</option>      
                    <option value="title">제목</option>      
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

                  location.href = "${pageContext.request.contextPath}/board/boardSearch.do?searchType="
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
                  <c:forEach items="${list}" var="p">
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
                              <div class="card-body">
                                 <h5>[무료배송] ${p.p_Name} </h5>
                                 <p style="margin: 0px">${p.p_Content}</p>
                                 <p>${p.p_Price}원</p>
                              </div>
                           </div>
                        </div>
                     </div>

                  </c:forEach>
               </div>
            </div>
         </div>
         <c:out value="${pageBar}" escapeXml="false" />

         
         </script>
      </div>

   </div>
   <br>
   <br>
   <br>
   <c:import url="../common/footer.jsp" />
</body>
</html>