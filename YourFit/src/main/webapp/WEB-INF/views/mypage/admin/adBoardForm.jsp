<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>광고 작성</title>
<link href="${pageContext.request.contextPath}/resources/css/dt_form.css" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

</head>
<body>
	<section class="section wb">
            <div class="container">
                <div class="row">
                    <div class="col-lg-1 col-md-1"></div>
                    
                    <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12">
                        <div class="page-wrapper">
                        	 <h3 class="content"><i class="fa fa-pencil-square-o" aria-hidden="true" style="margin-right: 10px;"></i>광고 등록</h3>
								<form action="${pageContext.request.contextPath}/adboard/adBoardFormEnd.do"
				      				  method="post" onsubmit="return validate();" enctype="multipart/form-data">
						      		<input type="hidden" name="ad_Mno" value="${member.m_No }" />
								    <table  class="sub_news" border="1px solid gray" align="center" >
								      	<tr>
								      		<th>제목</th>
								      		<td>
								      			<input class="form-control" type="text" id="ad_Title" name="ad_Title" placeholder="광고 제목을 입력하세요." />
								      		</td>
								      	</tr>
								      	<tr>
								      		<th>작성자</th>
											<td readonly style="padding-left: 17px;">${ member.m_Nick }</td>     		
								      	</tr>
										<tr>
								      		<th>마감 기한</th>
								      		<td>
								      			<input type="date" name="ad_Date" id="ad_Date" required/>
								      		</td>
								      	</tr>
								      	<tr>
								      		<th>첨부 파일</th>
								      		<td>&nbsp;<input type="file" name="upfiles" id="upfiles" onchange="loadImg(this);" accept="image/*"/></td>
								      	</tr>
								      	<tr>
								      		<th>미리 보기</th>
								      		<td>
								      			<img id="contentImg1" width="400px;" height="300px;"/>
								      		</td>
								      	</tr>
										<tr>
								      		<th>내용</th>
								      		<td>
								      			<textarea class="form-control" id="ad_Content" name="ad_Content" placeholder="내용을 입력하세요." required></textarea>
								      		</td>
								      	</tr>
								    </table>
								    
								    <br/>
								    <div>
								      	<button class="btn btn-default" id="btnSave" type="submit">등록</button>
								      	<button class="btn btn-default" id="btnDel" type="button" onclick="reset_form();">취소</button>								 
								    </div>
								</form>
								
                        </div><!-- end page-wrapper -->
                    </div><!-- end col -->
                    <div class="col-lg-1 col-md-1"></div>
                </div><!-- end row -->
            </div><!-- end container -->
        </section>
<script src="${pageContext.request.contextPath }/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
<script>
	function reset_form(){
		if(confirm("입력을 취소하고 돌아가시겠습니까?") == true){
			self.close();	
		} else{
			$("#ad_Title").val("");
			$("#upfiles").val("");
			$("#ad_Content").val("");
		}
	}
	
	function validate(){
		if($.trim($("#ad_Title")).length==0){
			alert("제목을 입력하세요");
			$("#ad_Title").focus();
			return false;
		} else if($("#upfiles").val()==""){
			alert("이미지 파일을 선택해 주세요.");
			return false;
		}
		return true;
	}

	function loadImg(img){

		if(img.files && img.files[0]){

			var reader = new FileReader();

			reader.onload = function(e){
				$('#contentImg1').attr('src',e.target.result);
			}
			reader.readAsDataURL(img.files[0]);
		}
	}

	$('#ad_date').attr('min',new Date().toISOString().substring(0,10));
</script>
</body>
</html>