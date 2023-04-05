<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입력 체크폼</title>
</head>
<body>

	<!-- 입력 내용이 정상 입력되었을 떄  -->
	<c:if test="${check eq 0}">
		<script type="text/javascript">
			alert("저장에 실패하였습니다. 작성 내용 확인 부탁드립니다.");
			location.href="<%=request.getContextPath()%>/offerBoard/offerInsertForm";
		</script>
	</c:if>
	<c:if test="${check eq 1}">
		<script type="text/javascript">
			alert("작성 완료");
			location.href="<%=request.getContextPath()%>/offerBoard/offerBoardForm";
		</script>
	</c:if>
	
</body>
</html>