<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<%
  Date today = new Date();
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
  String sToday = sdf.format(today);
%>
<html>
<head>
	<jsp:include page="/WEB-INF/views/include/bootstrap.jsp"/>
	<%-- <script src="${ctp}/js/home.js"></script> --%>
	<title>항공예약시스템</title>
	<style>
		#row {
			font-size:50px;
			color:black;
			font-weight:bold;
		}
	</style>
</head>
<body class="w3-light-grey">
	<!-- 상단바 -->
	<div class="w3-bar w3-white w3-border-bottom w3-xlarge">
	  <a href="${ctp}" class="w3-bar-item w3-button w3-text-red w3-hover-red"><b><i class="fa fa-plane w3-margin-right"></i>PSJ항공</b></a>
	  <c:if test="${empty sLevel}">
		  <a href="#" class="w3-bar-item w3-button w3-right w3-hover-red w3-text-grey" data-toggle="modal" data-target="#myModal">
		    로그인
		  </a>
	  </c:if>
	  <c:if test="${sLevel == '1' ||sLevel == '2' ||sLevel == '3' ||sLevel == '4'}">
	  	<a href="${ctp}/user/myPage" class="w3-bar-item w3-button w3-right w3-hover-red w3-text-grey">마이페이지</a>
	  	<a href="${ctp}/user/logout" class="w3-bar-item w3-button w3-right w3-hover-red w3-text-grey">로그아웃</a>
		</c:if>	  
	  <c:if test="${sLevel == '0'}">
	  	<a href="${ctp}/admin/adminpage" class="w3-bar-item w3-button w3-right w3-hover-red w3-text-grey">관리자페이지</a>
	  	<a href="${ctp}/user/logout" class="w3-bar-item w3-button w3-right w3-hover-red w3-text-grey">로그아웃</a>
		</c:if>	  
	  <!-- The Modal -->
	  <div class="modal fade" id="myModal">
	    <div class="modal-dialog modal-dialog-centered">
	      <div class="modal-content">
	      
	        <!-- Modal Header -->
	       <form name="loginForm" method="post" action="${ctp}/user/login" class="was-validated">
						<div class="modal-header">
							<h4 class="modal-title">로그인</h4>
							<button type="button" class="close" data-dismiss="modal">×</button>
						</div>
		
						<!-- Modal body -->
						<div class="modal-body">
							<div class="form-group">
						    	<h4 class="modal-title">아이디 :</h4>
						    	<input type="text" class="form-control" name="AIR_USER_MID" id="AIR_USER_MID" value="${cMid}" required="" autofocus="" />
							</div>
							<div class="form-group">
								<h4 class="modal-title">비밀번호 : </h4>
								<input type="password" class="form-control" name="AIR_USER_PWD" id="AIR_USER_PWD" required="" />
							</div>
							<div class="row">
								<h4><span class="col"><a href="${ctp}/user/midConfirm">ID 찾기</a> / <a href="${ctp}/user/pwdConfirm"> 비밀번호 찾기</a></span></h4>
							</div>
						</div>
			
						<!-- Modal footer -->
						<div class="modal-footer">
							<button type="submit" class="btn btn-primary">로그인</button>
							<button type="button" class="btn btn-primary" onclick="location.href='${ctp}/user/join';">회원가입</button>
							<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
				 		</div>
					</form>
	      </div>
	    </div>
	  </div>
	</div>

	<form name="myform" method="post"  action="${ctp}/order/airSearch">
	<header class="w3-display-container w3-content" style="max-width:100%">
	  <img class="w3-image" src="${ctp}/images/main.jpg" width="100%">
	  <div class="w3-display-middle" style="width:65%">
	    <div class="w3-container w3-white w3-padding-16 w3-margin-top">
				<input class="w3-radio" type="radio" name="AIR_ORDER_WAY" value="1" checked=""><font color="black">편도</font> &nbsp;
	   		<input class="w3-radio" type="radio" name="AIR_ORDER_WAY" value="2"><font color="black">왕복</font>
	      <div class="w3-row-padding" style="margin:0 -16px;">
	        <div class="w3-half w3-margin-top">
	        	<label>출발지</label>
		        <select name="AIR_RV_DEP" id="AIR_RV_DEP" class="form-control">
							<option value="">출발지선택</option>
							<option value="서울(인천)">서울(인천)</option>
							<option value="서울(김포)">서울(김포)</option>
							<option value="부산">부산</option>
							<option value="제주">제주</option>
							<option value="청주">청주</option>
							<option value="대구">대구</option>
							<option value="광주">광주</option>
							<option value="여수">여수</option>
							<option value="군산">군산</option>
						</select>
	        </div>
	        <div class="w3-half w3-margin-top">
	        	<label>도착지</label>
		        <select name="AIR_RV_ARR" id="AIR_RV_ARR" class="form-control">
							<option value="">도착지선택</option>
							<option value="서울(인천)">서울(인천)</option>
							<option value="서울(김포)">서울(김포)</option>
							<option value="부산">부산</option>
							<option value="제주">제주</option>
							<option value="청주">청주</option>
							<option value="대구">대구</option>
							<option value="광주">광주</option>
							<option value="여수">여수</option>
							<option value="군산">군산</option>
						</select>
	        </div>
	        <div class="w3-half w3-margin-top">
	        	<label>가는날</label>
	          <input type="date" name="AIR_RV_GO" id="AIR_RV_GO" value="<%=today %>" class="form-control" placeholder="출발일">
	        </div>
	        <div class="w3-half w3-margin-top">
	        	<label>오는날</label>
	          <input type="date" name="AIR_RV_BACK" id="AIR_RV_BACK" value="<%=today %>" class="form-control" placeholder="도착일">
	        </div>
	      </div>
	      <div class="w3-margin-top"><button type="submit" class="btn btn-secondary" style="width:100px;" name="button">검색</button></div>
	    </div>
	  </div>
	</header>
	</form>

	<!-- Footer -->
	<footer class="w3-container w3-center w3-opacity w3-margin-bottom">
	  <h5>Find Us On</h5>
	  <div class="w3-xlarge w3-padding-16">
	    <i class="fa fa-facebook-official w3-hover-opacity"></i>
	    <i class="fa fa-instagram w3-hover-opacity"></i>
	    <i class="fa fa-snapchat w3-hover-opacity"></i>
	    <i class="fa fa-pinterest-p w3-hover-opacity"></i>
	    <i class="fa fa-twitter w3-hover-opacity"></i>
	    <i class="fa fa-linkedin w3-hover-opacity"></i>
	  </div>
	</footer>
</body>
</html>
