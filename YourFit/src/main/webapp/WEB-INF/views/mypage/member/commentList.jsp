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
<title>작성 한 댓글 관리</title>
<link href="${pageContext.request.contextPath}/resources/css/mypage.css" rel="stylesheet">
<style>
.content {
		border-bottom: 2px solid black;
		margin-bottom: 20px;
		display: inline-block;
		width: 800px;
}
.content-title {
	font-family: 'InfinitySans-RegularA1';
}
	
.table {
	width: 800px !important;
	font-family: 'InfinitySans-RegularA1';
	text-align: center;
}

.table th {
	text-align: center;
	background: #f8e9e2;
}

.suspension {
	display: inline-block;
}

#btn-update {
	font-family: 'InfinitySans-RegularA1';
}

.checkbox {
	width: 20px;
	height: 20px;
}

.td-content {
	width: 280px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

.color-red {
	color: red;
}

.total-content > p {
	font-family: 'InfinitySans-RegularA1';
	margin-bottom: 7px;
}
</style>
<script>
$(document).ready(function(){ // 일괄 선택 / 전체 선택
    $("#checkall").click(function(){
        if($("#checkall").prop("checked")){
            $("input[name=checkcbBoard]").prop("checked",true);
        }else{
            $("input[name=checkcbBoard]").prop("checked",false);
        }
        $("input[name=checkcbBoard]").click(function(){
        	  $("#checkall").prop("checked", false);
        });
        
    })
})


$(function(){
	$("tr[id]").mouseenter(function(){
        $(this).css({"background-color" : "rgba( 248, 233, 226, 0.5)", "cursor" : "pointer"});
    }).mouseout(function(){
       $(this).css({"background" : "white"});
    }).on("click",function(){
		var no = $(this).children().attr("id");
		var type = no.substr(0,2);
		
		console.log(no);
		console.log(type);

			if(type == 'DT'){
				location.href = "${pageContext.request.contextPath}/dtboard/dtBoardView.do?no="+no;
			} else if (type == 'CO') {
				location.href = "${pageContext.request.contextPath}/board/boardView.do?no="+no;
			} else {
				location.href = "${pageContext.request.contextPath}/HomeTraining/boardView.do?no="+no;
			}
		});
});

</script>
</head>
<body>
<c:import url="../../common/header.jsp"/>
	<section class="section wb">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-12 col-sm-12 col-xs-12">
                        <div class="sidebar">
                            <div class="widget widget-sidebar">
                                <h2 class="widget-title">마이페이지</h2>
                                <div class="link-widget">
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/mypage/memberMypage.do?m_No=${member.m_No}">회원 정보<span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/selectPostList.do?m_No=${member.m_No}">작성 글 관리 <span>></span></a></li>
                                        <li class="active-sidebar"><a href="${pageContext.request.contextPath}/mypage/selectCommentList.do?m_No=${member.m_No}">작성 댓글 관리 <span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/memberOrderList.do?m_No=${member.m_No}">주문 내역 <span>></span></a></li>                                      
                                        <li><a href="${pageContext.request.contextPath}/mypage/memberQuestionList.do?m_No=${member.m_No}">문의 내역 <span>></span></a></li>
                                    </ul>
                                </div><!-- end link-widget -->
                            </div><!-- end widget -->
                        </div><!-- end sidebar -->
                    </div><!-- end col -->

                    <div class="col-lg-9 col-md-12 col-sm-12 col-xs-12">
                        <div class="page-wrapper">
                        	<div class="content">
                        	<h2 class="content-title">작성한 댓글 관리</h2>
                        	</div>
                        	<div>
								<p style="text-align: right; padding-right: 20px;">총 <span class="color-red">${totalContents}건</span>의 댓글을 작성하셨습니다.</p>
							</div>
                        	<table class="table">
									<tr>
										<th>게시판 분류</th>
										<th>댓글 내용</th>
										<th>닉네임</th>
										<th>작성일</th>
									</tr>
									
									<c:forEach items="${list}" var="comment" >
									
									<tr id="${comment.bc_No}">
									<c:choose>
										<c:when test="${not empty comment.bc_Dtno}">
											<td id="${comment.bc_Dtno}">[다이어트 팁]</td>
										</c:when>
										<c:when test="${not empty comment.bc_Htno}">
											<td id="${comment.bc_Htno}">[홈트]</td>
										</c:when>
										<c:when test="${not empty comment.bc_Cono}">
											<td id="${comment.bc_Cono}">[커뮤니티]</td>
										</c:when>
									</c:choose>
									
										<td>${comment.bc_Content}</td>
										<td>${member.m_Nick}</td>
										<td>${comment.bc_Date}</td>
					                </tr>
					            	</c:forEach>
								</table>
							<c:out value="${pageBar}" escapeXml="false"/>
                        </div><!-- end page-wrapper -->
                    </div><!-- end col -->
                </div><!-- end row -->
            </div><!-- end container -->
        </section>
<c:import url="../../common/footer.jsp"/>
</body>
</html>