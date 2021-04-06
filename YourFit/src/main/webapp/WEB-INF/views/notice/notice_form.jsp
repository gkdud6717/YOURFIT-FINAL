<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 등록</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/notice_form.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/mypage.css" rel="stylesheet">

</head>
<body>

    <c:import url="../common/header.jsp"/>
    
	<section class="section wb">
            <div class="container">
                <div class="row">
                    <div class="col-lg-2 col-md-2"></div>

                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                        <div class="page-wrapper">
                        	 <h3 class="content"><i class="fa fa-pencil-square-o" aria-hidden="true" style="margin-right: 10px;"></i>공지사항 등록 화면</h3>
                        	 <form action="${pageContext.request.contextPath}/notice/noticeEnd.do" method="post" onsubmit="return validate();" enctype="multipart/form-data">
										<table id="updateNotice">
											<tr>
												<th>제목</th>
												<td><input type="text" class="form-control" id="n_title" name="n_title" placeholder="제목을 입력하세요." required></td>
											</tr>						 
											<tr>
												<th>작성자</th>
												<td readonly style="padding-left: 17px;">
													${ member.m_Name }
													<input type="hidden" name="n_mno" value="${ member.m_No }"
												</td>   
											</tr>
											<tr>
												<th>작성일</th>
												<td style="padding-left: 15px;"><input type="date" id="myDate" /></td>
											</tr>
											
											<tr>
												<th>내용</th>
												<td>
												   <textarea class="form-control" id="n_content" name="n_content" placeholder="내용을 입력하세요." required></textarea>
												</td>
											</tr>
										</table>
										<br>
								 <div>
									<button class="btn btn-primary" id="btnBack" type="button" onclick="location.href='${pageContext.request.contextPath}/notice/notice_list.do'">목록으로</button> &nbsp;							
									<button type="submit" class="btn btn-primary" id="btnSave">등록</button>
									<button class="btn btn-default" id="btnDel" type="reset" onclick="button_event();" >취소</button>			
								 </div>
								</form>
                        
                        </div><!-- end page-wrapper -->
                    </div><!-- end col -->
                    <div class="col-lg-2 col-md-2"></div>
                </div><!-- end row -->
            </div><!-- end container -->
        </section>
        
   <c:import url="../common/footer.jsp"/>
   
   
 <script type="text/javascript">
	function validate(){
		var content = $("[name=n_Content]").val();
		var title = $("[name=n_title]").val();
		if(content.trim().length==0) && (title.trim().length==0){
			alert("내용을 입력하세요");
			return false;
		}
		return true;
	}

	_today: function () {
		  var myDate = document.querySelector(myDate);
		  var today = new Date();
		  myDate.value = today.toISOString().substr(0, 10);
		}

	/*
	function button_event(){
		if (confirm("정말 취소하시겠습니까?") == true){    //확인
			alert("취소되었습니다");
		}else{   //취소
		    return;
		}
		}*/

	
</script>
        
</body>
</html>