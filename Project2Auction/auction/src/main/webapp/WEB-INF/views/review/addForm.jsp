<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="contextPath1" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>리뷰 글등록(addFrom.jsp)</title>
    <meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
		<script>
		 let count=1; 
		 $(document).ready(function(){
		   $("#btnDelFile").click(function(){ 
		   	if(count==1){ //유지해야하는 파일수보다 적다면
		   		alert("반드시 한개는 있어야 합니다.");
		   		return;
		   	}
		   	
		   	let tr = $("#files"+count).parents("tr");
		    $(tr).remove();
		   	count--; 
		   });
		   
		   $("#btnAddFile").click(function(){ 
		    count++;
		    if(count==4){ //허용된 첨부파일수(3개)보다 크다면
		    	alert("첨부파일은 최대 3개까지 가능합니다.");
		    	count=3;
		    	return; //함수종료
		    }
		    let tr = "<tr><th>첨부파일</th><td>";
		     	tr+="<input type='file' name='file"+count+"' id='files"+count+"'/></td></tr>";
		    $("#i1").before(tr);	
		   });
		 });
		</script>
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
        <h2>리뷰 작성</h2>
	<form id="reviewAddForm" 
  		method="post" enctype="multipart/form-data" 
  		action="${contextPath}/review/addNewReview">
		<table border="1">
			<tbody>
			 <tr>
			  <th>작성자</th>
			  <td>${sessionScope.AUTHUSER_ID}
			  <input type="hidden" name="id" value="${sessionScope.AUTHUSER_ID}" />
			  </td>
			 </tr>
			 <tr>
			  <th>별점</th>
			  <td><label>
			  		<select name="starRating" id="starRating" required>
			  		 <option value="★★★★★">★★★★★</option>
			  		 <option value="★★★★☆">★★★★☆</option>
			  		 <option value="★★★☆☆">★★★☆☆</option>
			  		 <option value="★★☆☆☆">★★☆☆☆</option>
			  		 <option value="★☆☆☆☆">★☆☆☆☆</option>
			  	  </select>
			  	  </label>
			  	  </td>
			 	</tr>
			 <tr>
			  <th>제목</th>
			  <td><input type="text" name="reviewTitle" id="reviewTitle" required="required"></td>
			 </tr>
			 <tr>
			  <th>내용</th>
			  <td><textarea name="reviewContent" id="reviewContent" cols="30" rows="5" required="required"></textarea></td>
			 </tr>
		 	 <tr>
			     <th>파일첨부</th>
			     <td>
			        <input type="button" value="파일추가" id="btnAddFile"/>
			    	<input type="button" value="파일삭제" id="btnDelFile"/>
			     </td>
			 </tr>
			  <tr>
			     <th>첨부파일</th>
			     <td>
			     	<input type="file" name="file1" id="files1"/>
			     </td>
			  </tr>
		 	  <tr id="i1">
		 		 <td colspan="2" style="text-align:center;">
		 		 <input type="submit" value="첨부파일등록하기"/>
		 		 <input type="reset" id="btnReset" value="취소"/></td>	
		 	 </tr>
			</tbody>
		</table>	
	</form>
      </div>
      <div id="footer">
        <jsp:include page="../module/bottom.jsp" flush="false"/>
      </div>
    </div>
  </body>
</html>