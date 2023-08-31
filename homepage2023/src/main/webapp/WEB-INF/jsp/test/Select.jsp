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
  
  	.box-btn {
      text-align: center;
      margin: 20px auto;
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
	<table>
	    <tbody>
	        <tr>
	            <th>제목</th>
	            <td><c:out value="${result.sj}"/></td>
	        </tr>
	        <tr>
	            <th>작성자</th>
	            <td><c:out value="${result.userNm}"/></td>
	        </tr>
	        <tr>
	            <th>작성일</th>
	            <td><fmt:formatDate value="${result.frstRegistPnttm}"/></td>
	        </tr>
	        <tr>
	            <th>내용</th>
	            <td><c:out value="${result.cn}"/></td>
	        </tr>
	    </tbody>
	</table>

	<div class="box-btn">
	    <c:url var="uptUrl" value="/test/regist.do">
	        <c:param name="testId" value="${result.testId}"/>
	    </c:url>
	    <a href="${uptUrl}">수정</a>
	
	    <c:url var="delUrl" value="/test/delete.do">
	        <c:param name="testId" value="${result.testId}"/>
	    </c:url>
	    <a href="${delUrl}" class="btn-del">삭제</a>
	
	    <a href="/test/list.do">목록</a>
	</div>
	
	<script>
		$(document).ready(function(){
			$(".btn-del").click(function(){
				if(!confirm("삭제하시겠습니까?")){
					return false;
				}
			});
		});
	</script>
</body>
</html>