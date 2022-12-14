<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
	<jsp:include page="/WEB-INF/views/include/bootstrap.jsp"/>
	<link rel="stylesheet" href="${ctp}/css/login.css">
</head>
<body>
	<div class="w3-bar w3-white w3-border-bottom w3-xlarge">
	  <a href="${ctp}" class="w3-bar-item w3-button w3-text-red w3-hover-red"><b><i class="fa fa-plane w3-margin-right"></i>PSJ항공</b></a>
	  <a href="#" class="w3-bar-item w3-button w3-right w3-hover-red w3-text-grey" data-toggle="modal" data-target="#myModal">
	    로그인
	  </a>
	</div>
	<p><br/><br/></p>
 <div class="Form my-4 mx-5">
    <div class="container">
      <div class="row no-gutters">
      <div class="col-lg-3">
       </div>
			 <div class="col-lg-6 px-5 pt-5 mt-5">
			   <h1 class="font-weight-bold py-3 mt-3 ml-3" id="lolo">비밀번호 찾기</h1>
			   <br/><br/>
			   <form name="myform" class="needs-validation" method="post" novalidate>
			     <div class="col-lg-12">
			       <div class="txtb">
			         <input type="text" class="form-control" name="mid" id="mid" placeholder="아이디를 입력해주세요" autofocus required>
			       </div>
			       <div class="txtb">
			         <input type="text" class="form-control" name="name" id="name" placeholder="이름을 입력해주세요" autofocus required>
			       </div>
			       <div class="txtb ">
			         <input type="text" class="form-control" name="email" id="email" placeholder="예) name@example.com" required onkeypress="enter()">
			       </div>
			       <br/><br/>
			       <div class="col-lg-12" align="center">
			         <input type="submit" class="logbtn" value="비밀번호 찾기"><br/>
			       	<input type="button" class="logbtn" onclick="location.href='${ctp}'" value="돌아가기">
			       </div>
			     </div>
			     <br/><br/>
			     <div align="center">
			       <a href="${ctp}/user/midConfirm" style="font-size:16px">아이디를 잊으셨나요?</a> 
			     </div>
			      <br/>
			    </form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>