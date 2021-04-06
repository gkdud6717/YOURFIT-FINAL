<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
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
	
	/*부트스트랩 : file 변경시 파일명 보이기 */
	$(function(){
		$('[name=upfiles]').on('change',function(){
		    //var fileName = $(this).val();//C:\fakepath\파일명
		    //var fileName = this.files[0].name;//파일명(javascript)
		    //var fileName = $(this)[0].files[0].name;//파일명(jquery)
		    var fileName = $(this).prop('files')[0].name;//파일명(jquery)
			//console.log($(this).prop('files'));//FileList {0: File(54955), length: 1}
		    console.log($(this).val());
		    $(this).next('.custom-file-label').html(fileName);
		})
	});
	function fileDelete(obj, fNo, cName){
		$.ajax({
			url : '${pageContext.request.contextPath}/dtboard/dtfileDelete.do',
			data : { fNo : fNo, cName : cName }, 
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
               <h3 class="content"><i class="fa fa-pencil-square-o" aria-hidden="true" style="margin-right: 10px;"></i>다이어트 꿀팁 수정 화면</h3>
				
				<form action="${pageContext.request.contextPath}/dtboard/dtBoardUpdate.do"
				      method="post" onsubmit="return validate();" enctype="multipart/form-data">
				     <input type="hidden" name="dt_No" value="${ dtboard.dt_No }"/>
		      		
				    <table  class="sub_news" border="1px solid gray" align="center" >
				      	<tr>
				      		<th style="vertical-align: middle;">제목</th>
				      		<td colspan="10"><input type="text" size="150" class="form-control tinput" name="dt_Title" value="${dtboard.dt_Title} " style="width:100%;"  placeholder="제목을 입력하세요." /></td>
				      	</tr>
				      	<tr>
				      		<th style="vertical-align: middle;">작성자</th>
							<td colspan="10" name="nick">${ dtboard.nick } </td>     		
				      	</tr>
				      	<tr>
				      		<th style="vertical-align: middle;">첨부 파일</th>
				      		<td colspan="10">
				      			&nbsp;<input type="file" name="upfiles" id="upfiles" />
				      			
				      		</td>
				  
				      	</tr>
						<tr style="overflow-y:auto;text-align:left;">
				      		<th style="vertical-align: middle;">내 용</th>
				      		<td colspan="10">
				      			<textarea name="dt_Content" 
				      				style="resize:none; height: 350px; width:100%;" class="form-control cinput" placeholder="내용을 입력하세요." required>${dtboard.dt_Content}</textarea>
				      		</td>
				      	</tr>
				    </table>
				    
				    <br/>
				    <div>
				    	<button class="btn btn-default" id="btn-back" type="button" onclick="location.href='${pageContext.request.contextPath}/dtboard/dtBoardList.do'" style="align:left;">목록으로</button>
				      	<button class="btn btn-default" id="btnSave" type="submit">수정완료</button>
				      	<button class="btn btn-default" type="reset" id="btnReset" onclick="location.href='${pageContext.request.contextPath}/dtboard/dtBoardView.do?no=${dtboard.dt_No}'">취소</button>		
				    	<input type="button" class="btn btn-outline-danger" id="btnDel" value="삭제" onclick="location.href='${pageContext.request.contextPath}/dtboard/dtBoardDelete.do?dt_No=${dtboard.dt_No}'"/>				    	
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
</body>
</html>