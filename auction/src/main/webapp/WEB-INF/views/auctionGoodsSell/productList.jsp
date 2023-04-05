<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css'>
<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js'></script>
<script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js'></script>
    
    
 <script type="text/javascript">
	$(document).ready(function(){
		
		var actionForm = $("#actionForm");
		$(".paginate_button a").on("click", function(e) {
			
		e.preventDefault();
		
		console.log('click');
		
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
		});
		
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
				  margin: 0 auto;
				}
				td, th {
				  text-align: center;
				}
	    </style>
	    <script>
				function validateForm() {
				    var goodsGrade = document.forms[0]["goodsGrade"].value;
				    if (goodsGrade === "") {
				        alert("판매 상태를 선택해주세요.");
				        return false;
				    }
				    return true;
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
									 <form id="actionForm" action="${contextPath}/productList" method="get">
										<div class="container">
									  <h3>판매 상품
									  		<select name="goodsGrade">
						                <option value="" selected>-- 선택 --</option>
						                <option value="1">판매 전</option>
						                <option value="2">판매 중</option>
						                <option value="3">판매 완료</option>
						              </select>
						               <input type="submit" value="검색" onclick="return validateForm();">
									  </h3>
									  <table class="table">
  										<thead class="thead-dark">
									      <tr>
													<th>판매등록번호</th>
													<th>모델명</th>
													<th>판매희망가</th>
													<th>사이즈</th>
													<th>수량</th>
													<th>제품상태</th>
													<th>회원ID</th>
													<th>경매유효기간</th>
													<th>경매시작날짜</th>
													<th>경매종료날짜</th>
												</tr>
									    </thead>
									    <tbody>
									      <c:forEach var="list" items="${list}">
													<tr>
														<th scope="row"><a href="${contextPath}/productDetail?sellNo=${list.sellNo}
																								&pageNum=${pageMaker.cri.pageNum}
																								&amount=${pageMaker.cri.amount}">${list.sellNo}</a></th>
														<td>${list.goods}</td>
														<td><fmt:formatNumber value="${list.desiredSellPrice}" pattern="#,##0원" /></td>
														<td>${list.itemSize}</td>
														<td>${list.quantity}</td>
														<td>${list.goodsGrade}</td>
														<td>${list.id}</td>
														<td>${list.vailDate}</td>
														<td>${list.startTime}</td>
														<td>${list.endTime}</td>
													</tr>
												</c:forEach>
									    </tbody>
									  </table>
									</div>
										<div class='pull-right'>
											<ul class="pagination">
												
												<c:if test="${pageMaker.prev}">
													<li class="paginate_button a"><a href="${pageMaker.startPage -1}">Previous</a>
													</li>
												</c:if>
													
												<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
													<li class="paginate_button ${pageMaker.cri.pageNum == num ? 'active':''} ">
														<a href="${num}">${num}</a>
													</li>
												</c:forEach>
											
													
												<c:if test="${pageMaker.next}">
													<li class="paginate_button a">
														<a href="${pageMaker.endPage +1}">Next</a>
													</li>
												</c:if>
											</ul>
										</div>
										<!-- end Pagination -->
											<input type="text" name="pageNum" value="${pageMaker.cri.pageNum}" hidden>
											<input type="text" name="amount" value="${pageMaker.cri.amount}" hidden>
										</form>
		      </div>
		      <div id="footer">
        <jsp:include page="../module/bottom.jsp" flush="false"/>
      </div>
    </div>
  </body>
</html>