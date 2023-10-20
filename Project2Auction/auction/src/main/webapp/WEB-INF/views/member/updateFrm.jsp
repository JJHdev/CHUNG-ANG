<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>W3.CSS Template</title>
    <meta charset="UTF-8">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function findAddr(){
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var jibunAddr = data.jibunAddress; // 지번 주소 변수
            
            document.getElementById('zipcode').value = data.zonecode;
            document.getElementById("roadaddress").value = roadAddr;
            document.getElementById("jibunaddress").value = data.jibunAddress;
        }
    }).open();
}    
</script>
<script type="text/javascript">
$(function(){
	$("#email_op").change(function(){
		let val = $("select#email_op option:selected").val();
		$("#email2").val(val);
	});
});
</script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/memberupdate.css" />
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
	<%-- 일반user가 로그인했을 때 보여지는 메뉴 --%>
	<c:if test="${! empty AUTHUSER && (AUTHUSER.grade eq 1)}">
	<article class="user-c">
	<div>
 	<br>
 	<br>
	<h2>내정보 수정</h2>
	<br>
	<br>
 	</div>
 	<div>
	<f:form modelAttribute="NewMember" method="post" action="./update">
	<f:hidden path="id" name="id" value="${member.id}"/>
	<table class="user-t">
	<colgroup>
	<col width="30%"/>
	<col width="auto"/>
	</colgroup>
	<tbody>
		<tr>
		<td>&nbsp;&nbsp;이름</td>
		<td>&nbsp;&nbsp;<f:input path="name" name="name" value="${member.name}"/></td>
		</tr>
	 	<tr>
		<td>&nbsp;&nbsp;아이디</td>
		<td>&nbsp;&nbsp;${member.id}</td>
		</tr>
		<tr>
		<td>&nbsp;&nbsp;비밀번호</td>
		<td>&nbsp;&nbsp;<f:password path="password" name="password" value="${member.password}"/></td>
		</tr>
		<tr>
		<td>&nbsp;&nbsp;핸드폰 번호</td>
		<td>&nbsp;&nbsp;<f:select path="phone1" name="phone1" id="phone1" value="${member.phone1}">
		                <option value="010">010</option>
		                <option value="011">011</option>
		                <option value="016">016</option>
		                <option value="070">070</option>
		    </f:select>
		- <f:input path="phone2" value="${member.phone2}"/> - <f:input path="phone3" value="${member.phone3}"/></td>
		</tr>
		<tr class="e-mail">
		<td>&nbsp;&nbsp;이메일</td>
		<td>&nbsp;&nbsp;<f:input path="email1" name="email1" id="email1" value="${member.email1}"/> @ <f:input path="email2" name="email2" id="email2" value="${member.email2}"/>
				<select name="email_op" id="email_op">
	 				<option value="">직접입력</option>
	 				<option value="gmail.com">gmail.com</option>
	 				<option value="naver.com">naver.com</option>
	 				<option value="daum.net">daum.net</option>
	 				<option value="nate.com">nate.com</option>
 			 	</select>
		</td>
		</tr>
		<tr>
		<td>&nbsp;&nbsp;성별</td>
		<td>&nbsp;&nbsp;${member.gender}</td>
		</tr>
		<tr>
		<td>&nbsp;&nbsp;생년월일</td>
		<td>&nbsp;&nbsp;${member.birthyear}년 ${member.birthmonth}월 ${member.birthday}일</td>
		</tr>
		<tr>
		<td>&nbsp;&nbsp;우편번호</td>
		<td>&nbsp;&nbsp;<f:input path="zipcode" name="zipcode" value="${member.zipcode}"/>
		&nbsp;&nbsp;<f:button type="button" onclick="findAddr()">우편변호 찾기</f:button></td>
		</tr>
		<tr>
		<td>&nbsp;&nbsp;주소</td>
		<td class="adress-box">&nbsp;&nbsp;<f:input path="roadaddress" name="roadaddress" value="${member.roadaddress}"/>
		<br>
	 	<br>
		&nbsp;&nbsp;<f:input path="jibunaddress" name="jibunaddress" value="${member.jibunaddress}"/></td>
		</tr>
		<tr>
		<td>&nbsp;&nbsp;상세주소</td>
		<td class="adress-box">&nbsp;&nbsp;<f:input path="detailaddress" name="detailaddress" value="${member.detailaddress}"/></td>
		<f:hidden path="grade" name="grade" id="grade" value="${member.grade}"/>
	</table>
	<br>	
	<div style="text-align: center;">
		<f:button type="button" onclick="location.href='./info?id=${member.id}'">취소</f:button>
		<f:button type="submit">수정</f:button>
	</div>	
	</f:form>
	</div>
	</article>
	</c:if>
	<%-- 관리자가 로그인했을 때 보여지는 메뉴 --%>
	<c:if test="${not empty AUTHUSER && (AUTHUSER.grade==999)}">
	<article class="admin-c">
	<div>
 	<br>
 	<br>
	<h2>회원등급 변경</h2>
	<br>
	<br>
 	</div>
 	<div>
	 <f:form modelAttribute="NewMember" method="post" action="./update" >
	 <table class="admin-t">
	 <colgroup>
	 <col width="30%"/>
	 <col width="auto"/>
	 </colgroup>
	 <tbody>
	 	<tr>
		<td>&nbsp;&nbsp;이름</td>
		<td>&nbsp;&nbsp;${member.name} <input type="hidden" name="name" value="${member.name}"/></td>
		</tr>
		<tr>
		<td>&nbsp;&nbsp;아이디</td>
		<td>&nbsp;&nbsp;${member.id}<input type="hidden" name="id" value="${member.id}"/></td>
		</tr>
		<f:hidden path="password" name="password" id="password" value="${member.password}"/>
		<tr>
		<td>&nbsp;&nbsp;핸드폰 번호</td>
		<td>&nbsp;&nbsp;${member.phone1}-${member.phone2}-${member.phone3} <input type="hidden" name="phone1" value="${member.phone1}"/> <input type="hidden" name="phone2" value="${member.phone2}"/> <input type="hidden" name="phone3" value="${member.phone3}"/></td>
		</tr>
		<tr>
		<td>&nbsp;&nbsp;이메일</td>
		<td>&nbsp;&nbsp;${member.email1}@${member.email2}<input type="hidden" name="email1" value="${member.email1}"/> <input type="hidden" name="email2" value="${member.email2}"/></td>
		</tr>
		<tr>		
		<td>&nbsp;&nbsp;성별</td>
		<td>&nbsp;&nbsp;${member.gender} <input type="hidden" name="gender" value="${member.gender}"/></td>
		</tr>
		<tr>
		<td>&nbsp;&nbsp;생년월일</td>
		<td>&nbsp;&nbsp;${member.birthyear}년 ${member.birthmonth}월 ${member.birthday}일 <input type="hidden" name="birthyear" value="${member.birthyear}"/> <input type="hidden" name="birthmonth" value="${member.birthmonth}"/> <input type="hidden" name="birthday" value="${member.birthday}"/></td>
		</tr>
		<tr>
		<td>&nbsp;&nbsp;우편번호</td>
		<td>&nbsp;&nbsp;${member.zipcode} <input type="hidden" name="zipcode" value="${member.zipcode}"/></td>
		</tr>
		<tr>
		<td>&nbsp;&nbsp;도로명주소</td>
		<td>&nbsp;&nbsp;${member.roadaddress} <input type="hidden" name="roadaddress" value="${member.roadaddress}"/></td>
		</tr>
		<tr>
		<td>&nbsp;&nbsp;지번주소</td>
		<td>&nbsp;&nbsp;${member.jibunaddress} <input type="hidden" name="jibunaddress" value="${member.jibunaddress}"/></td>
		</tr>
		<tr>
		<td>&nbsp;&nbsp;상세주소</td> 
		<td>&nbsp;&nbsp;${member.detailaddress} <input type="hidden" name="detailaddress" value="${member.detailaddress}"/></td>
		</tr>
		<tr>
     	<td>&nbsp;&nbsp;가입일</td>
		<td>&nbsp;&nbsp;<fmt:formatDate value="${member.register}" type="both" pattern="yy/MM/dd"/></td>
  		</tr>
  		<tr>
		<tr>
		<td>&nbsp;&nbsp;회원등급</td>
		<td>&nbsp;&nbsp;<f:input path="grade" name="grade" id="grade" value="${member.grade}"/>
		</td>
		</tr>
	</table>
	<br>
	<div style="text-align: center;">
		<f:button type="button" onclick="location.href='./info?id=${member.id}'">취소</f:button>
		<f:button type="submit">수정</f:button>
	</div>
	</f:form>
	</div>
	</article>
	</c:if>              
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