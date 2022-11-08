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
	<script>
	    function depCheck(AIR_RV_IDX){
	    		let AIR_RV_PP = depForm.AIR_RV_PP.value;
	    		let AIR_USER_MID = depForm.AIR_USER_MID.value;
	    		let AIR_ORDER_WAY = depForm.AIR_ORDER_WAY.value;
	        if(AIR_RV_PP ==0){
	          alert("비행편을 선택해주세요!");
	          return false;
	        } 
	        $.ajax({
						type : "post",
						url : "../order/orderAirList",
						data:{
							AIR_RV_PP : AIR_RV_PP,
							AIR_RV_IDX : AIR_RV_IDX,
							AIR_USER_MID : AIR_USER_MID,
							AIR_ORDER_WAY : AIR_ORDER_WAY
						},
						success:function(){
							alert("장바구니에 담겼습니다");
							location.reload();
						},
						error:function(){
							alert("에러");
						}
					});	
	      }
	    function arrCheck(AIR_RV_IDX){
	    		let AIR_RV_PP = arrForm.AIR_RV_PP.value;
	    		let AIR_USER_MID = depForm.AIR_USER_MID.value;
	    		let AIR_ORDER_WAY = depForm.AIR_ORDER_WAY.value;
	        if(AIR_RV_PP ==0){
	          alert("비행편을 선택해주세요!");
	          return false;
	        } 
	        $.ajax({
						type : "post",
						url : "../order/orderAirList",
						data:{
							AIR_RV_PP : AIR_RV_PP,
							AIR_RV_IDX : AIR_RV_IDX,
							AIR_USER_MID : AIR_USER_MID,
							AIR_ORDER_WAY : AIR_ORDER_WAY
						},
						success:function(){
							alert("장바구니에 담겼습니다");
							location.reload();
						},
						error:function(){
							alert("에러");
						}
					});	
	      }
	</script>
</head>
<body>
	<div class="w3-main" style="margin-left:40px;margin-right:40px">
	  <div class="w3-container" style="margin-top:80px" id="showcase">
		  	<h2 class="text-center">가는편 비행 리스트</h2><br/><br/>
		  	<form name="depForm" method="post">
				  <table class="table table-hover m-3">
				    <tr class="text-dark text-center" style="background: linear-gradient(120deg,#9C7521,#FFDF73);">
				      <th>비행기코드</th>
				      <th>출발지역</th>
				      <th>도착지역</th>
				      <th>비행시간</th>
				      <th>날짜</th>
				      <th>좌석</th>
				      <th>선택</th>
				    </tr>
				    <c:forEach var="vo" items="${vos}">
				    	<tr class="text-center">
				    	  <td>${vo.AIR_AIR_CODE}</td>
				    	  <td>${vo.AIR_RV_DEP}</td>
				    	  <td>${vo.AIR_RV_ARR}</td>
				    	  <td>${vo.AIR_RV_TIME}</td>
				    	  <td>${vo.AIR_RV_DAY}</td>
				    	  <td>
				    	  	<input class="w3-radio" type="radio" id ="AIR_RV_PP" name="AIR_RV_PP${vo.AIR_RV_IDX}" value="${vo.AIR_RV_FP}"><font color="black">퍼스트</font> &nbsp;
	   							<input class="w3-radio" type="radio" id ="AIR_RV_PP" name="AIR_RV_PP${vo.AIR_RV_IDX}" value="${vo.AIR_RV_BP}"><font color="black">비지니스</font> &nbsp;
	   							<input class="w3-radio" type="radio" id ="AIR_RV_PP" name="AIR_RV_PP${vo.AIR_RV_IDX}" value="${vo.AIR_RV_EP}"><font color="black">이코노미</font>
				    	  </td>
				    	  <td><input type="button" value="가는편 담기" onclick="depCheck(${vo.AIR_RV_IDX})" class="btn btn-warning btn-sm"/></td>
				    	</tr>
				    	<input type="hidden" name="AIR_RV_DAY" value="${vo.AIR_RV_DAY}"/>
				    </c:forEach>
				  </table>
				 	<input type="hidden" name="AIR_USER_MID" value="${sMid}"/>
				 	<input type="hidden" name="AIR_ORDER_WAY" value="${AIR_ORDER_WAY}"/>
				  </form>
	  </div>
	  <c:if test="${AIR_ORDER_WAY == 2}">
	  <div class="w3-container" style="margin-top:80px" id="showcase">
	  	<h2 class="text-center">오는편 비행 리스트</h2><br/><br/>
	  	<form name="arrForm" method="post">
				  <table class="table table-hover m-3">
				    <tr class="text-dark text-center" style="background: linear-gradient(120deg,#9C7521,#FFDF73);">
				      <th>비행기코드</th>
				      <th>출발지역</th>
				      <th>도착지역</th>
				      <th>비행시간</th>
				      <th>날짜</th>
				      <th>좌석</th>
				      <th>선택</th>
				    </tr>
				    <c:forEach var="vo1" items="${vos1}" varStatus="st">
					    	<tr class="text-center">
				    	 	  <td>${vo1.AIR_AIR_CODE}</td>
					    	  <td>${vo1.AIR_RV_DEP}</td>
					    	  <td>${vo1.AIR_RV_ARR}</td>
					    	  <td>${vo1.AIR_RV_TIME}</td>
					    	  <td>${vo1.AIR_RV_DAY}</td>
					    	  <td>
					    	  	<input class="w3-radio" type="radio" id ="AIR_RV_PP" name="AIR_RV_PP" value="${vo1.AIR_RV_FP}"><font color="black">퍼스트</font> &nbsp;
		   							<input class="w3-radio" type="radio" id ="AIR_RV_PP" name="AIR_RV_PP" value="${vo1.AIR_RV_BP}"><font color="black">비지니스</font> &nbsp;
		   							<input class="w3-radio" type="radio" id ="AIR_RV_PP" name="AIR_RV_PP" value="${vo1.AIR_RV_EP}"><font color="black">이코노미</font>
					    	  </td>
					    	  <td><input type="button" value="오는편 담기" onclick="arrCheck(${vo1.AIR_RV_IDX})" class="btn btn-warning btn-sm"/></td>
					    	</tr>
					    	<input type="hidden" name="AIR_RV_DAY" value="${vo1.AIR_RV_DAY}"/>
				    </c:forEach>
				  </table>
			  </form>
	  </div>
		</c:if>
		<div class="w3-center">
			<a href="${ctp}/order/ordergo" class="btn btn-warning">담은 여행편 확인하기</a>
		</div>
  </div> 
</body>
</html>