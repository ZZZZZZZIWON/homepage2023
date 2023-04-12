<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Language" content="ko">
<title>데이터 가져오기</title>
<script src="https://code.jquery.com/jquery-Latest.min.js"></script>
</head>
<body>
	<c:choose>
		<c:when test="${not empty result.tempId}">
			<c:set var="actionUrl" value="/temp/update.do" />
		</c:when>
		<c:otherwise>
			<c:set var="actionUrl" value="/temp/insert.do" />
		</c:otherwise>
	</c:choose>

	<%--<form action="/temp/insert.do" method="post" name="tempVO"> --%>
	
	<form action="${actionUrl}" method="post" name="tempVO">
		<input type="hidden" name="tempId" value="${result.tempId}"/> 
		<label for="tempVal">값 정보 :</label> 
		<input type="text" id="tempVal" name="tempVal" value="${result.tempVal}"/> 
		<br/>
		<c:choose>
			<c:when test="${not empty result.tempId}">
				<button type="submit">수정</button>
			</c:when>
			<c:otherwise>
				<button type="submit">등록</button>
			</c:otherwise>
		</c:choose>
	</form>
</body>
</html>