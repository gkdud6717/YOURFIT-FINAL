<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
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
                        	 <h3 class="content">공지사항 수정 화면</h3>
                        	 <form action="${pageContext.request.contextPath}/notice/update_end.do" method="post" onsubmit="return validate();" enctype="multipart/form-data">
										<table id="updateNotice">
											<tr>
												<th>제목</th>
												<td>
												    <input type="hidden" name="n_no" value="${ notice.n_no }"/>
												    <input type="text" class="form-control" id="n_title" name="n_title" value="${notice.n_title }" required>
												</td>
											</tr>						 
											<tr>
												<th>작성자</th>
												<td readonly style="padding-left: 17px;">
													${ member.m_Name }
													<input type="hidden" name="n_mno" value="${ member.m_No }"/>
												</td>   
											</tr>
											<tr>
												<th>작성일</th>
												<td style="padding-left: 15px;"><input type="date" id="myDate" /></td>
											</tr>
											
											<tr>
												<th>내용</th>
												<td>
												   <textarea class="form-control" id="n_content" name="n_content" value="${notice.n_content }" required></textarea>
												</td>
											</tr>
										</table>
										<br>
								 <div>		
									<button class="btn btn-primary" id="btn-back" type="button" onclick="location.href='${pageContext.request.contextPath}/notice/notice_list.do'">목록으로</button>
									<input type="submit" class="btn btn-primary" id="btnSave" value="수정완료" /> &nbsp;
									<button class="btn btn-primary" id="btnReset" type="button" onclick="location.href='${pageContext.request.contextPath}/notice/notice_detail.do?n_no=${ notice.n_no}'">취소</button>
								    &nbsp;
								 </div>
								</form>
                        
                        </div><!-- end page-wrapper -->
                    </div><!-- end col -->
                    <div class="col-lg-2 col-md-2"></div>
                </div><!-- end row -->
            </div><!-- end container -->
        </section>
        
   <c:import url="../common/footer.jsp"/>
   
   
 <script>
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
		},
	
	/*
	function date(){

		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth()+1; //January is 0!
		var yyyy = today.getFullYear();

		if(dd<10) {
		    dd='0'+dd
		} 

		if(mm<10) {
		    mm='0'+mm
		} 

		today = yyyy+'/'+mm+'/'+dd;
		document.write(today);
	}
	*/
	
</script>
        
</body>
</html>