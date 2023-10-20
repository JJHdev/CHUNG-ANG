<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<!DOCTYPE html>
<html lang="ko">
  <head>
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
				  border-collapse: collapse;
				  width: 50%;
				  border: 1px solid #ccc;
				  margin: 0 auto;
				}
				
				th, td {
				  padding: 8px;
				  border-bottom: 1px solid #ddd;
				  text-align: center;
				}
				
				th {
				  background-color: #f2f2f2;
				  border-top: 1px solid #ddd;
				  border-right: 1px solid #ddd;
				}
				
				td {
				  border-right: 1px solid #ddd;
				}
				input[type=text], input[type=number] {
				  width: 60%;
				}
				
				
				input[type="submit"],input[type=reset] {
					  background-color: ECECEC;
					  color: black;
					  font-size: 13px;
					  font-weight: bold;
					  border: none;
					  padding: 10px 10px;
					  border-radius: 10px;
					}
					
					input[type=reset] {
					  background-color: ECECEC;
					  color: black;
					  font-size: 13px;
					  font-weight: bold;
					  border: none;
					  padding: 10px 10px;
					  border-radius: 10px;
					}
				 input[type="submit"]:hover, input[type="reset"]:hover {
			      border: 1.5px solid #333;
			      outline: none;
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
		   <form action="${contextPath}/productBuy" method="post">
				<table class="table" style="border: 1px solid #ccc;">
						  <thead class="thead-dark">
						    <tr>
						      <th>모델명</th>
						      <td>
						        <input type="text" value="${product.goods}" name="goodsName" id="goodsName" readonly="readonly" />
						        <input type="hidden" value="${sellNo}" name="sellNo" id="sellNo" readonly="readonly" />
						      </td>
						    </tr>
						    <tr>
						      <th>사이즈</th>
						      <td><input type="text" value="${product.itemSize}" name="GoodsSize" id="GoodsSize" readonly="readonly" /></td>
						    </tr>
						    <tr>
						      <th>아이디명</th>
						      <td><input type="text" value="${sessionScope.AUTHUSER.id}" name="id" id="id" readonly="readonly" /></td>
						    </tr>
						    <tr>
						      <th>낙찰 희망가</th>
						      <td><input type="text" id="desiredPurPrice" name="desiredPurPrice" pattern="[0-9]+" title="숫자만 입력해주세요." placeholder="숫자만 입력해주세요." required /></td>
						    </tr>
						    <tr>
						      <th>구매 수량</th>
						      <td><input type="number" id="desireQuantity" name="desireQuantity" placeholder="수량" min="0" required /></td>
						    </tr>
						    <tr>
						      <td colspan="2" style="text-align: center;">
						        <input type="submit" value="구매 등록" id="submit">
						        <input type="reset" id="btnReset" value="취소">
						      </td>
						    </tr>
						  </thead>
						</table>
			</form>
      </div>
      <div id="footer">
        <jsp:include page="../module/bottom.jsp" flush="false"/>
      </div>
    </div>
  </body>
</html>