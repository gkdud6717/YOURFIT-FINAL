<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   .btna input{
   padding: 0 24px;
   height: 40px;
   color: white;
   font-size: 18px;
   font-weight: 600;
   background: #1f76bc;
   border-radius: 25px;
   border: none;
    }
   .noo td input{
   border:none;
   width:250px;
   }
  
    
</style>
<script src="${pageContext.request.contextPath }/resources/js/jquery.min.js"></script>
</head>
<link href="${pageContext.request.contextPath}/resources/css/list_default.css" rel="stylesheet">
<body>
<%@ include file="../common/header.jsp" %>
		<div class="outer">
		<form action="<%= request.getContextPath() %>/product/productbuy.do" method="post" id="buyForm" name="buyForm">
		<input type="hidden" name="o_Mno" value="${member.m_No }" readonly/>
			<div id="listAre" align="center">
				<h2 align="center">주문 상품</h2>	
				<hr style="width:100px; align:center;'">		 
				<br />
				<table class="table1">
					<tr>
						
						<th>상품명</th>
						<th>가격</th>
						<th>수량</th>
			
					</tr>
					<%-- 	<c:forEach items="${cartlist}" var="c">  --%>
					<tr class="noo">
						<input type="hidden" name="userid" value="11"/>
						<input type="hidden" name="o_Pno" value="${o_Pno }" readonly/>
						
					
						<td><input type="text" name="p_Name" value="${p_Name }" readonly></td>
						<td><input type="text" name="p_Price" value="${p_Price }" readonly></td>
						<td><input type="text" name="c_Amount" value="${c_Amount }" readonly></td>
					<%-- 	<td><input type="text" name="productQuantity" value="${sumMoney }" readonly></td> --%>
						</tr>
					<%-- 	</c:forEach> --%>
				</table>		
				<hr />
				<table class="table1">
					<tr>
						
						<th>주문자명</th>
						<th>주문자 이메일</th>
						<th>주소</th>
						<th>주문자 전화번호</th>
						
					</tr>
					
					<tr class="noo">
						<td><input type="text" name="m_Name" value="${member.m_Name}" readonly/></td>
						<td><input type="text" name="m_Email" value="${member.m_Email}" readonly/></td>
						<td><input type="text" name="m_Address" value="${member.m_Address}" readonly/></td>
						<td><input type="text" name="m_Phone" value="${member.m_Phone}" readonly></td>
					</tr>
				</table>		
				<div style="margin-left:140px;">
				<br><br><br><br>
				<strong>총 금액 : </strong><input type="text" name="sumMoney" value="${sumMoney }" readonly style="border:none;">
				<br><br><br><br>
				</div>
			</div>
			<hr>
			<br>
		
		
			<br><br><br><br>
			<div class="btna" align="center">
				<input type="submit" value="주문하기" class="Btn">
				<input type="button" onclick="location.href='javascript:history.back();'" value="주문 취소" class="Btn">
			</div>
			<br><br><br><br>	
		</form>	
	</div>


<%@ include file="../common/footer.jsp" %>
</body>
</html>