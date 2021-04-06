<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
<link href="${pageContext.request.contextPath}/resources/css/co_detail.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/mypage.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
</head>
<body>

    <c:import url="../common/header.jsp"/>
     
        <section class="section wb">
             <div class="container">
                 <div class="row">
                    <div class="col-lg-1 col-md-1" style="padding: 0px;"></div>
               
                <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12" style="padding: 0px;">
                   <div class="page-wrapper">
                    <h3 class="content"><i class="fa fa-file-text-o" aria-hidden="true" style="margin-right: 10px;"></i>공지사항 상세보기</h3>

                    <table class="tableDetail" id="centered">
                     <tr>
						<td style="background-color:#e4efeb; color:#333;">
						   <h4 id="h4">${notice.n_title}</h4>
						</td>
					</tr>
					<tr>
						<td><i id="td_icon" class="fa fa-user-o" aria-hidden="true"></i>${notice.m_Nick }</td>
					</tr>
					<tr>
						<td><i id="td_icon" class="fa fa-calendar-check-o" aria-hidden="true"></i>${notice.n_date}</td>
					</tr>
					<tr>
						<td id="content_td">
						   <textarea id="n_content" class="form-control" name="co_Content" readonly required>${notice.n_content}</textarea>  
						</td>
					</tr>
                   </table>
                   <br>
               
                 <div>
                    <button class="btn btn-primary" id="btnBack" type="button" onclick="location.href='${pageContext.request.contextPath}/notice/notice_list.do'">목록으로</button>
                    <c:if test="${member.m_Id eq 'admin'}">
                    <button type="button" id="btnSave" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/notice/notice_updateView.do?n_no=${ notice.n_no}'">수정</button>

                    <!--  <button class="btn btn-default" id="btnSave" type="button" onclick="location.href='${pageContext.request.contextPath}/notice/notice_updateView.do?n_no='">수정</button>-->
				    </c:if>
				 </div> 
               </div>
            </div>
             <div class="col-lg-1 col-md-1" style="padding: 0px;"></div>
           </div>
         </div>
      </section>
      
      <div class="dmtop">Scroll to Top</div>
      
      <c:import url="../common/footer.jsp"/>
</body>
</html>