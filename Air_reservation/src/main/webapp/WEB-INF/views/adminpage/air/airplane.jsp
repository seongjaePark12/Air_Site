<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비행기등록</title>
	<jsp:include page="/WEB-INF/views/include/bootstrap.jsp"/>
	<script src="${ctp}/js/airplane.js"></script>
</head>
<body>
<form name="airForm" method="post">
	<div class="w3-main" style="margin-left:40px;margin-right:40px">
	  <div class="w3-container" style="margin-top:80px" id="showcase">
		  	<h2 class="text-center">비행기 관리</h2><br/><br/>
		  	비행기코드
		  	<input type="text" name="AIR_AIR_CODE"/> &nbsp; &nbsp;
		  	비행기명
		  	<input type="text" name="AIR_AIR_NAME"/>
		  	<input type="button" value="비행기등록" onclick="airCheck()" class="btn btn-warning btn-sm"/>
			  <table class="table table-hover m-3">
			    <tr class="text-dark text-center" style="background: linear-gradient(120deg,#9C7521,#FFDF73);">
			      <th>비행기코드</th>
			      <th>비행기명</th>
			      <th>삭제</th>
			    </tr>
			    <c:forEach var="airVo" items="${airVos}">
			    	<tr class="text-center">
			    	  <td>${airVo.AIR_AIR_CODE}</td>
			    	  <td>${airVo.AIR_AIR_NAME}</td>
			    	  <td><a href="javascript:delAir('${airVo.AIR_AIR_CODE}');"><i class="fa fa-close"></i></a>
			    	</tr>
			    </c:forEach>
			  </table>
	  </div>
  </div> 
</form>  
<div class="w3-center"><a href="${ctp}/admin/adminpage" class="w3-bar-item w3-button">관리자메인</a></div>
</body>
</html>