<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
  <head>
 <meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css'>
<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js'></script>
<script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js'></script>
    <title>W3.CSS Template</title>
    <meta charset="UTF-8">
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
      /* checkbox 스타일링 */
		.form-check-input[type="checkbox"] {
		  width: 30px;
		  height: 30px;
		}
    </style>
    <script>
	    function checkForm() {
	    	  var confirm1 = document.getElementById('confirm1').checked;
	    	  var confirm2 = document.getElementById('confirm2').checked;
	    	  var confirm3 = document.getElementById('confirm3').checked;
	    	  var confirm4 = document.getElementById('confirm4').checked;
	    	  var confirm5 = document.getElementById('confirm5').checked;
	
	    	  if (confirm1 && confirm2 && confirm3 && confirm4 && confirm5) {
	    	    return true;
	    	  } else {
	    	    alert('모든 항목에 동의하셔야 합니다.');
	    	    return false;
	    	  }
	    	}
    </script>
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
       <button onclick="window.history.back()" style="width: 50px; height: 50px; border:none; font-size: 2em;">←</button>
		  <h2 align="center" style="font-weight: bold;">판매 동의</h2>
		<h2 style="font-weight: bold;">
			<span style="color: #03C988; ">판매</span>하시기 전에 <br>
			꼭 확인하세요.
		</h2>
				<form action="${path}/productAddForm" onsubmit="return checkForm()">
				 <div class="table-responsive">
				  <table class="table">
				    <tbody>
				      <tr>
				        <td>
				        	<input type="hidden" name="goodsSize" id="goodsSize" value="${goodsSize}">
				        	<input type="hidden" name="goods" id="goods" value="${goods}">
				          <label for="confirm1" >
				          	판매하려는 상품이 맞습니다.
				          </label><br>
				         		 상품 이미지, 모델명, 수량, 상품명, 가격, 사이즈를 한 번 더 확인했습니다.
				        </td>
				        <td>
				          <div class="form-check">
				            <input class="form-check-input" type="checkbox" id="confirm1" name="confirm1" value="1">
				          </div>
				        </td>
				      </tr>
				      <tr>
				        <td>
				          <label for="confirm2">
				          	국내/해외에서 발매한 정품 · 새상품입니다.
				          </label><br>
				        		  모든 구성품이 그대로이며, 한 번도 착용하지 않은 정품・새상품입니다. 손상/오염/사용감 있는 상품은 판매가 불가능합니다.
				        </td>
				        <td>
				          <div class="form-check">
				            <input class="form-check-input" type="checkbox" id="confirm2" name="confirm2" value="1">
				          </div>
				        </td>
				      </tr>
				      <tr>
				        <td>
				          <label for="confirm3">
				          	박스/패키지의 상태를 확인합니다.
				          </label><br>
				         		 박스/패키지 상태에 따른 검수 기준과 패키지(포장) 개봉 검수에 대한 주의사항을 확인했습니다.
				        </td>
				        <td>
				          <div class="form-check">
				            <input class="form-check-input" type="checkbox" id="confirm3" name="confirm3" value="1">
				          </div>
				        </td>
				      </tr>
				      <tr>
				        <td>
				          <label for="confirm4">
				          		이중 포장하여 선불 발송합니다.
				          </label><br>
				         		 반드시 이중 포장하여 택배 상자에 담아 선불 발송합니다. 합배송은 권장하지 않으며 이로 인한 박스/패키지 훼손은 판매자의 책임입니다.
				        </td>
				        <td>
				          <div class="form-check">
				            <input class="form-check-input" type="checkbox" id="confirm4" name="confirm4" value="1">
				          </div>
				        </td>
				      </tr>
				      <tr>
				        <td>
				          <label for="confirm5">
				          	AUCTION의 최신 이용정책을 모두 확인하였으며, 판매를 계속합니다.
				          </label><br>
				         		 건전하고 안전한 거래를 위해 반드시 숙지해야 할 미입고, 페널티, 부정거래 등의 이용정책을 확인했습니다.
								</td>
					        <td>
					          <div class="form-check">
					            <input class="form-check-input" type="checkbox" id="confirm5" name="confirm5" value="1">
					          </div>
					        </td>
					      </tr>
					      <tr>
					      	<td>
					      		<div style="display: flex; justify-content: center;">
											<button class="btn" type="submit" name="submitBtn" value="continue" style="font-size: 1.2em; padding: 10px 20px; display:block; margin: 0 auto; width: 100%;">판매 계속</button>
					      		</div>
					      	</td>
					      </tr>
				      </tbody>
				     </table>
				    </div>
				</form>	<!-- 판매 동의서 끝 -->
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