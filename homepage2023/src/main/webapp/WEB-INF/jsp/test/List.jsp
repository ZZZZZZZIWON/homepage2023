<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Language" content="ko">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
<script src="https://code.jquery.com/jquery-Latest.min.js"></script>
<style>
table {
	border-collapse: collapse;
	margin: 0 auto;
}

th {
	font-weight: bold;
}

th, td {
	padding: 10px;
	border: 1px solid #000;
}

a {
	text-decoration-color: black;
	text-decoration: none;
}

.total {
	text-align: center;
	margin: 20px auto;
}

#paging_div {
	text-align: center;
	margin-bottom: 20px;
}

button {
	display: block;
	margin: 20px auto;
}
</style>
</head>
<body>
	<!-- BBS Style -->
	<link href="/asset/BBSTMP_0000000000001/style.css" rel="stylesheet" />
	<!-- 공통 Style -->
	<link href="/asset/LYTTMP_0000000000000/style.css" rel="stylesheet" />
	<div class="container">
		<div id="contents">
			<div id="bbs_wrap">
				<div class="total">
					총 게시물 <strong> <c:out
							value="${paginationInfo.totalRecordCount}" /></strong>건 | 현재페이지 <strong><c:out
							value="${paginationInfo.currentPageNo}" /></strong>/
					<c:out value="${paginationInfo.totalPageCount}" />
				</div>
				<table>
					<thead>
						<tr>
							<th>ID</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>수정일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="result" items="${resultList}">
							<tr>
								<td><c:out value="${result.testId}" /></td>
								<td><c:url var="viewUrl" value="/test/select.do">
										<c:param name="testId" value="${result.testId}" />
									</c:url> <a href="${viewUrl}"><c:out value="${result.sj}" /></a></td>
								<td><c:out value="${result.userNm}" /></td>
								<td><fmt:formatDate value="${result.frstRegistPnttm}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
								<td><fmt:formatDate value="${result.lastUpdtPnttm}" pattern="yyyy-MM-dd hh:mm:ss" /></td>

							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div id="paging">
				<c:url var="pageUrl" value="/test/List.do" />
				<c:set var="pagingParam"><c:out value="${pageUrl}" /></c:set>
				<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="${pagingParam}" />
		</div>
	<button type="button" id="btn-reg" data-href="/test/regist.do">등록하기</button>
	</div>


	<script>
		$(document).ready(function() {
			$("#btn-reg").click(function() {
				location.href = $(this).data("href");
			});
		});
	</script>
</body>
</html>