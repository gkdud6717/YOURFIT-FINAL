<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/co_detail.css" rel="stylesheet">
<html>
<head>
<meta charset="UTF-8">
<title>게시물 상세보기</title>	

<script>

	$(function(){

		listReply();
		// 댓글 입력
	 $("#btnReply").click(function(){
		        
			    var coContent = $("#coContent").val();    //댓글의 내용
			    var memberMno =  ${member.m_No};    // 세션에서 멤버 no가져와야함
			    
			    
			    var dt_No = '${dtboard.dt_No}';
			   /*  var params = {"coContent" : coContent, "member_bno" : member_bno}; */
			    var params = {"coContent" : coContent, "memberMno" : memberMno, "dt_No" : dt_No};
			    
			    $.ajax({
			        type: "post", //데이터를 보낼 방식
			        url: "${pageContext.request.contextPath}/dtboard/commentInsert.do", //데이터를 보낼 url
			        data: params, //보낼 데이터
			        
			        success: function(data){//데이터를 보내는 것이 성공했을 시 출력되는 메시지
			            alert("댓글이 등록되었습니다.");
			            location.reload();
			                }
			            });
			        });

	//댓글 목록을 출력하는 함수
	 function listReply(){

		 var dt_No = '${dtboard.dt_No}';
		 var params = {"dt_No" : dt_No};
	     $.ajax({
	         type: "post",    //get방식으로 자료를 전달
	         url: "${pageContext.request.contextPath}/dtboard/commentlist.do",    //컨트롤러에 있는 commentlist.do로 맵핑되고 게시글 번호도 같이 보낸다.
	         data : params,
	         
	         success: function(result){    //자료를 보내는것이 성공했을때 출력되는 메시지
	        	 
		        	console.log(result);
		        	
		      var output = "<table>";
		      for(var i in result) {
					output += "<tr>";
					output += "<td>" + result[i].nick;
					output += "("+changeDate(result[i].bc_Date)+")<br>"; 
					output += result[i].bc_Content+"</td>";
					output += "</tr>";
						
			      }
					output += "</table";
					
	             //댓글목록을 실행한 결과를 가져온다.
	         $("#listReply").html(output);
	         }
	    });
	}

		function changeDate(date) {
			date = new Date(parseInt(date));
			year = date.getFullYear();
			month = date.getMonth();
			day = date.getDate();
			hour = date.getHours();
			minute = date.getMinutes();
			second = date.getSeconds();
			strDate = year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
			return strDate;
			}
     
});
	</script>
	<script>

	    //댓글 삭제
	   function commentdelete(obj){
			var bc_no = $(obj).siblings('input').val();

			var dt_no = '${dtboard.dt_No}';

			alert("삭제하시겠습니까?")
			location.href="${pageContext.request.contextPath}/dtboard/commentDelete.do?bc_no="+bc_no+"&dt_no="+dt_no;
				alert("삭제되었습니다.")
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
			var dt_no = '${dtboard.dt_No}';

			alert("수정하시겠습니까?")
			location.href="${pageContext.request.contextPath}/dtboard/commentUpdate.do?bc_no="+bc_no+"&bc_content="+bc_content+"&dt_no="+dt_no;	
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
                     <h3 class="content"><i class="fa fa-file-text-o" aria-hidden="true" style="margin-right: 10px;"></i>다이어트 꿀팁 > ${dtboard.dt_Type }</h3>

                   <table class="tableDetail">
                     <tr>
			     	   	<td style="background-color:#e4efeb; color:#333;">
			     	   	   <h4 id="h4">${dtboard.dt_Title}</h4>
			     	   	</td>
			     	 </tr>
			     	 <tr>
			     	   	<td>
			     	   	  <i id="td_icon" class="fa fa-user-o" aria-hidden="true"></i>${dtboard.nick } &nbsp;&nbsp;
			     	   	  <i id="td_icon" class="fa fa-eye" aria-hidden="true"></i>${dtboard.dt_Count } &nbsp;&nbsp;
			  	    	  <i id="td_icon" class="fa fa-comment" aria-hidden="true"></i>${dtboard.commentcount }
			  	    	</td>						
			  	      </tr>  
			  	      <tr>
			  	         <td>
			  	            <div class="single-post-media" style="height: 650px; width:100%;">
			  	              <a>
                              <c:forEach items="${boardfileList }" var="a" varStatus="vs">
                            	<c:if test="${ ! empty a.f_Cname }">
                                  <img src="${pageContext.request.contextPath}/resources/dtboardUpload/${a.f_Cname}" alt="" class="img-fluid" id="img_dt" >
                                </c:if>
							    <c:if test="${ empty a.f_Cname }">
								  <img src="${pageContext.request.contextPath}/resources/images/no_image.png" id="img_dt">
							    </c:if>
							   </c:forEach>
                            </div><!-- end media -->
                            </a>
			  	         </td>
			  	      </tr>
			  	       <tr>
			  	         <td style="height: 400px;">
			  	            <textarea id="dt_content" class="form-control" name="co_Content" readonly required>${dtboard.dt_Content}</textarea>
			  	         </td>
			  	      </tr>
			  	    </table>
                       
                    <br>
                    <button class="btn btn-outline-info" type="button" id="btnBack" onclick="location.href='${pageContext.request.contextPath}/dtboard/dtBoardList.do'">목록으로</button>
					<c:if test="${member.m_No eq dtboard.dt_Mno }">
					<button class="btn btn-outline-info" type="button" id="btnSave" onclick="location.href='${pageContext.request.contextPath}/dtboard/dtBoardUpdateView.do?dt_No=${dtboard.dt_No}'">수정</button>
					</c:if>        
							

                  <!-- 댓글 area -->
 	             <br /><br />
 	              <div id="commlist" style="border: 10px solid #e4efeb;">
 	             	<h4 class="content"><i class="fa fa-commenting-o" aria-hidden="true" style="margin-right: 10px;"></i>댓글 작성</h4>
 	             
 	               <div id="comment-write">
 	               	<form action="">
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
	            
                     <hr style="border: 3px dashed #e4efeb"/>
                     
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
                   
                
            	
		      </div>
             <div class="col-lg-1 col-md-1"></div>
           </div>
         </div>
      </section>
      
      
      
       <div class="dmtop">Scroll to Top</div>
      
  <c:import url="../common/footer.jsp"/>

</body>
</html>