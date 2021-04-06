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
	<title>상품 게시글 수정</title>

	<style>
		div#board-container{width:400px; margin:0 auto; text-align:center;}
		div#board-container input{margin-bottom:15px;}
		/* 부트스트랩 : 파일라벨명 정렬*/
		div#board-container label.custom-file-label{text-align:left;}
	</style>
		<script>
	
	
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
                 <h3 class="content">상품 수정 화면</h3>
		     	
		     	<form name="productFrm" action="${pageContext.request.contextPath}/product/productUpdate.do" method="post" onsubmit="return validate();" enctype="multipart/form-data">
				<input type="hidden" name="p_No" value="${product.p_No }" />
				
				
			<table class="sub_news" border="1px solid gray" align="center">	
			     <tr>
			     <th id="roww">상품분류</th>
						<td>
						  <select name="p_Type" id="p_Type" style="height: 30px;">
								<option value=>게시판 선택</option>
                        <c:choose>
                           <c:when test="${product.p_Type eq 'Living' }">
                              <option value="Living" selected="selected">Living</option>
                              <option value="Food/Health">Food/Health</option>
                              <option value="Beauty">Beauty</option>
                           </c:when>
                           <c:when test="${product.p_Type eq 'Food/Health' }">
                              <option value="Living">Living</option>
                              <option value="Food/Health" selected="selected">Food/Health</option>
                              <option value="Beauty">Beauty</option>
                           </c:when>
                           <c:otherwise>
                              <option value="Living">Living</option>
                              <option value="Food/Health">Food/Health</option>
                              <option value="Beauty" selected="selected">Beauty</option>
                           </c:otherwise>
                        </c:choose>
                     </select>
						</td>
			     </tr>
			     <tr>
					<th id="roww">상품이름</th>
						<td>
							<input class="form-control" type="text" name="p_Name" id="p_Name" value="${product.p_Name}" required style="width:300px">
						</td>
				</tr>
				<tr>
					<th id="roww">가격</th>
						<td>
							<input class="form-control" type="text" name="p_Price" id="p_Price" value="${product.p_Price}"style="width:300px">
						</td>
					</tr>
				    <tr>	
				<c:forEach items="${product_img}" var="p" varStatus="vs">
					 <th></th>
						<td><button type="button" class="btn btn-outline-success col-8"
							onclick="fileDownload('${p.i_OriginName}','${p.i_ChangeName}');" download>
						      ${p.i_OriginName}</button>
					        <button type="button" class="btn btn-outline-danger col-3"
							onclick="fileDelete(this,'${p.i_No}', '${p.i_ChangeName}');">파일 삭제</button>
					    </td>
				</c:forEach>
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
				         <textarea class="form-control" name="p_Content"  id="p_Content" placeholder="내용을 입력하세요." required>${product.p_Content}</textarea>
				      </td>
				   </tr>
				 </table>
				 
				   <br />
				    <div>
				    	<button class="btn btn-default" id="btn-back" type="button" onclick="location.href='${pageContext.request.contextPath}/product/productList.do'" style="align:left;">목록으로</button>
				      	<button class="btn btn-default" id="btnSave" type="submit">수정완료</button>
				      	<button class="btn btn-default" type="reset" id="btnReset" onclick="location.href='${pageContext.request.contextPath}/product/productView.do?no=${product.p_No}'">취소</button>		
				    	<input type="button" class="btn btn-outline-danger" id="btnDel" value="삭제" onclick="location.href='${pageContext.request.contextPath}/product/productDelete.do?p_No=${product.p_No}'"/>				    	
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