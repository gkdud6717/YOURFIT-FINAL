<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<script src="${pageContext.request.contextPath }/resources/js/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/dt_form.css" rel="stylesheet">
<meta charset="UTF-8">
<title>게시글 수정</title>

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
<html>
<head>

	<script>
	
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
                 <h3 class="content"><i class="fa fa-pencil-square-o" aria-hidden="true" style="margin-right: 10px;"></i>홈트레이닝 수정 화면</h3>
  																											
		    	<form name="boardForm" action="${pageContext.request.contextPath}/HomeTraining/boardUpdate.do" 
		    	      method="post" onsubmit="return validate();" enctype="multipart/form-data">
		    	<input type="hidden" name="ht_No" value="${ht_board.ht_No }" />
		    	<input type="hidden" name="ht_Mno" value="${member.m_No}" readonly>
				<table class="sub_news" border="1px solid gray" align="center">
					<tr>
						<th id="roww">카테고리</th>
						<td>
							<select name="ht_Type"  id="ht_Type" value="하체">
								<option value=>게시판 선택</option>
								<option value="전신">전신</option>
								<option value="복부">복부</option>
								<option value="상체">상체</option>
								<option value="하체">하체</option>
								<option value="스트레칭">스트레칭</option>
							</select>
						</td>
					</tr>
					<tr>
					<th id="roww">SRC주소</th>
						<td>
							<input class="form-control" type="text" name="ht_Src" id="ht_Src" style="width:300px;" value="${ht_board.ht_Src}" />
						</td>
					
					</tr>
					<tr>
					<th id="roww">영상 길이</th>
						<td>
							<input class="form-control" type="text" name="ht_Time" id="ht_Time" style="width:280px" value="${ht_board.ht_Time}" />
						</td>
					</tr>
					<tr>
					<th id="roww">운동 부위</th>
						<td>
							 <select name ="ht_Part" id="ht_Part" style="width:150px;" value="댄스">
					            <option value="전신">전신</option>
					            <option value="상체">상체</option>
					            <option value="하체">하체</option>
					            <option value="요가">요가</option>
					            <option value="스트레칭">스트레칭</option>
					            <option value="댄스">댄스</option>
					        </select>
						</td>	
					</tr>
					<tr>
					<th id="roww">운동 레밸</th>
						<td>
							 <select name ="ht_Level" id="ht_Level" style="width:150px;" value="중">
					            <option value="상">상</option>
					            <option value="중">중</option>
					            <option value="하">하</option>
					        </select>
						</td>	
					</tr>
					<tr>
					<th id="roww">소모칼로리</th>
						<td>
							 <input class="form-control" type="text" name="ht_Cal" id="ht_Cal" style="width:280px" value="${ht_board.ht_Cal }">
						</td>	
					</tr>
					<th id="roww">제목</th>
						<td>
							<input class="form-control" type="text" name="ht_Title" id="ht_Title" style="width:280px"  value="${ht_board.ht_Title }">
						</td>
					</tr>
					<tr>
					<th>프로그램 소개</th>
					    <td>
					       <textarea class="form-control" name="ht_Intro" placeholder="프로그램 소개 (intro)를 입력해주세요." required style="height:70px; resize: none;">${ht_board.ht_Intro}</textarea>
					    </td>
					</tr>
					<tr>
					<th>내용</th>
					    <td>
					        <textarea class="form-control" name="ht_Content" placeholder="내용을 입력해주세요." required style="height:230px; resize: none;">${ht_board.ht_Content}</textarea>
					    </td>
					</tr>
				</table>
				
				<!-- input:file소스 : https://getbootstrap.com/docs/4.1/components/input-group/#custom-file-input -->
				<!-- style.css에서 div의  padding:10px을 제거함 -->
				<br />
				 <div>
				 	<button class="btn btn-primary" type="button" id="btn-back" onclick="location.href='${pageContext.request.contextPath}/HomeTraining/htList.do'" style="align:left;">목록으로</button>
				   	<button class="btn btn-default" id="btnSave" type="submit">수정완료</button> &nbsp;
				   	<button class="btn btn-primary" id="btnReset" type="button" onclick="location.href='${pageContext.request.contextPath}/HomeTraining/boardView.do?no=${ht_board.ht_No}'">취소</button>
				   	<input type="button" class="btn btn-outline-danger" id="btnDel" value="삭제" id="btnReset" onclick="location.href='${pageContext.request.contextPath}/HomeTraining/boardDelete.do?ht_No=${ht_board.ht_No}'"/>
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