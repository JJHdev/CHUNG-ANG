<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alert Form</title>
<script type="text/javascript">
alert("<%= "구매 신청이 완료되었습니다." %>");
location.href = "${contextPath}/goodsListForm";
</script>
</head>
<body>
</body>
</html>