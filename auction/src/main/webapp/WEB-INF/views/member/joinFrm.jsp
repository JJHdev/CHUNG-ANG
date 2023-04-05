<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<c:set var="cp" value="<%=request.getContextPath()%>"/>
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
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/joinform.css" />
<script type="text/javascript">
//아이디 중복체크
function fn_idChk(){	
	let id = $("#id").val();
	if(!id){
	       alert("사용할 아이디를 입력하세요.");
	         return false;
	}
	$.ajax({
		url : "http://localhost:8081/auction/member/idChk",
		type : "post",
		dataType : "json",
		data : {"id" : $("#id").val()},
		success : function(data){
			if(data == 1){
				alert("사용중인 아이디입니다.");
			}else if(data == 0){
				$("#idChk").attr("value", "Y");
				alert("사용가능한 아이디입니다.");
			}
		}
	})
}
//비밀번호 체크
$(function(){
	$('#password2').blur(function(){
		if($('#password').val() != $('#password2').val()){
			if($('#password2').val()!=''){
				alert("비밀번호가 일치하지 않습니다.");
		    	$('#password2').val('');
		        $('#password2').focus();
		     }
		 }
	})  	   
});
//이메일
$(function(){
	$("#email_op").change(function(){
		let val = $("select#email_op option:selected").val();
		$("#email2").val(val);
	});
});
//생년월일
$(document).ready(function(){            
    var now = new Date();
    var year = now.getFullYear();
    var mon = (now.getMonth() + 1) > 9 ? ''+(now.getMonth() + 1) : '0'+(now.getMonth() + 1); 
    var day = (now.getDate()) > 9 ? ''+(now.getDate()) : '0'+(now.getDate());           
    //년도 selectbox만들기               
    for(var i = 1900 ; i <= year ; i++) {
        $('#year').append('<option value="' + i + '">' + i + '년</option>');    
    }
    // 월별 selectbox 만들기            
    for(var i=1; i <= 12; i++) {
        var mm = i > 9 ? i : "0"+i ;            
        $('#month').append('<option value="' + mm + '">' + mm + '월</option>');    
    }
    
    // 일별 selectbox 만들기
    for(var i=1; i <= 31; i++) {
        var dd = i > 9 ? i : "0"+i ;            
        $('#day').append('<option value="' + dd + '">' + dd+ '일</option>');    
    }
    $("#year  > option[value="+year+"]").attr("selected", "true");        
    $("#month  > option[value="+mon+"]").attr("selected", "true");    
    $("#day  > option[value="+day+"]").attr("selected", "true");       
  
});
//유효성
$(document).ready(function(){	
	$("#JoinFrm").submit(function(){  	
		let frmObj = $(this);
		//아이디필수입력
		if($("#id").val()==""){
			alert("아이디를 입력하세요.");
			$("#id").focus();
			return false; 
		}	 
		let reg0= /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{4,12}/g;	
		if(!reg0.test($("#password").val())){
			alert("비밀번호는 최소 한개이상의 숫자,영어대소문자 4~12이내 입력하세요.");
			$("#password").focus(); 
			return false;
		}
		//비밀번호필수입력 
		if($("#password").val()==""){ 
			alert("비밀번호를 입력하세요.");
			$("#password").focus();
			return false; 
		}
		//비밀번호 글자수제한 편의상 4~12
		if($("#password").val().length<4 || $("#mpassword").val().length>12){
			alert("비밀번호는 4~12글자로 입력하세요.");
			$("#password").val("");
			$("#password").focus(); 
			return false; 
		}
		//비밀번호확인필수입력 
		if($("#password2").val()==""){ //비밀번호재확인를 입력하지않았다면
			alert("비밀번호재확인을 입력하세요.");
			$("#password2").focus(); //포커스위치
			return false; 
		}
		//이름필수입력
		if($("#name").val()==""){ 
			alert("이름을 입력하세요.");
			$("#name").focus();
			return false; 
		} 
		//번호필수입력
		if($("#phone1").val()==""){
			alert("번호를 입력하세요.");
			$("#phone1").focus();
			return false; 
		}
		if($("#phone2").val()==""){
			alert("번호를 입력하세요.");
			$("#phone2").focus();
			return false; 
		}
		//성별필수입력
		if($("#gender").val()==""){
			alert("성별을 입력하세요.");
			$("#gender").focus();
			return false; 
		}
		//생년월일필수입력
		if($("#birthyear").val()==""){
			alert("생년월일를 입력하세요.");
			$("#birthyear").focus();
			return false; 
		}
		if($("#birthmonth").val()==""){
			alert("생년월일을 입력하세요.");
			$("#birthmonth").focus();
			return false; 
		}
		if($("#birthday").val()==""){
			alert("생년월일을 입력하세요.");
			$("#birthday").focus();
			return false; 
		}
		//이메일필수입력
		if($("#email1").val()==""){
			alert("이메일을 입력하세요.");
			$("#email1").focus();
			return false; 
		}
		if($("#email2").val()==""){
			alert("이메일을 입력하세요.");
			$("#email2").focus();
			return false; 
		}
		//주소필수입력
		if($("#zipcode").val()==""){
			alert("우편번호를 입력하세요.");
			$("#zipcode").focus();
			return false; 
		}
		if($("#roadaddress").val()==""){
			alert("도로명주소를 입력하세요.");
			$("#roadaddress").focus();
			return false; 
		}
		if($("#jibunaddress").val()==""){
			alert("지번주소를 입력하세요.");
			$("#jibunaddress").focus();
			return false; 
		}
		if($("#detailaddress").val()==""){
			alert("상세주소를 입력하세요.");
			$("#detailaddress").focus();
			return false; 
		}
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
<article class="join-c">
 <div>
 	<br>
 	<br>
	<h2>회원가입</h2>
	<br>
	<br>
 </div>
 <div>
	<f:form modelAttribute="NewMember" method="post" action="${cp}/member/join" id="JoinFrm">
	<table class="join-t">
	<colgroup>
	<col width="30%"/>
	<col width="auto"/>
	</colgroup>
	<tbody>
	 <tr>
      <td>&nbsp;&nbsp;아이디</td>
      <td colspan="5">&nbsp;&nbsp;<f:input path="id" name="id" id="id" />
      &nbsp;&nbsp;<button class="idChk" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
      </td>
  	 </tr>
	 <tr>
      <td>&nbsp;&nbsp;비밀번호</td>
      <td colspan="5">&nbsp;&nbsp;<f:password path="password" name="password" id="password" />
      &nbsp;&nbsp;&nbsp;<span>비밀번호는 영어대소문자를 포함해 4~12자 이내로 입력하세요.</span>
      </td>
   	 </tr>
     <tr>
      <td>&nbsp;&nbsp;비밀번호 확인</td>
      <td colspan="5">&nbsp;&nbsp;<input type="password" name="password2" id="password2" /></td>
   	 </tr>
	 <tr>
      <td>&nbsp;&nbsp;이름</td>
      <td colspan="5">&nbsp;&nbsp;<f:input path="name" name="name" id="name"/>
      </td>
   	 </tr>
   	 <tr>
      <td>&nbsp;&nbsp;핸드폰 번호</td>
      <td colspan="5">&nbsp;&nbsp;<f:select path="phone1" name="phone1" id="phone1">
		                <option value="010">010</option>
		                <option value="011">011</option>
		                <option value="016">016</option>
		                <option value="070">070</option>
         </f:select> - <f:input path="phone2" name="phone2" id="phone2"/> - <f:input path="phone3" name="phone3" id="phone3"/>
      </td>   
    </tr>
	<tr class="e-mail">
     <td>&nbsp;&nbsp;이메일</td>
     <td colspan="5">&nbsp;&nbsp;<f:input path="email1" name="email1" id="email1"/> @ <f:input path="email2" name="email2" id="email2"/> 
       <select class="email-select" name="email_op" id="email_op">
	   	<option value="직접입력" selected>직접입력</option>
	  	<option value="naver.com">naver.com</option>
		<option value="gmail.com">gmail.com</option>
		<option value="daum.net">daum.net</option>
		<option value="nate.com">nate.com</option>
	   </select>
     </td>
    </tr> 
    <tr>
     <td>&nbsp;&nbsp;성별 </td>
     <td colspan="5">&nbsp;&nbsp;<label class="radiobox"><f:radiobutton path="gender" id="gender" value="남성" style="width:15px;height:15px;cursor:pointer;"/><span class="fm">남</span></label>
     <label class="radiobox">&nbsp;<f:radiobutton path="gender" value="여성" id="gender" style="width:15px;height:15px;cursor:pointer;"/><span class="fm">여</span></label>
     </td>
 	</tr>	
	<tr>
     <td>&nbsp;&nbsp;생년월일 </td>
     <td class="birth-box" colspan="5">&nbsp;&nbsp;<f:select path="birthyear" name="yy" id="year"/>년 <f:select path="birthmonth" name="mm" id="month"/>월  <f:select path="birthday" name="dd" id="day"/>일 </td>
    </tr>
	<tr>
	 <td>&nbsp;&nbsp;우편번호</td>
	 <td colspan="5">&nbsp;&nbsp;<f:input path="zipcode" name="zipcode" id="zipcode" />
	 &nbsp;&nbsp;<f:button type="button" onclick="findAddr()">우편변호 찾기</f:button>
	 </td>
	</tr>
	<tr>
	 <td>&nbsp;&nbsp;주소</td>
	 <td colspan="5" class="adress-box">&nbsp;&nbsp;<f:input path="roadaddress" name="roadaddress" id="roadaddress" placeholder="도로명주소"/>
	 <br>
	 <br>
	 &nbsp;&nbsp;<f:input path="jibunaddress" name="jibunaddress" id="jibunaddress" placeholder="지번주소"/></td>
	</tr>
	<tr>
	 <td>&nbsp;&nbsp;상세주소</td>
	 <td colspan="5" class="adress-box">&nbsp;&nbsp;<f:input path="detailaddress" name="detailaddress" id="address"/>
	 </td>
	</tr>
 </tbody>
 </table>
 	<br>
 	<div class="join-btn" style="text-align: center;">
		<f:button type="submit">가입</f:button>
		<button type="button" onclick="location.href='${cp}/goodsListForm'">취소</button>
 	</div>
 </f:form>
 </div>
</article>            
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