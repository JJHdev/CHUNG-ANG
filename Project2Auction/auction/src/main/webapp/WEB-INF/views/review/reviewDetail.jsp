<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="mreviewdto"  value="${reviewMap.reviewdto}" />
<c:set var="mimageList"  value="${reviewMap.imageList}" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>리뷰게시판 글 상세보기</title>
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
       <h2>리뷰 상세</h2>
    <c:if test="${not empty review}">
       <table border="1">
            <tr>
                <td>번호</td>
                <td>${ReviewNo}</td>
                <td>작성자</td>
                <td>${review.id}</td>
            </tr>
             <tr>
                <td>작성일자</td>
                <td>${review.reviewDate}</td>
                <td>조회수</td>
                <td>${review.viewCnt}</td>
            </tr>
            <tr>
                <td>별점</td>
                <td colspan="3">${review.starRating}</td>
            </tr>
              <tr>
                <td>이미지</td>
                <td colspan="3">
                <c:forEach var="file" items="${mimageList}">
					  <img src="${contextPath}/filedownload?reviewNo=${ReviewNo}&fileName=${file.fileName}" class="imgSize"/><br/>
				  </c:forEach>
  			</td>
            </tr>
            <tr>
                <td>제목</td>
                <td colspan="3">${title}</td>
            </tr>
            <tr>
                <td>내용</td>
                <td colspan="3">${review.reviewContent}</td>
            </tr>
            
        </table>
        <a href="${contextPath}/review/listForm">목록</a>
        	<a href="${contextPath}/review/updateForm?ano=${ReviewNo}">수정</a>
       		<a href="${contextPath}/review/delete?ano=${review.reviewNo}">삭제</a>
    </c:if>
      </div>
      <div id="footer">
        <jsp:include page="../module/bottom.jsp" flush="false"/>
      </div>
    </div>
  </body>
</html>