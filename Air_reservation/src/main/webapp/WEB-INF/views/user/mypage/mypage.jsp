<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>title</title>
	<jsp:include page="/WEB-INF/views/include/bootstrap.jsp"/>
		<script>
		function memDeleteCheck(){
			var ans = confirm("탈퇴를 하시면 포인트와 등급이 모두 삭제됩니다 정말 탈퇴 하시겠습니까?");
			if(ans){
				ans = confirm("탈퇴하시게되면 1개월간 같은 아이디로는 재가입 하실 수 없습니다 \n탈퇴 하시겠습니까?");
				if(ans) location.href = "${ctp}/user/userDelete";
			}
		}
	</script>
</head>
<body>
	<div class="w3-bar w3-white w3-border-bottom w3-xlarge">
	  <a href="${ctp}" class="w3-bar-item w3-button w3-text-red w3-hover-red"><b><i class="fa fa-plane w3-margin-right"></i>PSJ항공</b></a>
  	<a href="${ctp}/user/myPage" class="w3-bar-item w3-button w3-right w3-hover-red w3-text-grey">마이페이지</a>
  	<a href="${ctp}/user/logout" class="w3-bar-item w3-button w3-right w3-hover-red w3-text-grey">로그아웃</a>
	</div>
	<div class="w3-bar w3-padding-16 w3-large">
		<a href="${ctp}/user/" class="btn w3-bar-item w3-button w3-hide-small w3-right  w3-border-left">나의 주문제품</a>
		<a href="${ctp}/user/pwdCheck" class="btn w3-bar-item w3-button w3-hide-small w3-right w3-border-left">내정보수정</a>
		<a href="${ctp}/user/myPage" class="btn w3-bar-item w3-button w3-hide-small w3-right w3-border-left w3-bottombar w3-border-red">MyPage</a>
		<a href="#" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium" onclick="myFunction()">&#9776;</a>
	</div>
	
	<div id="demo" class="w3-bar-block w3-hide w3-hide-large w3-hide-medium w3-padding-16">
		<a href="${ctp}/user/myPage" class="w3-bar-item w3-button w3-border-bottom">MyPage</a>
		<a href="${ctp}/user/pwdCheck" class="w3-bar-item w3-button w3-border-bottom">내정보수정</a>
		<a href="${ctp}/user/" class="w3-bar-item w3-button w3-border-bottom">나의 주문제품</a>
	</div>
	<img src="${ctp}/images/mypage.png" width="100%"/>
	<div>임시임시임시</div>
	<div><input class="mybtn" type="button" onclick="javascript:memDeleteCheck()" value="회원탈퇴"></div>
</body>
</html>