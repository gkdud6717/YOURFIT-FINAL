<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
<html>
<head>
<meta charset="UTF-8">
<title>칼로리 사전 검색 결과</title>
<link href="${pageContext.request.contextPath}/resources/css/cbBoard.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
	.scd-title {
		display: inline-block;
		border-bottom: 2px solid black;
		width: 700px;
		padding-bottom: 30px;
	}
	
	span, p, h5 {
		font-family: 'InfinitySans-RegularA1'!important;
	}
	
	.excercise-group {
		width: 500px;
		border: 2px solid #a2a2a2;
		text-align: center;
		padding-top: 10px;
		margin-bottom: 30px;
	}
	
	.excercise {
		width:auto;
		display: inline-block;
		padding: 10px 30px 0px 0px;
		text-align: center;
	}
	
	.walking {
		margin-left: 30px;
	}
	
	img {
		margin: 15px 0px 15px 0px;
	}
	
	.ex-result {
		color: #c14646;
	}
	.p-info {text-align: left;}
	
	#btn-back:hover {background: #f8c7b8;}
</style>
<script>
		function fn_cbBoardForm(){
			location.href = "${pageContext.request.contextPath}/cbBoard/cbBoardForm.do";
		}

		function searchCalorie(){
			location.href = "${pageContext.request.contextPath}/cbBoard/cbBoardSearch.do?keyword="+$('#keyword').val();
		}
</script>
</head>
<body>
<c:import url="../common/header.jsp"/>

	<section id="wrap-contents">
      <div class="mypage-content">
         <div class="container" >
 
            <h2 class="content content-title"><i id="icon" class="fa fa-book" aria-hidden="true"></i>음식 칼로리 사전</h2>
          
            <div class="sch-div"> <!-- 음식 칼로리 검색 -->
				<form name="searchFrm" method="get" onsubmit="return false;">
					<fieldset class="sch2 clfix">
						<legend></legend>
						<input type="text" id="keyword" class="keyword" name="keyword" placeholder="검색어 입력" style="width:619px" onKeyPress="if (event.keyCode == 13){searchCalorie();return;}"/>
						<a class="cal-search" data-toggle="collapse" aria-expanded="false" aria-controls="collapseExample" onclick="searchCalorie();"><i class="fa fa-search"></i></a>
						<p class="p-info">칼로리 사전은 <span class="span-color">음식의 칼로리 뿐만 아니라 영양소 구성도 함께</span> 나와 다이어트뿐 아니라 건강한 식습관 형성에도 도움이 됩니다.</p>
					</fieldset>
				</form>
			</div>
             
                <div class="outer">
                      <div id="mainWrapper">
                      
                      <h2 class="content scd-title">'${cbBoard.cb_foodname}' 검색 결과</h2>
		
						<table id="result">
							<tr>
								<th>음식명</th>
								<th>단위</th>
								<th>칼로리</th>
							</tr>
							<tr>
								<td>${cbBoard.cb_foodname}</td>
								<td>${cbBoard.cb_unit}</td>
								<td>${cbBoard.cb_cal}kcal</td>
							</tr>
						</table>
						
						<br>
						<p class="p-info"><span class="span-color">[주의]</span> 음식 칼로리는 사용되는 재료와 1인 분량 기준의 차이에 의해 다소 차이가 있을 수 있습니다.</p>
						<br>
						
						<h2 class="content scd-title">'${cbBoard.cb_foodname}' 영양소 구성</h2>
						
						<table id="nutrient">
							<tr>
								<th>탄수화물</th>
								<th>단백질</th>
								<th>지방</th>
							</tr>
							<tr>
								<td>${cbBoard.cb_carbohydrate}g</td>
								<td>${cbBoard.cb_protein}g</td>
								<td>${cbBoard.cb_fat}g</td>
							</tr>
						</table>
	
						<br>
						<h5 class="samecal">'${cbBoard.cb_foodname}'의 칼로리<span class="span-color">(${cbBoard.cb_cal}kcal)</span>와 동일한 운동</h5>
						
						<div class="excercise-group">
							<div class="excercise walking">
								<img src="https://img.icons8.com/android/48/000000/walking.png"/>
								<fmt:parseNumber var="walking" value="${(cbBoard.cb_cal)/2}" integerOnly="true"/>
								<br><span>걷기</span><p class="ex-result">${walking}분</p>
							</div>
							<div class="excercise running">
								<img src="https://img.icons8.com/android/48/000000/running.png"/>
								<fmt:parseNumber var="running" value="${(cbBoard.cb_cal)/7}" integerOnly="true"/>
								<br><span>달리기</span><p class="ex-result">${running}분</p>
							</div>
							<div class="excercise jumprope">
								<img src="https://img.icons8.com/android/48/000000/jump-rope.png"/>
								<fmt:parseNumber var="jumprope" value="${(cbBoard.cb_cal)/10}" integerOnly="true"/>
								<br><span>줄넘기</span><p class="ex-result">${jumprope}분</p>
							</div>
							<div class="excercise swimming">
								<img src="https://img.icons8.com/ios-glyphs/48/000000/swimming.png"/>
								<fmt:parseNumber var="swimming" value="${(cbBoard.cb_cal)/9}" integerOnly="true"/>
								<br><span>수영</span><p class="ex-result">${swimming}분</p>
							</div>
							<div class="excercise riding">
								<img src="https://img.icons8.com/metro/48/000000/cycling-road.png"/>
								<fmt:parseNumber var="riding" value="${(cbBoard.cb_cal)/8}" integerOnly="true"/>
								<br><span>자전거 타기</span><p class="ex-result">${riding}분</p>
							</div>
						</div>
						    
						<button class="btn btn-primary" id="btn-back" type="button" onclick="location.href='${pageContext.request.contextPath}/cbBoard/cbBoard.do'">돌아가기</button>
						
					</div>

                	</div>   
                </div>      
                
         </div>
      </div>
   </section>

<c:import url="../common/footer.jsp"/>
</body>
</html>