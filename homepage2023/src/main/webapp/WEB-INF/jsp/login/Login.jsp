<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt"%> <%@ taglib prefix="ui"
uri="http://egovframework.gov/ctl/ui"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> <%@ taglib
prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Language" content="ko" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"
    />
    <title>로그인</title>
    <script src="https://code.jquery.com/jquery-Latest.min.js"></script>
    <link rel="stylesheet" href="/asset/member/css/login.css" />
  </head>
  <body>
    <h2 class="icon1">로그인</h2>
    <p class="mB20">
      스마트소프트웨어 하이테크과정 홈페이지 방문을 환영합니다.
    </p>

    <div class="login_box">
      <div class="mem_login">
        <div class="smartshool login">
          <div class="login_inp_wrap">
            <div class="login_inp">
              <form
                action="/login/actionLogin.do"
                name="frmGnrlLogin"
                method="post"
                id="frmGnrlLogin"
                onsubmit="return checkGnrlLogin(this)"
              >
                <fieldset>
                  <legend>로그인 입력폼</legend>
                  <span>
                    <label for="id"
                      ><img
                        src="/asset/member/images/member/ico_id.svg"
                        alt="아이디"
                    /></label>
                    <input
                      type="text"
                      name="id"
                      id="id"
                      value=""
                      class="inp"
                      title="아이디를 입력하세요."
                      placeholder="아이디를 입력하세요."
                    />
                  </span>
                  <span>
                    <label for="pwd"
                      ><img
                        src="/asset/member/images/member/ico_pw.svg"
                        alt="패스워드"
                    /></label>
                    <input
                      type="password"
                      name="password"
                      id="pwd"
                      value=""
                      class="inp"
                      title="비밀번호를 입력하세요."
                      placeholder="비밀번호를 입력하세요."
                      autocomplete="off"
                    />
                  </span>
                  <button type="submit" class="btn-lg spot p10">로그인</button>
                  <div class="btn-cont">
                    <a href="#" class="btn-kakao" data-type="login">
                      <img
                        src="http://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg"
                        width="170"
                        alt="카카오 로그인 버튼"
                      />
                    </a>
                  </div>
                </fieldset>
              </form>
            </div>

            <ul>
              <li>
                <p>회원으로 가입하시겠습니까?</p>
                <a href="/join/siteUseAgree.do">회원가입</a>
              </li>
              <li>
                <p>아이디를 잊으셨나요?</p>
                <a href="/member/findId.do">아이디 찾기</a>
              </li>
              <li>
                <p>비밀번호를 잊으셨나요?</p>
                <a href="/member/findPassword.do">패스워드 찾기</a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>

    <script>
      <c:if test="${not empty loginMessage}">alert("${loginMessage}");</c:if>;

      function checkGnrlLogin(frm) {
        if (frm.id.value == "") {
          alert("아이디를 입력해주세요");
          frm.id.focus();
          return false;
        }

        if (frm.pwd.value == "") {
          alert("비밀번호를 입력해주세요");
          frm.pwd.focus();
          return false;
        }
        $("#frmGnrlLogin");
      }

      $(document).ready(function () {
        // 아이디 입력 창 포커스 설정
        $("#id").focus();
      });
    </script>
    <form action="/login/actionLogin.do" name="frmLogin" method="post" id="frmLogin">
      <input type="hidden" name="loginType" value=""/>
      <input type="hidden" id="snsId" name="id" />
    </form>
    <script src="http://developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script>
      $(document).ready(function () {
        //카카오 로그인 버튼
        $(".btn-kakao").click(function () {
          const type = $(this).data("type");
          kakaoLogin(type);
          return false;
        });
      });

      //카카오 키 정보 입력
		Kakao.init('246456325c6f23239a4f114371ec9b5a'); 

		//카카오 SDK 초기화
		Kakao.isInitialized();

        //카카오로그인
		function kakaoLogin(type) {
			Kakao.Auth.login({
				success : function(response) {
					Kakao.API.request({
						url : '/v2/user/me',
						success : function(response) {
							console.log(response)
							$("input[name=loginType]").val("KAKAO");
							$("#snsId").val(response.id);
							$("#frmLogin").submit();
						},
						fail : function(error) {
							console.log(error)
						},
					})
				}, fail : function(error) {
					console.log(error)
				},
			})
		}
    </script>
  </body>
</html>
