<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비행편등록</title>
	<jsp:include page="/WEB-INF/views/include/bootstrap.jsp"/>
	<script src="${ctp}/js/rv.js"></script>
</head>
<body>
	<div class="w3-main" style="margin-left:500px;margin-right:500px">
	  <div class="w3-container" style="margin-top:80px" id="showcase">
	  	<h2 style="text-align:center; color: #626262;">비행편등록</h2>
		  <br/>
	     <form name="myform" method="post">
			  	<div class="form-group">
			  		<label for="AIR_AIR_CODE"><b>비행기선택</b></label>
						<select name="AIR_AIR_CODE" id="AIR_AIR_CODE" class="form-control">
							<option value="">비행기선택</option>
							<c:forEach var="airVo" items="${airVos}">
			  	    <option value="${airVo.AIR_AIR_CODE}">${airVo.AIR_AIR_NAME}</option>
			  	 		</c:forEach>
						</select>
			    </div>
 				  <div class="form-group">
		        <label for="AIR_RV_DEP"><b>출발지역</b></label>
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
					<div class="form-group">
		        <label for="AIR_RV_ARR"><b>도착지역</b></label>
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
					<div class="form-group">
		        <label for="AIR_RV_DAY"><b>날짜</b></label>
		        <input type="date" name="AIR_RV_DAY" class="form-control" id="AIR_RV_DAY" required >
			    </div>
					<div class="form-group">
		        <label for="AIR_RV_TIME"><b>비행시간</b></label>
		        <input type="text" name="AIR_RV_TIME" class="form-control" id="AIR_RV_TIME" placeholder="비행시간을 입력하세요" required >
			    </div>
				  <div class="form-group">
		        <label for="AIR_RV_FS"><b>퍼스트 클래스 좌석수</b></label>
		        <input type="number" class="form-control" id="AIR_RV_FS" name="AIR_RV_FS" maxlength="10" required >
				  </div> 
				  <div class="form-group">
		        <label for="AIR_RV_BS"><b>비지니스 클래스 좌석수</b></label>
		        <input type="number" class="form-control" id="AIR_RV_BS" name="AIR_RV_BS" maxlength="10" required >
				  </div> 
				  <div class="form-group">
		        <label for="AIR_RV_ES"><b>이코노미 클래스 좌석수</b></label>
		        <input type="number" class="form-control" id="AIR_RV_ES" name="AIR_RV_ES" maxlength="100" required >
				  </div> 
				  <div class="form-group">
		        <label for="AIR_RV_FP"><b>퍼스트 클래스 가격</b></label>
		        <input type="text" class="form-control" id="AIR_RV_FP" placeholder="가격 입력" name="AIR_RV_FP" required >
				  </div> 
				  <div class="form-group">
		        <label for="AIR_RV_BP"><b>비지니스 클래스 가격</b></label>
		        <input type="text" class="form-control" id="AIR_RV_BP" placeholder="가격 입력" name="AIR_RV_BP" required >
				  </div> 
				  <div class="form-group">
		        <label for="AIR_RV_EP"><b>이코노미 클래스 가격</b></label>
		        <input type="text" class="form-control" id="AIR_RV_EP" placeholder="가격 입력" name="AIR_RV_EP" required >
				  </div> 
			    <div style="text-align: center;"><br/>
			    	<button type="button" class="btn btn-warning" onclick="fCheck()" style="width:120px;">비행편등록</button> &nbsp;
			  	</div>
		  	</form>  
		  </div>
		</div>
		<div class="w3-center"><a href="${ctp}/admin/adminpage" class="w3-bar-item w3-button">관리자메인</a></div>
</body>
</html>