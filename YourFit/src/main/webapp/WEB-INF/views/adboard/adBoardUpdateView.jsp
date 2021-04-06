<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>광고 수정</title>
<link href="${pageContext.request.contextPath}/resources/css/dt_form.css" rel="stylesheet">

</head>
<body>	
	<c:import url="../common/header.jsp"/>
	
		
	<section class="section wb">
        <div class="container">
           <div class="row">
             <div class="col-lg-2 col-md-2"></div>

             <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
               <div class="page-wrapper">
               <h3 class="content"><i class="fa fa-pencil-square-o" aria-hidden="true" style="margin-right: 10px;"></i>광고 수정 화면</h3>
				
				<form action="${pageContext.request.contextPath}/adboard/adBoardUpdate.do"
				      method="post" onsubmit="return validate();" enctype="multipart/form-data">
				     <input type="hidden" name="ad_No" value="${ adboard.ad_No }"/>
		      		
				    <table  class="sub_news" border="1px solid gray" align="center" >
				      	<tr>
				      		<th style="vertical-align: middle;">제목</th>
				      		<td colspan="10"><input type="text" size="150" class="form-control tinput" name="ad_Title" value="${adboard.ad_Title} " style="width:100%;"  placeholder="제목을 입력하세요." /></td>
				      	</tr>
				      	<tr>
				      		<th style="vertical-align: middle;">작성자</th>
							<td colspan="10" name="nick">${ adboard.nick } </td>     		
				      	</tr>
				      	<tr>
				      		<th style="vertical-align: middle;">마감 기간</th>
							<td colspan="10" name="date">
								<input type="date" name="ad_Date" id="ad_Date" value="${ adboard.ad_Date }" required/>
							</td>     		
				      	</tr>
				      	<tr>
				      		<th style="vertical-align: middle;">첨부 파일</th>
				      		<td colspan="10">
				      		<c:forEach items="${boardfileList }" var="a" varStatus="vs">
				      				<span id="f_name">${a.f_Name}</span>
				      		</c:forEach>
				      			&nbsp;
				      			<input type="file" name="upfiles" id="upfiles" style="display: none;" accept="image/*"/>
				      			<button type="button" id="f_change">파일 변경</button>
				      		</td>
				  
				      	</tr>
				      	<tr>
				      		<th style="vertical-align: middle;">파일 미리보기</th>
				      		<td colspan="10">
				      		<c:forEach items="${boardfileList }" var="a" varStatus="vs">
				      		<div id="f_picture">
				      			<img src="${pageContext.request.contextPath}/resources/adboardUpload/${a.f_Cname}" class="img-fluid" style="height:300px; width:400px;">
				      		</div>
				      		</c:forEach>
				      			<img src="" alt="" id="change_picture" style="display: none; height:300px; width:400px;"/>
				      		</td>
				      	</tr>
						<tr style="overflow-y:auto;text-align:left;">
				      		<th style="vertical-align: middle;">내용</th>
				      		<td colspan="10">
				      			<textarea name="ad_Content" 
				      				style="resize:none; height: 100px; width:100%;" class="form-control cinput" placeholder="내용을 입력하세요." required>${adboard.ad_Content}</textarea>
				      		</td>
				      	</tr>
				    </table>
				    
				    <br/>
				    <div>
				      	<button class="btn btn-default" id="btnSave" type="submit">수정완료</button>
				      	<button class="btn btn-default" type="reset" id="btnReset" onclick="location.href='${pageContext.request.contextPath}/adboard/adBoardView.do?${adboard.ad_No}'">취소</button>		
				    	<input type="button" class="btn btn-outline-danger" id="btnDel" onclick="move_delte('${adboard.ad_No}');" value="삭제"/>				    	
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

<script>
	function validate(){
		var content = $("[name=ad_Content]").val();
		if(content.trim().length==0){
			alert("내용을 입력하세요");
			return false;
		}
		return true;
	}
	

	$("#f_change").click(function(){

		var f_changer = confirm("파일을 변경 하시겠습니까?");

		if(f_changer==true){

			$("#f_name").text("");		
			$("#f_picture").css('display', 'none');
			$("#change_picture").css('display','');
			$("#upfiles").click();
		};

	});

	$("#upfiles").change(function(){

		$("#f_name").text($('input[type=file]')[0].files[0].name);

		if(this.files && this.files[0]){

			var reader = new FileReader();

			reader.onload = function(e){
				$('#change_picture').attr('src',e.target.result);
			}
			reader.readAsDataURL(this.files[0]);
		}
	});

	function move_delte(ad_No){

		var delte_op = confirm("정말 삭제 하시겠습니까?");

		if(delte_op==true){
			location.href='${pageContext.request.contextPath}/adboard/adBoardDelete.do?'+ad_No
		}
	};
</script>

</body>
</html>