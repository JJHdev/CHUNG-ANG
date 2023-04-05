<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath"  value="<%=request.getContextPath()%>" />    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
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
<div id="container">
      <div id="header1">
        <jsp:include page="../module/banner.jsp" flush="false"/>
      </div>
      <div id="header2">
        <jsp:include page="../module/top.jsp" flush="false"/>
      </div>
      <div id="content">
      <table>
          <tr>
            <td>
<form id="updateFrm" method="post"	action="${conPath}/calendar/updateForm">      
   	<input type="hidden" name="calenNo" id = "calenNo" value="${calendar.calenNo}">
   	<table border="1">
 	  <tbody>
 		<tr>
 		 <th>일정 제목</th>
 		 <td>
 		  <input type="text" name="calenTitle" id="calenTitle" value="${calendar.calenTitle}" required="required"/></td>	
  		</tr>
 		<tr>
	     <th>시작일</th>
	     <td>
		       기존 시작일 :<fmt:formatDate type="both" pattern="yyyy/MM/dd"  value="${calendar.calenStart}" />
		    <br/>
		       수정할 시작일 : <input type="date" name="calenStart" id="calenStart"/>
	     </td>
	    </tr>
	    <tr>
	     <th>종료일</th>
	     <td>
			기존 종료일 : <fmt:formatDate type="both" pattern="yyyy/MM/dd"  value="${calendar.calenEnd}" />
			<br/>   
			수정할 종료일 : <input type="date"  name="calenEnd" id="calenEnd"/> 
	     </td>
	    </tr>
 		<tr id="i1">
 		 <td colspan="2" style="text-align:center;">
 		 <input type="submit" value="수정"/>
 		 <input type="reset" id="btnReset" value="취소"/></td>	
 		</tr>
 	  </tbody>
  	</table>
  </form>
  
      </tr>
        </table>
      </div>
      <div id="footer">
        <jsp:include page="../module/bottom.jsp" flush="false"/>
      </div>
    </div>
</body>
</html>