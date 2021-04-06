<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<script src="${pageContext.request.contextPath }/resources/js/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/co_detail.css" rel="stylesheet">
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세보기</title>
<script type="text/javascript" src="경로"></script>

	<script>
	
	
		function fileDownload(oName, rName){
			//한글파일명이 있을 수 있으므로, 명시적으로 encoding
			oName = encodeURIComponent(oName);
			location.href="${pageContext.request.contextPath}/board/fileDownload.do?oName="+oName+"&rName="+rName;
		}
	</script>
	
	<script>

	$(function(){

		listReply();
		
	 $("#btnReply").click(function(){
		        
			    var coContent = $("#coContent").val();    //댓글의 내용
			    var memberMno =  ${member.m_No};    // 세션에서 멤버 no가져와야함
			    
			    
			    var co_No = '${co_board.co_No}';
			   /*  var params = {"coContent" : coContent, "member_bno" : member_bno}; */
			    var params = {"coContent" : coContent, "memberMno" : memberMno, "co_No" : co_No};
			    
			    $.ajax({
			        type: "post", //데이터를 보낼 방식
			        url: "${pageContext.request.contextPath}/board/commentinsert.do", //데이터를 보낼 url
			        data: params, //보낼 데이터
			        
			        success: function(data){//데이터를 보내는 것이 성공했을 시 출력되는 메시지
			            alert("댓글이 등록되었습니다.");
			            location.reload();
			                }
			            });
			        });

	//댓글 목록을 출력하는 함수
	 function listReply(){

		 var co_No = '${co_board.co_No}';
		 var params = {"co_No" : co_No};
	     $.ajax({
	         type: "post",    //get방식으로 자료를 전달
	         url: "${pageContext.request.contextPath}/board/commentlist.do",    //컨트롤러에 있는 commentlist.do로 맵핑되고 게시글 번호도 같이 보낸다.
	         data : params,
	         
	         success: function(result){    //자료를 보내는것이 성공했을때 출력되는 메시지
	        	console.log(bclist);
	        	console.log(board_comment);
	             
	             //댓글목록을 실행한 결과를 가져온다.
	         $("#listReply").html(result);
	             }
	         });
	 }
     
	});

	</script>
	
	<script>


	    //댓글 삭제
	   function commentdelete(obj){
			var bc_no = $(obj).siblings('input').val();

			var co_no = '${co_board.co_No}';
			alert("삭제가 완료되었습니다!");

			location.href="${pageContext.request.contextPath}/board/commentdelete.do?bc_no="+bc_no+"&co_no="+co_no;
		   };

		   // 수정하기 버튼
	    function commentup(obj){
			  $(obj).siblings('textarea').removeAttr('readonly');
			  $(obj).siblings('#commentupdate').css('display','inline');
			  $(obj).css('display','none');
		};

		// 수정 완료버튼
		function commentupdate(obj){
			var bc_content =  $(obj).siblings('textarea').val();
			var bc_no = $(obj).siblings('input').val();
			var co_no = '${co_board.co_No}';
			
			location.href="${pageContext.request.contextPath}/board/commentupdate.do?bc_no="+bc_no+"&bc_content="+bc_content+"&co_no="+co_no;	
		alert("수정이 완료되었습니다!");
		}
	


	</script>
	
</head>
<body>
<c:import url="../common/header.jsp"/>
	  <section class="section wb">
         <div class="container">
             <div class="row">
               <div class="col-lg-1 col-md-1"></div>
           
               <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12" style="padding: 0px;">
                <div class="page-wrapper">
                <h3 class="content"><i class="fa fa-file-text-o" aria-hidden="true" style="margin-right: 10px;"></i>커뮤니티 상세보기</h3>
           
                  <table class="tableDetail">
                    <tr>
						<td style="background-color:#e4efeb; color:#333;">
						   <h4 id="h4">${co_board.co_Title}</h4>
						</td>
					</tr>
					<tr>
						<td><i id="td_icon" class="fa fa-user-o" aria-hidden="true"></i>${co_board.nick}</td>
					</tr>
					<tr>
						<td>
						  <i id="td_icon" class="fa fa-calendar-check-o" aria-hidden="true"></i>${co_board.co_Date} &nbsp;&nbsp;
						  <i id="td_icon" class="fa fa-eye" aria-hidden="true"></i>${co_board.co_Count}
						</td>						
					</tr>
					<tr>
						<td style="height: 50px;">
						  <c:forEach items="${board_file}" var="b" varStatus="vs">
			             	<button type="button" onclick="fileDownload('${b.f_Name }','${b.f_Cname }');">첨부파일 ${b.f_Name }</button>
			              </c:forEach>
						</td>
					</tr>
                    <tr>
						<td id="content_td">
						   <textarea id="n_content" class="form-control" name="co_Content" readonly required>${co_board.co_Content}</textarea>
                        </td>
					</tr>
                  </table>
            <br>
		    <button class="btn btn-outline-info" id="btnBack" type="button" onclick="location.href='${pageContext.request.contextPath}/board/coList.do'">목록으로</button>
		     <c:if test="${member.m_No eq co_board.co_Mno}">  <!-- 1이 아닌 세션에서 회원 불러와 비교예정 -->
			<button class="btn btn-outline-info" id="btnSave" type="button" onclick="location.href='${pageContext.request.contextPath}/board/boardUpdateView.do?co_No=${co_board.co_No}'">수정</button>
			 </c:if>
		 </div>
	
		<!-- 댓글 area -->
		<br /><br />
		 <div id="commlist" style="border: 10px solid #e4efeb;">
			<h4 class="content"><i class="fa fa-commenting-o" aria-hidden="true" style="margin-right: 10px;"></i>댓글 작성</h4>
		
		  <div id="comment-write">
		  	<form action=""></form>
		  	   <div class="row">
				<div class="col-md-10" style="padding-right: 0px;">
					<textarea class="comment" name="coContent" id="coContent" placeholder="댓글을 입력해주세요."></textarea>
				</div>
	  			<div class="col-md-2" style="padding-right: 0px;">
	  				<button type="button" id="btnReply" class="commentbtn">전송</button> 
	  			</div>
	  		  </div>
	  		</form>
	      </div>
	      
	      <hr>
	     <!-- <h4 class="content"><i class="fa fa-commenting" aria-hidden="true" style="margin-right: 10px;"></i>댓글 목록</h4> -->
	     <c:forEach items="${bclist}" var="bc"> 
	     	<div>
	     		  ${bc.bc_Date } ${bc.nick }
	     		  <textarea id="co_Content" name="bc_Content" readonly>${bc.bc_Content }</textarea>
	     		
	     		  <input type="hidden" id="bc_No" name="bc_No" value="${bc.bc_No }" />
	     		  <input type="hidden" id="bc_Mno" name="bc_Mno" value="${bc.bc_Mno }" />
	     	
	     		<c:if test="${member.m_No eq bc.bc_Mno}">
		     	  <button type ="button" id="commentup" onclick="commentup(this);">댓글 수정</button>
		     	  <button type="button" id="commentupdate" onclick="commentupdate(this);" style="display:none;">수정 완료</button>
		     	  <button type ="button" id="commentdelete" onclick="commentdelete(this);">댓글 삭제</button>
	     		</c:if>
	     		<br><br>
	     	</div>	
         </c:forEach>
            <div id="listReply"> </div>

            </div>
           <div class="col-lg-1 col-md-1"></div>
         </div>
       </div>
    </section>
    
    <div class="dmtop">Scroll to Top</div>
    
<c:import url="../common/footer.jsp"/>
</body>
</html>