<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비행편리스트</title>
	<jsp:include page="/WEB-INF/views/include/bootstrap.jsp"/>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script>
		IMP.init('imp85272380'); // 가맹점 식별코드
		IMP.request_pay({
		    pg : 'kakaopay', // 카카오 테스트
				pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '비행편결제' , //결제창에서 보여질 이름
		    amount : ${vo.AIR_RV_PP}, //실제 결제되는 가격
		    buyer_email : '${sEmail}',
		    buyer_name : '${sName}',
		    buyer_tel : '${sTel}',
		    buyer_addr : '${sAdd}',
		    buyer_postcode : '123-456'
		}, function(rsp) {
			  console.log(rsp);
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		});
	</script>
</head>
<body>
</body>
</html>