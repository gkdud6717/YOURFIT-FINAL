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
<title>칼로리 사전</title>
<link href="${pageContext.request.contextPath}/resources/css/cbBoard.css" rel="stylesheet">
<style>
.content-title { padding-top: 30px; }

#centered {display: table; margin-left: auto; margin-right: auto;}

th, td {color: black; border-bottom: 1px solid lightgrey; font-family: 'InfinitySans-RegularA1'; text-align: center;}

th { background-color: #f8e9e2; text-align: center !important; }

.p-info {text-align: left;}
</style>
<script>
		function fn_cbBoardForm(){
			location.href = "${pageContext.request.contextPath}/cbBoard/cbBoardForm.do";
		}

		$(function(){
			$("tr[id]").mouseenter(function(){
                $(this).css({"background-color" : "rgba( 248, 233, 226, 0.5)", "cursor" : "pointer"});
            }).mouseout(function(){
               $(this).css({"background" : "white"});
            }).on("click",function(){
				var cb_no = $(this).attr("id");
				console.log("cb_no="+cb_no);
				location.href = "${pageContext.request.contextPath}/cbBoard/cbBoardView.do?cb_no="+cb_no;
			});
		});

		function searchCalorie(){
			location.href = "${pageContext.request.contextPath}/cbBoard/cbBoardSearch.do?keyword="+$('#keyword').val();
		}
		
	</script>
</head>
<body>
	<c:import url="../common/header.jsp"/>
	
	<section id="wrap-contents">
         <div class="container" >
 
            <h2 class="content content-title"><i id="icon" class="fa fa-book" aria-hidden="true"></i>음식 칼로리 사전</h2>
            <br>
            
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
                      <h2 class="content content-title">금주의 칼로리사전 검색 순위 <span class="span-color">TOP 10</span></h2> <br>
                          <table class="table">
							<tr style="background: #f8e9e2;">
								<th>순위</th>
								<th>음식명</th>
								<th>단위</th>
								<th>칼로리</th>
								<c:if test="${member.m_Id eq 'admin'}">
                                <th>조회수</th>
                                </c:if>
							</tr>
				
							<c:forEach items="${list}" var="cbBoard" varStatus="vs">
								
								<tr id="${cbBoard.cb_no}">
									<td>${vs.count}</td>
									<td>${cbBoard.cb_foodname}</td>
									<td>${cbBoard.cb_unit}</td>
									<td>${cbBoard.cb_cal} kcal</td>
									<c:if test="${member.m_Id eq 'admin'}">
                                    <td>${cbBoard.cb_count}</td>
                                    </c:if>
								</tr>
						
							</c:forEach> 
						</table>
						<br>
                	</div>   
                </div>      
                
         </div>
   </section>
   	<c:import url="../common/footer.jsp"/>
</body>
</html>