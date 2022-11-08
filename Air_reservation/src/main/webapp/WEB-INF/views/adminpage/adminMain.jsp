<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인</title>
	<jsp:include page="/WEB-INF/views/include/bootstrap.jsp"/>
	<style>
		.pan{
				background: linear-gradient(120deg,#ADA996,#f2f2f2,#dbdbdb,#eaeaea);
		}
	</style>
</head>
<body oncontextmenu='return false' ondragstart='return false'>
	<div class="w3-main" style="margin-left:340px;margin-right:40px">
	
	  <div class="w3-container" style="margin-top:80px" id="showcase">
	    <h1 class="w3-xxxlarge"><b>관리자 페이지</b></h1>
	    <h1 class="w3-large"><b>PSJ</b></h1>
	  </div>
	  
    <div class="w3-row-padding w3-grayscale">
    	<div class="w3-quarter">
	      <div class="w3-container pan w3-padding-32 w3-margin-bottom">
	        <div class="w3-left"><i class="fa fa-truck w3-xxxlarge"></i></div>
	        <div class="w3-right">
	          <h3><a href="${ctp}/admin/"><font color="red"><b>${newOrder}</b></font></a>건</h3>
	        </div>
	        <div class="w3-clear"></div>
	        <h4>예매 내역</h4>
	      </div>
    	</div>
			<div class="w3-quarter">
	      <div class="w3-container pan w3-padding-32 w3-margin-bottom">
	        <div class="w3-left"><i class="fa fa-arrow-circle-down w3-xxxlarge"></i></div>
	        <div class="w3-right">
	          <h3><a href="${ctp}/rv/airday"><font color="red"><b>일정등록</b></font></a></h3>
	        </div>
	        <div class="w3-clear"></div>
	        <h4>비행일정</h4>
	      </div>
    	</div>
			<div class="w3-quarter">
	      <div class="w3-container pan w3-padding-32 w3-margin-bottom">
	        <div class="w3-left"><i class="fa fa-themeisle w3-xxxlarge"></i></div>
	        <div class="w3-right">
	          <h3><a href="${ctp}/rv/airdayList"><font color="red"><b>리스트보기</b></font></a></h3>
	        </div>
	        <div class="w3-clear"></div>
	        <h4>비행리스트</h4>
	      </div>
    	</div>
   	</div>
   	<div class="w3-row-padding w3-grayscale">
			<div class="w3-quarter">
	      <div class="w3-container pan w3-padding-32 w3-margin-bottom">
	        <div class="w3-left"><i class="fa fa-user w3-xxxlarge"></i></div>
	        <div class="w3-right">
	          <h3><a href="${ctp}/admin/userlist"><font color="red"><b>${newMember}</b></font></a>건</h3>
	        </div>
	        <div class="w3-clear"></div>
	        <h4>새로운 가입자</h4>
	      </div>
	    </div>
			<div class="w3-quarter">
	      <div class="w3-container pan w3-padding-32 w3-margin-bottom">
	        <div class="w3-left"><i class="fa fa-bullhorn w3-xxxlarge"></i></div>
	        <div class="w3-right">
	          <h3><a href="${ctp}/admin/"><font color="red"><b>공지등록</b></font></a></h3>
	        </div>
	        <div class="w3-clear"></div>
	        <h4>공지사항</h4>
	      </div>
			</div> 
			<div class="w3-quarter">
	      <div class="w3-container pan w3-padding-32 w3-margin-bottom">
	        <div class="w3-left"><i class="fa fa-comments-o w3-xxxlarge"></i></div>
	        <div class="w3-right">
	          <h3><a href="${ctp}/admin/question"><font color="red"><b>${newQuestion}</b></font></a>건</h3>
	        </div>
	        <div class="w3-clear"></div>
	        <h4>새로운 문의</h4>
	      </div>
	    </div>
	  </div> 
   	<div class="w3-row-padding w3-grayscale">
			<div class="w3-quarter">
	      <div class="w3-container pan w3-padding-32 w3-margin-bottom">
	        <div class="w3-left"><i class="fa fa-user w3-xxxlarge"></i></div>
	        <div class="w3-right">
	          <h3><a href="${ctp}/rv/airinput"><font color="red"><b>항공기등록</b></font></a></h3>
	        </div>
	        <div class="w3-clear"></div>
	        <h4>항공기종류</h4>
	      </div>
	    </div>
    </div>
  </div> 
  <div class="w3-center"><a href="${ctp}" class="w3-bar-item w3-button">메인</a></div>
</body>
</html>