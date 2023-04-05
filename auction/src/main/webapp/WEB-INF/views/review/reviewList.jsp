<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
   <title>리뷰게시판 글목록</title>
    <meta charset="UTF-8">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
  </head>
  <body>
    <div id="container">
      <div id="header1">
        <jsp:include page="../module/banner.jsp" flush="false"/>
      </div>
      <div id="header2">
        <jsp:include page="../module/top.jsp" flush="false"/>
      </div>
      <div id="content">
        <h2>리뷰 목록</h2>
				<p>*전체 게시물수 : ${totalCnt}</p>
				<table border=1>
				    <thead>
				        <tr>
				            <th>번호</th>
				            <th>제목</th>
				            <th>작성자</th>
				            <th>별점</th>
				            <th>작성일</th>
				            <th>조회수</th>
				            <!-- <th>추천수</th> -->
				        </tr>
				    </thead>
				    <tbody>
				         <c:forEach var="data" items="${list}">
				            <tr>
				                <td>${data.reviewNo}</td>
				                <td><a href="${contextPath}/review/detailForm?ano=${data.reviewNo}">${data.reviewTitle}</a></td>
								<td>${data.id}</td>
				                <td>${data.starRating}</td>
				                <td>${data.reviewDate}</td>
				                <td>${data.viewCnt}</td>
				               <%--  <td>${review.recommendCnt}</td> --%>
				            </tr>
						</c:forEach>
				    </tbody>
				</table>
					<button type="button" onclick="location.href='${contextPath}/review/addForm'">글쓰기</button>
				<%-- <c:if test="${not empty AUTHUSER_ID}">
					<button type="button" onclick="location.href='${contextPath}/review/addForm'">글쓰기</button>
				</c:if> --%>
      </div>
      <div id="footer">
        <jsp:include page="../module/bottom.jsp" flush="false"/>
      </div>
    </div>
  </body>
</html>