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
<title>상품 문의 관리</title>
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
	display: inline-block;
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
.table td {
	height: 100px;
	line-height: 120px;
} 
#btn-update {
	font-family: 'InfinitySans-RegularA1';
}
.color-red {
	color: red;
}

.total-content > p {
	font-family: 'InfinitySans-RegularA1';
	margin-bottom: 7px;
}
.product-img {
	padding:0px;
}
.checkbox {
	width: 20px;
	height: 20px;
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

function deletePost(){
	var url = "${pageContext.request.contextPath}/mypage/deleteQuestion.do";
    var arr = new Array();
    var list = $("input[name='checkcbBoard']");

    for(var i=0; i< list.length; i++){
		if(list[i].checked){
			arr.push(list[i].value);
		}
    }

    if(arr.length == 0){
        alert("선택된 글이 없습니다.");
    } else{
        var real = confirm("정말 삭제하시겠습니까?")
	        if (real) {
	        $.ajax({
	            url: url,
	            type: "POST",
	            data: { arr : arr },
	            success: function(jdata){
	                if(jdata == 1) {
	                    alert("삭제 성공");
	                    location.href = "${pageContext.request.contextPath}/mypage/memberQuestionList.do?m_No=${member.m_No}"
	                }
	                else {
	                    alert("삭제 실패");
	               	}
	            }
           
        	});
    	} 
    }
}


$(function(){
	$("tr[id]").mouseenter(function(){
        $(this).css({"background-color" : "rgba( 248, 233, 226, 0.5)", "cursor" : "pointer"});
    }).mouseout(function(){
       $(this).css({"background" : "white"});
    }).on("click",function(){
		var no = $(this).attr("id");
		location.href = "${pageContext.request.contextPath}/product/productView.do?no="+no;
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
                                        <li><a href="${pageContext.request.contextPath}/mypage/memberMypage.do?m_No=${member.m_No}">회원 정보 수정 <span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/selectPostList.do?m_No=${member.m_No}">작성 글 관리 <span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/selectCommentList.do?m_No=${member.m_No}">작성 댓글 관리 <span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/memberOrderList.do?m_No=${member.m_No}">구매내역 <span>></span></a></li>
                                        <li class="active-sidebar"><a href="${pageContext.request.contextPath}/mypage/memberQuestionList.do?m_No=${member.m_No}">상품 문의 내역 <span>></span></a></li>
                                    </ul>
                                </div><!-- end link-widget -->
                            </div><!-- end widget -->
                        </div><!-- end sidebar -->
                    </div><!-- end col -->

                    <div class="col-lg-9 col-md-12 col-sm-12 col-xs-12">
                        <div class="page-wrapper">
                        	<div class="content">
                        	<h2 class="content-title">상품 문의 관리</h2>
                        		<button class="btn btn-primary" id="btn-delete" type="button" onclick="deletePost();">선택 삭제</button>
                        	</div>
                        	<div class="total-content">
								<p style="text-align: right; margin-right: 25px;">총 <span class="color-red">${totalContents}건</span>의 문의를 작성하셨습니다.</p>
							</div>
                        	<table class="table">
									<tr>
										<th>상품</th>
										<th>상품명</th>
										<th>문의 제목</th>
										<th>작성일</th>
										<th>답변여부</th>
										<th style="width: 50px;"><input class="checkbox" type="checkbox" name="checkall" id="checkall"/></th>
									</tr>
									
									<c:forEach items="${list}" var="q">
									
									<tr id="${q.files[0].i_Pno}">
										<td style="padding: 10px; width: 120px;">
											<img src="${pageContext.request.contextPath}/resources/productUpload/${q.files[0].i_ChangeName}"
												class="product-img" alt="대표이미지" width="100" height="100">
										</td>
										<td>${q.p_Name }</td>
										<td>${q.q_Title }</td>
										<td>${q.q_Date}</td>
										<c:choose>
											<c:when test="${!empty q.q_Answer }"><td style="color: blue;">답변 완료</td></c:when>
											<c:otherwise><td>답변 미완료</td></c:otherwise>
										</c:choose>	
										<td onclick="event.cancelBubble=true"><input class="checkbox" type="checkbox" name="checkcbBoard" id="checkcbBoard" value="${q.q_No}"/></td>
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