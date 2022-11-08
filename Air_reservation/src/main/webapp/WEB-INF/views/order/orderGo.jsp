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
	<script type="text/javascript">
		function paygo(){
			orderForm.submit();
		}
	</script>
</head>
<body>
	<div class="w3-main" style="margin-left:40px;margin-right:40px">
	  <div class="w3-container" style="margin-top:80px" id="showcase">
		  	<h2 class="text-center">${sMid}님의 비행 리스트</h2><br/><br/>
		  	<form name="orderForm" method="post">
				  <table class="table table-hover m-3">
				    <tr class="text-dark text-center" style="background: linear-gradient(120deg,#9C7521,#FFDF73);">
				      <th>왕복/편도</th>
				      <th>비행기코드</th>
				      <th>출발지역</th>
				      <th>도착지역</th>
				      <th>비행시간</th>
				      <th>가는날짜</th>
				      <th>등급</th>
				      <th>가격</th>
				    </tr>
				    <c:forEach var="vo" items="${vos}">
				    	<tr class="text-center">
					    	<td>
						    	<c:if test="${vo.AIR_ORDER_WAY == 1}">편도</c:if>
						    	<c:if test="${vo.AIR_ORDER_WAY == 2}">왕복</c:if>
					    	</td>
				    	  <td>${vo.AIR_AIR_CODE}</td>
				    	  <td>${vo.AIR_RV_DEP}</td>
				    	  <td>${vo.AIR_RV_ARR}</td>
				    	  <td>${vo.AIR_RV_TIME}</td>
					    	<td>${vo.AIR_RV_GO}</td>
				    	  <c:if test="${vo.AIR_ORDER_FC == 3 and vo.AIR_ORDER_BC != 3 and vo.AIR_ORDER_EC !=3}"><td>퍼스트</td></c:if>
				    	  <c:if test="${vo.AIR_ORDER_BC == 1 and vo.AIR_ORDER_FC != 1 and vo.AIR_ORDER_EC !=1}"><td>비지니스</td></c:if>
				    	  <c:if test="${vo.AIR_ORDER_EC == 2 and vo.AIR_ORDER_BC != 2 and vo.AIR_ORDER_FC !=2}"><td>이코노미</td></c:if>
				    	  <td>${vo.AIR_RV_PP}</td>
				    	</tr>
				    	<input type="hidden" name="AIR_RV_IDX" value="${vo.AIR_RV_IDX}"/>
				    	<input type="hidden" name="AIR_AIR_CODE" value="${vo.AIR_AIR_CODE}"/>
				    	<input type="hidden" name="AIR_RV_DEP" value="${vo.AIR_RV_DEP}"/>
				    	<input type="hidden" name="AIR_RV_GO" value="${vo.AIR_RV_GO}"/>
				    	<input type="hidden" name="AIR_RV_TIME" value="${vo.AIR_RV_TIME}"/>
				    	<input type="hidden" name="AIR_ORDER_WAY" value="${vo.AIR_ORDER_WAY}"/>
				    	<input type="hidden" name="AIR_ORDER_FC" value="${vo.AIR_ORDER_FC}"/>
				    	<input type="hidden" name="AIR_ORDER_BC" value="${vo.AIR_ORDER_BC}"/>
				    	<input type="hidden" name="AIR_ORDER_EC" value="${vo.AIR_ORDER_EC}"/>
				    	<input type="hidden" name="AIR_RV_PP" value="${vo.AIR_RV_PP}"/>
				    	<input type="hidden" name="AIR_ORDER_ORDER" value="${vo.AIR_ORDER_ORDER}"/>
				    </c:forEach>
				  </table>
				 	<input type="hidden" name="AIR_USER_MID" value="${sMid}"/>
				</form>
	  </div>
		<div class="w3-center">
			<a class="btn btn-warning" onclick="paygo()">결제하기</a>
		</div>
  </div> 
</body>
</html>