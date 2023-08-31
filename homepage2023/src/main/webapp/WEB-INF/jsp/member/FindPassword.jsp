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
<title>비밀번호 찾기</title>
<script src="https://code.jquery.com/jquery-Latest.min.js"></script>
<link rel="stylesheet" href="/asset/member/css/login.css">
</head>
<body>
<h2 class="icon1">비밀번호 찾기</h2>
<p class="mB20">회원가입 시 등록한 정보를 입력해주세요.</p>

<div class="bg-area change_box">
    <form id="frm" name="frm" action="/member/findPasswordRegist.do" method="post" onsubmit="return checkForm(this)">
        <fieldset>
            <legend>비밀번호찾기 폼</legend>
            <div class="change_inp">
	            <div>
	                <label for="userNm">회원명</label>
	                <input type="text" name="userNm" class="inp" id="userNm">
	            </div>
	
	            <div>
	                <label for="emplyrId">아이디</label>
	                <input type="text" name="emplyrId" class="inp" id="emplyrId">
	            </div>            
	            
	            <div>
	                <label for="passwordHint">힌트</label>
	                <select name="passwordHint" id="passwordHint" required>
	                    <option value="1">취미 생활은?</option>
	                	<option value="2">애완견 이름은?</option>
	                	<option value="3">여행가고 싶은 곳은?</option>
	                	<option value="4">좋아하는 캐릭터는?</option>
	                </select>
	            </div>
	            <div>
	                <label for="passwordCnsr">정답</label>
	                <input type="text" name="passwordCnsr" class="inp" id="passwordCnsr"/>
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
<c:if test="${not empty message}">
    alert("${message}");
</c:if>

function checkForm() {
    if(!$("#userNm").val()) {
        alert("회원명을 입력해주세요");
        return false;
    } else if(!$("#passwordCnsr").val()) {
        alert("비밀번호 정답을 입력해주세요");
        return false;
    }
}
</script>
</body>
</html>