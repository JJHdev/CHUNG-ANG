<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
  <head>
 <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
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
      
      .table {
  display: table;
  border-collapse: collapse;
  width: 100%;
}

.row {
  display: table-row;
}

.cell {
  display: table-cell;
  padding: 10px;
  border: 1px solid black;
}
    </style>
    <script>
    var IMP = window.IMP; 
    IMP.init("imp67011510"); 
  
    var today = new Date();   
    var hours = today.getHours(); // 시
    var minutes = today.getMinutes();  // 분
    var seconds = today.getSeconds();  // 초
    var milliseconds = today.getMilliseconds();
    var makeMerchantUid = hours +  minutes + seconds + milliseconds;
    

    function requestPay(goodsName, desiredPurPrice,purchaseNo) {
        IMP.request_pay({
            pg : 'kcp',
            pay_method : 'card',
            merchant_uid: "IMP"+purchaseNo, 
            name : goodsName,
            amount : desiredPurPrice,
            buyer_email : 'Iamport@chai.finance',
            buyer_name : '아임포트 기술지원팀',
            buyer_tel : '010-1234-5678',
            buyer_addr : '서울특별시 강남구 삼성동',
            buyer_postcode : '123-456'
        }, function (rsp) { // callback
            if (rsp.success) {
                console.log(rsp);
            } else {
                console.log(rsp);
            }
        });
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
            
            
 
 
  <table>
  <tr>
    <td>
      <c:set var="goods_count" value="0" /> 
      <c:forEach var="message" items="${messageList}" begin="0" end="0">
        <div class="table">
          <div class="cell">Message No</div>
          <div class="cell">Title</div>
          <div class="cell">content</div>
          <div class="cell">Send ID</div>
          <div class="cell">Receive ID</div>
          
          <c:forEach var="purList" items="${PurList}">
            <c:set var="goods_count" value="${goods_count+1 }" />
            <div class="row">
              <div class="cell">${goods_count}</div>
              <div class="cell">${message.title}</div>
              <div class="cell">
					                체결된 상품명은 ${purList.goodsName} 이며  사이즈는 ${purList.goodsSize} 이고, 가격은 ${purList.desiredPurPrice}원 입니다.
					                구매자는 버튼을 누르시면 결재가 진행됩니다.
                <button onclick="requestPay('${purList.goodsName}', ${purList.desiredPurPrice},${purList.purchaseNo})">결제하기</button>
              </div>
              <div class="cell">${message.sendId}</div>
              <div class="cell">${message.receiveId}</div>
            </div> <!-- row끝 -->
          </c:forEach>
          
        </div> <!-- table 끝 -->
      </c:forEach>
    </td>
  </tr>
</table>
</tbody>
              
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