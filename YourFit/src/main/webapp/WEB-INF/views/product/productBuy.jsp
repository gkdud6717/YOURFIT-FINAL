<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<script src="${pageContext.request.contextPath }/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<html>
<head>
<meta charset="UTF-8">
<title>결제 페이지</title>
<link href="${pageContext.request.contextPath}/resources/css/list_default.css" rel="stylesheet">

</head>
<body>
      <c:import url="../common/header.jsp"/>
      <script>
      var IMP = window.IMP;
      IMP.init('imp84561106'); 

      IMP.request_pay({
    	    pg : 'inicis', // version 1.1.0부터 지원.
    	    pay_method : 'card',
    	    merchant_uid : 'merchant_' + new Date().getTime(),
    	    name : '${p_Name}',
    	    amount : ${sumMoney},
    	    buyer_email : '${member.m_Email}',
    	    buyer_name : '${member.m_Name}',
    	    buyer_tel : '${member.m_Phone}',
    	    buyer_addr : '${member.m_Address}',
    	    buyer_postcode : '123-456',
    	    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
    	}, function(rsp) {
    	    if ( rsp.success ) {
    	        var msg = '결제가 완료되었습니다.';
    	        msg += '고유ID : ' + rsp.imp_uid;
    	        msg += '상점 거래ID : ' + rsp.merchant_uid;
    	        msg += '결제 금액 : ' + rsp.paid_amount;
    	        msg += '카드 승인번호 : ' + rsp.apply_num;

    	        var params =  { "o_Pno" : ${o_Pno}, "o_Paymethod" : 'card', "o_Mno" : ${member.m_No} , "o_Payamount" : ${sumMoney}, "o_Paystatus" : 'N', "o_Amount" : ${c_Amount} }
    	        $.ajax({
    				url : "${pageContext.request.contextPath}/orders/ordersinsert.do",
    				data : params
    	        });

	        	location.href='<%=request.getContextPath()%>/product/productSuccess.do';
      
    	    } else {
    	        var msg = '결제에 실패하였습니다.';
    	        msg += '에러내용 : ' + rsp.error_msg;

        	    alert(msg);
	        	location.href='<%=request.getContextPath()%>/product/productFail.do';
    	    }
    	    
    	});
      
      </script>
       
	 
	 <c:import url="../common/footer.jsp"/>
	 
	
	
</body>
</html>