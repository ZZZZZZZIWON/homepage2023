<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL 연습</title>
</head>
<body>

	<c:set var="step" value="${param.step}" />
	<c:if test="${empty step }">
		<c:set var="step" value="1" />
	</c:if>

	<ul>
		<c:choose>
			<%-- c tag 설명 --%>
			<c:when test="${step eq '1' }">
				<li>
					<h3>c:out Tag : &#60;% = ... %&#62;과 유사한 표현식</h3>
					<h4>기본문법 : &#60;c:out value="값"/%&#62;</h4> 
						
						JSP 1번 : <% out.print("hello"); %> <br /> 
						JSP 2번 : <% String a = "hello"; %> 
								 <%=a%><br /> 
						JSTL : <c:out value="hello" /><br />
				</li>
			</c:when>
			<c:when test="${step eq '2' }">
				<li>
					<h3>c:import Tag : jsp 'include'와 유사. 서버 내부 또는 서버 외부의 모든 자원 컨텐츠를 포함하는 추가 기능이 있음</h3>
					<h4>기본문법 : &#60;c:import url="URL주소 값" charEncoding="utf-8"/&#62;</h4>
					
					<c:import url="/temp/jstlImport.do" charEncoding="utf-8"/>
					<%-- <c:import url="/temp/selectList.do" charEncoding="utf-8"/> --%>
				</li>
			</c:when>
			<c:when test="${step eq '3' }">
				<li>
					<h3>c:set Tag : 일반 변수를 생성해서 값을 할당</h3>
					<h4>기본문법 : &#60;c:set var="변수명" value="값"/&#62;</h4>
					
					<c:set var="str" value="지금은 c:set 연습중"/>
					<c:out value="${str }"/>
				</li>
			</c:when>
			<c:when test="${step eq '4' }">
				<li>
					<h3>c:if Tag : 조건문 중의 하나. JAVA에서 사용하는 If와 동일</h3>
					<h4>기본문법 : &#60;c:if test="조건문"&#62; &#60;/c:if&#62; </h4>
					
					<c:set var="test" value="0"/>
					<c:if test="${test eq '0'}">
						true
					</c:if>
				</li>
			</c:when>
			<c:when test="${step eq '5'}">
				<li>
					<h3>c:choose, c:when, c:otherwise Tag : 조건문 중의 하나. JAVA에서 사용하는 If, else if, else와 비슷함</h3>
					<h4>기본문법 : 
						&#60;c:choose&#62;</br>
							 &#60;c:when test="조건문"&#62; 조건 true에 대한 내용 &#60;/c:when&#62;<br/>
							 &#60;c:otherwise&#62; 조건에 해당되지 않아서 나오는 내용 &#60;/c:otherwise&#62;<br/>
							 &#60;/c:choose&#62;
					</h4>
					
					<c:set var="test" value="0"/>
					<c:choose>
						<c:when test="${test eq '1'}">1입니다.</c:when>
						<c:otherwise>조건에 해당되지 않음</c:otherwise>					
					</c:choose>
				</li>
			</c:when>
			<c:when test="${step eq '6'}">
				<li>
					<h3>c:forEach Tag : 기본 반복 태그, 고정된 횟수 또는 초과 수집 동안 중첩된 본문 내용을 반복</h3>
					<h4>기본문법 : </br>
						&#60;c:forEach var="변수명" items="반복문 변수" &#62;<br/>
						&#60;/c:forEach&#62;
					</h4>
					
					<c:set var="str" value="1,2,3,4,5,6"/>
					<c:set var="strSplit" value="${fn:split(str,',')}"/>
					<c:forEach var="result" items="${strSplit}">
						<c:out value="${result}"/><br/>
					</c:forEach>
				</li>
			</c:when>
			<c:when test="${step eq '7'}">
				<li>
					<h3>c:param Tag : 포함하는 import, url 태그의 URL에 매개 변수를 추가</h3>
					<h4>기본문법 : &#60;c:param name="변수명" value="값" &#62;</h4>
					
					<c:import url="/temp/jstlImport.do" charEncoding="utf-8">
						<c:param name="test" value="테스트 호츨"/>
					</c:import>

				</li>
			</c:when>
			<c:when test="${step eq '8'}">
				<li>
					<h3>c:url Tag : url 주소</h3>
					<h4>기본문법 : &#60;c:url var="변수명" value="값"/ &#62;</h4>
					
					URL 1 : <c:url var="link1" value="https://www.naver.com"/><br/>
					URL 2 : <c:url var="link2" value="/temp/jstlImport.do">
								<c:param name="test" value="테스트 호출"/>
							</c:url>
							<br/>
							
					<a href="${link1 }" target="_blank">링크 1번</a><br/>
					<a href="${link2 }" target="_blank">링크 2번</a><br/>
				</li>
			</c:when>
			
			<%-- function tag 설명 --%>
			<c:when test="${step eq '9' }">
				<li>
					<h3>fn:contains() : 주어진 문자열이 특정 문자열을 포함하고 있는지 확인하는데 사용</h3>
					
					<c:set var="str" value="지금은 fn:contains 연습중"/>
					<c:if test="${fn:contains(str, '지금')}">
					<h4>true</h4>
					</c:if>
				</li>
			</c:when>
			
			<c:when test="${step eq '10' }">
				<li>
					<h3>fn:indexOf() : 주어진 문자열이 특정 문자열로 시작되는지 확인하는데 사용</h3>
					
					<c:set var="string" value="It is the first String."/>
					<p>Index : ${fn:indexOf(string, "first")}</p>
				</li>
			</c:when>
			
			<c:when test="${step eq '11' }">
				<li>
					<h3>fn:startsWith() : 주어진 문자열이 특정 문자열 값으로 시작되는지 확인하는데 사용</h3>
					
					<c:set var="String" value="Welcome to JSP programming."/>
					<c:if test="${fn:startsWith(String, 'Welcome')}">
						<p>String starts with Welcome</p>
					</c:if>
					<c:if test="${fn:startsWith(String, 'programming')}">
						<p>String starts with programming</p>
					</c:if>
				</li>
			</c:when>
			<c:when test="${step eq '12' }">
				<li>
					<h3>fn:endsWith() : 주어진 문자열이 특정 문자열 값으로 끝나는 지 확인하는데 사용</h3>
					
					<c:set var="String" value="Welcome to JSP programming."/>
					<c:if test="${fn:endsWith(String, 'programming')}">
						<p>String ends with programming</p>
					</c:if>
					
					<c:if test="${fn:endsWith(String, 'JSP')}">
						<p>String ends with JSP</p>
					</c:if>
				</li>
			</c:when>
			<c:when test="${step eq '13'}">
				<li>
					<h3>fn:split() : 주어진 문자열을 특정 문자로 구분해서 배열로 분할</h3>
					
					<c:set var="str" value="1,2,3,4,5,6"/>
					<c:set var="strSplit" value="${fn:split(str,',')}"/>
					<c:forEach var="result" items="${strSplit}">
						<c:out value="${result}"/><br/>
					</c:forEach>
				</li>
			</c:when>
			
			<c:when test="${step eq '14'}">
				<li>
					<h3>fn:length() : 문자열 내부의 문자 수 또는 컬렉션의 항목 수를 반환</h3>
					
					<c:set var="str1" value="This is first string"/>
					<c:set var="str" value="1,2,3,4,5,6"/>
					<c:set var="strSplit" value="${fn:split(str,',')}"/>
					Length of the String-1 is : <c:out value="${fn:length(str1)}"/><br>
					Length of the String-2 is : <c:out value="${fn:length(strSplit)}"/><br>
				</li>
			</c:when>
			<c:when test="${step eq '15'}">
				<li>
					<h3>fn:toLowerCase() : 문자열의 모든 문자를 소문자로 변환</h3>
					
					<c:set var="string" value="Welcome to JSP Programming"/>
					<c:out value="${fn:toLowerCase(string)}"/>
				</li>
			</c:when>
			<c:when test="${step eq '16'}">
				<li>
					<h3>fn:toUpperCase() : 문자열의 모든 문자를 대문자로 변환</h3>
					
					<c:set var="string" value="Welcome to JSP Programming"/>
					<c:out value="${fn:toUpperCase(string)}"/>
				</li>
			</c:when>
			<c:when test="${step eq '17'}">
				<li>
					<h3>fn:substring() : 주어진 시작 및 끝 위치에 따라 문자열의 하위 집합을 반환</h3>
					
					<c:set var="string" value="2023-04-19"/>
					<c:out value="${fn:substring(string, 0, 4)}"/><br>
					<c:out value="${fn:substring(string, 5, 7)}"/><br>
					<c:out value="${fn:substring(string, 8, 10)}"/>
				</li>
			</c:when>
			<c:when test="${step eq '18'}">
				<li>
					<h3>fn:replace() : 모든 문자열을 다른 문자열 시퀀스로 바꿈</h3>
					
					<c:set var="string" value="2023-04-19"/>
					<c:out value="${fn:replace(string, '-', '.')}"/>
				</li>
			</c:when>
			<c:when test="${step eq '19'}">
				<li>
					<h3>fn:trim() : 문자열의 양쪽 끝에서 공백을 제거(문자열 사이의 공백은 사라지지 않음)</h3>
					
					<c:set var="str1" value="               Welcome to JSP programming               "/>
					<p>String-1 Length is : ${fn:length(str1)}</p>
					
					<c:set var="str2" value="${fn:trim(str1)}"/>
					<p>String-2 Length is : ${fn:length(str2)}</p>
					<p>Final value of string is : ${str2}</p>					
				</li>
			</c:when>
			
			
			<%-- formatting tag 설명 --%>
			<c:when test="${step eq '20'}">
				<li>
					<h3>fmt:formatDate : 제공된 패턴 및 스타일을 사용하여 시간 및 날짜를 형식화함</h3>
					
					<c:set var="Date" value="<%=new java.util.Date()%>"/>
					<h4>${Date}<br/></h4>
					<h4><fmt:formatDate value="${Date}" pattern="yyyy-MM-dd"/></h4>
				</li>
			</c:when>
		</c:choose>
	</ul>
</body>
</html>