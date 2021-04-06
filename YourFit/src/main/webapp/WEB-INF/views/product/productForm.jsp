<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<script src="${pageContext.request.contextPath }/resources/js/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/product_form.css" rel="stylesheet">
<html>
<head>
	<meta charset="UTF-8">
	<title>상품 게시물 작성</title>

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
                 <h3 class="content"><i class="fa fa-pencil-square-o" aria-hidden="true" style="margin-right: 10px;"></i>상품 등록 화면</h3>
																												
			    <form name="productFrm" action="${pageContext.request.contextPath}/product/productFormEnd.do" method="post" onsubmit="return validate();" enctype="multipart/form-data">
			 
				<table class="sub_news" border="1px solid gray" align="center">
					<tr>
						<th id="roww">상품분류</th>
						<td>
							<select name="p_Type" id="p_Type" style="height: 30px;">
								<option value=>게시판 선택</option>
								<option value="Living">Living</option>
								<option value="Food/Health">Food/Health</option>
								<option value="Beauty">Beauty</option>
								
							</select>
						</td>
					</tr>
					<tr>
					<th id="roww">상품이름</th>
						<td>
							<input class="form-control" type="text" name="p_Name" id="p_Name"  placeholder="상품이름을 입력하세요." style="width:300px">
						</td>
					</tr>
					<tr>
					<th id="roww">가격</th>
						<td>
							<input class="form-control" type="text" name="p_Price" id="p_Price"  placeholder="숫자만 입력하세요." style="width:300px">
						</td>
					</tr>
				   <tr>
				   <th>첨부파일1</th>
				       <td>
				          <input type="file" class="inputfile" name="upfiles" id="upFile1" multiple>
				          <label class="custom-file-label" for="upFile1"></label>
				       </td>
				   </tr>
				   <tr>
				   <th>첨부파일2</th>
				       <td>
				          <input type="file" class="inputfile" name="upfiles" id="upFile2">
				          <label class="custom-file-label" for="upFile2"></label>
				       </td>
				   </tr>
				   <tr>
				   <th>내용</th>
				      <td>
				         <textarea class="form-control" name="p_Content"  id="p_Content" placeholder="내용을 입력하세요." required></textarea>
				      </td>
				   </tr>
				 </table>
				<br />
				<div>
				   <button class="btn btn-primary" id="btnBack" type="button"><a href="${pageContext.request.contextPath}/product/productList.do" style="color: #333; align:left;">목록으로</a></button>
				   <input type="submit" class="btn btn-outline-success" id="btnSave" value="저장" >
				   <button class="btn btn-default" id="btnDel" type="reset" >취소</button>
			    </div>
			</form>
	 	 </div>
	    </div>
	   <div class="col-lg-2 col-md-2"></div>
      </div><!-- end row -->
     </div><!-- end container -->
    </section>
  <c:import url="../common/footer.jsp"/>
</body>
</html>