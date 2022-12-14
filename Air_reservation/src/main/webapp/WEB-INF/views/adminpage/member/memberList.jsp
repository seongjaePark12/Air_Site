<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원리스트</title>
	<jsp:include page="/WEB-INF/views/include/bootstrap.jsp"/>
	<script src="${ctp}/js/adminMember.js"></script>
</head>
<body oncontextmenu='return false' ondragstart='return false'>
<form name="myform" method="post">
	<div class="w3-main" style="margin-left:40px;margin-right:40px">
	  <div class="w3-container" style="margin-top:80px" id="showcase">
			<table class="table table-boderless m-0">
				<tr>
					<c:choose>
						<c:when test="${level==99}"><c:set var="title" value="전체"/></c:when>
						<c:when test="${level==4}"><c:set var="title" value="여행입문"/></c:when>
						<c:when test="${level==3}"><c:set var="title" value="여행초보"/></c:when>
						<c:when test="${level==2}"><c:set var="title" value="여행중수"/></c:when>
						<c:when test="${level==1}"><c:set var="title" value="여행고수"/></c:when>
					</c:choose>
					<td colspan="2">
						<c:if test="${!empty mid}"><c:set var="title" value="${mid}"/></c:if>
						<h2 style="text-align: center;">${title} 회원 리스트</h2>
					</td>
				</tr>
				<tr>
					<td style="text-align: left">
						<input type="text" name="mid" value="${mid}" placeholder="검색할아이디입력"/>
						<input type="button" value="개별검색" onclick="midSearch()" class="btn btn-warning btn-sm" />
						<input type="button" value="전체보기" onclick="location.href='${ctp}/admin/userlist';" class="btn btn-warning btn-sm"/>
					</td>
					<td style="text-align: right">
						회원등급
						<select name="levelel" onchange="levelSearch()">
							<option value="99" <c:if test="${level == 99}">selected</c:if>>전체회원</option>
							<option value="4" <c:if test="${level == 4}">selected</c:if>>여행입문</option>
							<option value="3" <c:if test="${level == 3}">selected</c:if>>여행초보</option>
							<option value="2" <c:if test="${level == 2}">selected</c:if>>여행중수</option>
							<option value="1" <c:if test="${level == 1}">selected</c:if>>여행고수</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						<input type="checkbox" id="checkAll"/>전체선택/해제 &nbsp;
						<input type="button" value="선택회원 삭제" onclick="selectDelCheck()" class="btn btn-warning btn-sm"/>
						<select name="level2" onchange="selectLevelCheck()">
								<option value="4">여행입문</option>
								<option value="3">여행초보</option>
								<option value="2">여행중수</option>
								<option value="1">여행고수</option>
								<option value="0">관리자</option>
						</select>					
					</td>
				</tr>
			</table>
			<table class="table table-hover">
				<tr class="text-dark text-center" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);">
					<th>선택</th>
					<th>번호</th>
					<th>아이디</th>
					<th>성명</th>
					<th>연락처</th>
					<th>이메일</th>
					<th>등급</th>
					<th>탈퇴여부</th>
				</tr>
				<c:forEach var="vo" items="${vos}">
					<tr class="text-center">
						<td><input type="checkbox" name="chk" class="chk" value="${vo.AIR_USER_IDX}"/></td>
						<td>${curScrStartNo}</td>
						<td>${vo.AIR_USER_MID}</td>
						<td>${vo.AIR_USER_NAME}</td>
						<td>${vo.AIR_USER_NUMBER}</td>
						<td>${vo.AIR_USER_EMAIL}</td>
						<td>
							<select name="level" onchange="levelCheck(this)">
								<option value="1${vo.AIR_USER_IDX}" <c:if test="${vo.AIR_USER_LEVEL == 1}">selected</c:if>>여행고수</option>
								<option value="2${vo.AIR_USER_IDX}" <c:if test="${vo.AIR_USER_LEVEL == 2}">selected</c:if>>여행중수</option>
								<option value="3${vo.AIR_USER_IDX}" <c:if test="${vo.AIR_USER_LEVEL == 3}">selected</c:if>>여행초보</option>
								<option value="4${vo.AIR_USER_IDX}" <c:if test="${vo.AIR_USER_LEVEL == 4}">selected</c:if>>여행입문</option>
								<option value="0${vo.AIR_USER_IDX}" <c:if test="${vo.AIR_USER_LEVEL == 0}">selected</c:if>>관리자</option>
							</select>					
						</td>
						<td>
							<c:if test="${vo.AIR_USER_DEL=='OK'}"><font color=red>탈퇴신청</font></c:if>
		    	    <c:if test="${vo.AIR_USER_DEL!='OK'}">활동중</c:if>
	    	    </td>
					</tr>
					<c:set var="curScrStartNo" value="${curScrStartNo - 1}"/>
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
				<li class="page-item"><a href="${ctp}/admin/userlist?pag=1&pageSize=${pageSize}&level=${level}&mid=${mid}" class="page-link text-dark" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);" title="첫페이지">◀◀</a></li>
			</c:if>
			<c:if test="${curBlock > 0}">
				<li class="page-item"><a href="${ctp}/admin/userlist?pag=${(curBlock-1)*blockSize + 1}&pageSize=${pageSize}&level=${level}&mid=${mid}" class="page-link text-dark" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);" title="이전">◀</a></li>
			</c:if>
			<c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}">
				<c:if test="${i == pag && i <= totPage}">
					<li class="page-item"><a href='${ctp}/admin/userlist?pag=${i}&pageSize=${pageSize}&level=${level}&mid=${mid}' class="page-link text-dark border-warning" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);">${i}</a></li>
				</c:if>
				<c:if test="${i != pag && i <= totPage}">
					<li class="page-item"><a href='${ctp}/admin/userlist?pag=${i}&pageSize=${pageSize}&level=${level}&mid=${mid}' class="page-link text-dark" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);">${i}</a></li>
				</c:if>
			</c:forEach>
			<c:if test="${curBlock < lastBlock}">
				<li class="page-item"><a href="${ctp}/admin/userlist?pag=${(curBlock+1)*blockSize + 1}&pageSize=${pageSize}&level=${level}&mid=${mid}" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);" class="page-link text-dark" title="다음">▶</a></li>
			</c:if>
			<c:if test="${pag != totPage}">
				<li class="page-item"><a href="${ctp}/admin/userlist?pag=${totPage}&pageSize=${pageSize}&level=${level}&mid=${mid}" class="page-link text-dark" style="background-image: linear-gradient(120deg, #9C7521, #FFDF73);" title="마지막">▶▶</a></li>
			</c:if>
		</c:if>
	</ul>
</div>
<div class="w3-center"><a href="${ctp}/admin/adminpage" class="w3-bar-item w3-button">관리자메인</a></div>
</body>
</html>