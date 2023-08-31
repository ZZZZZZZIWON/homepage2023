<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Language" content="ko">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-Latest.min.js"></script>
<link rel="stylesheet" href="/asset/member/css/login.css">
</head>
<body>
<div class="tit_intro_step">
	<ul>
		<li>약관동의</li>
		<li>회원유형</li>
		<li>정보입력</li>
		<li class="current">가입완료</li>
	</ul>
</div>

<h2 class="icon1">가입완료</h2>
<p class="mB40">회원가입이 완료되었습니다. 감사합니다</p>

<div class="join_finish">
	<p>"회원가입이 완료되었습니다. <em>로그인 후</em> 사용해주시기 바랍니다."</p>
	<div class="btn_c">
		<a href="/login/login.do" class="btn-lg spot">로그인</a>
		<a href="/cmm/main/mainPage.do" class="btn-lg">메인으로</a>
	</div>
</div>
</body>
</html>