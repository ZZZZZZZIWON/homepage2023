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
<style>
table {
	border-collapse: collapse;
}

th {
	font-weight: bold;
}

th, td {
	padding: 5px;
	border: 1px solid #000;
}
a {
	text-decoration-color: black;
	text-decoration: none;
}
button {
	margin: 5px;
}
</style>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>TEMP_ID</th>
				<th>TEMP_VAL</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="result" items="${resultList}">
				<tr>
					<td><c:out value="${result.tempId}"/></td>
					<td>
						<c:url var="viewUrl" value="/temp/select.do">
							<c:param name="tempId" value="${result.tempId}"/>
						</c:url>
						<a href="${viewUrl}"><c:out value="${result.tempVal}"/></a>	
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<button type="button" id="btn-reg" data-href="/temp/tempRegist.do">등록하기</button>
	<script>
		$(document).ready(function() {
			$("#btn-reg").click(function() {
				location.href = $(this).data("href");
			});
		});
	</script>
</body>
</html>