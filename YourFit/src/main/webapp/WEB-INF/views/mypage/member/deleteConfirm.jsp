<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 페이지</title>
<link href="${pageContext.request.contextPath}/resources/css/mypage.css" rel="stylesheet">
<script>
	function fn_deleteCheck(){
		if($("input:checkbox[name=cancelyn]").is(":checked") == true) {
			location.href = "${pageContext.request.contextPath}/mypage/deleteMember.do?m_Id=${member.m_Id}";
		} else {
			alert("탈퇴 동의를 체크해주세요.");
		}
	}
</script>
<style>
li, p {
	text-align: left!important;
}
.ul {
	padding: 10px 0px 20px 10px;
}
</style>
</head>
<body>
<c:import url="../../common/header.jsp"/>
	<section class="section wb">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-12 col-sm-12 col-xs-12">
                        <div class="sidebar">
                            <div class="widget widget-sidebar">
                                <h2 class="widget-title">마이페이지</h2>
                                <div class="link-widget">
                                    <ul>
                                        <li class="active-sidebar"><a href="${pageContext.request.contextPath}/mypage/memberMypage.do?m_No=${member.m_No}">회원 정보<span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/selectPostList.do?m_No=${member.m_No}">작성 글 관리 <span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/selectCommentList.do?m_No=${member.m_No}">작성 댓글 관리 <span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/memberOrderList.do?m_No=${member.m_No}">주문 내역 <span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/memberQuestionList.do?m_No=${member.m_No}">문의 내역 <span>></span></a></li>
                                    </ul>
                                </div><!-- end link-widget -->
                            </div><!-- end widget -->
                        </div><!-- end sidebar -->
                    </div><!-- end col -->

                    <div class="col-lg-9 col-md-12 col-sm-12 col-xs-12">
                        <div class="page-wrapper">
                        
                        <div class="memb_out_b">    
                        	<h2 class="content">계정 탈퇴 안내</h2>    
                        	<hr />   
			                <ul class="ul">
			                	<li>계정 탈퇴 시 <em>Yor Fit의 다이어트 정보/쇼핑몰</em> 모든 서비스에서 탈퇴가 이루어집니다.</li>
			                	<li>계정 탈퇴 시 쇼핑몰에서 해당 계정으로 주문한 주문내역 열람이 불가능합니다.</li>
			                	<li>계정 탈퇴 시 해당 계정으로 등록하신 커뮤니티와 쇼핑몰의 <em>게시물은 삭제 및 수정이 불가</em> 합니다.</li>
			            	</ul>
			            </div>
			
						<h2 class="title">회원탈퇴 정보확인</h2>
						<div class="bye">
							<ul>
								<li><strong>계정 </strong>아이디 : ${member.m_Id} &nbsp; 이메일 : ${member.m_Email}</li>
						
								<li>
									<strong>탈퇴동의</strong><input type="checkbox" class="chcekboxx" id="chcekboxx" name="cancelyn" value="Y"/>
									&nbsp; <label for="chcekboxx">회원탈퇴에 동의 합니다.</label></em>
								</li>
							</ul>
						</div>
						<p class="info"><i class="fa fa-exclamation-circle"></i>&nbsp;<span class="p-gray">회원 탈퇴 시 작성한 게시물의 <em>삭제/변경이 불가능</em>합니다.</span></p>
			
						<div class="btn-ac">
							<button class="btn btn-primary" id="btn-delete" type="button" onclick="fn_deleteCheck();">탈퇴하기</button>
							<button class="btn btn-primary" id="btn-back" type="button" onclick="location.href='${pageContext.request.contextPath}/mypage/memberMypage.do?m_No=${member.m_No}'">취소</button>
						</div>
                        
                      </div><!-- end page-wrapper -->
                    </div><!-- end col -->
                </div><!-- end row -->
            </div><!-- end container -->
        </section>
<c:import url="../../common/footer.jsp"/>
</body>
</html>