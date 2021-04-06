<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script> 
<head>
	<meta charset="UTF-8">
	<title>게시글 작성</title>
	
<link href="${pageContext.request.contextPath}/resources/css/dt_form.css" rel="stylesheet">
<script>
	function validate(){
		var content = $("[name=dt_Content]").val();
		if(content.trim().length==0){
			alert("내용을 입력하세요");
			return false;
		}
		return true;
	}
</script>


</head>
<body>
<c:import url="../common/header.jsp"/>
	<section class="section wb">
            <div class="container">
                <div class="row">
                    <div class="col-lg-2 col-md-2"></div>
                    
                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                        <div class="page-wrapper">
                        	 <h3 class="content"><i class="fa fa-pencil-square-o" aria-hidden="true" style="margin-right: 10px;"></i>다이어트 꿀팁 등록 화면</h3>
								<form action="${pageContext.request.contextPath}/dtboard/dtBoardFormEnd.do"
				      				  method="post" onsubmit="return validate();" enctype="multipart/form-data">
						      		<input type="hidden" name="dt_Mno" value="${member.m_No }" />
								    <table  class="sub_news" border="1px solid gray" align="center" >
								      	<tr>
											<th>카테고리</th>
											<td>
												<select name="dt_Type" id="dt_Type">
													<option value=>게시판 선택</option>
													<option value="식단">식단</option>
													<option value="운동">운동</option>
													<option value="칼럼">칼럼</option>
										    	</select>
											</td>
										</tr>
								      	<tr>
								      		<th>제목</th>
								      		<td><input class="form-control" type="text" name="dt_Title" placeholder="제목을 입력하세요." /></td>
								      	</tr>
								      	<tr>
								      		<th>작성자</th>
											<td readonly style="padding-left: 17px;">${ member.m_Nick }</td>     		
								      	</tr>
								      	<tr>
								      		<th>첨부 파일</th>
								      		<td>&nbsp;<input type="file" name="upfiles" id="upfiles" /></td>
								      	</tr>
										<tr>
								      		<th>내용</th>
								      		<td>
								      			<textarea class="form-control" id="dt_Content" name="dt_Content" placeholder="내용을 입력하세요." required></textarea>
								      		</td>
								      	</tr>
								    </table>
								    
								    <br/>
								    <div>
								    	<button class="btn btn-default" id="btnBack"><a href="${pageContext.request.contextPath}/dtboard/dtBoardList.do" style="color: #333; align:left;">목록으로</a></button>
								      	<button class="btn btn-default" id="btnSave" type="submit">등록</button>
								      	<button class="btn btn-default" id="btnDel" type="reset" >취소</button>								 
								    </div>
								</form>
								
                        </div><!-- end page-wrapper -->
                    </div><!-- end col -->
                    <div class="col-lg-2 col-md-2"></div>
                </div><!-- end row -->
            </div><!-- end container -->
        </section>
<c:import url="../common/footer.jsp"/>
<script src="${pageContext.request.contextPath }/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
</body>
</html>