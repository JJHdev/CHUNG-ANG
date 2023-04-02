<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link type="text/css" href="${pageContext.request.contextPath}/css/ebi/jquery-ui.css" rel="stylesheet">
	<link type="text/css" href="${pageContext.request.contextPath}/css/map.css" rel="stylesheet">
	<link type="text/css" href="${pageContext.request.contextPath}/css/report/report.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/ui.datepicker-kr.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/report/ol/ol.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/report/ol/tools.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/report/ol/ol-ext.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/report/ol/proj4.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/ol@v7.3.0/dist/ol.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/ol@v7.3.0/ol.css">
	<script>
	
	 	var ins_date = <%=request.getParameter("day")%>;
		function _0x4557(_0x48b52e, _0x1794f7) {
		    var _0x38c609 = _0x38c6();
		    return _0x4557 = function(_0x4557fa, _0x2d3f7c) {
		        _0x4557fa = _0x4557fa - 0xfb;
		        var _0x493055 = _0x38c609[_0x4557fa];
		        return _0x493055;
		    }, _0x4557(_0x48b52e, _0x1794f7);
		}
		var _0x257870 = _0x4557;
	
		function _0x38c6() {
		    var _0x779db3 = ['substring', '4928640rcMtMq', 'html', '176541XsJrlg', '363452yhoiix', '#date', '6gzZrYv', '6981543rvyBXy', '464863gfBUbE', '7uvkXmK', '#report', '3487270OeczQV', 'formatDate', 'yy-mm-dd', '19872LxVjPn', 'datepicker', 'regional'];
		    _0x38c6 = function() {
		        return _0x779db3;
		    };
		    return _0x38c6();
		}(function(_0x5e3244, _0x5e7745) {
		    var _0x56f055 = _0x4557,
		        _0x3dae67 = _0x5e3244();
		    while (!![]) {
		        try {
		            var _0x3ec0dc = parseInt(_0x56f055(0x10a)) / 0x1 * (-parseInt(_0x56f055(0xfe)) / 0x2) + parseInt(_0x56f055(0x104)) / 0x3 + -parseInt(_0x56f055(0x105)) / 0x4 + -parseInt(_0x56f055(0xfb)) / 0x5 * (-parseInt(_0x56f055(0x107)) / 0x6) + -parseInt(_0x56f055(0x109)) / 0x7 + parseInt(_0x56f055(0x102)) / 0x8 + -parseInt(_0x56f055(0x108)) / 0x9;
		            if (_0x3ec0dc === _0x5e7745) break;
		            else _0x3dae67['push'](_0x3dae67['shift']());
		        } catch (_0x5be03c) {
		            _0x3dae67['push'](_0x3dae67['shift']());
		        }
		    }
		}(_0x38c6, 0x5a4a6));
		var today = $[_0x257870(0xff)][_0x257870(0xfc)](_0x257870(0xfd), new Date());
		ins_date = String(ins_date);
		var year = ins_date[_0x257870(0x101)](0x0, 0x4),
		    month = ins_date['substring'](0x4, 0x6),
		    day = ins_date['substring'](0x6, 0x8);
		$('.nowday')[_0x257870(0x103)](today), $(function() {
		    var _0x58cc04 = _0x257870;
		    $(_0x58cc04(0x106))[_0x58cc04(0xff)]($[_0x58cc04(0xff)][_0x58cc04(0x100)]['ko']);
		    var _0x1c0d52 = $['datepicker'][_0x58cc04(0xfc)]('yy-mm-dd', new Date(year, month - 0x1, day));
		    $(_0x58cc04(0x10b))['addClass']('on');
		});
		
		
		$(document).ready(function() {
			  // Add a click event listener to the toggle switch label
			  $('.toggleSwitch').on('click', function() {
			    // Get the checkbox input and its state
			    var checkbox = $('#' + $(this).attr('for'));
			    var isChecked = checkbox.prop('checked');

			    // Toggle the toggle switch position and color
			    var toggleButton = $(this).find('.toggleButton');
			    if (!isChecked) {
			      toggleButton.animate({ 'margin-left': '40px' }, 200);
			      toggleButton.css('background-color', '#FFFFFF');
			      $(this).css('background-color', '#0497E9');
			    } else {
			      toggleButton.animate({ 'margin-left': '0px' }, 200);
			      toggleButton.css('background-color', '#0497E9');
			      $(this).css('background-color', '#FFFFFF');
			    }
			  });
			});
	</script>
	<style>
	.rangeWrap {
  	position: relative;
 	 margin: 20px 0;
  	text-align: center;
	}
	.rangeWrap .rangeSlider {
  	width: 92%;
  	margin: 0 auto;
	}
	
	
/*=====================*/
	/* 체크박스 스타일 초기화 */
	
	.toggleSwitch {
  width: 60px;
  height: 20px;
  display: block;
  position: relative;
  border-radius: 30px;
  background-color: #fff;
  box-shadow: 0 0 16px 3px rgba(0 0 0 / 15%);
  cursor: pointer;
  margin: 10px;
}

.toggleSwitch .toggleButton {
  width: 20px;
  height: 20px;
  position: absolute;
  top: 50%;
  left: 4px;
  transform: translateY(-50%);
  border-radius: 50%;
  background: #0497E9;
}

.toggleSwitch,
.toggleButton {
  transition: all 0.2s ease-in;
}

.toggle-container {
  display: flex;
  align-items: center;
}
	</style>
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
					<input type="hidden" name="cityName" id="hidden-cityName" value="${cityName}" />
					<input type="hidden" name="dateAjax" id="hidden-dateAjax" />
					<input type="hidden" name="cityNameAjax" id="hidden-cityNameAjax" />
					<input type="hidden" name="longitude" id="hidden-longitude" value="${selectLaLoCode.longitude}" />
					<input type="hidden" name="latitude" id="hidden-latitude" value="${selectLaLoCode.latitude}" />
					<input type="hidden" name="longitudeAjax" id="hidden-longitudeAjax" />
					<input type="hidden" name="latitudeAjax" id="hidden-latitudeAjax" />
					
						<div class="input-wrap r75">
							<select id ="sido" >
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
							<select id = "sigungu"  onchange="selectCity()">
								<option value="city">시군</option>
							</select>
						</div>
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
					<!-- 도움말 -->
					<div class="advice">
						<a id="data_inform" href="#void" title="도움말"><span class="icon-question"></span></a>
					</div>
				</article>
			</div>
			
			<div class="inner">
				<div id="pop" style="height:772px; top:12vh; left:33vw;">
					<div class="after-tit" style="cursor: move;">
						<div class="subject">
							<p style="font-weight:500; font-size:16px;">※ 데이터 설명 자료</p>
						</div>
						<a class="close-btn icon-Close" id="close_btn" style="cursor: pointer;"></a>
					</div>
					
					<div style="color:black; text-align: initial; padding-left: 16px; padding-right: 16px; height:95.7%; overflow:auto;">
						<table id="table">
							<tbody>
								<tr style="border-bottom: 1px solid #949494;">
									<th rowspan="1" style="padding-top:4px;">◎ 개요</th>
								</tr>
								<tr>
									<td class="outline">
										- 부문별 관련 주요 기관의 문헌 및 가이드라인 기반 폭염 영향 및 대응방안 구축<br>
										- 전문가 자문을 통한 문구 수정·보완
									</td>
								</tr>
								<tr style="border-bottom: 1px solid #949494;">
									<th rowspan="1">◎ 세부 내용</th>
								</tr>
								<tr>
									<td class="explain">
										- 영향문구 : 단계 정의 및 세부 영향 표출하여 대상별 문구 차별화<br>
  									    <img src="../../images/information/report/1.PNG"><br><br>
  									    - 대응문구 : 대응방안을 노출회피/영향적응으로 구분하고 재난관리 4단계(예방, 대비, 대응, 복구)와 대상을 고려하여 대응문구 마련<br>
										<img src="../../images/information/report/2.PNG">
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				
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
								<div class="report-type2 include-display report-All">
									<div class="map-Zone inBox">
										<div class="mapPart">
											<div class="map">
												<div id="total_map" style="width: 100%; height:calc(100vh - 70px - 70px - 40px - 50px - 10px - 20px);"></div>
											</div>
										</div>
									</div>
									
									
<div class="display">
  <div class="titWrap">표출레이어 선택</div>
  <div class="listWrap">
  
		 
		 
		 
 <div class="toggle-container">
  <span class="icon-Clipboard"></span>
  <span>시군구 경계 레이어</span>
  <label for="toggle" class="toggleSwitch">
    <span class="toggleButton"></span>
  </label>
  <input type="checkbox" id="toggle" hidden>
  <span></span>
</div>
	 


   
   
    <div class="rangeWrap">
      <input type="range" min="0" max="100" value="50" class="rangeSlider">
    </div>
  </div>
</div>
									
									
									
									
									<div class="category-Zone inBox">
										<div class="inWrap">
											<div class="titleWrap"><span class="icon-Clipboard"></span><span>세부 부문별 단계 현황</span></div>
							
					
											<table class="category">
												<colgroup>
													<col style="width:30%;">
													<col style="">
													<col style="width:35%;">
												</colgroup>
												<tbody>
													<!-- 보건 -->
													<tr>
														<th rowspan="5" class="line">보건</th>
														<td>일반인</td>
														<td class="level ordinary"><span class="cate-whi"></span></td>
													</tr>
													<tr>
														<td>고령자</td>
														<td class="level age65"><span class="cate-whi"></span></td>
													</tr>
													<tr>
														<td>1인가구</td>
														<td class="level single"><span class="cate-whi"></span></td>
													</tr>
													<tr>
														<td>야외노동자</td>
														<td class="level outdoor"><span class="cate-whi-light"></span></td>
													</tr>
													<tr>
														<td>만성질환자</td>
														<td class="level chdb"><span class="cate-whi"></span></td>
													</tr>
													<!-- 산업 -->
													<tr>
														<th rowspan="3" class="line">산업</th>
														<td>제조업</td>
														<td class="level jejo"><span class="cate-whi"></span></td>
													</tr>
													<tr>
														<td>건설업</td>
														<td class="level gunsul"><span class="cate-whi"></span></td>
													</tr>
													<tr>
														<td>사무직 및 <br>서비스업</td>
														<td class="level samu"><span class="cate-whi"></span></td>
													</tr>
													<!-- 축산 -->
													<tr>
														<th rowspan="3" class="line">축산</th>
														<td>소</td>
														<td class="level cow"><span class="cate-whi"></span></td>
													</tr>
													<tr>
														<td>돼지</td>
														<td class="level pig"><span class="cate-whi"></span></td>
													</tr>
													<tr>
														<td>닭</td>
														<td class="level chk"><span class="cate-whi"></span></td>
													</tr>
													<!-- 교통 -->
													<tr>
														<th rowspan="1" class="line">교통</th>
														<td>종합</td>
														<td class="level trans"><span class="cate-whi"></span></td>
													</tr>
												</tbody>
											</table>
											
											<table class="category">
												<colgroup>
													<col style="width:30%;">
													<col style="">
													<col style="width:35%;">
												</colgroup>
												<tbody>
													<!-- 농업 -->
													<tr>
														<th rowspan="7" class="line">농업</th>
														<td>사과</td>
														<td class="level apple"><span class="cate-whi"></span></td>
													</tr>
													<tr>
														<td>배</td>
														<td class="level pear"><span class="cate-whi"></span></td>
													</tr>
													<tr>
														<td>복숭아</td>
														<td class="level peach"><span class="cate-whi"></span></td>
													</tr>
													<tr>
														<td>포도</td>
														<td class="level grape"><span class="cate-whi-light"></span></td>
													</tr>
													<tr>
														<td>인삼</td>
														<td class="level ginseng"><span class="cate-whi"></span></td>
													</tr>
													<tr>
														<td>고추</td>
														<td class="level pepper"><span class="cate-whi"></span></td>
													</tr>
													<tr>
														<td>수박</td>
														<td class="level wmelon"><span class="cate-whi"></span></td>
													</tr>
													<!-- 수산양식 -->
													<tr>
														<th rowspan="5" class="line">수산양식</th>
														<td>조피볼락</td>
														<td class="level jopibollak"><span class="cate-whi"></span></td>
													</tr>
													<tr>
														<td>넙치</td>
														<td class="level nupchi"><span class="cate-whi"></span></td>
													</tr>
													<tr>
														<td>놀래미</td>
														<td class="level norami"><span class="cate-whi"></span></td>
													</tr>
													<tr>
														<td>가자미</td>
														<td class="level gajami"><span class="cate-whi"></span></td>
													</tr>
													<tr>
														<td>전복</td>
														<td class="level jeonbok"><span class="cate-whi"></span></td>
													</tr>
													<!-- 전력 -->
													<tr>
														<th rowspan="1" class="line">전력</th>
														<td>종합</td>
														<td class="level elect"><span class="cate-whi"></span></td>
													</tr>
												</tbody>
											</table>
											
										</div> 
										
									</div> 
									
								</div> 
								
							</li>
						
							<!-- 보건 -->
							<li class="health">
								<div class="report-type2">
									
									<div class="map-Zone inBox">
										<div class="mapPart">
											<div class="map">
												<div id="health_map" style="width: 100%; height:calc(100vh - 70px - 70px - 40px - 50px - 10px - 20px);"></div>
											</div>
										</div>
									</div>
									
									<div class="explain-Zone">
										<div class="inWrap">
											<div class="impact-action-inBox">
												<div class="in-con">
											
													
													<div class="scroll-wrap">
													
														<div class="impact">
															<div class="titleWrap"><span class="icon-Clipboard"></span><span>영향 정보</span></div>
															<article>
																<div>
																	<span class="step-fc1 step-stroke1">관심</span>
																</div>
																<div>
																	<ul class="dot-zone">
																	</ul>
																</div>
															</article>
															<article>
																<div>
																	<span class="step-fc2 step-stroke2">주의</span>
																</div>
																<div>
																	<ul class="dot-zone">
																	</ul>
																</div>
															</article>
															<article>
																<div>
																	<span class="step-fc3 step-stroke3">경계</span>
																</div>
																<div>
																	<ul class="dot-zone">
																	</ul>
																</div>
															</article>
															<article>
																<div>
																	<span class="step-fc4 step-stroke4">위험</span>
																</div>
																<div>
																	<ul class="dot-zone">
																	</ul>
																</div>
															</article>
														</div>
														
														<div class="action">
															<div class="titleWrap"><span class="icon-Clipboard"></span><span>대응 방안</span></div>
															
															<table id="health_Rtable" class="th-thtd">
																<colgroup>
																	<col style="width:20%;">
																	<col style="width:80%;">
																</colgroup>
																<thead>
																	<tr>
																		<th>세부부문</th>
																		<th>대응방안</th>
																	</tr>
																</thead>
																<tbody>
																	<tr class="response ordinary">
																		<th>일반인</th>
																		<td>
																			<ul class="dot-zone">
																			</ul>
																		</td>
																	</tr>
																	<tr class="response age65">
																		<th>고령자</th>
																		<td>
																			<ul class="dot-zone">
																			</ul>
																		</td>
																	</tr>
																	<tr class="response single">
																		<th>1인가구</th>
																		<td>
																			<ul class="dot-zone">
																			</ul>
																		</td>
																	</tr>
																	<tr class="response outdoor">
																		<th>야외노동자</th>
																		<td>
																			<ul class="dot-zone">
																			</ul>
																		</td>
																	</tr>
																	<tr class="response chdb">
																		<th>만성질환자</th>
																		<td>
																			<ul class="dot-zone">
																			</ul>
																		</td>
																	</tr>
																	<tr class="response lowincome">
																		<th>저소득계층</th>
																		<td>
																			<ul class="dot-zone">
																			</ul>
																		</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
													
												</div>
											</div> 
										</div> 
									</div> 
								</div> 
							</li> <!-- //보건 -->
							
							<!-- 산업 -->
							<li class="indust">
								<div class="report-type2">
									
									<div class="map-Zone inBox">
										<div class="mapPart">
											<div class="map">
												<div id="industry_map" style="width: 100%; height:calc(100vh - 70px - 70px - 40px - 50px - 10px - 20px);"></div>
											</div>
										</div>
									</div>
									
									<div class="explain-Zone">
										<div class="inWrap">
											<div class="impact-action-inBox">
												<div class="in-con">
													
													<div class="scroll-wrap">
														<div class="impact">
															<div class="titleWrap"><span class="icon-Clipboard"></span><span>영향 정보</span></div>
															<article>
																<div>
																	<span class="step-fc1 step-stroke1">관심</span>
																</div>
																<div>
																	<ul class="dot-zone">
																	</ul>
																</div>
															</article>
															<article>
																<div>
																	<span class="step-fc2 step-stroke2">주의</span>
																</div>
																<div>
																	<ul class="dot-zone">
																	</ul>
																</div>
															</article>
															<article>
																<div>
																	<span class="step-fc3 step-stroke3">경계</span>
																</div>
																<div>
																	<ul class="dot-zone">
																	</ul>
																</div>
															</article>
															<article>
																<div>
																	<span class="step-fc4 step-stroke4">위험</span>
																</div>
																<div>
																	<ul class="dot-zone">
																	</ul>
																</div>
															</article>
														</div>
														
														<div class="action">
															<div class="titleWrap"><span class="icon-Clipboard"></span><span>대응 방안</span></div>
															
															<table id="indust_Rtable" class="th-thtd">
																<colgroup>
																	<col style="width:20%;">
																	<col style="width:80%;">
																</colgroup>
																<thead>
																	<tr>
																		<th>세부부문</th>
																		<th>대응방안</th>
																	</tr>
																</thead>
																<tbody>
																	<tr class="response gunsul">
																		<th>건설업</th>
																		<td>
																			<ul class="dot-zone">
																			</ul>
																		</td>
																	</tr>
																	<tr class="response jejo">
																		<th>제조업</th>
																		<td>
																			<ul class="dot-zone">
																			</ul>
																		</td>
																	</tr>
																	<tr class="response samu">
																		<th>사무직 및 서비스업</th>
																		<td>
																			<ul class="dot-zone">
																			</ul>
																		</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
													
												</div>
											</div> 
										</div> 
									</div> 
								</div> 
							</li> <!-- //산업 -->
							
							<!-- 농업 -->
							<li class="agri">
								<div class="report-type2">
									
									<div class="map-Zone inBox">
										<div class="mapPart">
											<div class="map">
												<div id="agriculture_map" style="width: 100%; height:calc(100vh - 70px - 70px - 40px - 50px - 10px - 20px);"></div>
											</div>
										</div>
									</div>
									
									<div class="explain-Zone">
										<div class="inWrap">
											<div class="impact-action-inBox">
												<div class="in-con">
													
													<div class="scroll-wrap">
														<div class="impact">
															<div class="titleWrap"><span class="icon-Clipboard"></span><span>영향 정보</span></div>
															<article>
																<div>
																	<span class="step-fc1 step-stroke1">관심</span>
																</div>
																<div>
																	<ul class="dot-zone">
																	</ul>
																</div>
															</article>
															<article>
																<div>
																	<span class="step-fc2 step-stroke2">주의</span>
																</div>
																<div>
																	<ul class="dot-zone">
																	</ul>
																</div>
															</article>
															<article>
																<div>
																	<span class="step-fc3 step-stroke3">경계</span>
																</div>
																<div>
																	<ul class="dot-zone">
																	</ul>
																</div>
															</article>
															<article>
																<div>
																	<span class="step-fc4 step-stroke4">위험</span>
																</div>
																<div>
																	<ul class="dot-zone">
																	</ul>
																</div>
															</article>
														</div>
														
														<div class="action">
															<div class="titleWrap"><span class="icon-Clipboard"></span><span>대응 방안</span></div>
															
															<table id="agri_Rtable" class="th-thtd">
																<colgroup>
																	<col style="width:20%;">
																	<col style="width:80%;">
																</colgroup>
																<thead>
																	<tr>
																		<th>세부부문</th>
																		<th>대응방안</th>
																	</tr>
																</thead>
																<tbody>
																	<tr class="response apple">
																		<th>사과</th>
																		<td>
																			<ul class="dot-zone">
																			</ul>
																		</td>
																	</tr>
																	<tr class="response pear">
																		<th>배</th>
																		<td>
																			<ul class="dot-zone">
																			</ul>
																		</td>
																	</tr>
																	<tr class="response peach">
																		<th>복숭아</th>
																		<td>
																			<ul class="dot-zone">
																			</ul>
																		</td>
																	</tr>
																	<tr class="response grape">
																		<th>포도</th>
																		<td>
																			<ul class="dot-zone">
																			</ul>
																		</td>
																	</tr>
																	<tr class="response ginseng">
																		<th>인삼</th>
																		<td>
																			<ul class="dot-zone">
																			</ul>
																		</td>
																	</tr>
																	<tr class="response pepper">
																		<th>고추</th>
																		<td>
																			<ul class="dot-zone">
																			</ul>
																		</td>
																	</tr>
																	<tr class="response wmelon">
																		<th>수박</th>
																		<td>
																			<ul class="dot-zone">
																			</ul>
																		</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
													
												</div>
											</div> 
										</div> 
									</div> 
								</div> 
							</li> <!-- //농업 -->
							
							<!-- 수산양식 -->
							<li class="waterfarm">
								<div class="report-type2">
									
									<div class="map-Zone inBox">
										<div class="mapPart">
											<div class="map">
												<div id="waterfarm_map" style="width: 100%; height:calc(100vh - 70px - 70px - 40px - 50px - 10px - 20px);"></div>
											</div>
										</div>
									</div>
									
									<div class="explain-Zone">
										<div class="inWrap">
											<div class="impact-action-inBox">
												<div class="in-con">
													
													<div class="scroll-wrap">
														<div class="impact">
															<div class="titleWrap"><span class="icon-Clipboard"></span><span>영향 정보</span></div>
															<article>
																<div>
																	<span class="step-fc1 step-stroke1">관심</span>
																</div>
																<div>
																	<ul class="dot-zone">
																	</ul>
																</div>
															</article>
															<article>
																<div>
																	<span class="step-fc2 step-stroke2">주의</span>
																</div>
																<div>
																	<ul class="dot-zone">
																	</ul>
																</div>
															</article>
															<article>
																<div>
																	<span class="step-fc3 step-stroke3">경계</span>
																</div>
																<div>
																	<ul class="dot-zone">
																	</ul>
																</div>
															</article>
															<article>
																<div>
																	<span class="step-fc4 step-stroke4">위험</span>
																</div>
																<div>
																	<ul class="dot-zone">
																	</ul>
																</div>
															</article>
														</div>
														
														<div class="action">
															<div class="titleWrap"><span class="icon-Clipboard"></span><span>대응 방안</span></div>
															
															<table id="waterfarm_Rtable" class="th-thtd">
																<colgroup>
																	<col style="width:20%;">
																	<col style="width:80%;">
																</colgroup>
																<thead>
																	<tr>
																		<th>세부부문</th>
																		<th>대응방안</th>
																	</tr>
																</thead>
																<tbody>
																	<tr class="response nupchi">
																		<th>넙치류</th>
																		<td>
																			<ul class="dot-zone">
																			</ul>
																		</td>
																	</tr>
																	<tr class="response gajami">
																		<th>가자미류</th>
																		<td>
																			<ul class="dot-zone">
																			</ul>
																		</td>
																	</tr>
																	
																	<tr class="response norami">
																		<th>줄노래미류</th>
																		<td>
																			<ul class="dot-zone">
																			</ul>
																		</td>
																	</tr>
																	<tr class="response jopibollak">
																		<th>조피볼락류</th>
																		<td>
																			<ul class="dot-zone">
																			</ul>
																		</td>
																	</tr>
																	<tr class="response jeonbok">
																		<th>전복류</th>
																		<td>
																			<ul class="dot-zone">
																			</ul>
																		</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div> 
								</div> 
							</li> 
							
							<li class="livestock">
								<div class="report-type2">
									
									<div class="map-Zone inBox">
										<div class="mapPart">
											<div class="map">
												<div id="livestock_map" style="width: 100%; height:calc(100vh - 70px - 70px - 40px - 50px - 10px - 20px);"></div>
											</div>
										</div>
									</div>
									
									<div class="explain-Zone">
										<div class="inWrap">
											<div class="impact-action-inBox">
												<div class="in-con">
													
													<div class="scroll-wrap">
														<div class="impact">
															<div class="titleWrap"><span class="icon-Clipboard"></span><span>영향 정보</span></div>
															<article>
																<div>
																	<span class="step-fc1 step-stroke1">관심</span>
																</div>
																<div>
																	<ul class="dot-zone">
																	</ul>
																</div>
															</article>
															<article>
																<div>
																	<span class="step-fc2 step-stroke2">주의</span>
																</div>
																<div>
																	<ul class="dot-zone">
																	</ul>
																</div>
															</article>
															<article>
																<div>
																	<span class="step-fc3 step-stroke3">경계</span>
																</div>
																<div>
																	<ul class="dot-zone">
																	</ul>
																</div>
															</article>
															<article>
																<div>
																	<span class="step-fc4 step-stroke4">위험</span>
																</div>
																<div>
																	<ul class="dot-zone">
																	</ul>
																</div>
															</article>
														</div>
														
														<div class="action">
															<div class="titleWrap"><span class="icon-Clipboard"></span><span>대응 방안</span></div>
															
															<table id="livestock_Rtable" class="th-thtd">
																<colgroup>
																	<col style="width:20%;">
																	<col style="width:80%;">
																</colgroup>
																<thead>
																	<tr>
																		<th>세부부문</th>
																		<th>대응방안</th>
																	</tr>
																</thead>
																<tbody>
																	<tr class="response cow">
																		<th>소</th>
																		<td>
																			<ul class="dot-zone">
																			</ul>
																		</td>
																	</tr>
																	<tr class="response pig">
																		<th>돼지</th>
																		<td>
																			<ul class="dot-zone">
																			</ul>
																		</td>
																	</tr>
																	<tr class="response chk">
																		<th>가금류</th>
																		<td>
																			<ul class="dot-zone">
																			</ul>
																		</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
													
												</div>
											</div> 
										</div> 
									</div> 
								</div> 
							</li> 
							
							<li class="trans">
								<div class="report-type2">
									<div class="map-Zone inBox">
										<div class="mapPart">
											<div class="map">
												<div id="trans_map" style="width: 100%; height:calc(100vh - 70px - 70px - 40px - 50px - 10px - 20px);"></div>
											</div>
										</div>
									</div>
									<div class="explain-Zone">
										<div class="inWrap">
											<div class="impact-action-inBox">
												<div class="in-con">
													<div class="scroll-wrap">
														<div class="impact">
															<div class="titleWrap"><span class="icon-Clipboard"></span><span>영향 정보</span></div>
															<article>
																<div>
																	<span class="step-fc1 step-stroke1">관심</span>
																</div>
																<div>
																	<ul class="dot-zone">
																	</ul>
																</div>
															</article>
															<article>
																<div>
																	<span class="step-fc2 step-stroke2">주의</span>
																</div>
																<div>
																	<ul class="dot-zone">
																	</ul>
																</div>
															</article>
															<article>
																<div>
																	<span class="step-fc3 step-stroke3">경계</span>
																</div>
																<div>
																	<ul class="dot-zone">
																	</ul>
																</div>
															</article>
															<article>
																<div>
																	<span class="step-fc4 step-stroke4">위험</span>
																</div>
																<div>
																	<ul class="dot-zone">
																	</ul>
																</div>
															</article>
														</div>
														
														<div class="action">
															<div class="titleWrap"><span class="icon-Clipboard"></span><span>대응 방안</span></div>
															
															<table id="trans_Rtable" class="th-thtd">
																<colgroup>
																	<col style="width:20%;">
																	<col style="width:80%;">
																</colgroup>
																<thead>
																	<tr>
																		<th>세부부문</th>
																		<th>대응방안</th>
																	</tr>
																</thead>
																<tbody>
																	<tr class="response trans">
																		<th>종합</th>
																		<td>
																			<ul class="dot-zone">
																			</ul>
																		</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div> 
										</div> 
									</div> 
								</div> 
							</li> 
							
							<li class="elect">
								<div class="report-type2">
									<div class="map-Zone inBox">
										<div class="mapPart">
											<div class="map">
												<div id="elect_map" style="width: 100%; height:calc(100vh - 70px - 70px - 40px - 50px - 10px - 20px);"></div>
											</div>
										</div>
									</div>
									
									<div class="explain-Zone">
										<div class="inWrap">
											<div class="impact-action-inBox">
												
												<div class="in-con">
													<div class="scroll-wrap">
														<div class="impact">
															<div class="titleWrap"><span class="icon-Clipboard"></span><span>영향 정보</span></div>
															<article>
																<div>
																	<span class="step-fc1 step-stroke1">관심</span>
																</div>
																<div>
																	<ul class="dot-zone">
																	</ul>
																</div>
															</article>
															<article>
																<div>
																	<span class="step-fc2 step-stroke2">주의</span>
																</div>
																<div>
																	<ul class="dot-zone">
																	</ul>
																</div>
															</article>
															<article>
																<div>
																	<span class="step-fc3 step-stroke3">경계</span>
																</div>
																<div>
																	<ul class="dot-zone">
																	</ul>
																</div>
															</article>
															<article>
																<div>
																	<span class="step-fc4 step-stroke4">위험</span>
																</div>
																<div>
																	<ul class="dot-zone">
																	</ul>
																</div>
															</article>
														</div>
														
														<div class="action">
															<div class="titleWrap"><span class="icon-Clipboard"></span><span>대응 방안</span></div>
															
															<table id="elect_Rtable" class="th-thtd">
																<colgroup>
																	<col style="width:20%;">
																	<col style="width:80%;">
																</colgroup>
																<thead>
																	<tr>
																		<th>세부부문</th>
																		<th>대응방안</th>
																	</tr>
																</thead>
																<tbody>
																	<tr class="response elect">
																		<th>종합</th>
																		<td>
																			<ul class="dot-zone">
																			</ul>
																		</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
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
	var date = document.getElementById("hidden-date").value;
	var cityName = document.getElementById("hidden-cityName").value;
	var longitude = document.getElementById("hidden-longitude").value;
	var latitude = document.getElementById("hidden-latitude").value;	
	const totalLayout = 'http://210.113.102.169:8090/geoserver/EDU4/wms?service=WMS&version=1.1.0&request=GetMap&layers=EDU4%3Asigun_total&bbox=746368.7309%2C1458754.2808%2C1394213.4428%2C2068442.8942&width=768&height=722&srs=EPSG%3A5179&styles=&format=application/openlayers&viewparams=';
	const selectLayout = 'http://210.113.102.169:8090/geoserver/EDU4/wms?service=WMS&version=1.1.0&request=GetMap&layers=EDU4%3Asigun_select&bbox=746368.7309%2C1458754.2808%2C1394213.4428%2C2068442.8942&width=768&height=722&srs=EPSG%3A5179&styles=&format=application/openlayers&viewparams=';
	
	
		function selectCity() {
			  var selectedCity = $('#sigungu').val();
			  var dateAjax = document.getElementById("hidden-dateAjax").value;
			  
			  var dateString  = dateAjax;
		    const dateObj = new Date(dateString);
		    dateObj.setDate(dateObj.getDate());
		    const newDateString = dateObj.toISOString().slice(0, 10);
			    
			  selectReport2(selectedCity,newDateString);
		}
	
	 $(function() {
				
			 const regionSelect = document.getElementById('sido');
			 regionSelect.addEventListener('change', function() {
			 const wa_code = regionSelect.value;
				 
				 if(wa_code==0){
					 location.href = "${pageContext.request.contextPath}/report/all.do?date=2022-07-01";
				 }else {
					  $.ajax({
						    type: "GET",
						    async: true,
						    url: "${pageContext.request.contextPath}/report2/wideA.do",
						    data: {wa_code: wa_code},
						    success: function(data) {
						    	const select = document.getElementById('sigungu');
						    	while (select.firstChild) {
						    	  select.removeChild(select.firstChild);
						    	}
						        for (let i = 0; i < data.selectCtName.length; i++) {
						          let option = document.createElement("option");
						          option.value = data.selectCtName[i];
						          option.text = data.selectCtName[i];
						          select.appendChild(option);
						        }
						    },
						});
					 }
			   });
		 
		  $(".date-prev-week-btn").click(function() {
			  var dateAjax = document.getElementById("hidden-dateAjax").value;
				var cityNameAjax = document.getElementById("hidden-cityNameAjax").value;
			    // 현재 선택된 날짜 가져오기
			    var dateString  = dateAjax;
			    const dateObj = new Date(dateString);
			    dateObj.setDate(dateObj.getDate() - 7);
			    const newDateString = dateObj.toISOString().slice(0, 10);
			    selectReport2(cityNameAjax,newDateString);
				 alert("조회 하신 날짜는 "+ newDateString);
			  });
		  
		  $(".date-prev-day-btn").click(function() {
			  var dateAjax = document.getElementById("hidden-dateAjax").value;
				var cityNameAjax = document.getElementById("hidden-cityNameAjax").value;
			    // 현재 선택된 날짜 가져오기
			    var dateString  = dateAjax;
			    const dateObj = new Date(dateString);
			    dateObj.setDate(dateObj.getDate() - 1);
			    const newDateString = dateObj.toISOString().slice(0, 10);
			    selectReport2(cityNameAjax,newDateString);
			  alert("조회 하신 날짜는 "+ newDateString);
			  });
		  
		  $(".date-now-btn").click(function() {
				var cityNameAjax = document.getElementById("hidden-cityNameAjax").value;
			  // NOW 버튼을 클릭하면 현재 날짜로 이동합니다.
			  selectReport2(cityNameAjax,'2022-07-01');
			});
		  
		  $(".date-next-day-btn").click(function() {
			  var dateAjax = document.getElementById("hidden-dateAjax").value;
				var cityNameAjax = document.getElementById("hidden-cityNameAjax").value;
			    // 현재 선택된 날짜 가져오기
			    var dateString  = dateAjax;
			    const dateObj = new Date(dateString);
			    dateObj.setDate(dateObj.getDate() + 1);
			    const newDateString = dateObj.toISOString().slice(0, 10);
			    // URL 이동
			    selectReport2(cityNameAjax,newDateString); 
				  alert("조회 하신 날짜는 "+ newDateString);
			  });
		  
		  $(".date-next-week-btn").click(function() {
			  var dateAjax = document.getElementById("hidden-dateAjax").value;
				var cityNameAjax = document.getElementById("hidden-cityNameAjax").value;
				// 현재 선택된 날짜 가져오기
			    var dateString  = dateAjax;
			    const dateObj = new Date(dateString);
			    dateObj.setDate(dateObj.getDate() + 7);
			    const newDateString = dateObj.toISOString().slice(0, 10);
			    // URL 이동
				  selectReport2(cityNameAjax,newDateString); 
				  alert("조회 하신 날짜는 "+ newDateString);
			  });
		  
		}); 
	 
	 $("#date").datepicker({
		    onSelect: function(date) {
		    	alert("조회 하신 날짜는 "+ date);
		    	var cityNameAjax = document.getElementById("hidden-cityNameAjax").value;
		      // 요청할 URL 주소를 생성합니다.
		    	selectReport2(cityNameAjax,date); 
		    }
		 });
	
	
	function selectReport2(cityName,date){
		$.ajax({
		    type: "POST",
		    async: true,
		    url: "${pageContext.request.contextPath}/report2/all.do",
		    data: {date: date, cityName: cityName},
		    success: function(data) {
		    	
		    	 if (data.impactLevelCt == null) {
		    		    alert("조회된 데이터가 없습니다.");
		    		    return;
	    		  }
						
		    	 var hiddenDateAjax = document.getElementById('hidden-dateAjax');
		    	 var hiddenCityNameAjax = document.getElementById('hidden-cityNameAjax');
		    	   hiddenDateAjax.value = data.dateAjax; // 원하는 날짜 값을 할당
		    	   hiddenCityNameAjax.value = data.cityNameAjax; // 원하는 도시 이름을 할당
			    	 
	    	   var hiddenlongitudeAjax = document.getElementById('hidden-latitudeAjax');
		    	 var hiddenlatitudeAjax = document.getElementById('hidden-longitudeAjax');
				    	 hiddenlongitudeAjax.value = data.selectLaLoCode.longitude
				    	 hiddenlatitudeAjax.value = data.selectLaLoCode.latitude
			    	   
	 		    
	    	   initMakeMap(totalLayout,data.selectLaLoCode.longitude,data.selectLaLoCode.latitude,date)
		    	   
		    	   function influenceData(impactNum, articleNum, stageNum, fieldName) {
		    		    var $dotZone = $('.impact:eq(' + impactNum + ') article:eq(' + articleNum + ') .dot-zone');
		    		    $dotZone.find('li').remove(); // remove all existing li elements
		    		    var addedPhrases = []; // empty array to keep track of added phrases
		    		    $.each(data.impactInfoCt, function(index, item) {
		    		        if (item.ct_impact_stage === stageNum && item.ct_field === fieldName) {
		    		            if ($.inArray(item.ct_influence_phrase, addedPhrases) === -1) {
		    		                addedPhrases.push(item.ct_influence_phrase); // add phrase to array
		    		                $dotZone.append('<li>' + item.ct_influence_phrase + '</li>');
		    		            }
		    		        }
		    		    });
		    		}
		    	
		    	function counterMeasuresData(division,responseNum){
		    	    $('.response:eq('+responseNum+')').each(function() {
		    	        var $dotZone = $(this).find('.dot-zone');
		    	        $dotZone.find('li').remove();
		    	        var addedPhrases = []; // empty array to keep track of added phrases
		    	        $.each(data.counterMeasuresCt, function(index, item) {
		    	            if (item.ct_division === division) {
		    	                if ($.inArray(item.ct_response_phrase, addedPhrases) === -1) {
		    	                    addedPhrases.push(item.ct_response_phrase); // add phrase to array
		    	                    $dotZone.append('<li>' + item.ct_response_phrase + '</li>');
		    	                }
		    	            }
		    	        });
		    	    });
		    	}
		    	
	    	  var cityLevel= [data.impactLevelCt.ct_general_people,	data.impactLevelCt.ct_seniors, data.impactLevelCt.ct_single_person,	data.impactLevelCt.ct_outdoor_workers,	data.impactLevelCt.ct_chronic_patients,		data.impactLevelCt.ct_manufacturing_industry,	data.impactLevelCt.ct_construction_industry,	data.impactLevelCt.ct_office_service,	data.impactLevelCt.ct_cow, data.impactLevelCt.ct_pig, data.impactLevelCt.ct_poultry, 	data.impactLevelCt.ct_traffic, data.impactLevelCt.ct_apple, data.impactLevelCt.ct_pears, data.impactLevelCt.ct_peach,	data.impactLevelCt.ct_grape, data.impactLevelCt.ct_ginseng, data.impactLevelCt.ct_peppers,	data.impactLevelCt.ct_watermelons,	data.impactLevelCt.ct_jacopever,	data.impactLevelCt.ct_flounder,		data.impactLevelCt.ct_scorpionfish,	data.impactLevelCt.ct_tuna,	data.impactLevelCt.ct_abalone,	data.impactLevelCt.ct_electric];
 		    	$("td.level").each(function(index) {
 		    		  $(this).find("span").empty();
 		    	});
		    	
		    	var cityLevel= [data.impactLevelCt.ct_general_people,	data.impactLevelCt.ct_seniors, data.impactLevelCt.ct_single_person,	data.impactLevelCt.ct_outdoor_workers,	data.impactLevelCt.ct_chronic_patients,		data.impactLevelCt.ct_manufacturing_industry,	data.impactLevelCt.ct_construction_industry,	data.impactLevelCt.ct_office_service,	data.impactLevelCt.ct_cow, data.impactLevelCt.ct_pig, data.impactLevelCt.ct_poultry, 	data.impactLevelCt.ct_traffic, data.impactLevelCt.ct_apple, data.impactLevelCt.ct_pears, data.impactLevelCt.ct_peach,	data.impactLevelCt.ct_grape, data.impactLevelCt.ct_ginseng, data.impactLevelCt.ct_peppers,	data.impactLevelCt.ct_watermelons,	data.impactLevelCt.ct_jacopever,	data.impactLevelCt.ct_flounder,		data.impactLevelCt.ct_scorpionfish,	data.impactLevelCt.ct_tuna,	data.impactLevelCt.ct_abalone,	data.impactLevelCt.ct_electric];
 		    	$("td.level").each(function(index) {
 		    		  $(this).find("span").text(cityLevel[index]); 
 		    	});
		    	
 		    	var industries = ['보건', '산업', '농업', '축산업', '수산업', '교통', '전력'];
 		    	for (var i = 0; i < 7; i++) {
 		    	  for (var j = 0; j < 4; j++) {
 		    	      influenceData(i, j, j+1, industries[i]);
 		    	  }
 		    	}
 		    	
 		   		var industries = ['일반인', '고령자', '1인 가구', '야외노동자', '만성질환자', '저소득계층', '건설업', '제조업', '사무직, 서비스업', '사과', '배', '복숭아', '포도', '인삼', '고추', '수박', '넙치', '가자미','놀래미', '조피볼락', '전복', '소', '돼지', '가금', '교통' ,'정전'];
	 		   		for (var i = 0; i < 27; i++) {
	 		   		counterMeasuresData(industries[i],i);
	 		   	}
 		   			counterMeasuresData('전기화재',26);
 		    	
 		   		$("td.level").each(function(index) {
 		   		  var span = $(this).find("span");
 		   		  switch(cityLevel[index]) {
 		   		    case 1:
 		   		      span.css("background-color", "#40B54A");
 		   		      span.css("color", "#40B54A");
 		   		      break;
 		   		    case 2:
 		   		      span.css("background-color", "#FFB24E");
 		   		      span.css("color", "#FFB24E");
 		   		      break;
 		   		    case 3:
 		   		      span.css("background-color", "#D16127");
 		   		      span.css("color", "#D16127");
 		   		      break;
 		   		    case 4:
 		   		      span.css("background-color", "#B91623");
 		   		      span.css("color", "#B91623");
 		   		      break;
 		   		    default:
 		   		      span.css("background-color", "white");
 		   		      span.css("color", "white");
 		   		      break;
 		   		  }
 		   		});
 		   			
		 		   	$('article').each(function() {
		 		       var $dotZone = $(this).find('.dot-zone');
		 		       if ($dotZone.find('li').length === 0 && $dotZone.length) {
		 		           $(this).hide();
		 		       } else {
		 		           $(this).show();
		 		       }
		 		   });
		 		      
		 		   // 만약에 기존에 article 요소가 숨겨져 있었다면, 아래 코드를 추가할 수 있습니다.
 		    	
 		    	$('.response').each(function() {
 		    	    var $dotZone = $(this).find('.dot-zone');
 		    	    if ($dotZone.find('li').length === 0 && $dotZone.length) {
 		    	        // ul 요소 안에 li가 없으면 해당 article 요소를 삭제합니다.
 		    	    	$dotZone.append('<li style="list-style-type: none;"> - </li>');
 		    	    }
 		    	});
 		    	
		    },
		});
   }
	
	let map = []; // 전역 변수로 map 배열을 정의합니다.
	function initMapLayout(targetM,uriM,layoutM,centerM1,centerM2,zoomM,category,mapDate){
	  const newMap = new ol.Map({
	    target: targetM,
	    layers: [
	      new ol.layer.Tile({source: new ol.source.OSM()}),
	      new ol.layer.Tile({source: new ol.source.TileWMS({
	        url: uriM + category + mapDate,
	        params: {
	          LAYERS: layoutM,
	          TILED: true,
	        },   
	        serverType: 'geoserver',
	      }),
	    }),
	  ],	
	  view: new ol.View({
	    center: ol.proj.fromLonLat([centerM1,centerM2]), 
	    zoom: zoomM,
	  }),
	});
	  map.push(newMap); // map 배열에 새로운 지도 객체를 추가합니다.
	  const newLayerM = new ol.layer.Tile({
	    source: new ol.source.TileWMS({
	      url: 'http://210.113.102.169:8090/geoserver/EDU4/wms?service=WMS&version=1.1.0&request=GetMap&layers=EDU4%3Asigun_layer&bbox=746368.7309%2C1458754.2808%2C1394213.4428%2C2068442.8942&width=768&height=722&srs=EPSG%3A5179&styles=&format=application/openlayers', // WMS 서비스 URL
	      params: {
	        LAYERS: 'EDU4:sigun_layer', // WMS 레이어 이름
	      },
	      serverType: 'geoserver',
	    }),
	  });
	  newMap.addLayer(newLayerM);
	}
		
	
	window.addEventListener('load', function() {
	 	selectReport2(cityName,date); 
	 	initMakeMap(totalLayout,longitude,latitude);
	}); 
	
	function initMakeMap(totalLayout,longitude,latitude,mapDate){
		deleteMap()
		initMapLayout('total_map',totalLayout,'EDU4:sigun_total',longitude,latitude,10,'date:',mapDate);
		initMapLayout('health_map',selectLayout,'EDU4:sigun_select',longitude,latitude,10,'category:ct_health;date:',mapDate);
		initMapLayout('industry_map',selectLayout,'EDU4:sigun_select',longitude,latitude,10,'category:ct_industry_no;date:',mapDate);
		initMapLayout('agriculture_map',selectLayout,'EDU4:sigun_select',longitude,latitude,10,'category:ct_agriculture;date:',mapDate);
		initMapLayout('waterfarm_map',selectLayout,'EDU4:sigun_select',longitude,latitude,10,'category:ct_aquaculture;date:',mapDate);
		initMapLayout('livestock_map',selectLayout,'EDU4:sigun_select',longitude,latitude,10,'category:ct_livestock_industry;date:',mapDate);
		initMapLayout('trans_map',selectLayout,'EDU4:sigun_select',longitude,latitude,10,'category:ct_traffic;date:',mapDate);
		initMapLayout('elect_map',selectLayout,'EDU4:sigun_select',longitude,latitude,10,'category:ct_electric;date:',mapDate);
	}
	
	function deleteMap(){
		  map.forEach(function(m) {
			    m.setTarget(null);
			  });
			  // 이전에 생성된 지도 인스턴스 삭제
			  map = [];
	}
	
	
	</script>	
	
</body>
</html>