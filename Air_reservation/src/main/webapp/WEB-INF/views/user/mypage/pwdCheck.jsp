<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>title</title>
	<jsp:include page="/WEB-INF/views/include/bootstrap.jsp"/>
	<link rel="stylesheet" href="${ctp}/css/pwdCheck.css">
</head>
<body>
	<div class="w3-bar w3-white w3-border-bottom w3-xlarge">
	  <a href="${ctp}" class="w3-bar-item w3-button w3-text-red w3-hover-red"><b><i class="fa fa-plane w3-margin-right"></i>PSJ항공</b></a>
  	<a href="${ctp}/user/myPage" class="w3-bar-item w3-button w3-right w3-hover-red w3-text-grey">마이페이지</a>
  	<a href="${ctp}/user/logout" class="w3-bar-item w3-button w3-right w3-hover-red w3-text-grey">로그아웃</a>
	</div>
	<div class="w3-bar w3-padding-16 w3-large">
		<a href="${ctp}/user/" class="btn w3-bar-item w3-button w3-hide-small w3-right  w3-border-left">나의 주문제품</a>
		<a href="${ctp}/user/pwdCheck" class="btn w3-bar-item w3-button w3-hide-small w3-right w3-border-left w3-bottombar w3-border-red">내정보수정</a>
		<a href="${ctp}/user/myPage" class="btn w3-bar-item w3-button w3-hide-small w3-right w3-border-left">MyPage</a>
		<a href="#" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium" onclick="myFunction()">&#9776;</a>
	</div>
	
	<div id="demo" class="w3-bar-block w3-hide w3-hide-large w3-hide-medium w3-padding-16">
		<a href="${ctp}/user/myPage" class="w3-bar-item w3-button w3-border-bottom">MyPage</a>
		<a href="${ctp}/user/pwdCheck" class="w3-bar-item w3-button w3-border-bottom">내정보수정</a>
		<a href="${ctp}/user/" class="w3-bar-item w3-button w3-border-bottom">나의 주문제품</a>
	</div>
	<div class="container">
		<br/><br/><br/><br/><br/><br/><br/>
		<form name="myform" class="needs-validation" method="post" novalidate>
		  <div class="col-lg-12">
		  	<div align="center"><img src="${ctp}/images/air.png" width="30%"></div>
			  <div class="txtb">
			    <input type="password" class="form-control" name="pwd" id="pwd" placeholder="비밀번호를 입력해주세요" autofocus required>
			  </div>
		  </div>
		  <div class="col-lg-12" align="center">
	      <input type="submit" class="logbtn" value="비밀번호 확인"><br/>
	    	<input type="button" class="logbtn" onclick="location.href='${ctp}/user/myPage'" value="돌아가기">
	    </div>
	  </form>
		<br/><br/><br/><br/><br/><br/><br/>
  </div>
</body>
</html>