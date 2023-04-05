<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="contextPath1" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정</title>
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
</head>
<body>
<%-- 컨트롤러에 의해서 아래와 같이 모델을 받았다 
 Article review
 model.addAttribute("review",review);--%>

  <h3>리뷰글수정(updateForm.jsp)</h3>
  <form id="updateForm" 
        action="${contextPath}/review/updateForm" method="post">
 	<input type="hidden" name="reviewNo" value="${review.reviewNo}"/>
   	<table border="1">
 	  <tbody>
 		<tr>
 		 <th>글번호</th>
 		 <td>${review.reviewNo}</td>
 		</tr>
 		<tr>
 		 <th>작성자</th>
 		 <td>${review.id}</td>
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
 		 <td><input type="text" name="reviewTitle" id="reviewTitle" required="required" value="${review.reviewTitle}"/></td>	
 		</tr>
 		<tr>
 		 <th>내용</th>
 		 <td><textarea name="reviewContent" id="reviewContent" cols="30" rows="5" required="required">${review.reviewContent}</textarea></td>	
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
 		 <input type="submit" id="btnSubmit" value="수정"/>
 		 <input type="reset" id="btnReset" value="취소"/>	
 		 <input type="button" id="btn1" value="목록보기" onclick="location.href='${contextPath}/review/listForm?ano=${review.reviewNo}'"/>
		</td>	
 		</tr>
 	  </tbody>
  	</table>
  </form>
</body>
</html>