<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
    width: 50%;
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
</style>
<!-- <style>
 .map_wrap {position:relative;width:100%;height:350px;}
    .title {font-weight:bold;display:block;}
    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
</style> -->
</head>
<body>
	
		<h3 style="text-align: center;">구인 게시글 (확인폼)</h3>
		<hr>
		<form name="offerBoard2" id="offerBoard2">
			<div class="tablemain" >
			<br>
			<br>
			  <div class="table1">
			    	<div class="table-cell">글쓴이<br/>
			    	<input type="text" name="id" id="id" value="${offerBoard.id}" readonly="readonly"/>
			    	<input type="hidden" name="offerno" id="offerno" value="${offerBoard.offerno}"/>
			 		 
			 		 </div><br>
			  </div>
			  <div class="table2">
			    	<div class="table-cell">구인 글제목<br/>
			    	<input type="text" name="offertitle" id="offertitle" value="${offerBoard.offertitle}" readonly="readonly"/>
			    	</div>
			  </div>
			
			  <div class="table3">
			   	 	<div class="table-cell">급여<br/>
			   	 	<input type="text" name="pay" id="pay" value="${offerBoard.pay}" readonly="readonly"/>원
			   	 	</div>
			  </div>
			  
			   <div class="table4">
			   	 	<div class="table-cell">작성일<br/>
			   	 	<%-- <input type="date" name="wttime" id="wttime" value="${offerBoard.wttime}" readonly="readonly"/> --%>
			   	 	<fmt:formatDate value="${offerBoard.wttime}" pattern="yyyy년MM월dd일 hh시mm분" />
			   	 	</div>
			  </div>
			  
			    <div class="table5">
			   	 	<div class="table-cell">대행 시작일시<br/>
			   	 	<%-- <input type="date" name="starttime" id="starttime"  value="${offerBoard.starttime}" readonly="readonly"/> --%>
			   	 	<fmt:formatDate value="${offerBoard.starttime}" pattern="yyyy년MM월dd일 hh시mm분" />
			   	 	</div>
			  </div>
			  
			   <div class="table6">
			    	<div class="table-cell">내용<br/>
			    	<textarea  name="offercontent" id="offercontent" cols="30" rows="5"  readonly="readonly" >${offerBoard.offercontent}</textarea>
			    	</div>
			   </div>
			    
			  <br>
			  
			   <div class="table7">
			    	<div class="table-cell" >상세주소
			    	<br/>
			    	<input type="text" name="offerpoint" id="offerpoint" readonly="readonly"/>
			  		</div>
			  </div>
		 
			<!-- 지도 API 끝 -->
			<div class="table8">
			<input type="submit" value="지원하기"/>
			</div>
			<br/><br/>
			</div>
		 </form>
	
</body>
</html>