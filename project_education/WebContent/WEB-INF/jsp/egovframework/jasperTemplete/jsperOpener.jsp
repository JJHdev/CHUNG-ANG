<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>report</title>

	<style> html, body, div, * { box-sizing : border-box; } </style>
	<style>
		body{ width : 100%; height : 100%; margin : 0 !important; padding : 0; box-sizing: border-box; overflow : hidden; overflow-y : scroll; }
		button{ cursor : pointer; }
		#rxRenderer { width : 595px; height : 100%; margin : 0 !important; padding : 0 !important; box-sizing: border-box; }
		#rxRenderer > table{ margin : 0 !important; padding : 0 !important; }
		#rxRenderer2 { margin : 0 !important; padding : 0 !important; }
		#rxBtns{ position: absolute; top: 0; width: 100%; display:flex; background : rgba(0,0,0,0.3); }
		#rxBtns > div{ position : relative; display : flex; flex : 1;}
		#rxBtns > div:nth-child(1){ padding: 5px; }
		#rxBtns > div:nth-child(1) > button{ border: 0; padding: 5px; border-radius: 5px; background: white; margin-right : 7px; }
		#rxBtns > div:nth-child(2){ justify-content: center; height : 0; }
		#rxBtns > div:nth-child(2) > span{ display : flex; position : absolute; top: 5px; }
		#rxBtns > div:nth-child(2) > span > button{ background : white; font-size :11px; border : 0; border-radius : 3px;}
	</style>
	<style>
		#loadingPage { width:100%; height:100%; top:0; left:0; position:fixed; display:block; opacity:.8; background:#fff; text-align:center; z-index: 9999999; }
		#loadingPage>div { /*218x156*/ position:absolute; top:50%; left:50%; z-index:100; margin-left:-109px; margin-top:-78px; }
		#loadingPage>div>p {margin-top:30px; font-size:18px; letter-spacing:-1px; line-height:1; color:#2e3856;}
		#loadingPage>div>p>span {font-size:24px; font-weight:700; display:block; margin-bottom:20px;}
	</style>
	
	<script src="${pageContext.request.contextPath}/script/lib/jquery.1.12.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/script/lib/jquery.easing.1.3.js"></script>
	<script src="${pageContext.request.contextPath}/script/lib/jquery-ui.js"></script>
	
	<script src="${pageContext.request.contextPath}/script/lib/jquery.cookie.js"></script>
	
 	<script src="${pageContext.request.contextPath}/script/lib/canvg.min.js"></script>
	

	<!-- CANVAS -->
	<script src="${pageContext.request.contextPath}/script/lib/html2canvas.js"></script>
	
	<!-- CONVERTOR PDF -->
	<script src="${pageContext.request.contextPath}/script/lib/jsPdf.js"></script>
	
	<!-- REQUIRE -->
	<script src="${pageContext.request.contextPath}/script/lib/require.min.js"></script>
	
	<!-- JASPER -->
	<script src="${pageContext.request.contextPath}/script/jasperTemplete/jasperCVC.js"></script>
	<script src="${pageContext.request.contextPath}/script/jasperTemplete/jasperOpener.js"></script>
	<script src="${pageContext.request.contextPath}/script/jasperTemplete/jasperUtil.js"></script>
	
</head>
<body>
	<div id='rxRenderer'>
	</div>
	<div id='rxBtns' style='display:none'>
		<div id='rxBtnsInner'>
			<button onclick='RxJasperOpenerController.doPdfConvert()'>PDF로 변환</button>
			<button onclick='RxJasperOpenerController.doDocxConvert()'>Docx로 변환</button>
			
		</div>
		<div>
			<span>
				<button id='jsBtnCloseDom' onclick='RxJasperOpenerController.openBtnsPannel(false)'>닫기</button>
				<button id='jsBtnOpenDom' onclick='RxJasperOpenerController.openBtnsPannel(true)'>열기</button>
			</span>
		</div>
	</div>
	<!-- 로딩화면 -->
	<div id="loadingPage" style='display:none'>
		<div>
			<img src="${pageContext.request.contextPath}/images/loading.gif" alt="loading">
			<p><span>분석 중입니다.</span>잠시만 기다려 주시기 바랍니다.</p>
		</div>
	</div>
</body>

</html>