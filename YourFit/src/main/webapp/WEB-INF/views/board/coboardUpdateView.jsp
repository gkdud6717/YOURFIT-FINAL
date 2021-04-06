<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<script src="${pageContext.request.contextPath }/resources/js/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/notice_form.css" rel="stylesheet">
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 게시글 수정</title>


<script>

    function validate(){
    	var content = $("[name=dt_Content]").val();
    	if(content.trim().length==0){
    		alert("내용을 입력하세요");
    		return false;
    	}
    	return true;
    }
	
	function fileDownload(oName, rName){
		//한글파일명이 있을 수 있으므로, 명시적으로 encoding
		oName = encodeURIComponent(oName);
		location.href="${pageContext.request.contextPath}/board/fileDownload.do?oName="+oName+"&rName="+rName;
	}

	function fileDelete(obj, attNo, rName){
		$.ajax({
			url : '${pageContext.request.contextPath}/board/fileDelete.do',
			data : { attNo : attNo, rName : rName }, 
			dataType : 'json',
			success : function(data){
				if(data == true) {
					alert("첨부파일 삭제 완료!");
					$(obj).parent().remove();
				} else {
					alert("첨부파일 삭제 실패!");
				}
			}, error : function(req, status, error){
				console.log(req);
				console.log(status);
				console.log(error);
			}
		});
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
               <h3 class="content"><i class="fa fa-pencil-square-o" aria-hidden="true" style="margin-right: 10px;"></i>커뮤니티 수정 화면</h3>																											
			
			  <form name="boardFrm" action="${pageContext.request.contextPath}/board/boardUpdate.do" method="post" onsubmit="return validate();" enctype="multipart/form-data">
			  <input type="hidden" name="co_No" value="${co_board.co_No }" />
				<table class="co_table">
					<tr>
					<th>제목</th>
						<td>
							<input class="form-control" type="text" name="co_Title" id="co_Title" value="${co_board.co_Title}" required style="width:306px">
						</td>
					</tr>
					<tr>
					<th>작성자</th>
						<td>
							${co_board.nick}
						</td>
					</tr>
					<th>기존 첨부파일</th>
						<td>
							<c:forEach items="${board_file}" var="b" varStatus="vs">
					         <div class="rows">
						      <button type="button" class="btn btn-outline-success col-8" onclick="fileDownload('${b.f_Name}','${b.f_Cname}');" download>${b.f_Name}</button>
					          <button type="button" class="btn btn-outline-danger col-3" onclick="fileDelete(this,'${b.f_No}', '${b.f_Cname}');">파일 삭제</button>
					         </div>
			            	</c:forEach>
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
		                <textarea class="form-control" name="co_Content" placeholder="내용" required style="height:250px; resize: none;">${co_board.co_Content}</textarea>
		        	 </td>
		        	</tr>
		        </table>
				<br />
				<div>
				   <button class="btn btn-primary" id="btn-back" type="button" onclick="location.href='${pageContext.request.contextPath}/board/coList.do'">목록으로</button>
				   <input type="submit" class="btn btn-default" id="btnSave" value="수정완료" /> &nbsp;
				   <button class="btn btn-primary" id="btnReset" type="button" onclick="location.href='${pageContext.request.contextPath}board/boardView.do?co_No=${co_board.co_No}'">취소</button>
				   <input type="button" class="btn btn-outline-danger" id="btnDel" value="삭제" onclick="location.href='${pageContext.request.contextPath}/board/boardDelete.do?co_No=${co_board.co_No}'"/>
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