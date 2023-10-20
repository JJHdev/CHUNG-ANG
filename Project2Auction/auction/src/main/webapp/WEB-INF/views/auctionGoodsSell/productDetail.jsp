<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>W3.CSS Template</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
	    img {
					width: 150px;
					height: 150px;
				}
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
				input[type=button], input[type=button] {
				  width: 20%;
				}
				
				input[type="button"],input[type=button] {
					  background-color: ECECEC;
					  color: black;
					  font-size: 13px;
					  font-weight: bold;
					  border: none;
					  padding: 10px 10px;
					  border-radius: 10px;
					}
					
					input[type=button] {
					  background-color: ECECEC;
					  color: black;
					  font-size: 13px;
					  font-weight: bold;
					  border: none;
					  padding: 10px 10px;
					  border-radius: 10px;
					}
				 input[type="button"]:hover, input[type="button"]:hover {
			      border: 1.5px solid #333;
			      outline: none;
			    }
    </style>
	  <script>
	  $(document).ready(function() {
	    $(".btnSell").on("click", function() {
	      var sellNo = $("#sellNo").val(); // sellNo 값을 가져옴
	      var vailDate = $("#vailDate").val();
	      $.ajax({
	        url: "${contextPath}/GoodsGradeChange?pageNum=${pageNum}&amount=${amount}",
	        type: "post",
	        data: { grade: "2", sellNo: sellNo, vailDate: vailDate}, // grade와 sellNo 전송
	        success: function() {
	          alert("판매 허가 되었습니다.");
	          location.reload();
	        },
	        error: function() {
	          alert("에러가 발생하였습니다.");
	        }
	      });
	    });
		
	    $(".btnRejection").on("click", function() {
	      var sellNo = $("#sellNo").val(); // sellNo 값을 가져옴
	      var vailDate = $("#vailDate").val();
	      $.ajax({
	        url: "${contextPath}/GoodsGradeChange?pageNum=${pageNum}&amount=${amount}",
	        type: "post",
	        data: { grade: "3", sellNo: sellNo, vailDate: vailDate}, // grade와 sellNo 전송
	        success: function() {
	          alert("판매 취소 되었습니다.");
	          location.reload();
	        },
	        error: function() {
	          alert("에러가 발생하였습니다.");
	        }
	      });
	    });
	    
	    const btnList = document.querySelector('.btnList');
	    // 버튼 클릭 이벤트 핸들러 등록
	    btnList.addEventListener('click', function() {
	      // '/productList'로 이동
	      window.location.href = '${contextPath}/productList?pageNum=${pageNum}&amount=${amount}';
	    });
	  });
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
              <form action="${contextPath}/GoodsGradeChange" method="post">
								<input type="text" value="${product.sellNo}" name="sellNo" id="sellNo" hidden>
								<input type="text" value="${product.vailDate}" name="vailDate" id="vailDate" hidden>
								<table class="table" style="border: 1px solid #ccc;">
						  		<thead class="thead-dark">
									<tr>
										<td>판매등록번호</td>
										<td>${product.sellNo}</td>
									</tr>
									<tr>
										<td>모델명</td>
										<td>${product.goods}</td>
									</tr>
									<tr>
										<td>판매희망가</td>
										<td>${product.desiredSellPrice}</td>
									</tr>
									<tr>
										<td>사이즈</td>
										<td>${product.itemSize}</td>
									</tr>
									<tr>
										<td>수량</td>
										<td>${product.quantity}</td>
									</tr>
									<tr>
										<td>제품상태</td>
										<td>${product.goodsGrade}</td>
									</tr>
									<tr>
										<td>회원ID</td>
										<td>${product.id}</td>
									</tr>
									<tr>
										<td>경매유효기간</td>
										<td>${product.vailDate}</td>
									</tr>
									<tr>
										<td>경매시작날짜</td>
										<td>${product.startTime}</td>
									</tr>
									<tr>
										<td>경매종료날짜</td>
										<td>${product.endTime}</td>
								</tr>
								<c:forEach var="fileList" items="${productFileList}">
									<tr>
										<td>이미지 번호</td>
										<td>이미지 파일</td>
									</tr>
									<tr>
										<td>${fileList.sellImageNo}</td>
										<td>
										<c:if test="${!empty fileList.sellImages}">
											<img src="/uploadimg/${fileList.sellImages}" style="display:block; width:100%;" class="mx-auto" onclick="window.open(this.src)">
										</c:if>
										<c:if test="${empty fileList.sellImages}">
											등록된 사진이 없습니다.
										</c:if>
										</td>
									</tr>
								</c:forEach>
									<tr>
										<td colspan="2" align="center">
											<input type="button" class="btnSell" name="btnSell" value="판매 허가"/>
											<input type="button" class="btnRejection" name="btnRejection" value="판매 거절"/>
											<input type="button" class="btnList" name="btnList" value="리스트"/>
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