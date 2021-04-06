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
<title>공지사항 관리</title>
<link href="${pageContext.request.contextPath}/resources/css/mypage.css" rel="stylesheet">
<style>
.content {
		border-bottom: 2px solid black;
		padding-bottom: 20px;
		margin-bottom: 20px;
		display: inline-block;
		width: 700px;
}
	
.table {
	width: 700px !important;
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
</style>
<script>
function fn_noticeForm(){
	location.href = "${pageContext.request.contextPath}/mypage/notice_form.do";
}

function fn_noticeUpdate(n_no) {
	location.href = "${pageContext.request.contextPath}/mypage/notice_updateView.do?n_no="+n_no;
}


  /*
$(function(){
    var chkObj = document.getElementsByName("checknotice");
    var rowCnt = chkObj.length;

    $("input[name='checkall']").click(function(){
        var chk_listArr = $("input[name='checknotice']");
        for (var i=0; i<chk_listArr.length; i++){
            chk_listArr[i].checked = this.checked;
            }
        });
    $("input[name='checknotice']").click(function(){
        if($("input[name='checknotice']:checked").length == rowCnt){
            $("input[name='checkall']")[0].checked = true;
          } 
        else{
            $("input[name='checkall']")[0].checked = false;
          }
        });
   });
   */


$(document).ready(function(){ 
    $("#checkall").click(function(){
        if($("#checkall").prop("checked")){
            $("input[name=checknotice]").prop("checked",true);
        }else{
            $("input[name=checknotice]").prop("checked",false);
        }
        $("input[name=checknotice]").click(function(){
        	  $("#checkall").prop("checked", false);
        });
        
    })
})


function deleteNotice(){
	var url = "${pageContext.request.contextPath}/mypage/notice_deleteArr.do";
    var arr = new Array();
    var list = $("input[name='checknotice']");

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
	                    location.href = "${pageContext.request.contextPath}/mypage/managementNotice.do"
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
		var n_no = $(this).attr("id");
		console.log("n_no="+n_no);
		location.href = "${pageContext.request.contextPath}/mypage/notice_updateView.do?n_no="+n_no;
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
                                <h2 class="widget-title">관리자 페이지</h2>
                                <div class="link-widget">
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/mypage/managementMember.do">회원 관리 <span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/managementDT.do">다이어트 팁 관리 <span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/managementCB.do">칼로리 사전 관리 <span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/managementHT.do">홈 트레이닝 관리 <span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/managementCO.do">커뮤니티 관리 <span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/managementQuestion.do">문의 관리 <span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/managementOrders.do">주문 관리 <span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/managementAD.do">광고 관리 <span>></span></a></li>
                                        <li class="active-sidebar"><a href="${pageContext.request.contextPath}/mypage/managementNotice.do">공지사항 관리 <span>></span></a></li>
                                    </ul>
                                </div><!-- end link-widget -->
                            </div><!-- end widget -->
                        </div><!-- end sidebar -->
                    </div><!-- end col -->

                    <div class="col-lg-9 col-md-12 col-sm-12 col-xs-12">
                        <div class="page-wrapper">
                        	<h2 class="content content-title">공지사항 관리
                        		<button class="btn btn-primary" id="btn-insert" type="button" onclick="fn_noticeForm();">공지사항 추가</button>
                        
                        		<button class="btn btn-primary" id="btn-delete" type="button" onclick="deleteNotice();">선택 삭제</button>
                        	</h2>
                        	
								<table class="table">
									<tr>
										<th>번호</th>
						                <th>제목</th>
						                <th>작성자</th>
						                <th>작성일</th>
						                <th>수정</th>
										<th><input class="checkbox" type="checkbox" name="checkall" id="checkall"/></th>
									</tr>
									
									<c:forEach items="${list}" var="n">
					                <tr id="${n.n_no}">
					                   <td>${n.n_no}</td>
					                   <td>${n.n_title}</td>
					                   <td readonly><!--  ${n.n_mno}--> ${member.m_Name}</td>
					                   <td>${n.n_date}</td>
					                   <td>
					                   	<input type="button" value="수정하기" onclick="fn_noticeUpdate(${n.n_no});" />
					                   </td>
										<td onclick="event.cancelBubble=true"><input class="checkbox" type="checkbox" name="checknotice" id="checknotice" value="${n.n_no}"/></td>
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