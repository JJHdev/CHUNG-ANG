<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath"  value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<title>일정관리 할 테이블</title>
</head>

 <style>
      body {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
      }
      
      #container {
        position: relative;
        min-height: 100vh;
      }
      
      #header1 {
        height: 130px;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        background-color: #fff;
        z-index: 1;
      }
      
      #header2 {
        height: 70px;
        position: fixed;
        top: 130px;
        left: 0;
        width: 100%;
        background-color: #fff;
        z-index: 1;
      }
      
      #content {
        margin-top: 200px;
        margin-bottom: 100px;
      }
      
      #footer {
        height: 70px;
        position: fixed;
        bottom: 0;
        left: 0;
        width: 100%;
        background-color: #fff;
        z-index: 1;
      }
      
      table {
        width: 95%;
        margin: 0 auto;
        border: 1px solid #ccc;
        border-collapse: collapse;
      }
      
      tr {
        border: 1px solid #ccc;
      }
      
      td {
        border: 1px solid #ccc;
        padding: 10px;
      }
    </style>
<body>
<h2>전체 조회, 입력, 수정, 삭제를 수행할 테이블</h2>
   <div id="container">
      <div id="header1">
        <jsp:include page="../module/banner.jsp" flush="false"/>
      </div>
      <div id="header2">
        <jsp:include page="../module/top.jsp" flush="false"/>
      </div>
      <div id="content">
   
    <button type="button" onclick="location.href='${conPath}/calendar/addForm'">일정 등록</button>
	<table border="1">
 	 <thead>
  		<tr>
	  	 <th>번호</th>
	  	 <th>제목</th>
	  	 <th>시작일</th>
	  	 <th>종료일</th>
	  	 <th>비고(수정,삭제)</th>
  		</tr>
 	 </thead>
  	<tbody>
  <!--  JSTL forEach반복문이용하여 출력시작 
      for(int i=1; i<=10;i++){ syso(i) } //1 2 3.. 9 10
      for(타입 변수명 : 컬렉션명){ syso(변수명) }
    -->
   <c:forEach  var="data" items="${list}">
 	 <tr>
 	  <td>${data.calenNo}</td>
 	  <td>${data.calenTitle}</td>
 	  <td><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${data.calenStart}"/></td>
 	  <td><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${data.calenEnd}" /></td>
 	  <td><button type="button" 
    onclick="location.href='${conPath}/calendar/updateForm?ano=${data.calenNo}'">수정하기</button>
   <button type="button" 
    onclick="location.href='${conPath}/calendar/delete?ano=${data.calenNo}'">삭제하기</button>
   <br/></td>
 	 </tr>
 	 </c:forEach>
 <!--    반복문이용하여 출력끝-->
   </tbody> 
   </table> 
   
      </div>
      <div id="footer">
        <jsp:include page="../module/bottom.jsp" flush="false"/>
      </div>
    </div>
</body>
</html>