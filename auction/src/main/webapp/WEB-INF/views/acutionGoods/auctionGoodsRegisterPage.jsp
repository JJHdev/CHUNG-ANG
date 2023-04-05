<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<c:set var="path" value="${pageContext.request.contextPath}"/>
  <title>제품등록</title>
    <script>
let sizeCount =1;
let fileCount =1;
$(document).ready(function(){
	
	$("#btnDelSize").click(function(){
		if(sizeCount==1){ //유지해야하는 파일수 보다 적다면
			alert("1개이상은 있어야 합니다.");
			return; //함수종료
		}
		let tr=$("#goodSizes"+sizeCount).closest("tr");
		$(tr).remove()
		sizeCount--;
	});
	
	$("#btnAddSize").click(function(){
		sizeCount++;
		if(sizeCount==16){ //허용된 파일수 보다 크다면
			alert("최대 15개입니다.");
			sizeCount=15;
			return; //함수종료
		}
		let tr = "<tr><th>사이즈"+sizeCount+"</th><td>";
				tr+= "<input type='text' name='goodsSize"+sizeCount+"' id='goodsSizes"+sizeCount+"'/></td></tr>";
		//id가 i1인 요소의 바로 앞에 추가할것
		//$(기준요소).before(추가할 요소);
		$("#insertSize").before(tr);
	});
	
	
	$("#btnDelFile").click(function(){
		if(fileCount==1){ //유지해야하는 파일수 보다 적다면
			alert("1개이상은 있어야 합니다.");
			return; //함수종료
		}
		let trDelFile=$("#images"+fileCount).closest("tr");
		$(trDelFile).remove()
		fileCount--;
	});
	
	$("#btnAddFile").click(function(){
		fileCount++;
		if(fileCount==6){ //허용된 파일수 보다 크다면
			alert("최대 5개입니다.");
			fileCount=5;
			return; //함수종료
		}
		let tr = "<tr><th>이미지"+fileCount+"</th><td>";
				tr+= "<input type='file' name='image"+fileCount+"' id='images"+fileCount+"'/></td></tr>";
		//id가 i1인 요소의 바로 앞에 추가할것
		//$(기준요소).before(추가할 요소);
		$("#insertFile").before(tr);
	});
});		



$("form#uploadForm").submit(function(){  
	let frmObj = $(this);

	if($("#goodsName").val()==""){ 
		alert("제품명을 입력하세요.");
		$("#goodsName").focus();
		return false; 
	}
	
	if($("#goods").val()==""){ 
		alert("모델명을 입력하세요.");
		$("#goods").focus();
		return false; 
	}
	
	if($("#color").val()==""){ 
		alert("색상을 입력하세요.");
		$("#color").focus();
		return false; 
	}
	
	if($("#goodsSize1").val()==""){ 
		alert("최소 기본 사이즈를 입력해 주세요.");
		$("#goodsSize1").focus();
		return false; 
	}
	
	if($("#image1").val()==""){ 
		alert("쏌네일용 이미지 입력하세요.");
		$("#image1").focus();
		return false; 
	}
});

</script>
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
        <table>
          <tr>
            <td>
            
            
            
            
<form id="uploadForm" name="uploadForm" method="post" enctype="multipart/form-data" action="${path}/goodsRegisterForm">
	<table>
		<tr>
			<th>
				제품명
			</th>
			<td>
				<input type="text" name="goodsName" id="goodsName" placeholder="제품명 입력하세요" required="required">
			</td>
		</tr>
		
		<tr>
			<th>
				모델명
			</th>
			<td>
				<input type="text" name="goods" id="goods" placeholder="모델명 입력하세요" required="required">
			</td>
		</tr>
		
		<tr>
			<th>
				제품 상세 설명
			</th>
			<td>
				<textarea name="goodsContent" id="goodsContent" cols="50px" rows="8px"  ></textarea>
			</td>
		</tr>
		
		<tr>
			<th>
				발매가
			</th>
			<td>
				<input type="number" name="firstPrice" id="firstPrice" oninput="regexPhoneNumber(this)" placeholder="출시 금액을 입력하세요" required="required">
			</td>
		</tr>
		
		<tr>
			<th>
				출시일
			</th>
			<td>
				<input type="date" name="releaseDate" id="releaseDate" required="required">
			</td>
		</tr>
		
		<tr>
			<th>
				색상
			</th>
			<td>
				<input type="text" name="color" id="color" placeholder="색상을 입력하세요" required="required">
			</td>
		</tr>
		
		<tr>
		<th>사이즈</th>
			<td>
				<input type="button" id="btnAddSize" value="사이즈 추가"/>		
				<input type="button" id="btnDelSize" value="사이즈 삭제"/>	
			</td>
		</tr>
		
		<tr>
			<th>
				사이즈1
			</th>
			<td>
					<input type="text" name="goodsSize1" id="goodsSizes1" required="required"/>
			</td>
		</tr>
		
		<tr id="insertSize">
			<th>이미지첨부</th>
			<td>
				<input type="button" id="btnAddFile" value="이미지추가"/>		
				<input type="button" id="btnDelFile" value="이미지삭제"/>	
			</td>
		</tr>
		<tr>
			<th>이미지1(이미지1 썸네일용)</th>
			<td>
					<input type="file" name="image1" id="images1" required="required"/>
			</td>
		</tr>
		
		<tr  id="insertFile">
			<td colspan="2">
				<input type="submit" value="상품 등록하기">
				<input type="reset" value="목록 초기화">
			</td>
		</tr>
		
	</table>
	</form>              
              
              
              
            </td>
          </tr>
        </table>
      </div>
      <div id="footer">
        <jsp:include page="../module/bottom.jsp" flush="false"/>
      </div>
    </div>
  </body>
</html>