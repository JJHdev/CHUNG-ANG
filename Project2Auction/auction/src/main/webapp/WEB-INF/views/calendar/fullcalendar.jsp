<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fullcalendar</title>

 	<!-- jquery CDN -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- fullcalendar CDN -->
    <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet'/>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
    <!-- fullcalendar 언어 CDN -->
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
    <script>

	   $(document).ready(function() {
		
	   
	   var calendarEl = document.getElementById('calendar');
     var calendar = new FullCalendar.Calendar(calendarEl, {
    		 height: '700px', // calendar 높이 설정
    	    expandRows: true, // 화면에 맞게 높이 재설정
    		 headerToolbar: {
	      	 	 left: 'prev,next today',
	       		 center: 'title',
	        	 right: 'dayGridMonth,dayGridWeek,dayGridDay'
	   		   },
	      locale: 'ko' ,
	      initialView: 'dayGridMonth', // 초기 로딩 날짜.
	      navLinks: true, // 달력 내부의 날짜 (숫자)를 클릭할 수 있게 해주는 설정
	      selectable: true,
	      selectMirror: true,
	      // 이벤트명 : function(){} : 각 날짜에 대한 이벤트를 통해 처리할 내용..
	      editable: true,
	      dayMaxEvents: true, // allow "more" link when too many events
	     events: function(fetchInfo, successCallback, failureCallback){ 
	    	  $.ajax({
		   		type:"get",
		   		url:"${conPath}/events?method=data",
		   		dataType:"json",
		   		success: function (data){
		   			var result = jQuery.parseJSON(JSON.stringify(data)); 
		   			successCallback(result);
		   			
		   		}//success끝
	    	
	      /* json데이터*/
	    	  //=====ajax 데이터를 불러와야한다~
		      
	    });//ajax끝
	      
	      }
	      
	     
	      /*  $.ajax({
	      type:"GET",//요청방식.
	      async:"true",//기본값은 true.(true이면 비동기식방식)
	      url:"${conPath}/goods/keywordSearch",//요청url. 예) /board/boardList.do
	      data:{keyword:value},//서버로 전송할 데이터. 예){name:"홍GD"}
	      success:function(data,status,xhr){//정상응답후 호출되는 함수
	         //data: 서버로부터 응답받은 내용
	         //status: 응답코드 , /xhr: xhr헤더
	         //서버로부터 응답받은 내용 책제목 목록인 data변수값을  JSON으로 변환
	       let jsonInfo = JSON.parse(data);
	       displayResult(jsonInfo);
	      },error:function(xhr,status,error){
	       //오류발생시 호출되는 함수
	       //응답을 받지 못하거나, 데이터형식을 확인하지 못할 때 호출
	       //에러코드 => xhr.status       //예)404
	       //에러메세지=>xhr.responseText
	       alert("에러가 발생했습니다");
	      }
	    });//ajax끝   */
	      
	      
	      
	      //================ ajax데이터 불러올 부분 =====================//
	   
	      });
	    calendar.render();
	  });
</script>
<style>
#calendar-container {
    /* position: fixed; */
    top: 0;
    left: 5;
    right: 5;
    bottom: 0;
  }
.fc-day-sun a {
  color: red;
  text-decoration: none;
}

/* 토요일 날짜 파란색 */
.fc-day-sat a {
  color: blue;
  text-decoration: none;
}

</style>
</head>
<body>
 <div id="container">
     <%--  <div id="header1">
        <jsp:include page="../module/banner.jsp" flush="false"/>
      </div> --%>
      <div id="header1">
      <img src="<%=request.getContextPath()%>/resources/image/logo.png" style="height: 130px; width: 220px;">
      </div>
      <div id="header2">
        <jsp:include page="../module/top.jsp" flush="false"/>
      </div>
      <div id="content">
       <br/> 
       <br/>
        <br/>
<div id='calendar'></div>
<br/> 
       <br/>
        <br/>
      </div>
      <div id="footer">
        <jsp:include page="../module/bottom.jsp" flush="false"/>
      </div>
    </div>
</body>
</html>