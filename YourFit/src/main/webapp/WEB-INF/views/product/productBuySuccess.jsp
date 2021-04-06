<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 성공</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery.min.js"></script>
<style>
.title, p, h2 {
	font-family: 'InfinitySans-RegularA1'!important;
	text-align: center;
	margin-bottom: 40px;
}
.logo{text-align: center;}
.btn-back {
	width: 200px;
	height: 50px;
	background: #f8e9e2;
	border: 1px solid rgba(92, 92, 92,0.2);
	border-radius: 15px;
	font-family: 'InfinitySans-RegularA1'!important;
}
.btn-back:hover {
	box-shadow: 2px 4px 4px 3px rgba(227, 134, 118,0.1);
	cursor: pointer;
	transition: 0.4s;
	border: 2px solid #e0c7bf;
}
</style>
</head>
<body>
<%@ include file="../common/header.jsp" %>
	<section class="page-title wb">
	      <div class="container">
	      <div class="logo">
	      	<img src="${pageContext.request.contextPath }/resources/images/order1.png" alt="결제 성공" width="300" height="300"/>
	      </div>
	      <div class="title"><h2><span style="color: #ed8585">주문이 정상적으로 완료</span>되었습니다.</h2></div>
	      <p class="title">자세한 내역은 [마이페이지] > [주문내역] 에서 확인 가능합니다.</p>
	      </div>
	      <div style="text-align: center; margin-bottom: 30px;">
	      	<button class="btn-back" onclick="go_index();">메인페이지로 돌아가기</button>
	      </div>
	      <script>
				function go_index(){
					 location.href = "${pageContext.request.contextPath}";
					}
	      </script>
	</section>
<%@ include file="../common/footer.jsp" %>
</body>
</html>