<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 상세보기</title>
<link href="${pageContext.request.contextPath}/resources/css/mypage.css" rel="stylesheet">
<style>
.content {
	border-bottom: 2px solid black;
	padding-bottom: 20px;
	margin-bottom: 20px;
	display: inline-block;
	width:800px;
}

h4, button {
	font-family: 'InfinitySans-RegularA1'!important;
}

.detailinfo {
	font-size: 16pt;
}
.table1, .table-group {
	width: 700px!important;
	margin-top: 10px;
}

.table1 th, .table1 td, .table2 th, .table2 td {
	border-top : 1px solid #d4d4d4!important;
	border-bottom : 1px solid #d4d4d4;
}

.table2 {
	width: 450px!important;
	margin-top: 10px;
}

.table2 td {
	text-align: right;
	padding-right: 20px;
}

.rightborder {
	border-right: 1px solid #d4d4d4;
}

th {
	text-align: center!important;
	background: #f8e9e2;
}

.center {
	width: 350px;
	text-align: center; 
 }
 
.user {
	width: 150px;
	height: 150px;
}

.text-right { text-align: right; padding-right: 20px!important;}
.btn-group {float: right;}
#btn-delete { margin-left: 20px;}
#btn-delete:hover { color:red; }
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
                        	<h2 class="content"><i class="fa fa-user" style="margin-right: 10px"></i>${member.m_Nick }님의 회원 정보</h2>
								<div class="table-group">
								<table class="table table1">
							    	<tr>
								        <th style="width: 100px;">아이디</th>
								        <td style="width: 350px;">${member.m_Id }</td>
								        <th>가입일</th>
								       	<td>${member.m_Joindate }</td>
							        </tr>
							        <tr>
								        <th>닉네임</th>
								        <td>${member.m_Nick}</td> 
								        <td class="center" colspan="2" rowspan="3">
									       	 <c:choose>
									        	<c:when test="${member.m_Gender eq 'F'}"><img alt="여성아이콘" src="${pageContext.request.contextPath}/resources/images/woman.png" class="user"></c:when>
									       		<c:otherwise><img alt="남성아이콘" src="${pageContext.request.contextPath}/resources/images/man.png" class="user"></c:otherwise>
									        </c:choose>  
								       	</td>              
							        </tr>
							         <tr>
								        <th>성별</th>
								        <c:choose>
								        	<c:when test="${member.m_Gender eq 'F'}"><td>여성</td></c:when>
								       		<c:otherwise><td>남성</td></c:otherwise>
								        </c:choose>       
							        </tr>
							        <tr>
							            <th>이메일</th>
							            <td>${member.m_Email }</td>       
							        </tr>
							        <tr>
							            <th>전화번호</th>
							            <td class="rightborder">${member.m_Phone }</td>
							            <th class="rightborder">게시글 갯수</th>
							            <th>댓글 갯수</th>            
							        </tr>
							         <tr>
							            <th>주소</th>
							            <td class="rightborder">${member.m_Address }</td> 
							            <td class="rightborder text-right">${member.boardcount}개</td>
							            <td class="text-right">${member.commentcount}개</td>      
							        </tr>
							    </table>
								<div class="btn-group"> 
									<button class="btn btn-primary" id="btn-update" type="button" onclick="location.href='${pageContext.request.contextPath}/mypage/updateMemberView.do?m_No=${member.m_No}'">수정하기</button>
									<button class="btn btn-primary" id="btn-delete" type="button" onclick="location.href='${pageContext.request.contextPath}/mypage/deleteConfirm.do'">탈퇴하기</button>
                       			</div> 
                       		</div>
                        </div><!-- end page-wrapper -->
                    </div><!-- end col -->
                </div><!-- end row -->
            </div><!-- end container -->
        </section>
<c:import url="../../common/footer.jsp"/>
</body>
</html>