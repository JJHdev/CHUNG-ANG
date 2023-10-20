<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<h3>비밀번호 찾기</h3>
	<hr/>
	<!-- 정보가 일치하지 않을 때-->
	<c:if test="${check == 0}">	
		<script>
		 alert("일치하는 정보가 없습니다.");
		 location.href ="<%=request.getContextPath()%>/member/findPwd";
		</script>
	</c:if>
	<!-- 정보가 일치할 때 -->
	<c:if test="${check == 1 }">
		<script>
		 alert("${user.name}님의 비밀번호는'${user.password}'입니다.");
		 location.href ="<%=request.getContextPath()%>/member/login";
		</script>
	</c:if>
	
</body>
</html>