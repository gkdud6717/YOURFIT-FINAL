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
<title>홈트레이닝 영상 관리</title>
<link href="${pageContext.request.contextPath}/resources/css/mypage.css" rel="stylesheet">
<style>
.content {
		border-bottom: 2px solid black;
		padding-bottom: 20px;
		margin-bottom: 10px;
		display: inline-block;
		width: 800px;
}

	
.table {
	width: 800px;
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

#btn-update, #btn-insert {
	font-family: 'InfinitySans-RegularA1';
}

.checkbox {
	width: 20px;
	height: 20px;
}

.fa-book {
	margin-right: 10px;
}

.btn-group {
	float: right;
}
.blog-meta p {
	text-align: left;
	
}
</style>
<script>
function fn_cbBoardForm(){
	location.href = "${pageContext.request.contextPath}/mypage/cbBoardForm.do";
}

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

function deletecbBoard(){
	var url = "${pageContext.request.contextPath}/mypage/deletecbBoard.do";
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
	                    location.href = "${pageContext.request.contextPath}/mypage/managementCB.do"
	                }
	                else {
	                    alert("삭제 실패");
	               	}
	            }
           
        	});
    	} 
    }
}

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
                                <h2 class="widget-title">관리자 페이지</h2>
                                <div class="link-widget">
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/mypage/managementMember.do">회원 관리 <span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/managementDT.do">다이어트 꿀팁 관리 <span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/managementCB.do">칼로리 사전 관리 <span>></span></a></li>
                                        <li class="active-sidebar"><a href="${pageContext.request.contextPath}/mypage/managementHT.do">홈 트레이닝 관리 <span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/managementCO.do">커뮤니티 관리 <span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/managementQuestion.do">문의 관리 <span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/managementOrders.do">주문 관리 <span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/managementAD.do">광고 관리 <span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/managementNotice.do">공지사항 관리 <span>></span></a></li>
                                    </ul>
                                </div><!-- end link-widget -->
                            </div><!-- end widget -->
                        </div><!-- end sidebar -->
                    </div><!-- end col -->

                    <div class="col-lg-9 col-md-12 col-sm-12 col-xs-12">
                        <div class="page-wrapper">
                        <h2 class="content content-title">
                        	<a href="${pageContext.request.contextPath}/mypage/HomeTraining.do"><i id="icon" class="fa fa-youtube-play" aria-hidden="true"></i></a> 홈트 영상 관리</h2>
	                        <div class="blog-list clearfix">
	                       		<c:forEach items="${list}" var="ht"> 
	                                <div class="blog-box row">
	                                    <div class="col-md-4">
	                                        <div class="post-media">
	                                        	<a href="${pageContext.request.contextPath}/HomeTraining/boardView.do?no=${ht.ht_No}">
		                                            <img src="https://img.youtube.com/vi/${ht.ht_Src}/0.jpg" alt="" style="width:233px; height:137px;"/>
		                                        	<span class="ico-play"></span>
	                                        	</a>
	                                        </div><!-- end media -->
	                                    </div><!-- end col -->
										
	                                    <div class="blog-meta">
	                                        <h4>${ht.ht_Title}</h4>
	                                        <p>${ht.ht_Type} 게시판 > ${ht.ht_Part}</p>
	                                   		<small>댓글 : ${ht.commentcount }</small>
	                                        <small>조회수 : ${ht.ht_Count }</small>
	                                    </div><!-- end meta -->
	                                </div><!-- end blog-box -->
	                                <hr class="invis">
									</c:forEach>
									
									<c:out value="${pageBar}" escapeXml="false" />
	                                <hr class="invis">
	                            </div><!-- end blog-list -->
                         </div><!-- end page-wrapper -->
                    </div><!-- end col -->
                </div><!-- end row -->
                
               
            </div><!-- end container -->
        </section>
<c:import url="../../common/footer.jsp"/>
</body>
</html>