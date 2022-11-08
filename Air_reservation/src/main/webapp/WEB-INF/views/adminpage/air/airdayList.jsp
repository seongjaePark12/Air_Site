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
</head>
<body>
<form name="airForm" method="post">
	<div class="w3-main" style="margin-left:40px;margin-right:40px">
	  <div class="w3-container" style="margin-top:80px" id="showcase">
		  	<h2 class="text-center">비행편 리스트</h2><br/><br/>
			  <table class="table table-hover m-3">
			    <tr class="text-dark text-center" style="background: linear-gradient(120deg,#9C7521,#FFDF73);">
			      <th>번호</th>
			      <th>비행기코드</th>
			      <th>출발지역</th>
			      <th>도착지역</th>
			      <th>날짜</th>
			      <th>삭제</th>
			    </tr>
			    <c:forEach var="airVo" items="${airVos}" varStatus="st">
			    	<tr class="text-center">
			    	  <td>${curScrStartNo}</td>
			    	  <td>${airVo.AIR_AIR_CODE}</td>
			    	  <td>${airVo.AIR_RV_DEP}</td>
			    	  <td>${airVo.AIR_RV_ARR}</td>
			    	  <td>${airVo.AIR_RV_DAY}</td>
			    	  <td><a href="javascript:delAir('${airVo.AIR_AIR_CODE}');"><i class="fa fa-close"></i></a>
			    	</tr>
			    </c:forEach>
			  </table>
	  </div>
  </div> 
</form>  
   <!-- 블록 페이징처리 시작(bs4 스타일 적용) -->
<div class="container">
	<ul class="pagination justify-content-center">
		<c:if test="${totPage == 0}"><p style="text-align:center">자료가 없습니다</p></c:if>
		<c:if test="${totPage != 0}">
			<c:if test="${pag != 1}">
				<li class="page-item"><a href="${ctp}/rv/airdayList?pag=1&pageSize=${pageSize}" class="page-link text-dark" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);" title="첫페이지">◀◀</a></li>
			</c:if>
			<c:if test="${curBlock > 0}">
				<li class="page-item"><a href="${ctp}/rv/airdayList?pag=${(curBlock-1)*blockSize + 1}&pageSize=${pageSize}" class="page-link text-dark" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);" title="이전">◀</a></li>
			</c:if>
			<c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}">
				<c:if test="${i == pag && i <= totPage}">
					<li class="page-item"><a href='${ctp}/rv/airdayList?pag=${i}&pageSize=${pageSize}' class="page-link text-dark border-warning" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);">${i}</a></li>
				</c:if>
				<c:if test="${i != pag && i <= totPage}">
					<li class="page-item"><a href='${ctp}/rv/airdayList?pag=${i}&pageSize=${pageSize}' class="page-link text-dark" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);">${i}</a></li>
				</c:if>
			</c:forEach>
			<c:if test="${curBlock < lastBlock}">
				<li class="page-item"><a href="${ctp}/rv/airdayList?pag=${(curBlock+1)*blockSize + 1}&pageSize=${pageSize}" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);" class="page-link text-dark" title="다음">▶</a></li>
			</c:if>
			<c:if test="${pag != totPage}">
				<li class="page-item"><a href="${ctp}/rv/airdayList?pag=${totPage}&pageSize=${pageSize}" class="page-link text-dark" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);" title="마지막">▶▶</a></li>
			</c:if>
		</c:if>
	</ul>
</div>
<div class="w3-center"><a href="${ctp}/admin/adminpage" class="w3-bar-item w3-button">관리자메인</a></div>
</body>
</html>