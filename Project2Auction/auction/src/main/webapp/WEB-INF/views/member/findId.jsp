<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
<body>
	<h3>아이디 찾기</h3>
	<hr/>
	<!-- 이름과 이메일이 일치하지 않을 때-->
	<c:if test="${check == 0}">	
		<script>
		 alert("일치하는 정보가 없습니다.");
		 location.href ="<%=request.getContextPath()%>/member/findId";
		</script>
	</c:if>
	<!-- 이름과 이메일가 일치할 때 -->
	<c:if test="${check == 1 }">
		<script>
		 alert("${user.name}님의 아이디는'${user.id}'입니다.");
		 location.href ="<%=request.getContextPath()%>/member/login";
		</script>
	</c:if>
</body>
</html>