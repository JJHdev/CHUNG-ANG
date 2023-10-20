<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
</head>
<body>
	<h3>maind</h3>
	<hr>
	<%-- 비로그인시 보여지는 메뉴 --%>
	<c:if test="${empty AUTHUSER}">
	<ul>          
	<li><a href="<%=request.getContextPath()%>/member/join">회원가입</a></li>
	<li><a href="<%=request.getContextPath()%>/member/login">로그인</a></li>
	<li><a href="<%=request.getContextPath()%>/member/findId">아이디 찾기</a></li>
	<li><a href="<%=request.getContextPath()%>/member/findPwd">비밀번호 찾기</a></li>
	</ul>
	</c:if>
	<%-- 일반user가 로그인했을 때 보여지는 메뉴 --%>
	<c:if test="${! empty AUTHUSER && (AUTHUSER.grade eq 1)}">    
	 ${AUTHUSER.name}님 접속중 
	<ul>          
	 <li><a href="<%=request.getContextPath()%>/member/info?id=${AUTHUSER.id}">내정보</a></li>
	 <li><a href="<%=request.getContextPath()%>/member/logout">로그아웃</a></li>
	</ul>
	</c:if>
	<%-- 관리자가 로그인했을 때 보여지는 메뉴 --%>
	<c:if test="${not empty AUTHUSER && (AUTHUSER.grade==999)}">    
	 ${AUTHUSER.name}님 접속중 
	<ul>          
	 <li><a href="<%=request.getContextPath()%>/member/logout">로그아웃</a></li>
	 <li><a href="<%=request.getContextPath()%>/member/list">회원관리</a></li>
	</ul>
	</c:if>
</body>
</html>