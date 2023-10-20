<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<style>
/* 스타일링을 위한 CSS */
.dropdown {
  position: relative;
  display: inline-block;
  margin-right: 10px;
}
.dropbtn {
  background-color: #fff;
  color:  #000;
  padding: 10px 20px;
  font-size: 16px;
  border-radius: 5px;
  border: 1px solid #ccc;
  cursor: pointer;
  transition: all 0.3s ease-in-out;
}
.dropdown-content {
  display: none;
  position: absolute;
  z-index: 1;
}
.dropdown-content a {
 color: #000;
  padding: 10px 20px;
  display: block;
  transition: all 0.3s ease-in-out;
}
.dropdown:hover .dropbtn {
  background-color: #000;
  color: #fff;
  border-color: #000;
}
.dropdown:hover .dropdown-content {
background-color: white;
  display: block;
}
</style>
</head>
<body>

<%-- 관리자가 로그인했을 때 보여지는 메뉴 --%>
	<c:if test="${not empty AUTHUSER && (AUTHUSER.grade==999)}">  
<div class="dropdown">
  <button class="dropbtn">공지/일정</button>
  <div class="dropdown-content">
    <a href="<%=request.getContextPath()%>/calendarView">공지/일정</a>
    <a href="<%=request.getContextPath()%>/adminCalendar">일정관리</a>
  </div>
</div>

</c:if>
 <div class="dropdown">
  <button class="dropbtn">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상품 경매 확인&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
  <div class="dropdown-content">
  <c:if test="${sessionScope.AUTHUSER.grade == 999}">
    <a href="<%=request.getContextPath()%>/goodsRegisterForm">상품등록</a>
  </c:if>
    <a href="<%=request.getContextPath()%>/goodsListForm">상품리스트</a>
    <a href="<%=request.getContextPath()%>/productList">상품 결재 리스트</a>
<c:if test="${sessionScope.AUTHUSER != null}">
  <a href="<%=request.getContextPath()%>/productPurMessage">구매자용 결재 쪽지함</a>
  <a href="<%=request.getContextPath()%>/productSellMessage">판매자용 결재 쪽지함</a>
</c:if>
  </div>
</div>

<!-- <div class="dropdown">
  <button class="dropbtn">Button 2</button>
  <div class="dropdown-content">
    <a href="#">Option 2-1</a>
    <a href="#">Option 2-2</a>
    <a href="#">Option 2-3</a>
  </div>
</div>

<div class="dropdown">
  <button class="dropbtn">Button 2</button>
  <div class="dropdown-content">
    <a href="#">Option 2-1</a>
    <a href="#">Option 2-2</a>
    <a href="#">Option 2-3</a>
  </div>
</div> -->

<div class="dropdown">
  <button class="dropbtn">오픈런 구인</button>
  <div class="dropdown-content">
    <a href="<%=request.getContextPath()%>/offerBoard/offerBoardForm">구인 게시판</a>
  </div>
</div>



<div class="dropdown">
  <button class="dropbtn">후기</button>
  <div class="dropdown-content">
<a href="<%=request.getContextPath()%>/review/listForm">후기</a>
  </div>
</div>


<c:if test="${empty AUTHUSER}">
	<div class="dropdown">
	  <button class="dropbtn">회원가입</button>
	  <div class="dropdown-content">
	    <a href="<%=request.getContextPath()%>/member/join">회원가입</a>
	    <a href="<%=request.getContextPath()%>/member/findId">아이디 찾기</a>
		  <a href="<%=request.getContextPath()%>/member/findPwd">비밀번호 찾기</a>
	  </div>
	</div>
</c:if>


<%-- 일반user가 로그인했을 때 보여지는 메뉴 --%>
	<c:if test="${! empty AUTHUSER && (AUTHUSER.grade eq 1)}">  
	<div class="dropdown">
	  <button class="dropbtn">MyPage</button>
	  <div class="dropdown-content">
			 <a href="<%=request.getContextPath()%>/member/info?id=${AUTHUSER.id}">내정보</a>
	  </div>
	</div>
</c:if>

	<%-- 관리자가 로그인했을 때 보여지는 메뉴 --%>
	<c:if test="${not empty AUTHUSER && (AUTHUSER.grade==999)}">     
	<div class="dropdown">
	  <button class="dropbtn">회원관리</button>
	  <div class="dropdown-content">
			 <a href="<%=request.getContextPath()%>/member/list">회원관리</a>
	  </div>
	</div>
</c:if>
<c:if test="${not empty AUTHUSER}">
<div class="dropdown" style="float: right;">
  <button class="dropbtn" onclick="location.href='<%=request.getContextPath()%>/member/logout'">로그아웃</button>
</div>
</c:if>
<c:if test="${empty AUTHUSER}">
<div class="dropdown" style="float: right;">
  <button class="dropbtn" onclick="location.href='<%=request.getContextPath()%>/member/login'">로그인</button>
</div>
</c:if>

</body>
</html>