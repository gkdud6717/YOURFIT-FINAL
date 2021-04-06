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
<title>이벤트 수정</title>
<link href="${pageContext.request.contextPath}/resources/css/cbBoard.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/mypage.css" rel="stylesheet">
<style>
#updateCal {
	font-family: 'InfinitySans-RegularA1';
	text-align: left;
	margin-bottom: 30px;
	width: 100%;
}
	
#updateCal th {
	padding-left: 10px;
	background: #f8e9e2;
	width: 150px;
	line-height: 40px; 
}
	
#updateCal td {
	width: 500px;
}
	
#updateCal th, #updateCal td {
	border-bottom: 1px solid #a0a0a0;
	border-top: 1px solid #a0a0a0;
	padding: 10px;
}

#e_Content {
	width: 600px;
	height: 400px;
}

input[type=date] {
	width: 220px;
}

.content {
	display: inline-block;
	width: 100%;
	border-bottom: 2px solid black;
	padding-bottom: 20px;
}
</style>
<style>
		div#board-container{width:400px; margin:0 auto; text-align:center;}
		div#board-container input{margin-bottom:15px;}
		/* 부트스트랩 : 파일라벨명 정렬*/
		div#board-container label.custom-file-label{text-align:left;}
</style>
</head>
<body>
<c:import url="../common/header.jsp"/>
	<section class="section wb">
            <div class="container">
                <div class="row">
                    
                <div class="col-lg-2 col-md-2"></div>
                
                  <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                        <div class="page-wrapper">
                        	  <h3 class="content">이벤트 수정 화면</h3>
								<form action="${pageContext.request.contextPath}/event/updateEvent.do" method="post" enctype="multipart/form-data">
						      		<input type="hidden" name="e_Mno" value="${event.e_Mno }" />
										<table id="updateCal">
											<tr>
												<input type="hidden" name="e_No" value="${event.e_No}"/>
												<th>이벤트명</th>
												<td><input type="text" class="form-control" id="e_Title" name="e_Title" value="${event.e_Title }" required></td>
											</tr>
											<tr>
									      		<th>작성자</th>
												<td readonly>${ member.m_Nick }</td>     		
									      	</tr>
									      	<tr>
									      		<th>첨부 파일</th>
									      		<td>&nbsp;<input type="file" name="upfiles" id="upfiles"/></td>
									      	</tr>
											<tr>
									      		<th colspan="2" style="text-align: center; line-height: 20px;">내용</th>
									      	</tr>
									      	<tr>
									      		<td colspan="2">
									      			<textarea id="e_Content" name="e_Content" wrap="hard" cols="20" required style="resize: none; width: 100%; padding: 20px;">${event.e_Content }</textarea>
									      		</td>
									      	</tr>
									      	<tr>
									      		<th>시작일자</th>
									      		<td>
									      			<input type="date" id="e_Start" name="e_Start" required>
									      		</td>
									      	</tr>
									      	<tr>
									      		<th>종료일자</th>
									      		<td>
													<input type="date" id="e_End" name="e_End" required>
									      		</td>
									      	</tr>
										</table>
									<button class="btn btn-primary" id="btn-back" type="button" onclick="location.href='${pageContext.request.contextPath}/event/eventList.do'">목록으로</button>
									<input type="submit" class="btn btn-primary" id="btn-update" value="수정완료" style="float: right;"  />
								</form>
						
                        </div><!-- end page-wrapper -->
                    </div><!-- end col -->
                    <div class="col-lg-2 col-md-2"></div>
                </div><!-- end row -->
            </div><!-- end container -->
        </section>
<c:import url="../common/footer.jsp"/>
</body>
</html>