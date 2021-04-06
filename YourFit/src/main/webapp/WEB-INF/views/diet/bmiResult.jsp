<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% float hei = Float.parseFloat(request.getParameter("hei"))/100; %>
<% float wei = Float.parseFloat(request.getParameter("wei")); %>
<% float bmi = wei/(hei*hei); %>
<% String result = ""; %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BMI 결과</title>
<style>

@font-face {
    font-family: 'InfinitySans-RegularA1';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/InfinitySans-RegularA1.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

#title, #info {
	font-family: 'InfinitySans-RegularA1';
}

#h1tag {
	width: 50%;
	border-bottom: 4px solid #e39e8d;
	margin: 0px auto;
	text-align: center;
}

#bmitable {
	font-family: 'InfinitySans-RegularA1';
	margin: 40px auto;
}

#bmitable th {
	width: 100px;
	text-align: center;
	border-top: 1px solid #a2a2a2;
	border-bottom: 1px solid #a2a2a2;
	background: #f8e9e2;
}

td {
	width: 400px;
	border-top: 1px solid #a2a2a2;
	border-bottom: 1px solid #a2a2a2;
	padding: 10px 7px 10px 40px;
	text-align: left;
}

.color {
	color: #f08969;
}

#checkbmi:hover {
	background: #f8c7b8;
	color: #5e5e5e!important;
	cursor: pointer;
}

#btn-back {
	font-family: 'InfinitySans-RegularA1';
	background: #f8e9e2;
	color: #464646;
	border: 1px solid #d6d4d4;
	margin-bottom: 50px;
}

#btn-back:hover {
	background: #f8c7b8;
	color: white!important;
	cursor: pointer;
}

#result {
	text-align: left !important;
	padding: 5px;
}

.span-color {
	color: red;
}
.container { text-align: center;}
</style>
</head>

<body>
	<c:import url="../common/header.jsp"/>
	
	<% if(bmi>=30){ 
			 result = "고도 비만";
		 } else if(bmi>=25 && bmi<=29.9){
			 result = "비만";
		 } else if(bmi>=23 && bmi <=24.9){
			 result = "과체중";
		 } else if(bmi>=18.5 && bmi <=22.9){
			 result = "정상 체중";
		 } else {
			 result = "저체중";
		 } %>
	 
	<section id="wrap-contents">
        <div class="container" >
        	<div id="h1tag"><h1 id="title"><i class="fa fa-weight"></i>나의 <span class="color">BMI 지수</span> 결과</h1></div>
				<table id="bmitable">
					<tr>
						<th>성별</th>
						<td><%= request.getParameter("gender") %></td>
					</tr>
					<tr>
						<th>연령</th>
						<td><%= request.getParameter("age") %> 세</td>
					</tr>
					<tr>
						<th>키</th>
						<td><%= request.getParameter("hei") %> cm</td>
					</tr>
					<tr>
						<th>몸무게</th>
						<td><%= request.getParameter("wei") %> kg</td>
					</tr>
					<tr>
						<th style="background: white" id="result" colspan="2">
							<span style="margin-left: 7px;">비만도(BMI) 검사 결과 : <%= String.format("%.2f", bmi) %></span><br>
							<div id="graph"><img style="width: 600px; height: 100px;" alt="bmi표" src="${pageContext.request.contextPath}/resources/images/bmiResult.png"></div>
						</th>
					</tr>
					<tr>
						<th style="padding: 10px;" colspan="2">당신의 비만도(BMI)지수는 <%= String.format("%.2f", bmi) %>로 <span class="span-color">"<%=result %>"</span>입니다.</th>
					</tr>
				</table>
				
				<button class="btn btn-primary" id="btn-back" type="button" onclick="location.href='${pageContext.request.contextPath}/diet/bmi.do'">다시 하기</button>
		</div>
	</section>	
<c:import url="../common/footer.jsp"/>
	 	
</body>
</html>