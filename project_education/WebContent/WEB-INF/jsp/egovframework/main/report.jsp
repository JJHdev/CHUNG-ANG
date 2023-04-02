<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link type="text/css" href="${pageContext.request.contextPath}/css/ebi/jquery-ui.css" rel="stylesheet">
	<link type="text/css" href="${pageContext.request.contextPath}/css/map.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/ui.datepicker-kr.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/ol@v7.3.0/dist/ol.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/ol@v7.3.0/ol.css">
  <script>
	$(function() {
		var dateParam = document.getElementById("hidden-date").value;
		// 값을 읽어오는 경우
		  $("#date").datepicker({
		    onSelect: function(date) {
		      // 요청할 URL 주소를 생성합니다.
		      location.href  = "${pageContext.request.contextPath}/report/all.do?date=" + date;
		    }
		  });
		  
		  $(".date-prev-week-btn").click(function() {
			    // 현재 선택된 날짜 가져오기
			    var dateString  = dateParam;
			    const dateObj = new Date(dateString);
			    dateObj.setDate(dateObj.getDate() - 7);
			    const newDateString = dateObj.toISOString().slice(0, 10);
			    // URL 이동
			    location.href = "${pageContext.request.contextPath}/report/all.do?date=" + newDateString;
			  });
		  
		  $(".date-prev-day-btn").click(function() {
			    // 현재 선택된 날짜 가져오기
			    var dateString  = dateParam;
			    const dateObj = new Date(dateString);
			    dateObj.setDate(dateObj.getDate() - 1);
			    const newDateString = dateObj.toISOString().slice(0, 10);
			    // URL 이동
			    location.href = "${pageContext.request.contextPath}/report/all.do?date=" + newDateString;
			  });
		  
		  $(".date-now-btn").click(function() {
			  // NOW 버튼을 클릭하면 현재 날짜로 이동합니다.
			  location.href = "${pageContext.request.contextPath}/report/all.do?date=2022-07-01";
			});
		  
		  $(".date-next-day-btn").click(function() {
			    // 현재 선택된 날짜 가져오기
			    var dateString  = dateParam;
			    const dateObj = new Date(dateString);
			    dateObj.setDate(dateObj.getDate() + 1);
			    const newDateString = dateObj.toISOString().slice(0, 10);
			    // URL 이동
			    location.href = "${pageContext.request.contextPath}/report/all.do?date=" + newDateString;
			  });
		  
		  $(".date-next-week-btn").click(function() {
			    // 현재 선택된 날짜 가져오기
			    var dateString  = dateParam;
			    const dateObj = new Date(dateString);
			    dateObj.setDate(dateObj.getDate() + 7);
			    const newDateString = dateObj.toISOString().slice(0, 10);
			    // URL 이동
			    location.href = "${pageContext.request.contextPath}/report/all.do?date=" + newDateString;
			  });
		  
		  
		  
	  const tds = document.querySelectorAll('#levelTable td');
	  tds.forEach(td => {
	    const num = parseInt(td.innerText);
	    switch(num) {
	      case 1:
	        td.style.backgroundColor = '#40B54A';
	        td.style.color = '#40B54A';
	        break;
	      case 2:
	        td.style.backgroundColor = '#FFB24E';
	        td.style.color = '#FFB24E';
	        break;
	      case 3:
	        td.style.backgroundColor = '#D16127';
	        td.style.color = '#D16127';
	        break;
	      case 4:
	        td.style.backgroundColor = '#B91623';
	        td.style.color = '#B91623';
	        break;
	      default:
	        td.style.backgroundColor = 'white';
	      td.style.color = 'white';
	        break;
	    }
	  });
		});
	
		function selectCity() {
			  var selectedCity = $('#sigungu').val();
			  var date = document.getElementById("hidden-date").value;
			  window.location.href = "${pageContext.request.contextPath}/report2/all.do?cityName=" + selectedCity+ "&date="+date;
		}
	
	
  </script>
</head>
<body>
	<section class="contents-wrap">	
		<div class="lnb-part">
			<%@ include file="../../../layout/cmms/sidemenu.jsp" %>
		</div>
	
		<div class="contents report">
		
			<div class="title">
				<h2><span class="icon-doc-file"></span><span>보고서 조회</span></h2>
				<article>
					<form class="form-type-1" name="search-condition" method="get" action="">
					<input type="hidden" name="date" id="hidden-date" value="${date}" />
					<input type="hidden" name="wa_code" id="hidden-wa_code" value="${wa_code}" />
						<div class="input-wrap r75">
							<select id ="sido" name="sido">
								<option value="0" selected>전국</option>
								<option value="1">서울·인천·경기</option>
								<option value="2">부산·울산·경남</option>
								<option value="3">대구·경북</option>
								<option value="4">광주·전남</option>
								<option value="5">전북</option>
								<option value="6">대전·세종·충남</option>
								<option value="7">충북</option>
								<option value="8">강원</option>
								<option value="9">제주</option>
							</select>
						</div>
						<div class="input-wrap r75">
							<select id="sigungu" onchange="selectCity()">
							    <option value="city" name="sigungu">시군</option>
							    <c:forEach items="${selectCtName}" var="city">
							        <option value="${city}">${city}</option>
							    </c:forEach>
							</select>
						</div>
						<!-- now -->
						<div class="btn-wrap">
							<button type="button" class="date-prev-week-btn reversal">-1주일</button>
						</div>
						<div class="btn-wrap">
							<button type="button" class="date-prev-day-btn reversal">-1일</button>
						</div>
						<div class="btn-wrap">
							<button type="button" class="date-now-btn">NOW</button>
						</div>
						<div class="btn-wrap">
							<button type="button" class="date-next-day-btn reversal off">+1일</button>
						</div>
						<div class="btn-wrap">
							<button type="button" class="date-next-week-btn reversal off">+1주일</button>
						</div>
						<div class="input-wrap include-calendar">
							<span class="icon-Calendar"></span>
							<input type="text" name="date" id="date" class="w100" readonly placeholder="날짜선택">
						</div>
					</form>
				</article>
				
				<article class="position-right">
					<div class="legend">
						<ul>
							<li class="bg-gre">관심</li>
							<li class="bg-yel">주의</li>
							<li class="bg-ora">경고</li>
							<li class="bg-red">위험</li>
						</ul>
					</div>
				</article>
			</div>
			
			<div class="inner">
				<div class="tab_wrap">
					<div class="tab_tab">
						<ul>
							<li><a href="#void">종합</a></li>
							<li><a href="#void">보건</a></li>
							<li><a href="#void">산업</a></li>
							<li><a href="#void">농업</a></li>
							<li><a href="#void">수산양식</a></li>
							<li><a href="#void">축산</a></li>
							<li><a href="#void">교통</a></li>
							<li><a href="#void">전력</a></li>
						</ul>
					</div>
					
					<div class="tab_con">
						<ul>
							<li>
								<div>
									
									<div class="map-Zone inBox">
										    <div id="total_map" style="width: 100%; height:calc(100vh - 70px - 70px - 20px - 60px - 10px - 40px);"></div>
									</div>
									
									<div class="graph-Zone">
										<div class="inWrap">
											<div class="category-inBox">
												
												<div class="scroll-wrap">
													<div class="titleWrap"><span class="icon-Clipboard"></span><span>부문별 단계 현황 - 시군 수</span></div>
													<article>
														<div class="tit health">보건</div>
														<div class="graph health">
															<ul>
																<c:set var="total" value="${ctTotalLevel.ct_health_1_count + ctTotalLevel.ct_health_2_count + ctTotalLevel.ct_health_3_count + ctTotalLevel.ct_health_4_count}" />
															    <li class="graph-gra wNaN" ><span></span></li>
															    <li class="graph-gre wNaN" style="width: ${(ctTotalLevel.ct_health_1_count/total)*750}px;"><span>${ctTotalLevel.ct_health_1_count}</span></li>
															    <li class="graph-yel wNaN" style="width: ${(ctTotalLevel.ct_health_2_count/total)*750}px;"><span>${ctTotalLevel.ct_health_2_count}</span></li>
															    <li class="graph-ora wNaN" style="width: ${(ctTotalLevel.ct_health_3_count/total)*750}px;"><span>${ctTotalLevel.ct_health_3_count}</span></li>
															    <li class="graph-red wNaN" style="width: ${(ctTotalLevel.ct_health_4_count/total)*750}px;"><span>${ctTotalLevel.ct_health_4_count}</span></li>
															</ul>
														</div>
													</article>
													<article>
														<div class="tit industry">산업</div>
														<div class="graph industry">
															<ul>
															    <li class="graph-gra wNaN" ><span></span></li>
															    <li class="graph-gre wNaN" style="width: ${(ctTotalLevel.ct_construction_industry_1_count/total)*750}px;"><span>${ctTotalLevel.ct_construction_industry_1_count}</span></li>
															    <li class="graph-yel wNaN" style="width: ${(ctTotalLevel.ct_construction_industry_2_count/total)*750}px;"><span>${ctTotalLevel.ct_construction_industry_2_count}</span></li>
															    <li class="graph-ora wNaN" style="width: ${(ctTotalLevel.ct_construction_industry_3_count/total)*750}px;"><span>${ctTotalLevel.ct_construction_industry_3_count}</span></li>
															    <li class="graph-red wNaN" style="width: ${(ctTotalLevel.ct_construction_industry_4_count/total)*750}px;"><span>${ctTotalLevel.ct_construction_industry_4_count}</span></li>
															</ul>
														</div>
													</article>
													<article>
														<div class="tit agriculture">농업</div>
														<div class="graph agriculture">
															<ul>
															    <li class="graph-gra wNaN"><span></span></li>
															    <li class="graph-gre wNaN" style="width: ${(ctTotalLevel.ct_agriculture_1_count/total)*750}px;"><span>${ctTotalLevel.ct_agriculture_1_count}</span></li>
															    <li class="graph-yel wNaN" style="width: ${(ctTotalLevel.ct_agriculture_2_count/total)*750}px;"><span>${ctTotalLevel.ct_agriculture_2_count}</span></li>
															    <li class="graph-ora wNaN" style="width: ${(ctTotalLevel.ct_agriculture_3_count/total)*750}px;"><span>${ctTotalLevel.ct_agriculture_3_count}</span></li>
															    <li class="graph-red wNaN" style="width: ${(ctTotalLevel.ct_agriculture_4_count/total)*750}px;"><span>${ctTotalLevel.ct_agriculture_4_count}</span></li>
															</ul>
														</div>
													</article>
													<article>
														<div class="tit livestock">축산업</div>
														<div class="graph livestock">
															<ul>
															    <li class="graph-gra wNaN"><span></span></li>
															    <li class="graph-gre wNaN" style="width: ${(ctTotalLevel.ct_livestock_industry_1_count/total)*750}px;"><span>${ctTotalLevel.ct_livestock_industry_1_count}</span></li>
															    <li class="graph-yel wNaN" style="width: ${(ctTotalLevel.ct_livestock_industry_2_count/total)*750}px;"><span>${ctTotalLevel.ct_livestock_industry_2_count}</span></li>
															    <li class="graph-ora wNaN" style="width: ${(ctTotalLevel.ct_livestock_industry_3_count/total)*750}px;"><span>${ctTotalLevel.ct_livestock_industry_3_count}</span></li>
															    <li class="graph-red wNaN" style="width: ${(ctTotalLevel.ct_livestock_industry_4_count/total)*750}px;"><span>${ctTotalLevel.ct_livestock_industry_4_count}</span></li>
															</ul>
														</div>
													</article>
													<article>
														<div class="tit waterfarm">수산양식업</div>
														<div class="graph waterfarm">
															<ul>
															    <li class="graph-gra wNaN"><span></span></li>
															    <li class="graph-gre wNaN" style="width: ${(ctTotalLevel.ct_aquaculture_1_count/total)*750}px;"><span>${ctTotalLevel.ct_aquaculture_1_count}</span></li>
															    <li class="graph-yel wNaN" style="width: ${(ctTotalLevel.ct_aquaculture_2_count/total)*750}px;"><span>${ctTotalLevel.ct_aquaculture_2_count}</span></li>
															    <li class="graph-ora wNaN" style="width: ${(ctTotalLevel.ct_aquaculture_3_count/total)*750}px;"><span>${ctTotalLevel.ct_aquaculture_3_count}</span></li>
															    <li class="graph-red wNaN" style="width: ${(ctTotalLevel.ct_aquaculture_4_count/total)*750}px;"><span>${ctTotalLevel.ct_aquaculture_4_count}</span></li>
															</ul>
														</div>
													</article>
													<article>
														<div class="tit trans">교통</div>
														<div class="graph trans">
															<ul>
															    <li class="graph-gra wNaN"><span></span></li>
															    <li class="graph-gre wNaN" style="width: ${(ctTotalLevel.ct_traffic_1_count/total)*750}px;"><span>${ctTotalLevel.ct_traffic_1_count}</span></li>
															    <li class="graph-yel wNaN" style="width: ${(ctTotalLevel.ct_traffic_2_count/total)*750}px;"><span>${ctTotalLevel.ct_traffic_2_count}</span></li>
															    <li class="graph-ora wNaN" style="width: ${(ctTotalLevel.ct_traffic_3_count/total)*750}px;"><span>${ctTotalLevel.ct_traffic_3_count}</span></li>
															    <li class="graph-red wNaN" style="width: ${(ctTotalLevel.ct_traffic_4_count/total)*750}px;"><span>${ctTotalLevel.ct_traffic_4_count}</span></li>
															</ul>
														</div>
													</article>
													<article>
														<div class="tit elect">전력</div>
														<div class="graph elect">
															<ul>
															    <li class="graph-gra wNaN"><span></span></li>
															    <li class="graph-gre wNaN" style="width: ${(ctTotalLevel.ct_electric_1_count/total)*750}px;"><span>${ctTotalLevel.ct_electric_1_count}</span></li>
															    <li class="graph-yel wNaN" style="width: ${(ctTotalLevel.ct_electric_2_count/total)*750}px;"><span>${ctTotalLevel.ct_electric_2_count}</span></li>
															    <li class="graph-ora wNaN" style="width: ${(ctTotalLevel.ct_electric_3_count/total)*750}px;"><span>${ctTotalLevel.ct_electric_3_count}</span></li>
															    <li class="graph-red wNaN" style="width: ${(ctTotalLevel.ct_electric_4_count/total)*750}px;"><span>${ctTotalLevel.ct_electric_4_count}</span></li>
															</ul>
														</div>
													</article>
												</div>
												
											</div>
											<div class="area-inBox">
												<div class="scroll-wrap">
													<div id="report_title" class="titleWrap"><span class="icon-Clipboard"></span><span>권역별/부문별 단계 현황</span></div>
													<table id="levelTable">
														<colgroup>
															<col style="width:12.5%;">
															<col style="width:12.5%;">
															<col style="width:12.5%;">
															<col style="width:12.5%;">
															<col style="width:12.5%;">
															<col style="width:12.5%;">
															<col style="width:12.5%;">
															<col style="width:12.5%;">
														</colgroup>
														<thead>
															<tr>
																<th></th>
																<th>보건</th>
																<th>산업</th>
																<th>농업</th>
																<th>축산업</th>
																<th>수산양식업</th>
																<th>교통</th>
																<th>전력</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<th>전국</th>
																<td>${NwimpactLevel.nw_health}</td>
																<td>${NwimpactLevel.nw_construction_industry}</td>
																<td>${NwimpactLevel.nw_agriculture}</td>
																<td>${NwimpactLevel.nw_livestock_industry}</td>
																<td>${NwimpactLevel.nw_aquaculture}</td>
																<td>${NwimpactLevel.nw_traffic}</td>
																<td>${NwimpactLevel.nw_electric}</td>
															</tr>
															<tr>
																<th>서울·인천·경기</th>
																	<c:forEach var="Impact" items="${waPartImpactLevel}">
																		<c:if test="${Impact.wa_code==1}">
																				<td>${Impact.wa_health}</td>
																				<td>${Impact.wa_construction_industry}</td>
																				<td>${Impact.wa_agriculture}</td>
																				<td>${Impact.wa_livestock_industry}</td>
																				<td>${Impact.wa_aquaculture}</td>
																				<td>${Impact.wa_traffic}</td>
																				<td>${Impact.wa_electric}</td>
																			</c:if>
																	</c:forEach>
															</tr>
															<tr>
																<th>부산·경남</th>
																<c:forEach var="Impact" items="${waPartImpactLevel}">
																		<c:if test="${Impact.wa_code==2}">
																			<td>${Impact.wa_health}</td>
																			<td>${Impact.wa_construction_industry}</td>
																			<td>${Impact.wa_agriculture}</td>
																			<td>${Impact.wa_livestock_industry}</td>
																			<td>${Impact.wa_aquaculture}</td>
																			<td>${Impact.wa_traffic}</td>
																			<td>${Impact.wa_electric}</td>
																		</c:if>
																</c:forEach>
															</tr>
															<tr>
																<th>대구·경북</th>
																<c:forEach var="Impact" items="${waPartImpactLevel}">
																		<c:if test="${Impact.wa_code==3}">
																			<td>${Impact.wa_health}</td>
																			<td>${Impact.wa_construction_industry}</td>
																			<td>${Impact.wa_agriculture}</td>
																			<td>${Impact.wa_livestock_industry}</td>
																			<td>${Impact.wa_aquaculture}</td>
																			<td>${Impact.wa_traffic}</td>
																			<td>${Impact.wa_electric}</td>
																		</c:if>
																</c:forEach>
															</tr>
															<tr>
																<th>광주·전남</th>
																<c:forEach var="Impact" items="${waPartImpactLevel}">
																		<c:if test="${Impact.wa_code==4}">
																			<td>${Impact.wa_health}</td>
																			<td>${Impact.wa_construction_industry}</td>
																			<td>${Impact.wa_agriculture}</td>
																			<td>${Impact.wa_livestock_industry}</td>
																			<td>${Impact.wa_aquaculture}</td>
																			<td>${Impact.wa_traffic}</td>
																			<td>${Impact.wa_electric}</td>
																		</c:if>
																</c:forEach>
															</tr>
															<tr>
																<th>전북</th>
																<c:forEach var="Impact" items="${waPartImpactLevel}">
																		<c:if test="${Impact.wa_code==5}">
																			<td>${Impact.wa_health}</td>
																			<td>${Impact.wa_construction_industry}</td>
																			<td>${Impact.wa_agriculture}</td>
																			<td>${Impact.wa_livestock_industry}</td>
																			<td>${Impact.wa_aquaculture}</td>
																			<td>${Impact.wa_traffic}</td>
																			<td>${Impact.wa_electric}</td>
																		</c:if>
																</c:forEach>
															</tr>
															<tr>
																<th>대전·세종·충남</th>
																<c:forEach var="Impact" items="${waPartImpactLevel}">
																		<c:if test="${Impact.wa_code==6}">
																			<td>${Impact.wa_health}</td>
																			<td>${Impact.wa_construction_industry}</td>
																			<td>${Impact.wa_agriculture}</td>
																			<td>${Impact.wa_livestock_industry}</td>
																			<td>${Impact.wa_aquaculture}</td>
																			<td>${Impact.wa_traffic}</td>
																			<td>${Impact.wa_electric}</td>
																		</c:if>
																</c:forEach>
															</tr>
															<tr>
																<th>충북</th>
																<c:forEach var="Impact" items="${waPartImpactLevel}">
																		<c:if test="${Impact.wa_code==7}">
																			<td>${Impact.wa_health}</td>
																			<td>${Impact.wa_construction_industry}</td>
																			<td>${Impact.wa_agriculture}</td>
																			<td>${Impact.wa_livestock_industry}</td>
																			<td>${Impact.wa_aquaculture}</td>
																			<td>${Impact.wa_traffic}</td>
																			<td>${Impact.wa_electric}</td>
																		</c:if>
																</c:forEach>
															</tr>
															<tr>
																<th>강원</th>
																<c:forEach var="Impact" items="${waPartImpactLevel}">
																		<c:if test="${Impact.wa_code==8}">
																			<td>${Impact.wa_health}</td>
																			<td>${Impact.wa_construction_industry}</td>
																			<td>${Impact.wa_agriculture}</td>
																			<td>${Impact.wa_livestock_industry}</td>
																			<td>${Impact.wa_aquaculture}</td>
																			<td>${Impact.wa_traffic}</td>
																			<td>${Impact.wa_electric}</td>
																		</c:if>
																</c:forEach>
															</tr>
															<tr>
																<th>제주</th>
																<c:forEach var="Impact" items="${waPartImpactLevel}">
																		<c:if test="${Impact.wa_code==9}">
																			<td>${Impact.wa_health}</td>
																			<td>${Impact.wa_construction_industry}</td>
																			<td>${Impact.wa_agriculture}</td>
																			<td>${Impact.wa_livestock_industry}</td>
																			<td>${Impact.wa_aquaculture}</td>
																			<td>${Impact.wa_traffic}</td>
																			<td>${Impact.wa_electric}</td>
																		</c:if>
																</c:forEach>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
								</div>
							</li>
							
							<li>
								<div class="include-titleWrap health">
									
									<div class="map-Zone inBox">
										<div class="titleWrap">보건 종합</div>
										<div class="mapWrap">
											<div id="health_map" style="width: 100%; height:calc(100vh - 70px - 70px - 40px - 50px - 10px - 70px);"></div>
										</div>
									</div>
									
									<div class="graph-Zone">
										<div class="inWrap">
											<div class="category-inBox">
												
												<div class="scroll-wrap">
													<div class="titleWrap"><span class="icon-Clipboard"></span><span>세부 부문별 단계 현황 - 시군 수</span></div>
													
													<article>
														<div id="h" class="tit health h"><a href="#">보건 종합</a></div>
														<div class="graph health">
															<ul>
															<c:set var="total_health" value="${ctCountImpactLevel.ct_health_0_count + ctCountImpactLevel.ct_health_1_count + ctCountImpactLevel.ct_health_2_count + ctCountImpactLevel.ct_health_3_count + ctCountImpactLevel.ct_health_4_count}" />
																<li class="graph-gra wNaN" style="width: ${(ctCountImpactLevel.ct_health_0_count/total_health)*750}px;"><span>${ctCountImpactLevel.ct_health_0_count}</span></li>
																<li class="graph-gre wNaN" style="width: ${(ctCountImpactLevel.ct_health_1_count/total_health)*750}px;"><span>${ctCountImpactLevel.ct_health_1_count}</span></li>
																<li class="graph-yel wNaN" style="width: ${(ctCountImpactLevel.ct_health_2_count/total_health)*750}px;"><span>${ctCountImpactLevel.ct_health_2_count}</span></li>
																<li class="graph-ora wNaN" style="width: ${(ctCountImpactLevel.ct_health_3_count/total_health)*750}px;"><span>${ctCountImpactLevel.ct_health_3_count}</span></li>
																<li class="graph-red wNaN" style="width: ${(ctCountImpactLevel.ct_health_4_count/total_health)*750}px;"><span>${ctCountImpactLevel.ct_health_4_count}</span></li>
															</ul>
														</div>
													</article>
													<article>
														<div class="tit ordinary h"><a href="#">일반인</a></div>
														<div class="graph ordinary">
															<ul>
																<li class="graph-gra wNaN" style="width: ${(ctCountImpactLevel.ct_general_people_0_count/total_health)*750}px;"><span>${ctCountImpactLevel.ct_general_people_0_count}</span></li>
																<li class="graph-gre wNaN" style="width: ${(ctCountImpactLevel.ct_general_people_1_count/total_health)*750}px;"><span>${ctCountImpactLevel.ct_general_people_1_count}</span></li>
																<li class="graph-yel wNaN" style="width: ${(ctCountImpactLevel.ct_general_people_2_count/total_health)*750}px;"><span>${ctCountImpactLevel.ct_general_people_2_count}</span></li>
																<li class="graph-ora wNaN" style="width: ${(ctCountImpactLevel.ct_general_people_3_count/total_health)*750}px;"><span>${ctCountImpactLevel.ct_general_people_3_count}</span></li>
																<li class="graph-red wNaN" style="width: ${(ctCountImpactLevel.ct_general_people_4_count/total_health)*750}px;"><span>${ctCountImpactLevel.ct_general_people_4_count}</span></li>
															</ul>
														</div>
													</article>
													<article>
														<div class="tit age65 h"><a href="#">고령자</a></div>
														<div class="graph age">
															<ul>
																<li class="graph-gra wNaN" style="width: ${(ctCountImpactLevel.ct_seniors_0_count/total_health)*750}px;"><span>${ctCountImpactLevel.ct_seniors_0_count}</span></li>
																<li class="graph-gre wNaN" style="width: ${(ctCountImpactLevel.ct_seniors_1_count/total_health)*750}px;"><span>${ctCountImpactLevel.ct_seniors_1_count}</span></li>
																<li class="graph-yel wNaN" style="width: ${(ctCountImpactLevel.ct_seniors_2_count/total_health)*750}px;"><span>${ctCountImpactLevel.ct_seniors_2_count}</span></li>
																<li class="graph-ora wNaN" style="width: ${(ctCountImpactLevel.ct_seniors_3_count/total_health)*750}px;"><span>${ctCountImpactLevel.ct_seniors_3_count}</span></li>
																<li class="graph-red wNaN" style="width: ${(ctCountImpactLevel.ct_seniors_4_count/total_health)*750}px;"><span>${ctCountImpactLevel.ct_seniors_4_count}</span></li>
															</ul>
														</div>
													</article>
													<article>
														<div class="tit outdoor h"><a href="#">야외노동자</a></div>
														<div class="graph outdoor">
															<ul>
																<li class="graph-gra wNaN" style="width: ${(ctCountImpactLevel.ct_outdoor_workers_0_count/total_health)*750}px;"><span>${ctCountImpactLevel.ct_outdoor_workers_0_count}</span></li>
																<li class="graph-gre wNaN" style="width: ${(ctCountImpactLevel.ct_outdoor_workers_1_count/total_health)*750}px;"><span>${ctCountImpactLevel.ct_outdoor_workers_1_count}</span></li>
																<li class="graph-yel wNaN" style="width: ${(ctCountImpactLevel.ct_outdoor_workers_2_count/total_health)*750}px;"><span>${ctCountImpactLevel.ct_outdoor_workers_2_count}</span></li>
																<li class="graph-ora wNaN" style="width: ${(ctCountImpactLevel.ct_outdoor_workers_3_count/total_health)*750}px;"><span>${ctCountImpactLevel.ct_outdoor_workers_3_count}</span></li>
																<li class="graph-red wNaN" style="width: ${(ctCountImpactLevel.ct_outdoor_workers_4_count/total_health)*750}px;"><span>${ctCountImpactLevel.ct_outdoor_workers_4_count}</span></li>
															</ul>
														</div>
													</article>
													<article>
														<div class="tit single h"><a href="#">1인가구</a></div>
														<div class="graph single">
															<ul>
																<li class="graph-gra wNaN" style="width: ${(ctCountImpactLevel.ct_single_person_0_count/total_health)*750}px;"><span>${ctCountImpactLevel.ct_single_person_0_count}</span></li>
																<li class="graph-gre wNaN" style="width: ${(ctCountImpactLevel.ct_single_person_1_count/total_health)*750}px;"><span>${ctCountImpactLevel.ct_single_person_1_count}</span></li>
																<li class="graph-yel wNaN" style="width: ${(ctCountImpactLevel.ct_single_person_2_count/total_health)*750}px;"><span>${ctCountImpactLevel.ct_single_person_2_count}</span></li>
																<li class="graph-ora wNaN" style="width: ${(ctCountImpactLevel.ct_single_person_3_count/total_health)*750}px;"><span>${ctCountImpactLevel.ct_single_person_3_count}</span></li>
																<li class="graph-red wNaN" style="width: ${(ctCountImpactLevel.ct_single_person_4_count/total_health)*750}px;"><span>${ctCountImpactLevel.ct_single_person_4_count}</span></li>
															</ul>
														</div>
													</article>
													<article>
														<div class="tit chdb h"><a href="#">만성질환자</a></div>
														<div class="graph chdb">
															<ul>
																<li class="graph-gra wNaN" style="width: ${(ctCountImpactLevel.ct_chronic_patients_0_count/total_health)*750}px;"><span>${ctCountImpactLevel.ct_chronic_patients_0_count}</span></li>
																<li class="graph-gre wNaN" style="width: ${(ctCountImpactLevel.ct_chronic_patients_1_count/total_health)*750}px;"><span>${ctCountImpactLevel.ct_chronic_patients_1_count}</span></li>
																<li class="graph-yel wNaN" style="width: ${(ctCountImpactLevel.ct_chronic_patients_2_count/total_health)*750}px;"><span>${ctCountImpactLevel.ct_chronic_patients_2_count}</span></li>
																<li class="graph-ora wNaN" style="width: ${(ctCountImpactLevel.ct_chronic_patients_3_count/total_health)*750}px;"><span>${ctCountImpactLevel.ct_chronic_patients_3_count}</span></li>
																<li class="graph-red wNaN" style="width: ${(ctCountImpactLevel.ct_chronic_patients_4_count/total_health)*750}px;"><span>${ctCountImpactLevel.ct_chronic_patients_4_count}</span></li>
															</ul>
														</div>
													</article>
													<article>
														<div class="tit lowincome h"><a href="#">저소득계층</a></div>
														<div class="graph lowincome">
															<ul>
																<li class="graph-gra wNaN" style="width: ${(ctCountImpactLevel.ct_low_income_0_count/total_health)*750}px;"><span>${ctCountImpactLevel.ct_low_income_0_count}</span></li>
																<li class="graph-gre wNaN" style="width: ${(ctCountImpactLevel.ct_low_income_1_count/total_health)*750}px;"><span>${ctCountImpactLevel.ct_low_income_1_count}</span></li>
																<li class="graph-yel wNaN" style="width: ${(ctCountImpactLevel.ct_low_income_2_count/total_health)*750}px;"><span>${ctCountImpactLevel.ct_low_income_2_count}</span></li>
																<li class="graph-ora wNaN" style="width: ${(ctCountImpactLevel.ct_low_income_3_count/total_health)*750}px;"><span>${ctCountImpactLevel.ct_low_income_3_count}</span></li>
																<li class="graph-red wNaN" style="width: ${(ctCountImpactLevel.ct_low_income_4_count/total_health)*750}px;"><span>${ctCountImpactLevel.ct_low_income_4_count}</span></li>
															</ul>
														</div>
													</article>
												</div>
												
											</div>
											<div class="area-inBox">
												<div class="scroll-wrap">
													<div class="titleWrap"><span class="icon-Clipboard"></span><span>세부 부문별 영향 정보 및 대응 방안</span></div>
													<table id="health_nTable">
														<colgroup>
															<col style="width:15%;">
															<col style="width:42.5%;">
															<col style="width:42.5%;">
														</colgroup>
														<thead>
															<tr>
																<th>세부부문</th>
																<th>영향 정보</th>
																<th>대응 방안</th>
															</tr>
														</thead>
														<tbody>
															<tr class="response ordinary">
																<th>일반인</th>
																<c:forEach var="ImpactInfoNw" items="${ImpactInfoNw}">
																	<c:if test="${ImpactInfoNw.nw_division eq '일반인'}">
																		<td> ${ImpactInfoNw.nw_influence_phrase}</td>
																	</c:if>
																</c:forEach>
																<td>
																	<c:forEach var="cmNw" items="${cmNw}">
																		<c:if test="${cmNw.nw_division eq '일반인'}">
																			 ${cmNw.nw_response_phrase} <br>
																		</c:if>
																	</c:forEach>
																</td>
															</tr>
															<tr class="response age65">
																<th>고령자</th>
																<c:forEach var="ImpactInfoNw" items="${ImpactInfoNw}">
																	<c:if test="${ImpactInfoNw.nw_division eq '고령자'}">
																	<td> ${ImpactInfoNw.nw_influence_phrase}</td>
																	</c:if>
																</c:forEach>
																<td>
																	<c:forEach var="cmNw" items="${cmNw}">
																		<c:if test="${cmNw.nw_division eq '고령자'}">
																			 ${cmNw.nw_response_phrase} <br>
																		</c:if>
																	</c:forEach>
																</td>
															</tr>
															<tr class="response outdoor">
																<th>야외노동자</th>
																<c:forEach var="ImpactInfoNw" items="${ImpactInfoNw}">
																	<c:if test="${ImpactInfoNw.nw_division eq '야외노동자'}">
																		<td> ${ImpactInfoNw.nw_influence_phrase}</td>
																	</c:if>
																</c:forEach>
																<td>
																	<c:forEach var="cmNw" items="${cmNw}">
																		<c:if test="${cmNw.nw_division eq '야외노동자'}">
																			 ${cmNw.nw_response_phrase} <br>
																		</c:if>
																	</c:forEach>
																</td>
															</tr>
															<tr class="response single">
																<th>1인가구</th>
																<c:forEach var="ImpactInfoNw" items="${ImpactInfoNw}">
																	<c:if test="${ImpactInfoNw.nw_division eq '1인가구'}">
																		<td> ${ImpactInfoNw.nw_influence_phrase}</td>
																	</c:if>
																</c:forEach>
																<td>
																	<c:forEach var="cmNw" items="${cmNw}">
																		<c:if test="${cmNw.nw_division eq '1인가구'}">
																			 ${cmNw.nw_response_phrase} <br>
																		</c:if>
																	</c:forEach>
																</td>
															</tr>
															<tr class="response chdb">
																<th>만성질환자</th>
																<c:forEach var="ImpactInfoNw" items="${ImpactInfoNw}">
																	<c:if test="${ImpactInfoNw.nw_division eq '만성질환자'}">
																		<td> ${ImpactInfoNw.nw_influence_phrase}</td>
																	</c:if>
																</c:forEach>
																<td>
																	<c:forEach var="cmNw" items="${cmNw}">
																		<c:if test="${cmNw.nw_division eq '만성질환자'}">
																			 ${cmNw.nw_response_phrase} <br>
																		</c:if>
																	</c:forEach>
																</td>
															</tr>
															<tr class="response lowincome">
																<th>저소득계층</th>
																<c:forEach var="ImpactInfoNw" items="${ImpactInfoNw}">
																	<c:if test="${ImpactInfoNw.nw_division eq '저소득계층'}">
																		<td>  ${ImpactInfoNw.nw_influence_phrase}</td>
																	</c:if>
																</c:forEach>
																<td>
																	<c:forEach var="cmNw" items="${cmNw}">
																		<c:if test="${cmNw.nw_division eq '저소득계층'}">
																			 ${cmNw.nw_response_phrase} <br>
																		</c:if>
																	</c:forEach>
																</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
								</div>
							</li>
							
							<li>
								<div class="include-titleWrap industry">
									
									<div class="map-Zone inBox">
										<div class="titleWrap">산업 종합</div>
										<div class="mapWrap">
											<div id="industry_map" style="width: 100%; height:calc(100vh - 70px - 70px - 40px - 50px - 10px - 70px);"></div>
										</div>
									</div>
									
									<div class="graph-Zone">
										<div class="inWrap">
											<div class="category-inBox">
												
												<div class="scroll-wrap">
													<div class="titleWrap"><span class="icon-Clipboard"></span><span>세부 부문별 단계 현황 - 시군 수</span></div>
													<article>
														<div id="i" class="tit indust i"><a href="#">산업 종합</a></div>
														<div class="graph industry">
															<ul>
															<c:set var="total_industry" value="${ctCountImpactLevel.ct_industry_no_0_count + ctCountImpactLevel.ct_industry_no_1_count + ctCountImpactLevel.ct_industry_no_2_count + ctCountImpactLevel.ct_industry_no_3_count + ctCountImpactLevel.ct_industry_no_4_count}" />
																<li class="graph-gra wNaN" style="width: ${(ctCountImpactLevel.ct_industry_no_0_count/total_industry)*750}px;"><span>${ctCountImpactLevel.ct_industry_no_0_count}</span></li>
																<li class="graph-gre wNaN" style="width: ${(ctCountImpactLevel.ct_industry_no_1_count/total_industry)*750}px;"><span>${ctCountImpactLevel.ct_industry_no_1_count}</span></li>
																<li class="graph-yel wNaN" style="width: ${(ctCountImpactLevel.ct_industry_no_2_count/total_industry)*750}px;"><span>${ctCountImpactLevel.ct_industry_no_2_count}</span></li>
																<li class="graph-ora wNaN" style="width: ${(ctCountImpactLevel.ct_industry_no_3_count/total_industry)*750}px;"><span>${ctCountImpactLevel.ct_industry_no_3_count}</span></li>
																<li class="graph-red wNaN" style="width: ${(ctCountImpactLevel.ct_industry_no_4_count/total_industry)*750}px;"><span>${ctCountImpactLevel.ct_industry_no_4_count}</span></li>
															</ul>
														</div>
													</article>
													<article>
														<div class="tit gunsul i"><a href="#">건설업</a></div>
														<div class="graph gunsul">
															<ul>
																<li class="graph-gra wNaN" style="width: ${(ctCountImpactLevel.ct_industry_no_0_count/total_industry)*750}px;"><span>${ctCountImpactLevel.ct_construction_industry_0_count}</span></li>
																<li class="graph-gre wNaN" style="width: ${(ctCountImpactLevel.ct_industry_no_1_count/total_industry)*750}px;"><span>${ctCountImpactLevel.ct_construction_industry_1_count}</span></li>
																<li class="graph-yel wNaN" style="width: ${(ctCountImpactLevel.ct_industry_no_2_count/total_industry)*750}px;"><span>${ctCountImpactLevel.ct_construction_industry_2_count}</span></li>
																<li class="graph-ora wNaN" style="width: ${(ctCountImpactLevel.ct_industry_no_3_count/total_industry)*750}px;"><span>${ctCountImpactLevel.ct_construction_industry_3_count}</span></li>
																<li class="graph-red wNaN" style="width: ${(ctCountImpactLevel.ct_industry_no_4_count/total_industry)*750}px;"><span>${ctCountImpactLevel.ct_construction_industry_4_count}</span></li>
															</ul>
														</div>
													</article>
													<article>
														<div class="tit jejo i"><a href="#">제조업</a></div>
														<div class="graph jejo">
															<ul>
																<li class="graph-gra wNaN" style="width: ${(ctCountImpactLevel.ct_manufacturing_industry_0_count/total_industry)*750}px;"><span>${ctCountImpactLevel.ct_manufacturing_industry_0_count}</span></li>
																<li class="graph-gre wNaN" style="width: ${(ctCountImpactLevel.ct_manufacturing_industry_1_count/total_industry)*750}px;"><span>${ctCountImpactLevel.ct_manufacturing_industry_1_count}</span></li>
																<li class="graph-yel wNaN" style="width: ${(ctCountImpactLevel.ct_manufacturing_industry_2_count/total_industry)*750}px;"><span>${ctCountImpactLevel.ct_manufacturing_industry_2_count}</span></li>
																<li class="graph-ora wNaN" style="width: ${(ctCountImpactLevel.ct_manufacturing_industry_3_count/total_industry)*750}px;"><span>${ctCountImpactLevel.ct_manufacturing_industry_3_count}</span></li>
																<li class="graph-red wNaN" style="width: ${(ctCountImpactLevel.ct_manufacturing_industry_4_count/total_industry)*750}px;"><span>${ctCountImpactLevel.ct_manufacturing_industry_4_count}</span></li>
															</ul>
														</div>
													</article>
													<article>
														<div class="tit samu i"><a href="#">사무직 및 서비스업</a></div>
														<div class="graph samu">
															<ul>
																<li class="graph-gra wNaN" style="width: ${(ctCountImpactLevel.ct_office_service_0_count/total_industry)*750}px;"><span>${ctCountImpactLevel.ct_office_service_0_count}</span></li>
																<li class="graph-gre wNaN" style="width: ${(ctCountImpactLevel.ct_office_service_1_count/total_industry)*750}px;"><span>${ctCountImpactLevel.ct_office_service_1_count}</span></li>
																<li class="graph-yel wNaN" style="width: ${(ctCountImpactLevel.ct_office_service_2_count/total_industry)*750}px;"><span>${ctCountImpactLevel.ct_office_service_2_count}</span></li>
																<li class="graph-ora wNaN" style="width: ${(ctCountImpactLevel.ct_office_service_3_count/total_industry)*750}px;"><span>${ctCountImpactLevel.ct_office_service_3_count}</span></li>
																<li class="graph-red wNaN" style="width: ${(ctCountImpactLevel.ct_office_service_4_count/total_industry)*750}px;"><span>${ctCountImpactLevel.ct_office_service_4_count}</span></li>
															</ul>
														</div>
													</article>
												</div>
												
											</div>
											<div class="area-inBox">
												<div class="scroll-wrap">
													<div class="titleWrap"><span class="icon-Clipboard"></span><span>세부 부문별 영향 정보 및 대응 방안</span></div>
													<table id="indust_nTable">
														<colgroup>
															<col style="width:15%;">
															<col style="width:42.5%;">
															<col style="width:42.5%;">
														</colgroup>
														<thead>
															<tr>
																<th>세부부문</th>
																<th>영향 정보</th>
																<th>대응 방안</th>
															</tr>
														</thead>
														<tbody>
															
															<tr class="response gunsul">
																<th>건설업</th>
																<c:forEach var="ImpactInfoNw" items="${ImpactInfoNw}">
																	<c:if test="${ImpactInfoNw.nw_division eq '건설업'}">
																		<td>  ${ImpactInfoNw.nw_influence_phrase}</td>
																	</c:if>
																</c:forEach>
																<td>
																	<c:forEach var="cmNw" items="${cmNw}">
																		<c:if test="${cmNw.nw_division eq '건설업'}">
																			 ${cmNw.nw_response_phrase} <br>
																		</c:if>
																	</c:forEach>
																</td>
															</tr>
															<tr class="response jejo">
																<th>제조업</th>
																<c:forEach var="ImpactInfoNw" items="${ImpactInfoNw}">
																	<c:if test="${ImpactInfoNw.nw_division eq '제조업'}">
																		<td>  ${ImpactInfoNw.nw_influence_phrase}</td>
																	</c:if>
																</c:forEach>
																<td>
																	<c:forEach var="cmNw" items="${cmNw}">
																		<c:if test="${cmNw.nw_division eq '제조업'}">
																			 ${cmNw.nw_response_phrase} <br>
																		</c:if>
																	</c:forEach>
																</td>
															</tr>
															<tr class="response samu">
																<th>사무직 및 서비스업</th>
																<c:forEach var="ImpactInfoNw" items="${ImpactInfoNw}">
																	<c:if test="${ImpactInfoNw.nw_division eq '사무직 및 서비스업'}">
																		<td>  ${ImpactInfoNw.nw_influence_phrase}</td>
																	</c:if>
																</c:forEach>
																<td>
																	<c:forEach var="cmNw" items="${cmNw}">
																		<c:if test="${cmNw.nw_division eq '사무직 및 서비스업'}">
																			 ${cmNw.nw_response_phrase} <br>
																		</c:if>
																	</c:forEach>
																</td>
															</tr>
															
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
								</div>
							</li> 
							
							<li>
								<div class="include-titleWrap agri">
									
									<div class="map-Zone inBox">
										<div class="titleWrap">농업 종합</div>
										<div class="mapWrap">
											<div id="agriculture_map" style="width: 100%; height:calc(100vh - 70px - 70px - 40px - 50px - 10px - 70px);"></div>
										</div>
									</div>
									
									<div class="graph-Zone">
										<div class="inWrap">
											<div class="category-inBox">
												
												<div class="scroll-wrap">
													<div class="titleWrap"><span class="icon-Clipboard"></span><span>세부 부문별 단계 현황 - 시군 수</span></div>
													<article>
														<div id="a" class="tit agri a"><a href="#">농업 종합</a></div>
														<div class="graph agriculture">
															<ul>
															<c:set var="total_agriculture" value="${ctCountImpactLevel.ct_agriculture_0_count + ctCountImpactLevel.ct_agriculture_1_count + ctCountImpactLevel.ct_agriculture_2_count + ctCountImpactLevel.ct_agriculture_3_count + ctCountImpactLevel.ct_agriculture_4_count}" />
																<li class="graph-gra wNaN" style="width: ${(ctCountImpactLevel.ct_agriculture_0_count/total_agriculture)*750}px;"><span>${ctCountImpactLevel.ct_agriculture_0_count}</span></li>
																<li class="graph-gre wNaN" style="width: ${(ctCountImpactLevel.ct_agriculture_1_count/total_agriculture)*750}px;"><span>${ctCountImpactLevel.ct_agriculture_1_count}</span></li>
																<li class="graph-yel wNaN" style="width: ${(ctCountImpactLevel.ct_agriculture_2_count/total_agriculture)*750}px;"><span>${ctCountImpactLevel.ct_agriculture_2_count}</span></li>
																<li class="graph-ora wNaN" style="width: ${(ctCountImpactLevel.ct_agriculture_3_count/total_agriculture)*750}px;"><span>${ctCountImpactLevel.ct_agriculture_3_count}</span></li>
																<li class="graph-red wNaN" style="width: ${(ctCountImpactLevel.ct_agriculture_4_count/total_agriculture)*750}px;"><span>${ctCountImpactLevel.ct_agriculture_4_count}</span></li>
															</ul>
														</div>
													</article>
													<article>
														<div class="tit apple a"><a href="#">사과</a></div>
														<div class="graph apple">
															<ul>
																<li class="graph-gra wNaN" style="width: ${(ctCountImpactLevel.ct_apple_0_count/total_agriculture)*750}px;"><span>${ctCountImpactLevel.ct_apple_0_count}</span></li>
																<li class="graph-gre wNaN" style="width: ${(ctCountImpactLevel.ct_apple_1_count/total_agriculture)*750}px;"><span>${ctCountImpactLevel.ct_apple_1_count}</span></li>
																<li class="graph-yel wNaN" style="width: ${(ctCountImpactLevel.ct_apple_2_count/total_agriculture)*750}px;"><span>${ctCountImpactLevel.ct_apple_2_count}</span></li>
																<li class="graph-ora wNaN" style="width: ${(ctCountImpactLevel.ct_apple_3_count/total_agriculture)*750}px;"><span>${ctCountImpactLevel.ct_apple_3_count}</span></li>
																<li class="graph-red wNaN" style="width: ${(ctCountImpactLevel.ct_apple_4_count/total_agriculture)*750}px;"><span>${ctCountImpactLevel.ct_apple_4_count}</span></li>
															</ul>
														</div>
													</article>
													<article>
														<div class="tit pear a"><a href="#">배</a></div>
														<div class="graph pear">
															<ul>
																<li class="graph-gra wNaN" style="width: ${(ctCountImpactLevel.ct_pears_0_count/total_agriculture)*750}px;"><span>${ctCountImpactLevel.ct_pears_0_count}</span></li>
																<li class="graph-gre wNaN" style="width: ${(ctCountImpactLevel.ct_pears_1_count/total_agriculture)*750}px;"><span>${ctCountImpactLevel.ct_pears_1_count}</span></li>
																<li class="graph-yel wNaN" style="width: ${(ctCountImpactLevel.ct_pears_2_count/total_agriculture)*750}px;"><span>${ctCountImpactLevel.ct_pears_2_count}</span></li>
																<li class="graph-ora wNaN" style="width: ${(ctCountImpactLevel.ct_pears_3_count/total_agriculture)*750}px;"><span>${ctCountImpactLevel.ct_pears_3_count}</span></li>
																<li class="graph-red wNaN" style="width: ${(ctCountImpactLevel.ct_pears_4_count/total_agriculture)*750}px;"><span>${ctCountImpactLevel.ct_pears_4_count}</span></li>
															</ul>
														</div>
													</article>
													<article>
														<div class="tit peach a"><a href="#">복숭아</a></div>
														<div class="graph peach">
															<ul>
																<li class="graph-gra wNaN" style="width: ${(ctCountImpactLevel.ct_peach_0_count/total_agriculture)*750}px;"><span>${ctCountImpactLevel.ct_peach_0_count}</span></li>
																<li class="graph-gre wNaN" style="width: ${(ctCountImpactLevel.ct_peach_1_count/total_agriculture)*750}px;"><span>${ctCountImpactLevel.ct_peach_1_count}</span></li>
																<li class="graph-yel wNaN" style="width: ${(ctCountImpactLevel.ct_peach_2_count/total_agriculture)*750}px;"><span>${ctCountImpactLevel.ct_peach_2_count}</span></li>
																<li class="graph-ora wNaN" style="width: ${(ctCountImpactLevel.ct_peach_3_count/total_agriculture)*750}px;"><span>${ctCountImpactLevel.ct_peach_3_count}</span></li>
																<li class="graph-red wNaN" style="width: ${(ctCountImpactLevel.ct_peach_4_count/total_agriculture)*750}px;"><span>${ctCountImpactLevel.ct_peach_4_count}</span></li>
															</ul>
														</div>
													</article>
													<article>
														<div class="tit grape a"><a href="#">포도</a></div>
														<div class="graph grape">
															<ul>
																<li class="graph-gra wNaN" style="width: ${(ctCountImpactLevel.ct_grape_0_count/total_agriculture)*750}px;"><span>${ctCountImpactLevel.ct_grape_0_count}</span></li>
																<li class="graph-gre wNaN" style="width: ${(ctCountImpactLevel.ct_grape_1_count/total_agriculture)*750}px;"><span>${ctCountImpactLevel.ct_grape_1_count}</span></li>
																<li class="graph-yel wNaN" style="width: ${(ctCountImpactLevel.ct_grape_2_count/total_agriculture)*750}px;"><span>${ctCountImpactLevel.ct_grape_2_count}</span></li>
																<li class="graph-ora wNaN" style="width: ${(ctCountImpactLevel.ct_grape_3_count/total_agriculture)*750}px;"><span>${ctCountImpactLevel.ct_grape_3_count}</span></li>
																<li class="graph-red wNaN" style="width: ${(ctCountImpactLevel.ct_grape_4_count/total_agriculture)*750}px;"><span>${ctCountImpactLevel.ct_grape_4_count}</span></li>
															</ul>
														</div>
													</article>
													<article>
														<div class="tit ginseng a"><a href="#">인삼</a></div>
														<div class="graph ginseng">
															<ul>
																<li class="graph-gra wNaN" style="width: ${(ctCountImpactLevel.ct_ginseng_0_count/total_agriculture)*750}px;"><span>${ctCountImpactLevel.ct_ginseng_0_count}</span></li>
																<li class="graph-gre wNaN" style="width: ${(ctCountImpactLevel.ct_ginseng_1_count/total_agriculture)*750}px;"><span>${ctCountImpactLevel.ct_ginseng_1_count}</span></li>
																<li class="graph-yel wNaN" style="width: ${(ctCountImpactLevel.ct_ginseng_2_count/total_agriculture)*750}px;"><span>${ctCountImpactLevel.ct_ginseng_2_count}</span></li>
																<li class="graph-ora wNaN" style="width: ${(ctCountImpactLevel.ct_ginseng_3_count/total_agriculture)*750}px;"><span>${ctCountImpactLevel.ct_ginseng_3_count}</span></li>
																<li class="graph-red wNaN" style="width: ${(ctCountImpactLevel.ct_ginseng_4_count/total_agriculture)*750}px;"><span>${ctCountImpactLevel.ct_ginseng_4_count}</span></li>
															</ul>
														</div>
													</article>
													<article>
														<div class="tit pepper a"><a href="#">고추</a></div>
														<div class="graph pepper">
															<ul>
																<li class="graph-gra wNaN" style="width: ${(ctCountImpactLevel.ct_peppers_0_count/total_agriculture)*750}px;"><span>${ctCountImpactLevel.ct_peppers_0_count}</span></li>
																<li class="graph-gre wNaN" style="width: ${(ctCountImpactLevel.ct_peppers_1_count/total_agriculture)*750}px;"><span>${ctCountImpactLevel.ct_peppers_1_count}</span></li>
																<li class="graph-yel wNaN" style="width: ${(ctCountImpactLevel.ct_peppers_2_count/total_agriculture)*750}px;"><span>${ctCountImpactLevel.ct_peppers_2_count}</span></li>
																<li class="graph-ora wNaN" style="width: ${(ctCountImpactLevel.ct_peppers_3_count/total_agriculture)*750}px;"><span>${ctCountImpactLevel.ct_peppers_3_count}</span></li>
																<li class="graph-red wNaN" style="width: ${(ctCountImpactLevel.ct_peppers_4_count/total_agriculture)*750}px;"><span>${ctCountImpactLevel.ct_peppers_4_count}</span></li>
															</ul>
														</div>
													</article>
													<article>
														<div class="tit wmelon a"><a href="#">수박</a></div>
														<div class="graph wmelon">
															<ul>
																<li class="graph-gra wNaN" style="width: ${(ctCountImpactLevel.ct_watermelons_0_count/total_agriculture)*750}px;"><span>${ctCountImpactLevel.ct_watermelons_0_count}</span></li>
																<li class="graph-gre wNaN" style="width: ${(ctCountImpactLevel.ct_watermelons_1_count/total_agriculture)*750}px;"><span>${ctCountImpactLevel.ct_watermelons_1_count}</span></li>
																<li class="graph-yel wNaN" style="width: ${(ctCountImpactLevel.ct_watermelons_2_count/total_agriculture)*750}px;"><span>${ctCountImpactLevel.ct_watermelons_2_count}</span></li>
																<li class="graph-ora wNaN" style="width: ${(ctCountImpactLevel.ct_watermelons_3_count/total_agriculture)*750}px;"><span>${ctCountImpactLevel.ct_watermelons_3_count}</span></li>
																<li class="graph-red wNaN" style="width: ${(ctCountImpactLevel.ct_watermelons_4_count/total_agriculture)*750}px;"><span>${ctCountImpactLevel.ct_watermelons_4_count}</span></li>
															</ul>
														</div>
													</article>
												</div>
												
											</div>
											<div class="area-inBox">
												<div class="scroll-wrap">
													<div class="titleWrap"><span class="icon-Clipboard"></span><span>세부 부문별 영향 정보 및 대응 방안</span></div>
													<table id="agri_nTable">
														<colgroup>
															<col style="width:15%;">
															<col style="width:42.5%;">
															<col style="width:42.5%;">
														</colgroup>
														<thead>
															<tr>
																<th>세부부문</th>
																<th>영향 정보</th>
																<th>대응 방안</th>
															</tr>
														</thead>
														<tbody>
															<tr class="response apple">
																<th>사과</th>
																<c:forEach var="ImpactInfoNw" items="${ImpactInfoNw}">
																	<c:if test="${ImpactInfoNw.nw_division eq '사과'}">
																		<td> ${ImpactInfoNw.nw_influence_phrase}</td>
																	</c:if>
																</c:forEach>
																<td>
																	<c:forEach var="cmNw" items="${cmNw}">
																		<c:if test="${cmNw.nw_division eq '사과'}">
																			 ${cmNw.nw_response_phrase} <br>
																		</c:if>
																	</c:forEach>
																</td>
															</tr>
															<tr class="response pear">
																<th>배</th>
																<c:forEach var="ImpactInfoNw" items="${ImpactInfoNw}">
																	<c:if test="${ImpactInfoNw.nw_division eq '배'}">
																		<td> ${ImpactInfoNw.nw_influence_phrase}</td>
																	</c:if>
																</c:forEach>
																<td>
																	<c:forEach var="cmNw" items="${cmNw}">
																		<c:if test="${cmNw.nw_division eq '배'}">
																			 ${cmNw.nw_response_phrase} <br>
																		</c:if>
																	</c:forEach>
																</td>
															</tr>
															<tr class="response peach">
																<th>복숭아</th>
																<c:forEach var="ImpactInfoNw" items="${ImpactInfoNw}">
																	<c:if test="${ImpactInfoNw.nw_division eq '복숭아'}">
																		<td> ${ImpactInfoNw.nw_influence_phrase}</td>
																	</c:if>
																</c:forEach>
																<td>
																	<c:forEach var="cmNw" items="${cmNw}">
																		<c:if test="${cmNw.nw_division eq '복숭아'}">
																			 ${cmNw.nw_response_phrase} <br>
																		</c:if>
																	</c:forEach>
																</td>
															</tr>
															<tr class="response grape">
																<th>포도</th>
																<c:forEach var="ImpactInfoNw" items="${ImpactInfoNw}">
																	<c:if test="${ImpactInfoNw.nw_division eq '포도'}">
																		<td> ${ImpactInfoNw.nw_influence_phrase}</td>
																	</c:if>
																</c:forEach>
																<td>
																	<c:forEach var="cmNw" items="${cmNw}">
																		<c:if test="${cmNw.nw_division eq '포도'}">
																			 ${cmNw.nw_response_phrase} <br>
																		</c:if>
																	</c:forEach>
																</td>
															</tr>
															<tr  class="response ginseng">
																<th>인삼</th>
																<c:forEach var="ImpactInfoNw" items="${ImpactInfoNw}">
																	<c:if test="${ImpactInfoNw.nw_division eq '인삼'}">
																		<td> ${ImpactInfoNw.nw_influence_phrase}</td>
																	</c:if>
																</c:forEach>
																<td>
																	<c:forEach var="cmNw" items="${cmNw}">
																		<c:if test="${cmNw.nw_division eq '인삼'}">
																			 ${cmNw.nw_response_phrase} <br>
																		</c:if>
																	</c:forEach>
																</td>
															</tr>
															<tr class="response pepper">
																<th>고추</th>
																<c:forEach var="ImpactInfoNw" items="${ImpactInfoNw}">
																	<c:if test="${ImpactInfoNw.nw_division eq '고추'}">
																		<td> ${ImpactInfoNw.nw_influence_phrase}</td>
																	</c:if>
																</c:forEach>
																<td>
																	<c:forEach var="cmNw" items="${cmNw}">
																		<c:if test="${cmNw.nw_division eq '고추'}">
																			 ${cmNw.nw_response_phrase} <br>
																		</c:if>
																	</c:forEach>
																</td>
															</tr>
															<tr class="response wmelon">
																<th>수박</th>
																<c:forEach var="ImpactInfoNw" items="${ImpactInfoNw}">
																	<c:if test="${ImpactInfoNw.nw_division eq '수박'}">
																		<td> ${ImpactInfoNw.nw_influence_phrase}</td>
																	</c:if>
																</c:forEach>
																<td>
																	<c:forEach var="cmNw" items="${cmNw}">
																		<c:if test="${cmNw.nw_division eq '수박'}">
																			 ${cmNw.nw_response_phrase} <br>
																		</c:if>
																	</c:forEach>
																</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
								</div>
							</li>
							
							<li>
								<div class="include-titleWrap waterfarm">
									
									<div class="map-Zone inBox">
										<div class="titleWrap">수산양식 종합</div>
										<div class="mapWrap">
											<div id="waterfarm_map" style="width: 100%; height:calc(100vh - 70px - 70px - 40px - 50px - 10px - 70px);"></div>
										</div>
									</div>
									
									<div class="graph-Zone">
										<div class="inWrap">
											<div class="category-inBox">
												
												<div class="scroll-wrap">
													<div class="titleWrap"><span class="icon-Clipboard"></span><span>세부 부문별 단계 현황 - 시군 수</span></div>
													<article>
														<div id="w" class="tit waterfarm w"><a href="#">수산양식 종합</a></div>
														<div class="graph waterfarm">
															<ul>
															<c:set var="total_aquaculture" value="${ctCountImpactLevel.ct_aquaculture_0_count + ctCountImpactLevel.ct_aquaculture_1_count + ctCountImpactLevel.ct_aquaculture_2_count + ctCountImpactLevel.ct_aquaculture_3_count + ctCountImpactLevel.ct_aquaculture_4_count}" />
																<li class="graph-gra wNaN" style="width: ${(ctCountImpactLevel.ct_aquaculture_0_count/total_aquaculture)*750}px;"><span>${ctCountImpactLevel.ct_aquaculture_0_count}</span></li>
																<li class="graph-gre wNaN" style="width: ${(ctCountImpactLevel.ct_aquaculture_1_count/total_aquaculture)*750}px;"><span>${ctCountImpactLevel.ct_aquaculture_1_count}</span></li>
																<li class="graph-yel wNaN" style="width: ${(ctCountImpactLevel.ct_aquaculture_2_count/total_aquaculture)*750}px;"><span>${ctCountImpactLevel.ct_aquaculture_2_count}</span></li>
																<li class="graph-ora wNaN" style="width: ${(ctCountImpactLevel.ct_aquaculture_3_count/total_aquaculture)*750}px;"><span>${ctCountImpactLevel.ct_aquaculture_3_count}</span></li>
																<li class="graph-red wNaN" style="width: ${(ctCountImpactLevel.ct_aquaculture_4_count/total_aquaculture)*750}px;"><span>${ctCountImpactLevel.ct_aquaculture_4_count}</span></li>
															</ul>
														</div>
													</article>
													<article>
														<div class="tit nupchi w"><a href="#">넙치류</a></div>
														<div class="graph nupchi">
															<ul>
																<li class="graph-gra wNaN" style="width: ${(ctCountImpactLevel.ct_flounder_0_count/total_aquaculture)*750}px;"><span>${ctCountImpactLevel.ct_flounder_0_count}</span></li>
																<li class="graph-gre wNaN" style="width: ${(ctCountImpactLevel.ct_flounder_1_count/total_aquaculture)*750}px;"><span>${ctCountImpactLevel.ct_flounder_1_count}</span></li>
																<li class="graph-yel wNaN" style="width: ${(ctCountImpactLevel.ct_flounder_2_count/total_aquaculture)*750}px;"><span>${ctCountImpactLevel.ct_flounder_2_count}</span></li>
																<li class="graph-ora wNaN" style="width: ${(ctCountImpactLevel.ct_flounder_3_count/total_aquaculture)*750}px;"><span>${ctCountImpactLevel.ct_flounder_3_count}</span></li>
																<li class="graph-red wNaN" style="width: ${(ctCountImpactLevel.ct_flounder_4_count/total_aquaculture)*750}px;"><span>${ctCountImpactLevel.ct_flounder_4_count}</span></li>
															</ul>
														</div>
													</article>
													<article>
														<div class="tit gajami w"><a href="#">가자미류</a></div>
														<div class="graph gajami">
															<ul>
																<li class="graph-gra wNaN" style="width: ${(ctCountImpactLevel.ct_tuna_0_count/total_aquaculture)*750}px;"><span>${ctCountImpactLevel.ct_tuna_0_count}</span></li>
																<li class="graph-gre wNaN" style="width: ${(ctCountImpactLevel.ct_tuna_1_count/total_aquaculture)*750}px;"><span>${ctCountImpactLevel.ct_tuna_1_count}</span></li>
																<li class="graph-yel wNaN" style="width: ${(ctCountImpactLevel.ct_tuna_2_count/total_aquaculture)*750}px;"><span>${ctCountImpactLevel.ct_tuna_2_count}</span></li>
																<li class="graph-ora wNaN" style="width: ${(ctCountImpactLevel.ct_tuna_3_count/total_aquaculture)*750}px;"><span>${ctCountImpactLevel.ct_tuna_3_count}</span></li>
																<li class="graph-red wNaN" style="width: ${(ctCountImpactLevel.ct_tuna_4_count/total_aquaculture)*750}px;"><span>${ctCountImpactLevel.ct_tuna_4_count}</span></li>
															</ul>
														</div>
													</article>
													
													<article>
														<div class="tit norami w"><a href="#">줄노래미류</a></div>
														<div class="graph norami">
															<ul>
																<li class="graph-gra wNaN" style="width: ${(ctCountImpactLevel.ct_scorpionfish_0_count/total_aquaculture)*750}px;"><span>${ctCountImpactLevel.ct_scorpionfish_0_count}</span></li>
																<li class="graph-gre wNaN" style="width: ${(ctCountImpactLevel.ct_scorpionfish_1_count/total_aquaculture)*750}px;"><span>${ctCountImpactLevel.ct_scorpionfish_1_count}</span></li>
																<li class="graph-yel wNaN" style="width: ${(ctCountImpactLevel.ct_scorpionfish_2_count/total_aquaculture)*750}px;"><span>${ctCountImpactLevel.ct_scorpionfish_2_count}</span></li>
																<li class="graph-ora wNaN" style="width: ${(ctCountImpactLevel.ct_scorpionfish_3_count/total_aquaculture)*750}px;"><span>${ctCountImpactLevel.ct_scorpionfish_3_count}</span></li>
																<li class="graph-red wNaN" style="width: ${(ctCountImpactLevel.ct_scorpionfish_4_count/total_aquaculture)*750}px;"><span>${ctCountImpactLevel.ct_scorpionfish_4_count}</span></li>
															</ul>
														</div>
													</article>
													<article>
														<div class="tit jopibollak w"><a href="#">조피볼락류</a></div>
														<div class="graph jopibollak">
															<ul>
																<li class="graph-gra wNaN" style="width: ${(ctCountImpactLevel.ct_jacopever_0_count/total_aquaculture)*750}px;"><span>${ctCountImpactLevel.ct_jacopever_0_count}</span></li>
																<li class="graph-gre wNaN" style="width: ${(ctCountImpactLevel.ct_jacopever_1_count/total_aquaculture)*750}px;"><span>${ctCountImpactLevel.ct_jacopever_1_count}</span></li>
																<li class="graph-yel wNaN" style="width: ${(ctCountImpactLevel.ct_jacopever_2_count/total_aquaculture)*750}px;"><span>${ctCountImpactLevel.ct_jacopever_2_count}</span></li>
																<li class="graph-ora wNaN" style="width: ${(ctCountImpactLevel.ct_jacopever_3_count/total_aquaculture)*750}px;"><span>${ctCountImpactLevel.ct_jacopever_3_count}</span></li>
																<li class="graph-red wNaN" style="width: ${(ctCountImpactLevel.ct_jacopever_4_count/total_aquaculture)*750}px;"><span>${ctCountImpactLevel.ct_jacopever_4_count}</span></li>
															</ul>
														</div>
													</article>
													<article>
														<div class="tit jeonbok w"><a href="#">전복류</a></div>
														<div class="graph jeonbok">
															<ul>
																<li class="graph-gra wNaN" style="width: ${(ctCountImpactLevel.ct_abalone_0_count/total_aquaculture)*750}px;"><span>${ctCountImpactLevel.ct_abalone_0_count}</span></li>
																<li class="graph-gre wNaN" style="width: ${(ctCountImpactLevel.ct_abalone_1_count/total_aquaculture)*750}px;"><span>${ctCountImpactLevel.ct_abalone_1_count}</span></li>
																<li class="graph-yel wNaN" style="width: ${(ctCountImpactLevel.ct_abalone_2_count/total_aquaculture)*750}px;"><span>${ctCountImpactLevel.ct_abalone_2_count}</span></li>
																<li class="graph-ora wNaN" style="width: ${(ctCountImpactLevel.ct_abalone_3_count/total_aquaculture)*750}px;"><span>${ctCountImpactLevel.ct_abalone_3_count}</span></li>
																<li class="graph-red wNaN" style="width: ${(ctCountImpactLevel.ct_abalone_4_count/total_aquaculture)*750}px;"><span>${ctCountImpactLevel.ct_abalone_4_count}</span></li>
															</ul>
														</div>
													</article>
													
												</div>
												
											</div>
											<div class="area-inBox">
												<div class="scroll-wrap">
													<div class="titleWrap"><span class="icon-Clipboard"></span><span>세부 부문별 영향 정보 및 대응 방안</span></div>
													<table id="waterfarm_nTable">
														<colgroup>
															<col style="width:15%;">
															<col style="width:42.5%;">
															<col style="width:42.5%;">
														</colgroup>
														<thead>
															<tr>
																<th>세부부문</th>
																<th>영향 정보</th>
																<th>대응 방안</th>
															</tr>
														</thead>
														<tbody>
															<tr class="response nupchi">
																<th>넙치류(육상수조식)</th>
																	<c:forEach var="ImpactInfo" items="${ImpactInfoNw}">
																	  <c:if test="${ImpactInfo.nw_division eq '넙치'}">
																	    <td> ${ImpactInfo.nw_influence_phrase}</td>
																	  </c:if>
																	</c:forEach>
																<td>
																	<c:forEach var="cm" items="${cmNw}">
																		<c:if test="${cm.nw_division eq '넙치'}">
																			 ${cm.nw_response_phrase} <br>
																		</c:if>
																	</c:forEach>
																</td>
															</tr>
															<tr class="response gajami">
																<th>가자미류(육상수조식)</th>
																	<c:forEach var="ImpactInfo" items="${ImpactInfoNw}">
																	  <c:if test="${ImpactInfo.nw_division eq '가자미'}">
																	    <td> ${ImpactInfo.nw_influence_phrase}</td>
																	  </c:if>
																	</c:forEach>
																<td>
																	<c:forEach var="cm" items="${cmNw}">
																		<c:if test="${cm.nw_division eq '가자미'}">
																			 ${cm.nw_response_phrase} <br>
																		</c:if>
																	</c:forEach>
																</td>
															</tr>
															
															<tr class="response norami">
																<th>줄노래미류(육상수조식)</th>
																<c:forEach var="ImpactInfoNw" items="${ImpactInfoNw}">
																	<c:if test="${ImpactInfoNw.nw_division eq '놀래미'}">
																		<td> ${ImpactInfoNw.nw_influence_phrase}</td>
																	</c:if>
																</c:forEach>
																<td>
																	<c:forEach var="cmNw" items="${cmNw}">
																		<c:if test="${cmNw.nw_division eq '놀래미'}">
																			 ${cmNw.nw_response_phrase} <br>
																		</c:if>
																	</c:forEach>
																</td>
															</tr>
															<tr class="response jopibollak">
																<th>조피볼락류(가두리)</th>
																<c:forEach var="ImpactInfoNw" items="${ImpactInfoNw}">
																	<c:if test="${ImpactInfoNw.nw_division eq '조피볼락'}">
																		<td>  ${ImpactInfoNw.nw_influence_phrase}</td>
																	</c:if>
																</c:forEach>
																<td>
																	<c:forEach var="cmNw" items="${cmNw}">
																		<c:if test="${cmNw.nw_division eq '조피볼락'}">
																			 ${cmNw.nw_response_phrase} <br>
																		</c:if>
																	</c:forEach>
																</td>
															</tr>
															<tr class="response jeonbok">
																<th>전복류(가두리)</th>
																<c:forEach var="ImpactInfoNw" items="${ImpactInfoNw}">
																	<c:if test="${ImpactInfoNw.nw_division eq '전복'}">
																		<td>  ${ImpactInfoNw.nw_influence_phrase}</td>
																	</c:if>
																</c:forEach>
																<td>
																	<c:forEach var="cmNw" items="${cmNw}">
																		<c:if test="${cmNw.nw_division eq '전복'}">
																			 ${cmNw.nw_response_phrase} <br>
																		</c:if>
																	</c:forEach>
																</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
								</div>
							</li>
							
							<li>
								<div class="include-titleWrap livestock">
									
									<div class="map-Zone inBox">
										<div class="titleWrap">축산 종합</div>
										<div class="mapWrap">
											<div id="livestock_map" style="width: 100%; height:calc(100vh - 70px - 70px - 40px - 50px - 10px - 70px);"></div>
										</div>
									</div>
									
									<div class="graph-Zone">
										<div class="inWrap">
											<div class="category-inBox">
												
												<div class="scroll-wrap">
													<div class="titleWrap"><span class="icon-Clipboard"></span><span>세부 부문별 단계 현황 - 시군 수</span></div>
													<article>
														<div id="l" class="tit livestock l"><a href="#">축산 종합</a></div>
														<div class="graph livestock">
															<ul>
															<c:set var="total_livestock" value="${ctCountImpactLevel.ct_livestock_industry_0_count + ctCountImpactLevel.ct_livestock_industry_1_count + ctCountImpactLevel.ct_livestock_industry_2_count + ctCountImpactLevel.ct_livestock_industry_3_count + ctCountImpactLevel.ct_livestock_industry_4_count}" />
																<li class="graph-gra wNaN" style="width: ${(ctCountImpactLevel.ct_livestock_industry_0_count/total_livestock)*750}px;"><span>${ctCountImpactLevel.ct_livestock_industry_0_count}</span></li>
																<li class="graph-gre wNaN" style="width: ${(ctCountImpactLevel.ct_livestock_industry_1_count/total_livestock)*750}px;"><span>${ctCountImpactLevel.ct_livestock_industry_1_count}</span></li>
																<li class="graph-yel wNaN" style="width: ${(ctCountImpactLevel.ct_livestock_industry_2_count/total_livestock)*750}px;"><span>${ctCountImpactLevel.ct_livestock_industry_2_count}</span></li>
																<li class="graph-ora wNaN" style="width: ${(ctCountImpactLevel.ct_livestock_industry_3_count/total_livestock)*750}px;"><span>${ctCountImpactLevel.ct_livestock_industry_3_count}</span></li>
																<li class="graph-red wNaN" style="width: ${(ctCountImpactLevel.ct_livestock_industry_4_count/total_livestock)*750}px;"><span>${ctCountImpactLevel.ct_livestock_industry_4_count}</span></li>
															</ul>
														</div>
													</article>
													<article>
														<div class="tit cow l"><a href="#">소</a></div>
														<div class="graph cow">
															<ul>
																<li class="graph-gra wNaN" style="width: ${(ctCountImpactLevel.ct_cow_0_count/total_livestock)*750}px;"><span>${ctCountImpactLevel.ct_cow_0_count}</span></li>
																<li class="graph-gre wNaN" style="width: ${(ctCountImpactLevel.ct_cow_1_count/total_livestock)*750}px;"><span>${ctCountImpactLevel.ct_cow_1_count}</span></li>
																<li class="graph-yel wNaN" style="width: ${(ctCountImpactLevel.ct_cow_2_count/total_livestock)*750}px;"><span>${ctCountImpactLevel.ct_cow_2_count}</span></li>
																<li class="graph-ora wNaN" style="width: ${(ctCountImpactLevel.ct_cow_3_count/total_livestock)*750}px;"><span>${ctCountImpactLevel.ct_cow_3_count}</span></li>
																<li class="graph-red wNaN" style="width: ${(ctCountImpactLevel.ct_cow_4_count/total_livestock)*750}px;"><span>${ctCountImpactLevel.ct_cow_4_count}</span></li>
															</ul>
														</div>
													</article>
													<article>
														<div class="tit pig l"><a href="#">돼지</a></div>
														<div class="graph pig">
															<ul>
																<li class="graph-gra wNaN" style="width: ${(ctCountImpactLevel.ct_pig_0_count/total_livestock)*750}px;"><span>${ctCountImpactLevel.ct_pig_0_count}</span></li>
																<li class="graph-gre wNaN" style="width: ${(ctCountImpactLevel.ct_pig_1_count/total_livestock)*750}px;"><span>${ctCountImpactLevel.ct_pig_1_count}</span></li>
																<li class="graph-yel wNaN" style="width: ${(ctCountImpactLevel.ct_pig_2_count/total_livestock)*750}px;"><span>${ctCountImpactLevel.ct_pig_2_count}</span></li>
																<li class="graph-ora wNaN" style="width: ${(ctCountImpactLevel.ct_pig_3_count/total_livestock)*750}px;"><span>${ctCountImpactLevel.ct_pig_3_count}</span></li>
																<li class="graph-red wNaN" style="width: ${(ctCountImpactLevel.ct_pig_4_count/total_livestock)*750}px;"><span>${ctCountImpactLevel.ct_pig_4_count}</span></li>
															</ul>
														</div>
													</article>
													<article>
														<div class="tit chk l"><a href="#">가금류</a></div>
														<div class="graph chk">
															<ul>
																<li class="graph-gra wNaN" style="width: ${(ctCountImpactLevel.ct_poultry_0_count/total_livestock)*750}px;"><span>${ctCountImpactLevel.ct_poultry_0_count}</span></li>
																<li class="graph-gre wNaN" style="width: ${(ctCountImpactLevel.ct_poultry_1_count/total_livestock)*750}px;"><span>${ctCountImpactLevel.ct_poultry_1_count}</span></li>
																<li class="graph-yel wNaN" style="width: ${(ctCountImpactLevel.ct_poultry_2_count/total_livestock)*750}px;"><span>${ctCountImpactLevel.ct_poultry_2_count}</span></li>
																<li class="graph-ora wNaN" style="width: ${(ctCountImpactLevel.ct_poultry_3_count/total_livestock)*750}px;"><span>${ctCountImpactLevel.ct_poultry_3_count}</span></li>
																<li class="graph-red wNaN" style="width: ${(ctCountImpactLevel.ct_poultry_4_count/total_livestock)*750}px;"><span>${ctCountImpactLevel.ct_poultry_4_count}</span></li>
															</ul>
														</div>
													</article>
												</div>
												
											</div>
											<div class="area-inBox">
												<div class="scroll-wrap">
													<div class="titleWrap"><span class="icon-Clipboard"></span><span>세부 부문별 영향 정보 및 대응 방안</span></div>
													<table id="livestock_nTable">
														<colgroup>
															<col style="width:15%;">
															<col style="width:42.5%;">
															<col style="width:42.5%;">
														</colgroup>
														<thead>
															<tr>
																<th>세부부문</th>
																<th>영향 정보</th>
																<th>대응 방안</th>
															</tr>
														</thead>
														<tbody>
															<tr class="response cow">
																<th>소</th>
																<c:forEach var="ImpactInfoNw" items="${ImpactInfoNw}">
																	<c:if test="${ImpactInfoNw.nw_division eq '소'}">
																		<td>  ${ImpactInfoNw.nw_influence_phrase}</td>
																	</c:if>
																</c:forEach>
																<td>
																	<c:forEach var="cmNw" items="${cmNw}">
																		<c:if test="${cmNw.nw_division eq '소'}">
																			 ${cmNw.nw_response_phrase} <br>
																		</c:if>
																	</c:forEach>
																</td>
															</tr>
															<tr class="response pig">
																<th>돼지</th>
																<c:forEach var="ImpactInfoNw" items="${ImpactInfoNw}">
																	<c:if test="${ImpactInfoNw.nw_division eq '돼지'}">
																		<td> ${ImpactInfoNw.nw_influence_phrase}</td>
																	</c:if>
																</c:forEach>
																<td>
																	<c:forEach var="cmNw" items="${cmNw}">
																		<c:if test="${cmNw.nw_division eq '돼지'}">
																			 ${cmNw.nw_response_phrase} <br>
																		</c:if>
																	</c:forEach>
																</td>
															</tr>
															<tr class="response chk">
																<th>가금류</th>
																<c:forEach var="ImpactInfoNw" items="${ImpactInfoNw}">
																	<c:if test="${ImpactInfoNw.nw_division eq '가금류'}">
																		<td>  ${ImpactInfoNw.nw_influence_phrase}</td>
																	</c:if>
																</c:forEach>
																<td>
																	<c:forEach var="cmNw" items="${cmNw}">
																		<c:if test="${cmNw.nw_division eq '가금류'}">
																			  ${cmNw.nw_response_phrase} <br>
																		</c:if>
																	</c:forEach>
																</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
								</div>
							</li>
							
							<li>
								<div class="include-titleWrap trans">
									
									<div class="map-Zone inBox">
										<div class="titleWrap">교통 종합</div>
										<div class="mapWrap">
											<div id="trans_map" style="width: 100%; height:calc(100vh - 70px - 70px - 40px - 50px - 10px - 70px);"></div>
										</div>
									</div>
									
									<div class="graph-Zone">
										<div class="inWrap">
											<div class="category-inBox">
												
												<div class="scroll-wrap">
													<div class="titleWrap"><span class="icon-Clipboard"></span><span>세부 부문별 단계 현황 - 시군 수</span></div>
													<article>
														<div id="t" class="tit trans t"><a href="#">교통 종합</a></div>
														<div class="graph trans">
															<ul>
															<c:set var="total_traffic" value="${ctCountImpactLevel.ct_traffic_0_count + ctCountImpactLevel.ct_traffic_1_count + ctCountImpactLevel.ct_traffic_2_count + ctCountImpactLevel.ct_traffic_3_count + ctCountImpactLevel.ct_traffic_4_count}" />
																<li class="graph-gra wNaN" style="width: ${(ctCountImpactLevel.ct_traffic_0_count/total_traffic)*750}px;"><span>${ctCountImpactLevel.ct_traffic_0_count}</span></li>
																<li class="graph-gre wNaN" style="width: ${(ctCountImpactLevel.ct_traffic_1_count/total_traffic)*750}px;"><span>${ctCountImpactLevel.ct_traffic_1_count}</span></li>
																<li class="graph-yel wNaN" style="width: ${(ctCountImpactLevel.ct_traffic_2_count/total_traffic)*750}px;"><span>${ctCountImpactLevel.ct_traffic_2_count}</span></li>
																<li class="graph-ora wNaN" style="width: ${(ctCountImpactLevel.ct_traffic_3_count/total_traffic)*750}px;"><span>${ctCountImpactLevel.ct_traffic_3_count}</span></li>
																<li class="graph-red wNaN" style="width: ${(ctCountImpactLevel.ct_traffic_4_count/total_traffic)*750}px;"><span>${ctCountImpactLevel.ct_traffic_4_count}</span></li>
															</ul>
														</div>
													</article>
												</div>
												
											</div>
											<div class="area-inBox">
												<div class="scroll-wrap">
													<div class="titleWrap"><span class="icon-Clipboard"></span><span>세부 부문별 영향 정보 및 대응 방안</span></div>
													<table id="trans_nTable">
														<colgroup>
															<col style="width:15%;">
															<col style="width:42.5%;">
															<col style="width:42.5%;">
														</colgroup>
														<thead>
															<tr>
																<th>세부부문</th>
																<th>영향 정보</th>
																<th>대응 방안</th>
															</tr>
														</thead>
														<tbody>
															<tr class="response trans">
																<th>교통 종합</th>
																<c:forEach var="ImpactInfoNw" items="${ImpactInfoNw}">
																	<c:if test="${ImpactInfoNw.nw_division eq '교통'}">
																		<td> ${ImpactInfoNw.nw_influence_phrase}</td>
																	</c:if>
																</c:forEach>
																<td>
																	<c:forEach var="cmNw" items="${cmNw}">
																		<c:if test="${cmNw.nw_division eq '교통'}">
																			 ${cmNw.nw_response_phrase} <br>
																		</c:if>
																	</c:forEach>
																</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
								</div>
							</li>
							<li>
								<div class="include-titleWrap elect">
									
									<div class="map-Zone inBox">
										<div class="titleWrap">전력 종합</div>
										<div class="mapWrap">
											<div id="elect_map" style="width: 100%; height:calc(100vh - 70px - 70px - 40px - 50px - 10px - 70px);"></div>
										</div>
									</div>
									
									<div class="graph-Zone">
										<div class="inWrap">
											<div class="category-inBox">
												
												<div class="scroll-wrap">
													<div class="titleWrap"><span class="icon-Clipboard"></span><span>세부 부문별 단계 현황 - 시군 수</span></div>
													<article>
														<div id="e" class="tit elect e"><a href="#">전력 종합</a></div>
														<div class="graph elect">
															<ul>
															<c:set var="total_electric" value="${ctCountImpactLevel.ct_electric_0_count + ctCountImpactLevel.ct_electric_1_count + ctCountImpactLevel.ct_electric_2_count + ctCountImpactLevel.ct_electric_3_count + ctCountImpactLevel.ct_electric_4_count}" />
																<li class="graph-gra wNaN" style="width: ${(ctCountImpactLevel.ct_electric_0_count/total_industry)*750}px;"><span>${ctCountImpactLevel.ct_electric_0_count}</span></li>
																<li class="graph-gre wNaN" style="width: ${(ctCountImpactLevel.ct_electric_1_count/total_industry)*750}px;"><span>${ctCountImpactLevel.ct_electric_1_count}</span></li>
																<li class="graph-yel wNaN" style="width: ${(ctCountImpactLevel.ct_electric_2_count/total_industry)*750}px;"><span>${ctCountImpactLevel.ct_electric_2_count}</span></li>
																<li class="graph-ora wNaN" style="width: ${(ctCountImpactLevel.ct_electric_3_count/total_industry)*750}px;"><span>${ctCountImpactLevel.ct_electric_3_count}</span></li>
																<li class="graph-red wNaN" style="width: ${(ctCountImpactLevel.ct_electric_4_count/total_industry)*750}px;"><span>${ctCountImpactLevel.ct_electric_4_count}</span></li>
															</ul>
														</div>
													</article>
												</div>
												
											</div>
											<div class="area-inBox">
												<div class="scroll-wrap">
													<div class="titleWrap"><span class="icon-Clipboard"></span><span>세부 부문별 영향 정보 및 대응 방안</span></div>
													<table id="elect_nTable">
														<colgroup>
															<col style="width:15%;">
															<col style="width:42.5%;">
															<col style="width:42.5%;">
														</colgroup>
														<thead>
															<tr>
																<th>세부부문</th>
																<th>영향 정보</th>
																<th>대응 방안</th>
															</tr>
														</thead>
														<tbody>
															<tr class="response elect">
																<th>전력 종합</th>
																<c:forEach var="ImpactInfoNw" items="${ImpactInfoNw}">
																	<c:if test="${ImpactInfoNw.nw_division eq '전력'}">
																		<td> ${ImpactInfoNw.nw_influence_phrase}</td>
																	</c:if>
																</c:forEach>
																<td>
																	<c:forEach var="cmNw" items="${cmNw}">
																		<c:if test="${cmNw.nw_division eq '전력'}">
																			 ${cmNw.nw_response_phrase} <br>
																		</c:if>
																	</c:forEach>
																</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>
	
		<script>
		
		var dateRe = document.getElementById("hidden-date").value;
		const healthMain = document.querySelector('.tit.health');
		const industryMain = document.querySelector('.tit.industry');
		const agricultureMain = document.querySelector('.tit.agriculture');
		const livestockMain = document.querySelector('.tit.livestock');
		const waterfarmMain = document.querySelector('.tit.waterfarm');
		const transMain = document.querySelector('.tit.trans');
		const electMain = document.querySelector('.tit.elect');
		
		const health = document.querySelector('#h');
		const ordinary = document.querySelector('.tit.ordinary');
		const age65 = document.querySelector('.tit.age65');
		const outdoor = document.querySelector('.tit.outdoor');
		const single = document.querySelector('.tit.single');
		const chdb = document.querySelector('.tit.chdb');
		const lowincome = document.querySelector('.tit.lowincome');
		
		const indust = document.querySelector('#i');
		const gunsul = document.querySelector('.tit.gunsul');
		const jejo = document.querySelector('.tit.jejo');
		const samu = document.querySelector('.tit.samu');
		
		const agri = document.querySelector('#a');
		const apple = document.querySelector('.tit.apple');
		const pear = document.querySelector('.tit.pear');
		const peach = document.querySelector('.tit.peach');
		const grape = document.querySelector('.tit.grape');
		const ginseng = document.querySelector('.tit.ginseng');
		const pepper = document.querySelector('.tit.pepper');
		const wmelon = document.querySelector('.tit.wmelon');
		
		const waterfarm = document.querySelector('#w');
		const nupchi = document.querySelector('.tit.nupchi');
		const gajami = document.querySelector('.tit.gajami');
		const norami = document.querySelector('.tit.norami');
		const jopibollak = document.querySelector('.tit.jopibollak');
		const jeonbok = document.querySelector('.tit.jeonbok');
		
		const livestock = document.querySelector('#l');
		const cow = document.querySelector('.tit.cow');
		const pig = document.querySelector('.tit.pig');
		const chk = document.querySelector('.tit.chk');
		
		const trans = document.querySelector('#t');
		
		const elect = document.querySelector('#e');
		
		healthMain.dataset.mapType = 'ct_health';
		industryMain.dataset.mapType = 'ct_industry_no';
		agricultureMain.dataset.mapType = 'ct_agriculture';
		livestockMain.dataset.mapType = 'ct_livestock_industry';
		waterfarmMain.dataset.mapType = 'ct_aquaculture';
		transMain.dataset.mapType = 'ct_traffic';
		electMain.dataset.mapType = 'ct_electric';
		
		healthMain.addEventListener('click', total_mapFn);
		industryMain.addEventListener('click', total_mapFn);
		agricultureMain.addEventListener('click', total_mapFn);
		livestockMain.addEventListener('click', total_mapFn);
		waterfarmMain.addEventListener('click', total_mapFn);
		transMain.addEventListener('click', total_mapFn);
		electMain.addEventListener('click', total_mapFn);
		/*---------------------------------------------------------------------*/
		health.dataset.mapType = 'ct_health';
		ordinary.dataset.mapType = 'ct_general_people';
		age65.dataset.mapType = 'ct_seniors';
		outdoor.dataset.mapType = 'ct_outdoor_workers';
		single.dataset.mapType = 'ct_single_person';
		chdb.dataset.mapType = 'ct_chronic_patients';
		lowincome.dataset.mapType = 'ct_low_income';
		
		health.addEventListener('click', health_mapFn);
		ordinary.addEventListener('click', health_mapFn);
		age65.addEventListener('click', health_mapFn);
		outdoor.addEventListener('click', health_mapFn);
		single.addEventListener('click', health_mapFn);
		chdb.addEventListener('click', health_mapFn);
		lowincome.addEventListener('click', health_mapFn);
		/*---------------------------------------------------------------------*/
		indust.dataset.mapType = 'ct_industry_no';
		gunsul.dataset.mapType = 'ct_construction_industry';
		jejo.dataset.mapType = 'ct_manufacturing_industry';
		samu.dataset.mapType = 'ct_office_service';
		
		indust.addEventListener('click', indust_mapFn);
		gunsul.addEventListener('click', indust_mapFn);
		jejo.addEventListener('click', indust_mapFn);
		samu.addEventListener('click', indust_mapFn);
		/*---------------------------------------------------------------------*/
		agri.dataset.mapType = 'ct_agriculture';
		apple.dataset.mapType = 'ct_apple';
		pear.dataset.mapType = 'ct_pears';
		peach.dataset.mapType = 'ct_peach';
		grape.dataset.mapType = 'ct_grape';
		ginseng.dataset.mapType = 'ct_ginseng';
		pepper.dataset.mapType = 'ct_peppers';
		wmelon.dataset.mapType = 'ct_watermelons';
		
		agri.addEventListener('click', agri_mapFn);
		apple.addEventListener('click', agri_mapFn);
		pear.addEventListener('click', agri_mapFn);
		peach.addEventListener('click', agri_mapFn);
		grape.addEventListener('click', agri_mapFn);
		ginseng.addEventListener('click', agri_mapFn);
		pepper.addEventListener('click', agri_mapFn);
		wmelon.addEventListener('click', agri_mapFn);
		/*---------------------------------------------------------------------*/
		waterfarm.dataset.mapType = 'ct_aquaculture';
		nupchi.dataset.mapType = 'ct_flounder';
		gajami.dataset.mapType = 'ct_tuna';
		norami.dataset.mapType = 'ct_scorpionfish';
		jopibollak.dataset.mapType = 'ct_jacopever';
		jeonbok.dataset.mapType = 'ct_abalone';
		
		waterfarm.addEventListener('click', waterfarm_mapFn);
		nupchi.addEventListener('click', waterfarm_mapFn);
		gajami.addEventListener('click', waterfarm_mapFn);
		norami.addEventListener('click', waterfarm_mapFn);
		jopibollak.addEventListener('click', waterfarm_mapFn);
		jeonbok.addEventListener('click', waterfarm_mapFn);
		/*---------------------------------------------------------------------*/		
		livestock.dataset.mapType = 'ct_livestock_industry';
		cow.dataset.mapType = 'ct_cow';
		pig.dataset.mapType = 'ct_pig';
		chk.dataset.mapType = 'ct_poultry';
		
		livestock.addEventListener('click', livestock_mapFn);
		cow.addEventListener('click', livestock_mapFn);
		pig.addEventListener('click', livestock_mapFn);
		chk.addEventListener('click', livestock_mapFn);
		/*---------------------------------------------------------------------*/				
		trans.dataset.mapType = 'ct_traffic';
		trans.addEventListener('click', trans_mapFn);
		/*---------------------------------------------------------------------*/						
		elect.dataset.mapType = 'ct_electric';
		elect.addEventListener('click', elect_mapFn);
		
		
		
		function total_mapFn(event) {
 			const divId = 'total_map'; // 특정 div의 id
 			const layers = map[0].getLayers();
 			const layerToRemove0 = layers.getArray()[0];
 			const layerToRemove1 = layers.getArray()[1];
 			map[0].setTarget(null);
 			map.splice(0, 1);
 			
			const mapType = event.currentTarget.dataset.mapType;
 			
			layerUrlSide = 'http://210.113.102.169:8090/geoserver/EDU4/wms?service=WMS&version=1.1.0&request=GetMap&layers=EDU4%3Asigun_select&bbox=746368.7309%2C1458754.2808%2C1394213.4428%2C2068442.8942&width=768&height=722&srs=EPSG%3A5179&styles=&format=application/openlayers&viewparams=category:'+mapType+';date:'+dateRe                                     
			const MapSide = new ol.Map({
		      target: divId,
		      layers: [
		        new ol.layer.Tile({
		          source: new ol.source.OSM(),
		        }),
		        new ol.layer.Tile({ 
		          source: new ol.source.TileWMS({
		            url: layerUrlSide, 
		            params: {
		              LAYERS: 'EDU4:sigun_select', // GeoServer에서 정의한 레이어 이름
		              TILED: true,
		            },   
		            serverType: 'geoserver',
		          }),
		        }),
		      ],	
		      view: new ol.View({
		        center: centerV, // 지도를 한반도 중심으로 이동
		        zoom: zoomV, // 지도 축적 설정
		      }),
		    });
		    map.splice(0, 0, MapSide);
		    
		    const newLayer = new ol.layer.Tile({
		    	  source: new ol.source.TileWMS({
		    	    url: 'http://210.113.102.169:8090/geoserver/EDU4/wms?service=WMS&version=1.1.0&request=GetMap&layers=EDU4%3Asigun_layer&bbox=746368.7309%2C1458754.2808%2C1394213.4428%2C2068442.8942&width=768&height=722&srs=EPSG%3A5179&styles=&format=application/openlayers', // WMS 서비스 URL
		    	    params: {
		    	      LAYERS: 'EDU4:sigun_layer', // WMS 레이어 이름
		    	    },
		    	    serverType: 'geoserver',
		    	  }),
		    	});

		    	MapSide.addLayer(newLayer);
		}
		
		
		function health_mapFn(event) {
 			const divId = 'health_map'; // 특정 div의 id
 			const layers = map[1].getLayers();
 			const layerToRemove0 = layers.getArray()[0];
 			const layerToRemove1 = layers.getArray()[1];
 			map[1].setTarget(null);
 			map.splice(1, 1);
 			
			const mapType = event.currentTarget.dataset.mapType;
 			
			layerUrlSide = 'http://210.113.102.169:8090/geoserver/EDU4/wms?service=WMS&version=1.1.0&request=GetMap&layers=EDU4%3Asigun_select&bbox=746368.7309%2C1458754.2808%2C1394213.4428%2C2068442.8942&width=768&height=722&srs=EPSG%3A5179&styles=&format=application/openlayers&viewparams=category:'+mapType+';date:'+dateRe                                     
			const MapSide = new ol.Map({
		      target: divId,
		      layers: [
		        new ol.layer.Tile({
		          source: new ol.source.OSM(),
		        }),
		        new ol.layer.Tile({ 
		          source: new ol.source.TileWMS({
		            url: layerUrlSide, 
		            params: {
		              LAYERS: 'EDU4:sigun_select', // GeoServer에서 정의한 레이어 이름
		              TILED: true,
		            },   
		            serverType: 'geoserver',
		          }),
		        }),
		      ],	
		      view: new ol.View({
		        center: centerV, // 지도를 한반도 중심으로 이동
		        zoom: zoomV, // 지도 축적 설정
		      }),
		    });
		    map.splice(1, 0, MapSide);
		    
		    const newLayer = new ol.layer.Tile({
		    	  source: new ol.source.TileWMS({
		    	    url: 'http://210.113.102.169:8090/geoserver/EDU4/wms?service=WMS&version=1.1.0&request=GetMap&layers=EDU4%3Asigun_layer&bbox=746368.7309%2C1458754.2808%2C1394213.4428%2C2068442.8942&width=768&height=722&srs=EPSG%3A5179&styles=&format=application/openlayers', // WMS 서비스 URL
		    	    params: {
		    	      LAYERS: 'EDU4:sigun_layer', // WMS 레이어 이름
		    	    },
		    	    serverType: 'geoserver',
		    	  }),
		    	});

		    	MapSide.addLayer(newLayer);
		}
		
		function indust_mapFn(event) {
 			const divId = 'industry_map'; // 특정 div의 id
 			const layers = map[2].getLayers();
 			const layerToRemove0 = layers.getArray()[0];
 			const layerToRemove1 = layers.getArray()[1];
 			map[2].setTarget(null);
 			map.splice(2, 1);
 			
			const mapType = event.currentTarget.dataset.mapType;
 			
			layerUrlSide = 'http://210.113.102.169:8090/geoserver/EDU4/wms?service=WMS&version=1.1.0&request=GetMap&layers=EDU4%3Asigun_select&bbox=746368.7309%2C1458754.2808%2C1394213.4428%2C2068442.8942&width=768&height=722&srs=EPSG%3A5179&styles=&format=application/openlayers&viewparams=category:'+mapType+';date:'+dateRe                                     
			const MapSide = new ol.Map({
		      target: divId,
		      layers: [
		        new ol.layer.Tile({
		          source: new ol.source.OSM(),
		        }),
		        new ol.layer.Tile({ 
		          source: new ol.source.TileWMS({
		            url: layerUrlSide, 
		            params: {
		              LAYERS: 'EDU4:sigun_select', // GeoServer에서 정의한 레이어 이름
		              TILED: true,
		            },   
		            serverType: 'geoserver',
		          }),
		        }),
		      ],	
		      view: new ol.View({
		        center: centerV, // 지도를 한반도 중심으로 이동
		        zoom: zoomV, // 지도 축적 설정
		      }),
		    });
		    map.splice(2, 0, MapSide);
		    const newLayer = new ol.layer.Tile({
		    	  source: new ol.source.TileWMS({
		    	    url: 'http://210.113.102.169:8090/geoserver/EDU4/wms?service=WMS&version=1.1.0&request=GetMap&layers=EDU4%3Asigun_layer&bbox=746368.7309%2C1458754.2808%2C1394213.4428%2C2068442.8942&width=768&height=722&srs=EPSG%3A5179&styles=&format=application/openlayers', // WMS 서비스 URL
		    	    params: {
		    	      LAYERS: 'EDU4:sigun_layer', // WMS 레이어 이름
		    	    },
		    	    serverType: 'geoserver',
		    	  }),
		    	});

		    	MapSide.addLayer(newLayer);
		}
		
		function agri_mapFn(event) {
 			const divId = 'agriculture_map'; // 특정 div의 id
 			const layers = map[3].getLayers();
 			const layerToRemove0 = layers.getArray()[0];
 			const layerToRemove1 = layers.getArray()[1];
 			map[3].setTarget(null);
 			map.splice(3, 1);
 			
			const mapType = event.currentTarget.dataset.mapType;
 			
			layerUrlSide = 'http://210.113.102.169:8090/geoserver/EDU4/wms?service=WMS&version=1.1.0&request=GetMap&layers=EDU4%3Asigun_select&bbox=746368.7309%2C1458754.2808%2C1394213.4428%2C2068442.8942&width=768&height=722&srs=EPSG%3A5179&styles=&format=application/openlayers&viewparams=category:'+mapType+';date:'+dateRe                                     
			const MapSide = new ol.Map({
		      target: divId,
		      layers: [
		        new ol.layer.Tile({
		          source: new ol.source.OSM(),
		        }),
		        new ol.layer.Tile({ 
		          source: new ol.source.TileWMS({
		            url: layerUrlSide, 
		            params: {
		              LAYERS: 'EDU4:sigun_select', // GeoServer에서 정의한 레이어 이름
		              TILED: true,
		            },   
		            serverType: 'geoserver',
		          }),
		        }),
		      ],	
		      view: new ol.View({
		        center: centerV, // 지도를 한반도 중심으로 이동
		        zoom: zoomV, // 지도 축적 설정
		      }),
		    });
		    map.splice(3, 0, MapSide);
		    const newLayer = new ol.layer.Tile({
		    	  source: new ol.source.TileWMS({
		    	    url: 'http://210.113.102.169:8090/geoserver/EDU4/wms?service=WMS&version=1.1.0&request=GetMap&layers=EDU4%3Asigun_layer&bbox=746368.7309%2C1458754.2808%2C1394213.4428%2C2068442.8942&width=768&height=722&srs=EPSG%3A5179&styles=&format=application/openlayers', // WMS 서비스 URL
		    	    params: {
		    	      LAYERS: 'EDU4:sigun_layer', // WMS 레이어 이름
		    	    },
		    	    serverType: 'geoserver',
		    	  }),
		    	});

		    	MapSide.addLayer(newLayer);
		}
		
		function waterfarm_mapFn(event) {
 			const divId = 'waterfarm_map'; // 특정 div의 id
 			const layers = map[4].getLayers();
 			const layerToRemove0 = layers.getArray()[0];
 			const layerToRemove1 = layers.getArray()[1];
 			map[4].setTarget(null);
 			map.splice(4, 1);
 			
			const mapType = event.currentTarget.dataset.mapType;
 			
			layerUrlSide = 'http://210.113.102.169:8090/geoserver/EDU4/wms?service=WMS&version=1.1.0&request=GetMap&layers=EDU4%3Asigun_select&bbox=746368.7309%2C1458754.2808%2C1394213.4428%2C2068442.8942&width=768&height=722&srs=EPSG%3A5179&styles=&format=application/openlayers&viewparams=category:'+mapType+';date:'+dateRe                                     
			const MapSide = new ol.Map({
		      target: divId,
		      layers: [
		        new ol.layer.Tile({
		          source: new ol.source.OSM(),
		        }),
		        new ol.layer.Tile({ 
		          source: new ol.source.TileWMS({
		            url: layerUrlSide, 
		            params: {
		              LAYERS: 'EDU4:sigun_select', // GeoServer에서 정의한 레이어 이름
		              TILED: true,
		            },   
		            serverType: 'geoserver',
		          }),
		        }),
		      ],	
		      view: new ol.View({
		        center: centerV, // 지도를 한반도 중심으로 이동
		        zoom: zoomV, // 지도 축적 설정
		      }),
		    });
		    map.splice(4, 0, MapSide);
		    const newLayer = new ol.layer.Tile({
		    	  source: new ol.source.TileWMS({
		    	    url: 'http://210.113.102.169:8090/geoserver/EDU4/wms?service=WMS&version=1.1.0&request=GetMap&layers=EDU4%3Asigun_layer&bbox=746368.7309%2C1458754.2808%2C1394213.4428%2C2068442.8942&width=768&height=722&srs=EPSG%3A5179&styles=&format=application/openlayers', // WMS 서비스 URL
		    	    params: {
		    	      LAYERS: 'EDU4:sigun_layer', // WMS 레이어 이름
		    	    },
		    	    serverType: 'geoserver',
		    	  }),
		    	});

		    	MapSide.addLayer(newLayer);
		}
		
		function livestock_mapFn(event) {
 			const divId = 'livestock_map'; // 특정 div의 id
 			const layers = map[5].getLayers();
 			const layerToRemove0 = layers.getArray()[0];
 			const layerToRemove1 = layers.getArray()[1];
 			map[5].setTarget(null);
 			map.splice(5, 1);
 			
			const mapType = event.currentTarget.dataset.mapType;
 			
			layerUrlSide = 'http://210.113.102.169:8090/geoserver/EDU4/wms?service=WMS&version=1.1.0&request=GetMap&layers=EDU4%3Asigun_select&bbox=746368.7309%2C1458754.2808%2C1394213.4428%2C2068442.8942&width=768&height=722&srs=EPSG%3A5179&styles=&format=application/openlayers&viewparams=category:'+mapType+';date:'+dateRe                                     
			const MapSide = new ol.Map({
		      target: divId,
		      layers: [
		        new ol.layer.Tile({
		          source: new ol.source.OSM(),
		        }),
		        new ol.layer.Tile({ 
		          source: new ol.source.TileWMS({
		            url: layerUrlSide, 
		            params: {
		              LAYERS: 'EDU4:sigun_select', // GeoServer에서 정의한 레이어 이름
		              TILED: true,
		            },   
		            serverType: 'geoserver',
		          }),
		        }),
		      ],	
		      view: new ol.View({
		        center: centerV, // 지도를 한반도 중심으로 이동
		        zoom: zoomV, // 지도 축적 설정
		      }),
		    });
		    map.splice(5, 0, MapSide);
		    const newLayer = new ol.layer.Tile({
		    	  source: new ol.source.TileWMS({
		    	    url: 'http://210.113.102.169:8090/geoserver/EDU4/wms?service=WMS&version=1.1.0&request=GetMap&layers=EDU4%3Asigun_layer&bbox=746368.7309%2C1458754.2808%2C1394213.4428%2C2068442.8942&width=768&height=722&srs=EPSG%3A5179&styles=&format=application/openlayers', // WMS 서비스 URL
		    	    params: {
		    	      LAYERS: 'EDU4:sigun_layer', // WMS 레이어 이름
		    	    },
		    	    serverType: 'geoserver',
		    	  }),
		    	});

		    	MapSide.addLayer(newLayer);
		}
		
		function trans_mapFn(event) {
 			const divId = 'trans_map'; // 특정 div의 id
 			const layers = map[6].getLayers();
 			const layerToRemove0 = layers.getArray()[0];
 			const layerToRemove1 = layers.getArray()[1];
 			map[6].setTarget(null);
 			map.splice(6, 1);
 			
			const mapType = event.currentTarget.dataset.mapType;
 			
			layerUrlSide = 'http://210.113.102.169:8090/geoserver/EDU4/wms?service=WMS&version=1.1.0&request=GetMap&layers=EDU4%3Asigun_select&bbox=746368.7309%2C1458754.2808%2C1394213.4428%2C2068442.8942&width=768&height=722&srs=EPSG%3A5179&styles=&format=application/openlayers&viewparams=category:'+mapType+';date:'+dateRe                                     
			const MapSide = new ol.Map({
		      target: divId,
		      layers: [
		        new ol.layer.Tile({
		          source: new ol.source.OSM(),
		        }),
		        new ol.layer.Tile({ 
		          source: new ol.source.TileWMS({
		            url: layerUrlSide, 
		            params: {
		              LAYERS: 'EDU4:sigun_select', // GeoServer에서 정의한 레이어 이름
		              TILED: true,
		            },   
		            serverType: 'geoserver',
		          }),
		        }),
		      ],	
		      view: new ol.View({
		        center: centerV, // 지도를 한반도 중심으로 이동
		        zoom: zoomV, // 지도 축적 설정
		      }),
		    });
		    map.splice(6, 0, MapSide);
		    const newLayer = new ol.layer.Tile({
		    	  source: new ol.source.TileWMS({
		    	    url: 'http://210.113.102.169:8090/geoserver/EDU4/wms?service=WMS&version=1.1.0&request=GetMap&layers=EDU4%3Asigun_layer&bbox=746368.7309%2C1458754.2808%2C1394213.4428%2C2068442.8942&width=768&height=722&srs=EPSG%3A5179&styles=&format=application/openlayers', // WMS 서비스 URL
		    	    params: {
		    	      LAYERS: 'EDU4:sigun_layer', // WMS 레이어 이름
		    	    },
		    	    serverType: 'geoserver',
		    	  }),
		    	});

		    	MapSide.addLayer(newLayer);
		}
		
		function elect_mapFn(event) {
 			const divId = 'elect_map'; // 특정 div의 id
 			const layers = map[7].getLayers();
 			const layerToRemove0 = layers.getArray()[0];
 			const layerToRemove1 = layers.getArray()[1];
 			map[7].setTarget(null);
 			map.splice(7, 1);
 			
			const mapType = event.currentTarget.dataset.mapType;
 			
			layerUrlSide = 'http://210.113.102.169:8090/geoserver/EDU4/wms?service=WMS&version=1.1.0&request=GetMap&layers=EDU4%3Asigun_select&bbox=746368.7309%2C1458754.2808%2C1394213.4428%2C2068442.8942&width=768&height=722&srs=EPSG%3A5179&styles=&format=application/openlayers&viewparams=category:'+mapType+';date:'+dateRe                                     
			const MapSide = new ol.Map({
		      target: divId,
		      layers: [
		        new ol.layer.Tile({
		          source: new ol.source.OSM(),
		        }),
		        new ol.layer.Tile({ 
		          source: new ol.source.TileWMS({
		            url: layerUrlSide, 
		            params: {
		              LAYERS: 'EDU4:sigun_select', // GeoServer에서 정의한 레이어 이름
		              TILED: true,
		            },   
		            serverType: 'geoserver',
		          }),
		        }),
		      ],	
		      view: new ol.View({
		        center: centerV, // 지도를 한반도 중심으로 이동
		        zoom: zoomV, // 지도 축적 설정
		      }),
		    });
		    map.splice(7, 0, MapSide);
		    const newLayer = new ol.layer.Tile({
		    	  source: new ol.source.TileWMS({
		    	    url: 'http://210.113.102.169:8090/geoserver/EDU4/wms?service=WMS&version=1.1.0&request=GetMap&layers=EDU4%3Asigun_layer&bbox=746368.7309%2C1458754.2808%2C1394213.4428%2C2068442.8942&width=768&height=722&srs=EPSG%3A5179&styles=&format=application/openlayers', // WMS 서비스 URL
		    	    params: {
		    	      LAYERS: 'EDU4:sigun_layer', // WMS 레이어 이름
		    	    },
		    	    serverType: 'geoserver',
		    	  }),
		    	});

		    	MapSide.addLayer(newLayer);
		}
		
		
var centerV =ol.proj.fromLonLat([127.9784, 36.5665]);
 var zoomV = 6.8;
  
  const geoList = [
		['total_map','http://210.113.102.169:8090/geoserver/EDU4/wms?service=WMS&version=1.1.0&request=GetMap&layers=EDU4%3Asigun_select&bbox=746368.7309%2C1458754.2808%2C1394213.4428%2C2068442.8942&width=768&height=722&srs=EPSG%3A5179&styles=&format=application/openlayers&viewparams=','EDU4:sigun_total'],
		['health_map','http://210.113.102.169:8090/geoserver/EDU4/wms?service=WMS&version=1.1.0&request=GetMap&layers=EDU4%3Asigun_select&bbox=746368.7309%2C1458754.2808%2C1394213.4428%2C2068442.8942&width=768&height=722&srs=EPSG%3A5179&styles=&format=application/openlayers&viewparams=category:ct_health;','EDU4:sigun_select'],
		['industry_map','http://210.113.102.169:8090/geoserver/EDU4/wms?service=WMS&version=1.1.0&request=GetMap&layers=EDU4%3Asigun_select&bbox=746368.7309%2C1458754.2808%2C1394213.4428%2C2068442.8942&width=768&height=722&srs=EPSG%3A5179&styles=&format=application/openlayers&viewparams=category:ct_industry_no;','EDU4:sigun_select'],
		['agriculture_map','http://210.113.102.169:8090/geoserver/EDU4/wms?service=WMS&version=1.1.0&request=GetMap&layers=EDU4%3Asigun_select&bbox=746368.7309%2C1458754.2808%2C1394213.4428%2C2068442.8942&width=768&height=722&srs=EPSG%3A5179&styles=&format=application/openlayers&viewparams=category:ct_agriculture;','EDU4:sigun_select'],
		['waterfarm_map','http://210.113.102.169:8090/geoserver/EDU4/wms?service=WMS&version=1.1.0&request=GetMap&layers=EDU4%3Asigun_select&bbox=746368.7309%2C1458754.2808%2C1394213.4428%2C2068442.8942&width=768&height=722&srs=EPSG%3A5179&styles=&format=application/openlayers&viewparams=category:ct_aquaculture;','EDU4:sigun_select'],
		['livestock_map','http://210.113.102.169:8090/geoserver/EDU4/wms?service=WMS&version=1.1.0&request=GetMap&layers=EDU4%3Asigun_select&bbox=746368.7309%2C1458754.2808%2C1394213.4428%2C2068442.8942&width=768&height=722&srs=EPSG%3A5179&styles=&format=application/openlayers&viewparams=category:ct_livestock_industry;','EDU4:sigun_select'],
		['trans_map','http://210.113.102.169:8090/geoserver/EDU4/wms?service=WMS&version=1.1.0&request=GetMap&layers=EDU4%3Asigun_select&bbox=746368.7309%2C1458754.2808%2C1394213.4428%2C2068442.8942&width=768&height=722&srs=EPSG%3A5179&styles=&format=application/openlayers&viewparams=category:ct_traffic;','EDU4:sigun_select'],
		['elect_map','http://210.113.102.169:8090/geoserver/EDU4/wms?service=WMS&version=1.1.0&request=GetMap&layers=EDU4%3Asigun_select&bbox=746368.7309%2C1458754.2808%2C1394213.4428%2C2068442.8942&width=768&height=722&srs=EPSG%3A5179&styles=&format=application/openlayers&viewparams=category:ct_electric;','EDU4:sigun_select']
	];
	let layerUrl = [];
	let map = []
	
	window.addEventListener('load', function() {
		
		var wa_code = document.getElementById("hidden-wa_code").value;
		    switch (wa_code) {
		    case '1': // 서울·인천·경기
		      centerV = ol.proj.fromLonLat([126.9784, 37.5665]);
		      zoomV = 8.5;
		      break;
		    case '2': // 부산·울산·경남
		      centerV = ol.proj.fromLonLat([128.9999, 35.1796]);
		      zoomV = 8.5;
		      break;
		    case '3': // 대구·경북
		      centerV = ol.proj.fromLonLat([128.6042, 35.8580]);
		      zoomV = 8.5;
		      break;
		    case '4': // 광주·전남
		      centerV = ol.proj.fromLonLat([126.9108, 35.1595]);
		      zoomV = 8.5;
		      break;
		    case '5': // 전북
		      centerV = ol.proj.fromLonLat([127.153, 35.8218]);
		      zoomV = 8.5;
		      break;
		    case '6': // 대전·세종·충남
		      centerV = ol.proj.fromLonLat([127.3845, 36.3504]);
		      zoomV = 8.5;
		      break;
		    case '7': // 충북
		      centerV = ol.proj.fromLonLat([127.6807, 36.6357]);
		      zoomV = 8.5;
		      break;
		    case '8': // 강원
		      centerV = ol.proj.fromLonLat([128.2122, 37.4273]);
		      zoomV = 8.5;
		      break;
		    case '9': // 제주
		      centerV = ol.proj.fromLonLat([126.498, 33.489]);
		      zoomV = 8.5;
		      break;
		    default: // 전국
		      centerV = ol.proj.fromLonLat([127.9784, 36.5665]);
		      zoomV = 6.8;
		      break;
		  }
		    initializeMaps(); // 매개변수 변경 후 지도 초기화
		    document.getElementById('sido').value = wa_code; 
		    
    function initializeMaps() {
		  // 이전에 생성된 지도 인스턴스 및 DOM 요소 삭제
		  map.forEach(function(m) {
		    m.setTarget(null);
		  });
		  // 이전에 생성된 지도 인스턴스 삭제
		  map = [];
		  // 새로운 지도 인스턴스 생성 및 추가
		  geoList.forEach((geo,i) => {
		    layerUrl[i] = geo[1]+'date:'+dateRe;
		    const newMap = new ol.Map({
		      target: geo[0],
		      layers: [
		        new ol.layer.Tile({
		          source: new ol.source.OSM(),
		        }),
		        new ol.layer.Tile({ 
		          source: new ol.source.TileWMS({
		            url: layerUrl[i], 
		            params: {
		              LAYERS: geo[2], // GeoServer에서 정의한 레이어 이름
		              TILED: true,
		            },   
		            serverType: 'geoserver',
		          }),
		        }),
		      ],	
		      view: new ol.View({
		        center: centerV, // 지도를 한반도 중심으로 이동
		        zoom: zoomV, // 지도 축적 설정
		      }),
		    });
		    map.push(newMap);
		    const newLayer = new ol.layer.Tile({
		    	  source: new ol.source.TileWMS({
		    	    url: 'http://210.113.102.169:8090/geoserver/EDU4/wms?service=WMS&version=1.1.0&request=GetMap&layers=EDU4%3Asigun_layer&bbox=746368.7309%2C1458754.2808%2C1394213.4428%2C2068442.8942&width=768&height=722&srs=EPSG%3A5179&styles=&format=application/openlayers', // WMS 서비스 URL
		    	    params: {
		    	      LAYERS: 'EDU4:sigun_layer', // WMS 레이어 이름
		    	    },
		    	    serverType: 'geoserver',
		    	  }),
		    	});
		    newMap.addLayer(newLayer);
		  });
		}
	  
});
	
	$(document).ready(function() {
		function initializeMaps() {
			  // 이전에 생성된 지도 인스턴스 및 DOM 요소 삭제
			  map.forEach(function(m) {
			    m.setTarget(null);
			  });
			  // 이전에 생성된 지도 인스턴스 삭제
			  map = [];
			  // 새로운 지도 인스턴스 생성 및 추가
			  geoList.forEach((geo,i) => {
			    layerUrl[i] = geo[1];
			    const newMap = new ol.Map({
			      target: geo[0],
			      layers: [
			        new ol.layer.Tile({
			          source: new ol.source.OSM(),
			        }),
			        new ol.layer.Tile({ 
			          source: new ol.source.TileWMS({
			            url: layerUrl[i], 
			            params: {
			              LAYERS: geo[2], // GeoServer에서 정의한 레이어 이름
			              TILED: true,
			            },   
			            serverType: 'geoserver',
			          }),
			        }),
			      ],	
			      view: new ol.View({
			        center: centerV, // 지도를 한반도 중심으로 이동
			        zoom: zoomV, // 지도 축적 설정
			      }),
			    });
			    map.push(newMap);
			    const newLayer = new ol.layer.Tile({
			    	  source: new ol.source.TileWMS({
			    	    url: 'http://210.113.102.169:8090/geoserver/EDU4/wms?service=WMS&version=1.1.0&request=GetMap&layers=EDU4%3Asigun_layer&bbox=746368.7309%2C1458754.2808%2C1394213.4428%2C2068442.8942&width=768&height=722&srs=EPSG%3A5179&styles=&format=application/openlayers', // WMS 서비스 URL
			    	    params: {
			    	      LAYERS: 'EDU4:sigun_layer', // WMS 레이어 이름
			    	    },
			    	    serverType: 'geoserver',
			    	  }),
			    	});

			    newMap.addLayer(newLayer);
			  });
			}
		  initializeMaps(); // 페이지 로드 시 지도 초기화
					  
		  const regionSelect = document.getElementById('sido');
		  
		  regionSelect.addEventListener('change', function() {
	    const regionValue = regionSelect.value;
	    if (regionValue == 0) {
	    	location.href = "${pageContext.request.contextPath}/report/all.do?date="+dateRe+"&wa_code="+regionValue;
	    } else	{ 
	    	location.href = "${pageContext.request.contextPath}/report/all.do?date="+dateRe+"&wa_code="+regionValue+"&how=1";
	    }
		});
	});
			
    </script>
    <c:if test="${not empty message}">
    <script>
        alert("${message}");
    </script>
</c:if>
</body>
</html>