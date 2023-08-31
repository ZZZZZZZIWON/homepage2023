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
<title>아이디 찾기</title>
<script src="https://code.jquery.com/jquery-Latest.min.js"></script>
<link rel="stylesheet" href="/asset/member/css/login.css">
</head>
<body>
<h2 class="icon1">비밀번호 재발급</h2>

<div class="bg-area change_box">
    <form id="passwordCnfirm" action="/member/findPasswordComplete.do" method="post" onsubmit="return checkForm(this)">
        <fieldset>
            <legend>비밀번호 변경 폼</legend>
            <input type="hidden" name="esntlId" value="${result.esntlId}">
            <input type="hidden" name="emplyrId" value="${result.emplyrId}">
            <div class="change_intro">
                <cite><span>TIP</span>보안에 취약한 비밀번호는 사용하지 마세요!</cite>
                <p>
                    쉬운 비밀번호나 자주 쓰는 사이트의 비밀번호가 같은 경우, 도용되기 쉬워 주기적으로 변경하여 사용하는 것이 좋습니다.<br />
                    비밀번호에 특수문자를 추가하여 사용하시면 기억하기도 좋고, 비밀번호 안전도가 높아져 도용의 위험이 줄어듭니다.
                </p>
            </div>
            <div class="change_inp">
	            <div>
	                <label for="password">새로운 비밀번호</label>
	                <input type="password" name="password" class="inp" id="password">
                    <span>비밀번호는 영문, 숫자, 특수문자를 3가지 사용시 8자 이상, 2가지 사용시 10자리 이상으로 구성하여 주십시오.</span>
	            </div>
	            <div>
	                <label for="password2">새 비밀번호 확인</label>
	                <input type="password" name="password2" class="inp" id="password2">
	            </div>            
           </div>
            <div class="btn-cont">
                <button type="submit" class="btn spot">확인</button>
                <button type="reset" class="btn">취소</button>
            </div>
        </fieldset>
    </form>
</div>

<script>

function checkForm() {
    if(!$("#password").val()) {
        alert("비밀번호를 입력해주세요");
        return false;
    } else if(!$("#password2").val()) {
        alert("비밀번호 확인을 입력해주세요");
        return false;
    } else if($("#password").val() != $("#password2").val()) {
        alert("비밀번호와 비밀번호 확인 정보가 다릅니다.");
        return false;
    }
}

</script>
</body>

</html>