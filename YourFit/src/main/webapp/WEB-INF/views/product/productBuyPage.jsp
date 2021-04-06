<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 내역 확인</title>
<style>
h2, input{font-family: 'InfinitySans-RegularA1'!important;}
.table1 th, .table2 th{
   text-align: center;
   height: 50px;
   background: #f8e9e2;
}
.table1 { margin-top: 10px; }
.btna input{
   	padding: 0 30px;
   	height: 50px;
   	font-size: 18px;
   	font-weight: 600;
 	background: #f8e9e2;
	border: 1px solid rgba(92, 92, 92,0.2);
   	border-radius: 25px;
   	margin: 10px; 
 }
.btna input:hover {
	box-shadow: 2px 4px 4px 3px rgba(227, 134, 118,0.2);
	cursor: pointer;
	transition: 0.4s;
	padding: 0 35px;
	border: 1px solid #e0c7bf;
}
.noo1 td input{
   border:none;
   height: 100px;
   text-align: center;
}
.noo1 {
	border: 1px solid #d1d1d1;
	margin-bottom: 10px;
	height: 150px;
}
.margin-tr { height: 20px; }
.product-img { margin: 20px; }
.content-title {
	display: inline-block;
	width: 60%;
	border-bottom : 5px solid #f8e9e2;
	padding-bottom: 40px;
}
.table1{width: 60%; text-align: center;}
.table2 {width: 50%; text-align: center;}
.table2 th { width: 200px;}
.table2 input {
	width: 90%;
	text-align: left;
	border:none;
    height: 70px;
}
.table2 tr {
	border-top: 1px solid #d1d1d1;
	border-bottom: 1px solid #f0f0f0;
}
.result {
	width: 60%;
	text-align: right;
	border : 1px solid #d1d1d1;
	padding: 30px;
	font-size: 13pt;
	margin-bottom: 50px;
}
.color {color: #e65553;}
.btna {margin: 40px 0px;}
</style>
<script src="${pageContext.request.contextPath }/resources/js/jquery.min.js"></script>
</head>
<body>
<%@ include file="../common/header.jsp" %>
		<div class="outer">
		<hr />
		<form action="<%= request.getContextPath() %>/product/productbuy.do" method="post" id="buyForm" name="buyForm">
		<input type="hidden" name="o_Mno" value="${member.m_No }" readonly/>
			<div id="listAre" align="center">
				<h2 class="content-title" style="margin-top: 20px;">주문 리스트</h2>
				<div>	 
				<table class="table1">
					<tr>	
						<th>상품</th>
						<th>상품명</th>
						<th>가격</th>
						<th>수량</th>
						<th style="width: 100px;">합계</th>
					</tr>
						<tr><td colspan="5" style="height: 10px;"></td></tr>
				
						<c:forEach items="${cartlist}" var="c"> 
					<tr class="noo noo1">
						<input type="hidden" name="userid" value="11"/>
						<input type="hidden" name="o_Pno" value="${c.c_Pno }" readonly/>
						<td><a href="${pageContext.request.contextPath}/product/productView.do?no=${c.c_Pno}">
							<img src="${pageContext.request.contextPath}/resources/productUpload/${c.files[0].i_ChangeName}" alt="상품이미지" class="product-img" width="100" height="100" /></a>
						</td>
						<td><input type="text" name="p_Name" value="${c.p_Name }" readonly  style="width: 300px; text-align: left;"></td>
						<td><input type="text" name="p_Price" value="${c.c_Price }" readonly></td>
						<td><input type="text" name="c_Amount" value="${c.c_Amount }" readonly></td>
						<td><div>${c.c_Amount * c.c_Price } 원</div></td>
						<%-- <td><input type="text" name="productQuantity" value="${sumMoney }" readonly></td> --%>
						</tr>
						<tr><td colspan="5" class="margin-tr"></td></tr>
						</c:forEach>
				</table>
				<div class="result">
					상품 구매 금액 
					<input type="text" name="sumMoney" value="${sumMoney }" readonly style="border:none; width: 90px; text-align: right;" /> 원
					 + 배송비 0 = 합계 : <span class="color"><strong> ${sumMoney } 원</strong></span>
				</div>
				
				</div>	
						
				<h2 class="content-title">주문자 정보</h2>
				<div>		
				<table class="table2">
					<tr class="noo">
						<th>주문자명</th>
						<td><input type="text" name="m_Name" value="${member.m_Name}" readonly/></td>	
					</tr>
					
					<tr class="noo">
						<th>주문자 이메일</th>
						<td><input type="text" name="m_Email" value="${member.m_Email}" readonly/></td>
						
					</tr class="noo">
					<tr class="noo">
						<th>주문자 전화번호</th>
						<td><input type="text" name="m_Phone" value="${member.m_Phone}" readonly></td>
					</tr>
					<tr class="noo">
						<th>주소</th>
						<td><input type="text" name="m_Address" value="${member.m_Address}" readonly/></td>
					</tr>
				</table>
				</div>
			</div>
		
			<div class="btna" align="center">
				<input type="submit" value="결제하기" class="Btn">
				<input type="button" onclick="location.href='javascript:history.back();'" value="주문 취소" class="Btn">
			</div>
		</form>	
	</div>


<%@ include file="../common/footer.jsp" %>
</body>
</html>