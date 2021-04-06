<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<script
   src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
<html>
<head>
<meta charset="UTF-8">
<title>자주 묻는 질문</title>
<style>
h2 {font-family: 'InfinitySans-RegularA1'!important;}
.titlefaq {
text-align:center; 
}
.page-wrapper {
	height: auto;
}
.heading{
	width:600px;
	margin: 20px auto 5px auto;
	border:1px solid #000;
	padding: 10px;
}
.content{width:600px; margin:0px auto; border: 1px solid black;}

pre{
	font-family: 'InfinitySans-RegularA1'!important;
    padding:20px;
    overflow: auto;
    white-space: pre-wrap; 
}
</style>
<script>
   $(document).ready(function() {
      $(".content").hide();
      //content 클래스를 가진 div를 표시/숨김(토글)
      $(".heading").click(function() {
         $(this).next(".content").slideToggle(500);
         $("i", this).toggleClass("fa-chevron-down fa-chevron-up");
      });
   });
</script>
</head>
<body>
   <c:import url="../common/header.jsp" />
   <div class="container" style="padding-bottom: 50px;">
 	<div class="titlefaq">
 		<h2><i class="fa fa-question-circle"></i> 자주 묻는 질문 FAQ</h2>
    </div>      
    
    <hr />
               		
    <div class="heading"><i class="fa fa-chevron-down f"></i> 고객센터의 상담 시간을 알고 싶어요.</div>
	<div class="content">
<pre>
- 고객센터 전화번호 : 123-1234
			
- 상담 시간 : 평일 오전 9시 30분 ~ 오후 6시
 (점심시간 : 오전 11시 30분 ~ 오후 1시 30분 / 주말, 공휴일 휴무)
- 전화 연결이 어려운 경우 카카오 상담톡으로 문의를 남겨주시면 확인 후 정성껏 답변드리겠습니다.

※ 문의량이 많을 경우 상담 연결 및 답변이 지연될 수 있습니다.
</pre>
	</div>
	
	<div class="heading"><i class="fa fa-chevron-down"></i> 회원 탈퇴는 어떻게 하나요?</div>
	<div class="content">
<pre>
- 로그인을 한 상태에서 우측 상단에 마이페이지를 클릭합니다.
- 회원 정보 수정에서 [탈퇴하기]를 통해 회원탈퇴를 하실 수 있습니다.

- 전화상으로는 회원탈퇴가 불가하오니 참고하여 주시기 바랍니다
</pre>
	</div>
	
	<div class="heading"><i class="fa fa-chevron-down"></i> 칼로리 정보 추가를 요청하고 싶어요.</div>
	<div class="content">
<pre>
- 칼로리 정보는 커뮤니티 게시판 [관리자에게]에 요청하실 수 있습니다.
- 요청하는 제품의 영양성분표를 사진찍어 올려주시면 보다 빠른 등록이 가능합니다.

※ 칼로리 정보 등록은 문의량에 따라 다소 지연될 수 있습니다.

    <a href="${pageContext.request.contextPath }/board/coList.do"><span>커뮤니티 게시판 가기</span></a>
</pre>	
	</div>
	
	<div class="heading"><i class="fa fa-chevron-down"></i> 배송은 언제 되나요?</div>
	<div class="content">
<pre>
- 영업일 기준 오후 1시 이전 결제 완료 주문건 :  당일 출고됩니다. (일부 상품 제외)
- 공휴일의 경우 다음 영업일에 출고됩니다.

( 출고된 경우 서울/수도권 지역은 대부분 다음날 수령, 지방은 1~3일 이내에 배송됩니다. 
따라서 전체 배송 기간은 (업무일 기준) 3일~7일 정도 소요되며, 
일부 택배사 사정에 따라 변동될 수 있습니다. )

※ 주문 상품이 재고 부족일 경우 부득이하게 배송 시간은 달라질 수 있는 점 양해 부탁드립니다.
</pre>	
	</div>	
	
    <div class="heading"><i class="fa fa-chevron-down"></i> 상품에 대해 궁금한 점이 있습니다.</div>
	<div class="content">
<pre>
- 메뉴바에 [SHOP]에서 제품 구매페이지로 이동하신 뒤
- 해당 상품을 클릭해 상품 상세페이지의 하단에 있는 상품 문의하기를 통해
- 글을 작성해주시면 감사하겠습니다.

- 고객센터 전화번호 : 123-1234 
- 상세 설명 외 궁금한 사항이 있다면 고객센터로 문의해주시면 감사하겠습니다.

※ 답변은 문의 순서에 따라 작성해 드리며 다소 지연될 수 있습니다.
</pre>	
	</div>     

      </div>
      <!-- end page-wrapper -->
   </div>
   <!-- page-wrapper -->
   </div>
   <!-- end col -->

   <c:import url="../common/footer.jsp" />
</body>
</html>