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
	<title>문의 내용 작성</title>

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
                <div class="col-lg-3 col-md-3"></div>
                    
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <div class="page-wrapper">
                 <h3 class="content"><i class="fa fa-question-circle-o" aria-hidden="true" style="margin-right: 10px;"></i>문의 내용 작성하기</h3>		
																										
		        <form name="boardFrm" action="/yourfit/product/QuestionFormEnd.do" method="post" >
			    <input type="hidden" name="q_Mno" value="${Question.q_Mno }" readonly />
			    <input type="hidden" name="q_Pno" value="${Question.q_Pno }" readonly />
               
                <table class="sub_news" border="1px solid gray" align="center">
					<tr>
					<th id="column_row" style="width:100px;">제목</th>
						<td>
							<input class="form-control" type="text" name="q_Title" id="q_Title" style="width: 100%">
						</td>
					</tr>
					<tr>
				    <th>내용</th>
				       <td>
				         <textarea class="form-control" name="q_Content" placeholder="내용을 입력하세요." required style="height:250px; resize: none;"></textarea>
				       </td>
				    </tr>
				</table>
				<br>
				 <div>
				    <input type="submit" class="btn btn-outline-success" id="btnSave" value="저장">
				    <button class="btn btn-primary" id="btnReset" type="button" onclick="location.href='${pageContext.request.contextPath}/product/productView.do?no=${Question.q_Pno}'">취소</button>
			     </div>
			</form>
		</div>
	    </div>
	   <div class="col-lg-3 col-md-3"></div>
      </div><!-- end row -->
     </div><!-- end container -->
    </section>
  <c:import url="../common/footer.jsp"/>
  
</body>
</html>