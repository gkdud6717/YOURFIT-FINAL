<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
#dropdown01, #dropdown02, #dropdown03, #dropdown04, #dropdown05 {
   font-size: 20px;
   margin: 0;
   padding: 0;
   width: 140px;
}
nav{
	height: 200px;
}
#nav_li01, #nav_li02, #nav_li03, #nav_li04, #nav_li05{
   margin: 0;
   padding: 0;
   width: 160px;
}
@font-face {
    font-family: 'InfinitySans-RegularA1';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/InfinitySans-RegularA1.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
div, .nav-link, li {
	font-family: 'InfinitySans-RegularA1'!important;
}

a, p, li {
	 text-align: center;
	}
	
#logo {display: inline;}

.navbar-toggleable-md {margin-top: 0px!important;}

.dropdown-menu, .dropdown-item {width: 140px;}

</style>
<!-- Basic -->
<c:set var="path"
   value="${requestScope['javax.servlet.forward.servlet_path']}" />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Metas -->
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Site Metas -->
<title>Cloapedia - Stylish Magazine Blog Template</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">

<!-- Site Icons -->
<link rel="shortcut icon"
   href="${pageContext.request.contextPath}/resources/images/favicon.ico"
   type="image/x-icon" />
<link rel="apple-touch-icon"
   href="${pageContext.request.contextPath}/resources/images/apple-touch-icon.png">

<!-- Design fonts -->
<link
   href="https://fonts.googleapis.com/css?family=Ubuntu:300,400,400i,500,700"
   rel="stylesheet">
<link
   href="https://fonts.googleapis.com/css?family=Roboto:300,400,400i,500,700,900"
   rel="stylesheet">

<!-- Bootstrap core CSS -->
<link
   href="${pageContext.request.contextPath}/resources/css/bootstrap.css"
   rel="stylesheet">

<!-- FontAwesome Icons core CSS -->
<link
   href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css"
   rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/resources/css/style.css"
   rel="stylesheet">

<!-- Responsive styles for this template -->
<link
   href="${pageContext.request.contextPath}/resources/css/responsive.css"
   rel="stylesheet">

<!-- Colors for this template -->
<link href="${pageContext.request.contextPath}/resources/css/colors.css"
   rel="stylesheet">

<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<div id="wrapper">
   <div class="topbar-section">
      <div class="container-fluid">
         <div class="row">
            <div class="col-lg-4 col-md-6 col-sm-6 hidden-xs-down">
            </div>

            <div class="col-lg-8 hidden-md-down">
               <div class="topmenu text-right">
                  <ul class="list-inline">
                     <c:choose>
                     <c:when test="${empty member}">
						<li class="list-inline-item"><a href="${pageContext.request.contextPath}/member/page_move.do?login">
							<i class="fa fa-user-circle-o"></i> 로그인</a>
						</li>
                        <li class="list-inline-item"><a href="${pageContext.request.contextPath}/member/page_move.do?join">
                        	<i class="fa fa-user-circle-o"></i> 회원가입</a>
                        </li>
                     </c:when>
                     <c:when test="${!empty member and member.m_Id eq 'admin' || !empty member and member.m_Id eq 'ADMIN'}">
                        <li class="list-inline-item">
                           <i class="fa fa-user-circle-o"></i> ${member.m_Nick}님 안녕하세요
                        </li>
                        <li class="list-inline-item"><a href="${pageContext.request.contextPath}/member/Logout.do">로그아웃</a></li>
                        <li class="list-inline-item"><a href="${pageContext.request.contextPath}/mypage/managementMember.do">관리자 페이지</a></li>
                        <li class="list-inline-item"><a href="${pageContext.request.contextPath}/mypage/qna.do">FAQ</a></li>
                     </c:when>
                     <c:otherwise>
                        <li class="list-inline-item">
                           <i class="fa fa-user-circle-o"></i> ${member.m_Nick}님 안녕하세요
                        </li>
                        <li class="list-inline-item"><a href="${pageContext.request.contextPath}/member/Logout.do">로그아웃</a></li>
                        <li class="list-inline-item"><a href="${pageContext.request.contextPath}/mypage/memberMypage.do?m_No=${member.m_No}">마이페이지</a></li>
                        <li class="list-inline-item"><a href="${pageContext.request.contextPath}/cart/cartList.do?c_Mno=${member.m_No}">장바구니</a></li>
                        <li class="list-inline-item"><a href="${pageContext.request.contextPath}/mypage/qna.do">FAQ</a></li>
                     	<button class="btn btn-outline-primary my-2 my-sm-0" id="chat" type="button" onclick="fn_chatting();">채팅하기</button> &nbsp;
                     </c:otherwise>
                     </c:choose>
                  </ul>
                  <!-- end ul -->
               </div>
               <!-- end topmenu -->
            </div>
            <!-- end col -->

         </div>
         <!-- end row -->
      </div>
      <!-- end header-logo -->
   </div>
   <!-- end topbar -->
   

   <div class="header-section" style="padding-top: 10px; padding-bottom: 0px;">
      <div class="container">
         <div class="header">
         <div class="row">
            <div class="col-md-3" style="text-align: center; padding-right: 0px; padding-left: 0px;">
               
                  <a href="${pageContext.request.contextPath}"> <img id="logo"
                     src="${pageContext.request.contextPath}/resources/images/logo.png"
                     width="200px" height="200px">
                  </a>
              
            </div>
            <div class="col-md-9" style="padding-left: 0px; padding-right: 10px;" >
          
               <nav class="navbar navbar-inverse navbar-toggleable-md">
            <button class="navbar-toggler" type="button" data-toggle="collapse"
               data-target="#cloapediamenu" aria-controls="cloapediamenu"
               aria-expanded="false" aria-label="Toggle navigation">
               <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="cloapediamenu">
               <ul class="navbar-nav col-12">
                        <li class="nav-item dropdown has-submenu" id="nav_li01"><a
                           class="nav-link dropdown-toggle" href="#" id="dropdown01"
                           data-toggle="dropdown" aria-haspopup="true"
                           aria-expanded="false">다이어트 꿀팁</a>
                           <ul class="dropdown-menu" aria-labelledby="dropdown01">
                             <li><a class="dropdown-item" href="${pageContext.request.contextPath}/dtboard/dtBoardList.do">전체</a></li>
		    				 <li><a class="dropdown-item" href="${pageContext.request.contextPath}/dtboard/dtBoardListCal.do">칼럼</a></li>
		     				 <li><a class="dropdown-item" href="${pageContext.request.contextPath}/dtboard/dtBoardListExe.do">운동</a></li>
		    				 <li><a class="dropdown-item" href="${pageContext.request.contextPath}/dtboard/dtBoardListDiet.do">식단</a></li>
                           </ul></li>

                        <li class="nav-item dropdown has-submenu" id="nav_li02"><a
                           class="nav-link dropdown-toggle" href="#" id="dropdown02"
                           data-toggle="dropdown" aria-haspopup="true"
                           aria-expanded="false">홈트레이닝</a>
                           <ul class="dropdown-menu" aria-labelledby="dropdown02">
                              <li><a class="dropdown-item" href="${pageContext.request.contextPath}/HomeTraining/htList.do">전체</a></li>
							  <li><a class="dropdown-item" href="${pageContext.request.contextPath}/HomeTraining/htListBody.do">전신</a></li>
							  <li><a class="dropdown-item" href="${pageContext.request.contextPath}/HomeTraining/htListMid.do">복부</a></li>
							  <li><a class="dropdown-item" href="${pageContext.request.contextPath}/HomeTraining/htListUp.do">상체</a></li>
							  <li><a class="dropdown-item" href="${pageContext.request.contextPath}/HomeTraining/htListLow.do">하체</a></li>
							  <li><a class="dropdown-item" href="${pageContext.request.contextPath}/HomeTraining/htListStret.do">스트레칭</a></li>

                           </ul></li>
                           
                        <li class="nav-item" id="nav_li03"><a
                           class="nav-link" href="${pageContext.request.contextPath}/cbBoard/cbBoard.do" id="dropdown03">칼로리
                              사전</a></li>    

                        <li class="nav-item dropdown has-submenu col-2" id="nav_li04"><a
                           class="nav-link dropdown-toggle" href="#" id="dropdown04"
                           data-toggle="dropdown" aria-haspopup="true"
                           aria-expanded="false">커뮤니티</a>
                           <ul class="dropdown-menu" aria-labelledby="dropdown04">
                             <li><a class="dropdown-item" href="${pageContext.request.contextPath}/board/coList.do">전체</a></li>
							 <li><a class="dropdown-item" href="${pageContext.request.contextPath}/board/coListDiet.do">식단</a></li>
							 <li><a class="dropdown-item" href="${pageContext.request.contextPath}/board/coListExer.do">운동</a></li>
							 <li><a class="dropdown-item" href="${pageContext.request.contextPath}/board/coListTip.do">팁&노하우</a></li>
							 <li><a class="dropdown-item" href="${pageContext.request.contextPath}/board/coListQA.do">고민&질문</a></li>
							 <li><a class="dropdown-item" href="${pageContext.request.contextPath}/board/coListToAdmin.do">관리자에게</a></li>
                           </ul></li>
                           
                           <li class="nav-item dropdown has-submenu col-2" id="nav_li05"><a
	                           class="nav-link dropdown-toggle" href="#" id="dropdown05"
	                           data-toggle="dropdown" aria-haspopup="true"
	                           aria-expanded="false">SHOP</a>
	                           <ul class="dropdown-menu" aria-labelledby="dropdown05">
	                             <li><a class="dropdown-item" href="${pageContext.request.contextPath}/product/productList.do">제품 구매</a></li>
								 <li><a class="dropdown-item" href="${pageContext.request.contextPath}/event/eventList.do">이벤트</a></li>
	                           </ul></li>
               </ul>
            </div>
         </nav>         
      </div> <!-- header -->
    </div> 
  </div>
  </div>
  </div>
</div>
  		<script>
				function fn_chatting() {
				var title= 'chattingRoom';
				var url = '${pageContext.request.contextPath}/chatting.do';
				var status = 'width=500px,height=700px';

				var popup = window.open(url, title, status); 	
				}
		 </script>

