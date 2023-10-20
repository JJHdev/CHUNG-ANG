<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){	
	$("#LoginFrm").submit(function(){  	
		let frmObj = $(this);
		//아이디필수입력
		if($("#id").val()==""){
			alert("아이디를 입력하세요.");
			$("#id").focus();
			return false; 
		}	 
		//비밀번호필수입력 
		if($("#password").val()==""){ 
			alert("비밀번호를 입력하세요.");
			$("#password").focus();
			return false; 
		}
	});	
});
</script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/login.css" />
<body>
	<article class="loginpage">
        <section class=" login">
            <h2>로그인</h2>
            <h5>WELCOME BACK</h5>
        </section>
    <div>
	<f:form modelAttribute="NewMember" method="post" action="./login" id="LoginFrm">
          	<f:input path="id" name="id" class="logform" placeholder="아이디"/>
          	<f:password path="password" name="password" class="logform" placeholder="비밀번호" />
      		<f:button type="submit" class="loginbnt">로그인</f:button> 
     </f:form>
     <br> <br>
     <div>
       <p><a href="<%=request.getContextPath()%>/member/findId">아이디찾기</a></p>&verbar;
       <p><a href="<%=request.getContextPath()%>/member/findPwd">비밀번호찾기</a></p>&verbar;
       <p><a href="<%=request.getContextPath()%>/member/join">회원가입</a></p>
     </div> 
 	 </div>
  </article>
</body>
</html>