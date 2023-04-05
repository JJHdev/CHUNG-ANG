<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

.row {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  margin-bottom: 40px;
}

.column {
  flex-basis: calc(33.33% - 20px);
  margin-bottom: 40px;
  box-sizing: border-box;
  padding: 20px;
  background-color: #fff;
  border-radius: 5px;
  box-shadow: 0px 2px 6px rgba(0, 0, 0, 0.1);
  transition: transform 0.2s ease-in-out;
}

.column:hover {
  transform: translateY(-5px);
  box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.2);
}

.column img {
  display: block;
  width: 100%;
  height: auto;
  margin-bottom: 20px;
}

.column h3 {
  font-size: 24px;
  margin-bottom: 10px;
}

.column p {
  font-size: 18px;
  margin-bottom: 0;
}

.column p.price {
  font-weight: bold;
  color: #f44336;
  margin-top: 10px;
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
              

<!-- mv.addObject("goodsInfo",goodsInfo);
 goodsInfo[ProductDTO [goods=test, goodsName=test, color=tes, 
 goodsContent=test, firstPrice=32, imageNo=0, releaseDate=Wed Mar 29 00:00:00 KST 2023, goodsSize=null, image=null], 
  -->
 
<table>
  <tr>
    <td>
      <div class="row">
        <c:forEach items="${goodsInfo}" var="item">
          <div class="column">
            <a href="${path}/goodsDetail?goods=${item.goods}">
              <img src="${path}/download?goods=${item.goods}">
            </a> 
            <h3>모델명 ${item.goods}</h3>
            <p>상품명 ${item.goodsName}</p>
            <p>출시가격 : ${item.firstPrice}원</p>
          </div>
        </c:forEach>
      </div>
    </td>
  </tr>
</table>






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