<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bmi 확인하기</title>
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
}

#bmitable {
	font-family: 'InfinitySans-RegularA1';
	margin: 30px 30px 30px 5px;
	width: 400px;
}

#bmitable th {
	width: 150px;
	text-align: center;
	border-top: 1px solid #a2a2a2;
	border-bottom: 1px solid #a2a2a2;
	background: #f8e9e2;
}

td {
	width: 400px;
	border-top: 1px solid #a2a2a2;
	border-bottom: 1px solid #a2a2a2;
	padding: 10px 7px 10px 15px;
	text-align: left;
}

.color {
	color: #f08969;
}

#checkbmi {
	font-family: 'InfinitySans-RegularA1';
	background: #f8e9e2;
	color: #464646;
	border: 1px solid #d6d4d4;
	margin: 20px 0px 50px 0px;
}

#checkbmi:hover {
		background: #f8c7b8;
		color: #5e5e5e!important;
		cursor: pointer;
}
.container { text-align: center;}
</style>
</head>

<body>
<c:import url="../common/header.jsp"/>
	<section id="wrap-contents">
        <div class="container" >
        	<div id="h1tag"><h1 id="title"><i class="fa fa-poll"></i>나의 <span class="color">BMI 지수</span> 확인하기</h1></div>
			
			<form name="bmi" action="${pageContext.request.contextPath}/diet/bmiResult.do" method="get">
				<table id="bmitable" style="margin: 40px auto;">
					<tr>
						<th>성별</th>
						<td>
							<input type="radio" name="gender" value="여성" checked="checked"/> 여성 &nbsp;
							<input type="radio" name="gender" value="남성"/> 남성
						</td>
					</tr>
					<tr>
						<th>연령</th>
						<td><input type="number" name="age" required="required"/> 세 </td>
					</tr>
					<tr>
						<th>키</th>
						<td><input type="text" onkeydown="this.value=this.value.replace(/[^0-9]/g,'')" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onblur="this.value=this.value.replace(/[^0-9]/g,'')" maxlength="3" 
								   name="hei" required="required"/> cm </td>
					</tr>
					<tr>
						<th>몸무게</th>
						<td><input type="text" onkeydown="this.value=this.value.replace(/[^0-9]/g,'')" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onblur="this.value=this.value.replace(/[^0-9]/g,'')" maxlength="3" 
						           name="wei" required="required" autocomplete="off" /> kg </td>
					</tr>
				</table>
				
				<span id="info">
					<i class="fa fa-exclamation-circle"></i>
					비만도 측정(BMI)이란? <br>
					&nbsp; &nbsp; 나이, 신장(cm)과 체중(kg) 만으로 비만을 판정하는 비만 지수 <br>
		    	</span>
			
				<input type="submit" id="checkbmi" class="btn btn-primary" value="확인하기"> 
			</form>
		</div>
	</section>
<c:import url="../common/footer.jsp"/>
</body>

</html>