<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<script src="${pageContext.request.contextPath }/resources/js/jquery.min.js"></script>
<html>
<head>
<title>다이어트 칼럼</title>	
<style>
	
	.eye {
		color : red;
	}
	.titleFont {
		font-size = 30px;
	}
	.bc_Content{
		
		margin : auto;
	}
	
</style>
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
	             
	             //댓글목록을 실행한 결과를 가져온다.
	         $("#listReply").html(result);
	             }
	         });
	 }
     
	});

	</script>
	<script>


	    //댓글 삭제
	   function commentDelete(obj){
			var bc_no = $(obj).siblings('input').val();

			var dt_no = '${dtboard.dt_No}';

			alert("삭제하시겠습니까?")
			location.href="${pageContext.request.contextPath}/dtboard/commentDelete.do?bc_no="+bc_no+"&dt_no="+dt_no;
				alert("삭제되었습니다.")
			   };

		   // 수정하기 버튼
	    function commentup(obj){
			  $(obj).siblings('textarea').removeAttr('readonly');
			  $(obj).siblings('#commentUpdate').css('display','inline');
			  $(obj).css('display','none');
		};

		// 수정 완료버튼
		function commentUpdate(obj){
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
                    <div class="col-lg-10 offset-lg-1">
                        <div class="page-wrapper">
                            <div class="blog-title-area text-center">
                               <!--   <ol class="breadcrumb hidden-xs-down">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item"><a href="#">Blog</a></li>
                                    <li class="breadcrumb-item active">The golden rules you need to know for a positive life</li>
                                </ol> -->

                                <span class="color-aqua"><a href="blog-category-01.html" title="">다이어트 칼럼</a></span>

                                <h4>${dtboard.dt_Title}</h4>

                                <div class="blog-meta big-meta" id="titleFont">
                                   <a href="single.html" title="">${dtboard.dt_Type }  </a>
                                   <img src="${pageContext.request.contextPath}/resources/images/bar.PNG">
                                    <a href="blog-author.html" title="">${member.m_Nick }  </a>
                                    <img src="${pageContext.request.contextPath}/resources/images/bar.PNG">
                                    <a href="#" title=""><i class="fa fa-eye fa-2x"></i>${dtboard.dt_Count }</a>
                                     <img src="${pageContext.request.contextPath}/resources/images/bar.PNG"><img src="${pageContext.request.contextPath}/resources/images/reply.PNG">${dtboard.commentcount }
                                </div><!-- end meta -->
                                   <!--   <ul class="list-inline">
                                        <li><a href="#" class="fb-button btn btn-primary"><i class="fa fa-facebook"></i> <span class="down-mobile">Share on Facebook</span></a></li>
                                        <li><a href="#" class="tw-button btn btn-primary"><i class="fa fa-twitter"></i> <span class="down-mobile">Tweet on Twitter</span></a></li>
                                        <li><a href="#" class="gp-button btn btn-primary"><i class="fa fa-google-plus"></i></a></li>
                                    		-->
                                    </ul>
                                </div><!-- end post-sharing -->
                            </div><!-- end title -->
							
							
                            <div class="single-post-media">
                            	<c:forEach items="${boardfileList }" var="a" varStatus="vs">
                            	<c:if test="${ ! empty a.f_Cname }">
                                <img src="${pageContext.request.contextPath}/resources/dtboardUpload/${a.f_Cname}" alt="" class="img-fluid">
                                </c:if>
							<c:if test="${ empty a.f_Cname }">
									X
							</c:if>
							   </c:forEach>
                            </div><!-- end media -->

                            <div class="blog-content">  
                                <div class="pp">
                                    <p>${dtboard.dt_Content}  </p>
                                    
                                    <button class="btn btn-outline-info" type="button" onclick="location.href='${pageContext.request.contextPath}/dtboard/dtBoardList.do'">목록</button>
									<c:if test="${member.m_No eq dtboard.dt_Mno }">
									<button class="btn btn-outline-info" type="button" onclick="location.href='${pageContext.request.contextPath}/dtboard/dtBoardUpdateView.do?dt_No=${dtboard.dt_No}'">수정 페이지</button>
									</c:if>
                                  <!--  -<h3><strong>Maecenas non convallis quam, eu sodales justo. Pellentesque quis lectus elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</strong></h3>

                                    <p>Donec nec metus sed leo sollicitudin ornare sed consequat neque. Aliquam iaculis neque quis dui venenatis, eget posuere felis viverra. Ut sit amet feugiat elit, nec elementum velit. Sed eu nisl convallis, efficitur turpis eu, euismod nunc. Proin neque enim, malesuada non lobortis nec, facilisis et lectus. Ie consectetur. Nam eget neque ac ex fringilla dignissim eu ac est. Nunc et nisl vel odio posuere. </p>

                                    <p>Vivamus non condimentum orci. Pellentesque venenatis nibh sit amet est vehicula lobortis. Cras eget aliquet eros. Nunc lectus elit, suscipit at nunc sed, finibus imperdiet ipsum. Maecenas dapibus neque sodales nulla finibus volutpat. Integer pulvinar massa vitae ultrices posuere. Proin ut tempor turpis. Mauris felis neque, egestas in lobortis et, sodales non ante. Ut vestibulum libero quis luctus tempus. Nullam eget dignissim massa. Vivamus id condimentum orci. Nunc ac sem urna. Aliquam et hendrerit nisl massa nunc. </p>
										->  
                                </div><!-- end pp -->

                                <!--  <img src="upload/menu_05.jpg" alt="" class="img-fluid img-fullwidth"> -->

                                <div class="pp">
                                <!--    <h3><strong>Nam non velit est. Sed lobortis arcu vitae nunc molestie consectetur. Nam eget neque ac ex fringilla dignissim eu ac est. Nunc et nisl vel odio posuere. </strong></h3>

                                    <p>Vivamus non condimentum orci. Pellentesque venenatis nibh sit amet est vehicula lobortis. Cras eget aliquet eros. Nunc lectus elit, suscipit at nunc sed, finibus imperdiet ipsum. Maecenas dapibus neque sodales nulla finibus volutpat. Integer pulvinar massa vitae ultrices posuere. Proin ut tempor turpis. Mauris felis neque, egestas in lobortis et, sodales non ante. Ut vestibulum libero quis luctus tempus. Nullam eget dignissim massa. Vivamus id condimentum orci. Nunc ac sem urna. Aliquam et hendrerit nisl massa nunc. </p>

                                    <p>Morbi pharetra porta consequat. Aenean et diam sapien. <a href="#">Interdum et malesuada</a> fames ac ante ipsum primis in faucibus. Pellentesque dictum ligula iaculis, feugiat metus eu, sollicitudin ex. Quisque eu ullamcorper ligula. In vel ex ac purus finibus viverra. Maecenas pretium lobortis turpis. Fusce lacinia nisi in tortor massa nunc.</p>

                                    <ul class="check">
                                        <li>Integer sit amet odio ac lectus imperdiet elementum.</li>
                                        <li>Praesent vitae lacus sed lacus ullamcorper mollis.</li>
                                        <li>Donec vitae metus ac felis vulputate tincidunt non et ex.</li>
                                        <li>In dapibus sapien at viverra venenatis.</li>
                                        <li>Pellentesque mollis velit id maximus finibus.</li>
                                    </ul>

                                    <p>Proin ultricies nulla consectetur, sollicitudin dolor at, sollicitudin mauris. Maecenas at nunc nunc. Ut nulla felis, tincidunt et porttitor at, rutrum in dolor. Aenean id tincidunt ligula. Donec vitae placerat odio. Mauris accumsan nibh ut nunc maximus, ac auctor elit vehicula. Cras leo sem, vehicula a ultricies ac, condimentum vitae lectus. Sed ut eros euismod, luctus nisl eu, congue odio. </p>

                                    <p><img src="upload/blog_01.jpg" class="float-left" width="340" alt="">Suspendisse ultrices placerat dolor sed efficitur. Morbi in laoreet diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Mauris ut massa id lectus laoreet porta non in metus. Donec nibh justo, tincidunt non justo ut, tincidunt malesuada turpis. Cras pellentesque sollicitudin ex eget pharetra.</p>

                                    <h3><strong>Nam non velit est. Sed lobortis arcu vitae nunc molestie consectetur. Nam eget neque ac ex fringilla dignissim eu ac est. Nunc et nisl vel odio posuere. </strong></h3>


                                    <p>Aliquam eget maximus odio. Aliquam varius nisl ut leo fermentum, id fringilla magna tempus. Curabitur quis bibendum lorem, ut suscipit tellus. Morbi id dictum justo, et massa nunc. Mauris laoreet, neque et varius malesuada, justo neque consequat dolor, sit amet semper dui ligula commodo enim. Duis mauris magna, euismod in ante sed, laoreet faucibus elit. Nam euismod vulputate lorem, nec tincidunt lacus volutpat sit amet. In libero eros, dignissim vitae quam sed, maximus consectetur justo. Donec id orci eget odio convallis pellentesque. Quisque urna cras amet.Vivamus non condimentum orci. Pellentesque venenatis nibh sit amet est vehicula lobortis. Cras eget aliquet eros. Nunc lectus elit, suscipit at nunc sed, finibus imperdiet ipsum. Maecenas dapibus neque sodales nulla finibus volutpat. Integer pulvinar massa vitae ultrices posuere. Proin ut tempor turpis. Mauris felis neque, egestas in lobortis et, sodales non ante. Ut vestibulum libero quis luctus tempus. Nullam eget dignissim massa. Vivamus id condimentum orci. Nunc ac sem urna. Aliquam et hendrerit nisl massa nunc. </p>

                                    <p>Vivamus non condimentum orci. Pellentesque venenatis nibh sit amet est vehicula lobortis. Cras eget aliquet eros. Nunc lectus elit, suscipit at nunc sed, finibus imperdiet ipsum. Maecenas dapibus neque sodales nulla finibus volutpat. Integer pulvinar massa vitae ultrices posuere. Proin ut tempor turpis. Mauris felis neque, egestas in lobortis et, sodales non ante. Ut vestibulum libero quis luctus tempus. Nullam eget dignissim massa. Vivamus id condimentum orci. Nunc ac sem urna. Aliquam et hendrerit nisl massa nunc. </p>
                                </div><!-- end pp -->
                            </div><!-- end content -->

                            <div class="blog-title-area">
                            <!--    <div class="tag-cloud-single">
                                    <span>Tags</span>
                                    <small><a href="#" title="">lifestyle</a></small>
                                    <small><a href="#" title="">colorful</a></small>
                                    <small><a href="#" title="">trending</a></small>
                                    <small><a href="#" title="">another tag</a></small>
                                </div><!-- end meta -->

                                <div class="post-sharing">
                                <!--  <ul class="list-inline">
                                        <li><a href="#" class="fb-button btn btn-primary"><i class="fa fa-facebook"></i> <span class="down-mobile">Share on Facebook</span></a></li>
                                        <li><a href="#" class="tw-button btn btn-primary"><i class="fa fa-twitter"></i> <span class="down-mobile">Tweet on Twitter</span></a></li>
                                        <li><a href="#" class="gp-button btn btn-primary"><i class="fa fa-google-plus"></i></a></li>
                                    </ul>
                                </div><!-- end post-sharing -->
                            </div><!-- end title -->

                            

                            <hr class="invis1">

                            <div class="custombox clearfix">
                            	 
                                <h4 class="small-title">Comments</h4>
                                <c:forEach items="${bclist}" var="bc"> 
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="comments-list">
                                       
                                            <div class="media">
                                               <!--   <a class="media-left" href="#">
                                                    <img src="upload/author.jpg" alt="" class="rounded-circle">
                                                </a> -->
                                                <div class="media-body">
                                                	 	
                                                    <h4 class="media-heading user_name">${bc.nick } <small>${bc.bc_Date }</small></h4>
                                                    <textarea id="bc_Content" name="bc_Content" style="resize: none; " rows="3" cols="60"  readonly  >${bc.bc_Content }</textarea>
                                                   <!--   <a href="#" class="btn btn-primary btn-sm">Reply</a> -->
                                                   <input type="hidden" id="bc_No" name="bc_No" value="${bc.bc_No }" />
	     		  								   <input type="hidden" id="bc_Mno" name="bc_Mno" value="${bc.bc_Mno }" />
	     		  								   	
	     		     							   	<c:if test="${member.m_No eq bc.bc_Mno }">
	     		  								    <button type ="button" id="commentup" class="comment1" onclick="commentup(this);">댓글 수정</button>
		     	  							 		<button type="button" id="commentUpdate" class="comment1" onclick="commentUpdate(this);" style="display:none;">수정 완료</button>
		     	  							 		<button type ="button" id="commentDelete" class="comment2" onclick="commentDelete(this);">댓글 삭제</button>
                                                	</c:if>
                                </c:forEach>
                                                </div>
                                            </div>
                                            
                                            
                                            <div class="media">
                                              <!--   <a class="media-left" href="#">
                                                    <img src="upload/author_01.jpg" alt="" class="rounded-circle">
                                                </a>  -->
                                           <!-- <div class="media-body">

                                                    <h4 class="media-heading user_name">Baltej Singh <small>5 days ago</small></h4>

                                                    <p>Drinking vinegar stumptown yr pop-up artisan sunt. Deep v cliche lomo biodiesel Neutra selfies. Shorts fixie consequat flexitarian four loko tempor duis single-origin coffee. Banksy, elit small.</p>

                                                    <a href="#" class="btn btn-primary btn-sm">Reply</a>
                                                </div> --> 
                                            </div>
                                          <!--   <div class="media last-child">
                                                <a class="media-left" href="#">
                                                    <img src="upload/author_02.jpg" alt="" class="rounded-circle">
                                                </a>
                                                <div class="media-body">

                                                    <h4 class="media-heading user_name">Marie Johnson <small>5 days ago</small></h4>
                                                    <p>Kickstarter seitan retro. Drinking vinegar stumptown yr pop-up artisan sunt. Deep v cliche lomo biodiesel Neutra selfies. Shorts fixie consequat flexitarian four loko tempor duis single-origin coffee. Banksy, elit small.</p>

                                                    <a href="#" class="btn btn-primary btn-sm">Reply</a>
                                                </div>
                                            </div> --> 
                                        </div>
                                    </div><!-- end col -->
                                </div><!-- end row -->
                               
                            </div><!-- end custom-box -->

                            <hr class="invis1">
							</div>
							
					
                            <div class="custombox clearfix">
                            	<c:choose>
	     		  				<c:when test="${empty member}">
	     		  				<p>댓글 기능은 로그인 이후에 가능합니다.</p>
	     		  				<li class="list-inline-item"><a
		                           href="${pageContext.request.contextPath}/member/login.do"><i
		                              class="fa fa-user-circle-o"></i> 로그인</a></li>
		                        <li class="list-inline-item"><a href="#"><i
		                              class="fa fa-user-circle-o"></i> 회원가입</a></li>
		                    	 </c:when>
		                    	 <c:when test="${!empty member}">
                                <h4 class="small-title">Leave a Reply</h4>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <form class="form-wrapper">
                                            
                                            <textarea class="form-control" name="coContent" id="coContent" placeholder="Your comment"></textarea>
                                            <button type="button" class="btn btn-primary" id="btnReply">Submit Comment</button>
                                      </c:when>    
                                      </c:choose>  
                                        </form>
                                    </div>
                                </div>
                               </div>
                            
                             </div>
                             <div id="listReply"></div>
                            </div>
                           
                        </div><!-- end page-wrapper -->
                    </div><!-- end col -->
                </div><!-- end row -->
            </div><!-- end container -->
        </section>

        

        <div class="dmtop">Scroll to Top</div>
        
    </div><!-- end wrapper -->
    
     <c:import url="../common/footer.jsp"/>

     <!-- Core JavaScript
    ================================================== -->
    <script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
    <script src="<c:url value="/resources/js/tether.min.js"/>"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
    <script src="<c:url value="/resources/js/custom.js"/>"></script>

</body>
</html>
    
</body>
</html>