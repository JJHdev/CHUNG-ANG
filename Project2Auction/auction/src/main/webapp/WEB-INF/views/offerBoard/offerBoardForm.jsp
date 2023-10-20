<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="cp" value="<%=request.getContextPath()%>" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구인게시판</title>
<style type="text/css"><
 <style>
          
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
      #GOoffer{
      button-size: 100px;
      padding: 15px 30px;
        text-align: center;
        font-size: 18px;
        background-color: beige;
        margin: 4px 2px;
        border: none;
         margin: auto;
         display: flex; 
         justify-content: center;
          border-radius:8px;
      }
     
         body {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
        font-size: 0.9rem;
        line-height: 1.2rem;
        color: #333;
        letter-spacing: 0.1px;
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

<h3 style="text-align: center;">구인 게시판</h3>
<hr/>

	<form >
<table border="1">
	  <thead>
		  <tr>
		    <td>글번호</td>
		    <td>작성자ID</td>
		    <td>제목</td>
		    <td>거래 장소</td>
		    <td>급여</td>
		    <td>작성일</td>
		    <td>대행 시작 시간</td>
		    <td>조회수</td>
		  </tr>
	  </thead>
	  <tbody>
 
	  <c:forEach var="data" items="${offerBoard.contents}"> 
		
		  <tr>
		  
		    <td>${data.offerno}</td>
		  
		    <td>${data.id}</td> 
		    <td><a href="${cp}/offerBoard/offerSelectForm?offerno=${data.offerno}">
		    ${data.offertitle}</a>
		    </td>
		    <td>${data.offerpoint}</td>
		   
		    <td>${data.pay}</td>
		    <td><fmt:formatDate value="${data.wttime}" pattern="yyyy년MM월dd일 hh시mm분" /></td>
		     <td><fmt:formatDate value="${data.starttime}" pattern="yyyy년MM월dd일 hh시mm분" /></td>
		    <td>${data.viewcnt}</td>
		  </tr>
		   
		</c:forEach>  
	
		 <%-- paging출력 부분 --%>
   <tr>
  	<td colspan="8" style="text-align:center;  ">
     <%-- JSTL if조건문: 이전출력 --%>
	     <c:if test="${offerBoard.startpage>5}">
	       <a href="${cp}/offerBoard/offerBoardForm?pageNo=${offerBoard.startpage-5}">prev</a>
	     </c:if>  
     <%-- JSTL forEch조건문: 페이지번호출력 --%>  
	     <c:forEach var="pNo"                       
	     			begin="${offerBoard.startpage}" 
	     			end="${offerBoard.endpage}">
	      <a href="${cp}/offerBoard/offerBoardForm?pageNo=${pNo}">${pNo}</a> 
	     </c:forEach>  
                                      
     <%-- JSTL if조건문: 다음출력 --%>  
	     <c:if test="${offerBoard.endpage<offerBoard.totalpages}">
	       <a href="${cp}/offerBoard/offerBoardForm?pageNo=${offerBoard.startpage+5}">next</a>
	     </c:if> 
	   </td>
   </tr>
	  </tbody>
</table>
	<a href="${cp}/offerBoard/offerInsertForm" ><input type="button" name="GOoffer" id="GOoffer" value="구인 글쓰기"/></a>
	 </form>
	 </div>
    </div>    
</body>
</html>