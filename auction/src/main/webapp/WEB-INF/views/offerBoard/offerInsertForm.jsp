<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="frm" uri="http://www.springframework.org/tags/form" %>  
<c:set var="CPATH" value="<%=request.getContextPath()%>"/>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구인입력폼View</title>
<style>
	
  .tablemain {
    display: table;
	 margin: auto;
    width: 30%;
    text-align: center;
     border-radius:8px;
   }
  .table1 {
    display: table-row;
  }
   .table2 {
    display: table-row;
  }
   .table3 {
    display: table-row;
  }
   .table4 {
    display: table-row;
  }
   .table5 {
    display: table-row;
  }

  .table-cell {
    display: table-cell;
    padding: 10px;
    border: 1px solid gray;
  }
  .table6 {
    display: table-row;
  }
    .table7 {
    display: table-row;
    text-align: center;
  }   
  .table8 {
    display: table-row;
    text-align: center;
   
  }
  #offersave{
	border-radius:8px;
      button-size: 100px;
      padding: 15px 30px;
        text-align: center;
        font-size: 18px;
        background-color: beige;
        margin: 4px 2px;
        border: none;
        line-height: 1.2rem;
         margin: auto;
   
  }
  
</style>
 <script type="text/javascript">
	window.onload = function() {
		today = new Date();
		console.log("today.toISOString() >>>" + today.toISOString());
		today = today.toISOString().slice(0, 10);
		console.log("today >>>> " + today);
		bir = document.getElementById("wttime");
		bir.value = today;
	}
	
</script>
<script>
$(document).ready(function(){
	$("#offersave").click(function(){
		
		let contentCK =$("$id").val();
		let titleCK =$("$title").val();
		
		if(contentCK == ""){
			alert("재 로그인 후 작성 가능합니다.");
			return false;
		}
		if(titleCK == ""){
			alert("제목 입력은 필수입니다.");
			return false;
		}
		
	});
	
	
	
});


</script>





</head>

<body>
	
		<h3 style="text-align: center;">구인 게시글 (입력 폼)</h3>
		<hr>
		<form name="offerBoardfrm" id="offerBoardfrm" method="get" action="${CPATH}/offerBoard/offerInsertForm1">
			<div class="tablemain">
			<br>
			<br>
			  <div class="table1">
			    	<div class="table-cell">글쓴이<br/>${sessionScope.AUTHUSER.id}
			    <!-- 	<input type="hidden" name="offerno" id="offerno" /> -->
			    	<input type="hidden" name="id" id="id" value="${sessionScope.AUTHUSER.id}" />
			  <br></div>
			  </div>
			  
			  <div class="table2">
			    	<div class="table-cell">구인 글제목<br/>
			    	<input type="text" name="offertitle" id="offertitle"  required="required"/>
			    	</div>
			  </div>
			
			  <div class="table3">
			   	 	<div class="table-cell">급여<br/>
			   	 	<input type="text" name="pay" id="pay" />원
			   	 	</div>
			  </div>
			  
			   
			   	 
			   	 	<input type="hidden" name="wttime" id="wttime" />
			   
			 
			  
			    <div class="table5">
			   	 	<div class="table-cell">대행 시작일시<br/>
			   	 	<input type="datetime-local" name="starttime" id="starttime" required="required"/>
			   	 	</div>
			  </div>
			  
			   <div class="table6">
			    	<div class="table-cell">내용<br/>
			    	<textarea  name="offercontent" id="offercontent" cols="30" rows="5" required="required"></textarea>
			    	</div>
			   </div>
			    
		
			   <div class="table7">
			    	<div class="table-cell" >상세주소
			    	<br/>
			    	<input type="text" name="offerpoint" id="offerpoint" required="required"/>
			    	</div>
			  </div>
			
			<!-- 지도 API 끝 -->
			<div class="table8"><input type="submit" name="offersave" id="offersave" value="작성 완료" /></div>
			 </div>
		 </form>
	
</body>
</html>