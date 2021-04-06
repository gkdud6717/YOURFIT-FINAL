<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/notice_form.css" rel="stylesheet">
<html>
<meta charset="UTF-8">
<title>커뮤니티 게시글 작성</title>
<head>
	<style>
		div#board-container{width:400px; margin:0 auto; text-align:center;}
		div#board-container input{margin-bottom:15px;}
		/* 부트스트랩 : 파일라벨명 정렬*/
		div#board-container label.custom-file-label{text-align:left;}
		th#column_row {background:#edeff2; padding:22px 14px 22px 14px;}
		table {border-bottom: 1px solid #edeff2; border-top: 1px solid #edeff2;}
		.input-group-prepend{width:200px;}
	</style>
	<script>
	/* textarea에도 required속성을 적용가능하지만, 공백이 입력된 경우 대비 유효성검사를 실시함. */
	function validate(){
		var content = $("[name=boardContent]").val();
		if(content.trim().length==0){
			alert("내용을 입력하세요");
			return false;
		}
		return true;
	}
	
	/*부트스트랩 : file 변경시 파일명 보이기 */

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
               <h3 class="content"><i class="fa fa-pencil-square-o" aria-hidden="true" style="margin-right: 10px;"></i>커뮤니티 등록 화면</h3>																											<!--  사진도 업로드하기 위함 (라이브러리2개필요) -->
			
			  <form name="boardFrm" action="${pageContext.request.contextPath}/board/coboardFormEnd.do" method="post" onsubmit="return validate();" enctype="multipart/form-data">
			  <input type="hidden" name="co_Mno" value="${member.m_No}" readonly>
				<table class="co_table">
					<tr>
					  <th>카테고리</th>
						<td>
							<select name="co_Type" id="co_Type">
								<option value=>게시판 선택</option>
								<option value="식단">식단</option>
								<option value="운동">운동</option>
								<option value="팁 & 노하우">팁 & 노하우</option>
								<option value="고민 & 질문">고민 & 질문</option>
								<option value="관리자에게">관리자에게</option>
							</select>
						</td>
					</tr>
					<tr>
					<th>제목</th>
						<td>
							<input class="form-control" type="text" name="co_Title" id="co_Title" required style="width:306px">
						</td>
					</tr>
					<tr>
					<th>첨부파일1</th>
					    <td>
					      <div class="custom-file">
				            <input type="file" class="inputfile" name="upFile" id="upFile1" multiple>
				            <label class="custom-file-label" for="upFile1"></label>
				          </div>
					    </td>		
					</tr>
					<tr>
					<th>첨부파일2</th>
					    <td>
					      <div class="custom-file">
			   	            <input type="file" class="inputfile" name="upFile" id="upFile2">
				            <label class="custom-file-label" for="upFile2"></label>
				          </div>
					    </td>		
					</tr>
		        	<tr>
		            <th>내용</th>
		             <td>
		                <textarea class="form-control" name="co_Content" placeholder="내용" required style="height:250px; resize: none;"></textarea>
		        	 </td>
		        	</tr>
		        </table>
				<br />
				<div>
				   <button class="btn btn-default" id="btnBack"><a href="${pageContext.request.contextPath}/board/coList.do" style="color: #333; align:left;">목록으로</a></button> &nbsp;
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
</body>
</html>