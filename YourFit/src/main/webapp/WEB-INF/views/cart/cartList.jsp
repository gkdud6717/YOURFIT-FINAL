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
<title>장바구니 목록</title>
<link href="${pageContext.request.contextPath}/resources/css/list_default.css" rel="stylesheet">
<style>
p, button {font-family: 'InfinitySans-RegularA1'!important; margin: 0px;}
 tr, th, td { border: none; }
 tr:hover {
 	background: white;
 }
.td {
	height: 100px;
	line-height: 100px;
}
th {
	border-bottom: 2px solid #d9d9d9;
}
.table {
border-top: 2px solid #d9d9d9;
}
#delete-btn {
	margin-top: 30px; 
	width: 100px;
	height: 40px;
	background: #f8e9e2;
	border: 1px solid rgba(92, 92, 92,0.2);
	border-radius: 15px;
}
#delete-btn:hover, #buy-btn:hover {
	box-shadow: 2px 4px 4px 3px rgba(227, 134, 118,0.2);
	cursor: pointer;
	transition: 0.4s;
	border: 2px solid #e0c7bf;
}

.result {
	font-size: 15pt;
	margin: 20px auto;
	border: 7px solid #f8e9e2;
	padding: 40px;
}

.result>div {
	display: inline-block;
	margin: 0px 50px;
}

#buy-btn {
	margin-top: 30px; 
	width: 200px;
	height: 60px;
	background: #f8e9e2;
	border: 1px solid rgba(92, 92, 92,0.2);
	border-radius: 5px;
	font-size: 15pt;
}
.span-color {
	color: #d64747;
}
</style>
</head>
<body>
      <c:import url="../common/header.jsp"/>
      
        <section class="page-title wb">
	      <div class="container">
	        
			<div class="row">
			 <div class="col-lg-7 col-md-7">
                <h2 class="co-category" style="margin-left: 10px; margin-top: 10px;">
                <i id="icon" class="fa fa-shopping-basket" aria-hidden="true" style="margin-bottom: 3px;"></i> 장바구니</h2>
             </div><!-- end col -->
            
           
			</div>
		    <br>
            
				<table id="tbl-board" class="table">
					<tr>
						<th style="width: 10%;">상품</th>
						<th style="width: 40%;">상품명</th>
						<th>가격</th>
						<th>수량</th>
						<th>합계</th>
						<th>삭제</th>
					</tr>
					<c:forEach items="${cartlist}" var="cl"> 
					<tr id="${cl.c_No}">
						<td class="td" style=" padding: 14px;">
							<a href="${pageContext.request.contextPath}/product/productView.do?no=${cl.c_Pno}">
								<img src="${pageContext.request.contextPath}/resources/productUpload/${cl.files[0].i_ChangeName}" alt="" width="100" height="100" />					
							</a>
						</td>
						<td class="td" style="text-align: left; padding-left: 40px;">${cl.p_Name}</td>
						<td class="td"><fmt:formatNumber type="number" maxFractionDigits="3" value="${cl.c_Price}" /> 원</td>
						<td class="td">${cl.c_Amount}</td>
						<td class="td"><fmt:formatNumber type="number" maxFractionDigits="3" value="${cl.c_Price * cl.c_Amount }"/> 원</td>
					
						<td class="delete-group">
						<input type="hidden" value="${cl.c_No}" readonly />
						<button id="delete-btn" onclick="cartdelete(this);">삭제</button>
						</td>
					</c:forEach>
					<tr>
						<td colspan="6" style="border-top: 2px solid #d9d9d9;">
							<div class="result-group">
								<div style="text-align: right; font-size: 14pt; margin-right: 10px;">주문한 상품 갯수 : ${count} 개</div>
								<div class="result">
									<div>
										총 주문 금액 <br><br> <fmt:formatNumber type="number" maxFractionDigits="3" value="${sumMoney}" /> 원
									</div>
									<div>+</div>
									<div>
										배송비 <br><br> 0 원
									</div>
									<div>=</div>
									<div>
										<span class="span-color">결제 예상 금액</span> <br><br> <fmt:formatNumber type="number" maxFractionDigits="3" value="${sumMoney}" /><span class="span-color"> 원</span> 
									</div>
								</div>
								<div><button id="buy-btn"  onclick="location.href='${pageContext.request.contextPath}/cart/productbuypage.do?o_Mno=${ member.m_No }'">구매하러 가기</button></div>
							</div>
						</td>
					</tr>
					
				</table>
				<br>
				
		<script>
		

		function cartdelete(obj) {
            var c_No = $(obj).siblings('input').val();
            var c_Mno = ${member.m_No};    // 세션에서 멤버 no가져와야함
          
            alert("삭제가 완료되었습니다!");
            location.href = "${pageContext.request.contextPath}/cart/cartDelete.do?c_No="+c_No+"&c_Mno="+ c_Mno;
         };
		</script>
	
	     </div>
	   </section>
	 
	 <c:import url="../common/footer.jsp"/>
	 
	<!--  <script>
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
	</script> -->
	
</body>
</html>