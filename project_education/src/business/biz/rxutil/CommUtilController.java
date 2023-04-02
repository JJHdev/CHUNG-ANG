package business.biz.rxutil;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import business.biz.main.MainService;
import business.biz.report.ReportService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

@Controller
public class CommUtilController {

	@Resource(name ="CommUtilService")
	private CommUtilService commUtilService;

	@Resource(name ="MainService")
	private MainService mainService;

	

	@Resource(name="ReportService")
	private ReportService ReportService;
	
	
	
	// 배열도 받음
	private EgovMap paramMap(HttpServletRequest request){
		EgovMap paramMap = new EgovMap();

		Enumeration enu= request.getParameterNames();
		String name = "";
		String arr_value = "";

		while(enu.hasMoreElements()){
		 name = (String)enu.nextElement();
		 String[] value = request.getParameterValues(name);
		 int valueSize = value.length;

			 if(valueSize == 1){ //배열이 아닌것
				  for(int i=0; i<valueSize; i++){
					  paramMap.put(name, value[i]);
				  }
			 }

			 if(valueSize > 1){ //배열인것
				 ArrayList<String> tempList = new ArrayList<String>();
				 for(int j=0; j<valueSize; j++){
					 tempList.add(value[j]);
				 }
				 
				 String newName = new String(name);
				 if(newName.indexOf('[') != -1) {
					 newName = newName.substring(0, newName.indexOf('['));
				 }
				 paramMap.put(newName, tempList);
			 }
		}
		
		return paramMap;
	}
	

	
	
	// array data
	// Array will be One  : ex) {array : [{key : val}], string : string, string...}.
	// NOT THIS WAY		  : ex) {array : []} 	OR  {array : [{}], array : [{}]}
	public EgovMap NewParamMap(HttpServletRequest request) {
		EgovMap paramMap = new EgovMap();
		
		ArrayList<String> newKeys = new ArrayList();
		
		String currentKey = "";
		
		
		ArrayList<Object> newData = new ArrayList();
		
		Set keySet = request.getParameterMap().keySet();
		Iterator<?> iter = keySet.iterator();
		while(iter.hasNext()){
			String key = (String) iter.next();
			paramMap.put(key, request.getParameter(key));

			
			// will be Array <Object>
			if(key.indexOf('[') != -1) {
//				System.out.println("request.getParameter(\""+key+"\", \""+request.getParameter(key)+"\")");
				String tempKey = key.substring(0, key.indexOf('['));

				boolean hasKey = false;
				for(int i = 0; i < newKeys.size(); i++) {
					if(newKeys.get(i).equals(tempKey)) {
						hasKey = true;
						break;
					}
				}
				if(hasKey == false) {
					newKeys.add(tempKey);
				}
			
				
				boolean isSame = true;
				if(!currentKey.equals(key.substring(0, key.indexOf('[')))) {
					currentKey = key.substring(0, key.indexOf('['));
					isSame = false;
					paramMap.put(currentKey, newData);
				}
				

				String j_index_num = key.substring(key.indexOf('[')+1, key.indexOf(']'));
				String j_index_key = key.substring(key.lastIndexOf('[')+1, key.lastIndexOf(']'));
				
				boolean isSetData = false;
				for(int k = 0; k < newData.size(); k++) {
					String cur_num = Integer.toString(k);

					if(j_index_num.equals(cur_num)) {
						System.out.println("is Same? : " + j_index_num.equals(cur_num));
						HashMap each = (HashMap) newData.remove(k);
						each.put(j_index_key, request.getParameter(key));
						newData.add(k, each);
						isSetData = true;
					}
				}
				
				if(!isSetData) {
					HashMap newHashMap = new HashMap();
					newHashMap.put(j_index_key, request.getParameter(key));
					newData.add(newHashMap);
				}
				
			}
		}
		
		return paramMap;
	}
	
	
	/*
	 * 통합 조회 : 축산, 수산양식업, 전력
	 * */
	@RequestMapping(value="/commUtil/commGetTotalLWZTable.do", method=RequestMethod.GET)
    @ResponseBody
	public ModelAndView CommGetLivestockdeadTable(HttpServletRequest request, ModelAndView mv) throws Exception{

		EgovMap tempMap = this.NewParamMap(request);
		mv.setViewName("jsonView");
		
		String whatType = (String) tempMap.get("whatType");
		
		if(whatType.equals("liveStock")) {				// 축산
			List<EgovMap> livestockCountList = commUtilService.CommGetLivestockdeadTotalTb(tempMap);		// 폐사수
//			List<EgovMap> livestockRateList = commUtilService.CommGetLivestockDeathRateTotalTb(tempMap);	// 폐사율
			mv.addObject("livestockCountList", livestockCountList);
//			mv.addObject("livestockRateList", livestockRateList);
		}else if(whatType.equals("electFire")){			// 전력
			List<EgovMap> zizizigList = commUtilService.CommGetPowerTotalTb(tempMap);						// 전력
			mv.addObject("zizizigList", zizizigList);
		}else if(whatType.equals("waterFarm")){			// 수산양식업
			List<EgovMap> watersList = commUtilService.CommGetWaterfarmAmountTotalTb(tempMap);				// 수산양식업
			mv.addObject("watersList", watersList);
		}

		return mv;
	}
	
	/* rx_hist_sg 에 있는 데이터만 표출
	 * 통합 보건 조회 : 온열 질환자 수
	 * */
	@RequestMapping(value="/commUtil/CommGetHealthCareTotal.do", method=RequestMethod.GET)
    @ResponseBody
	public ModelAndView CommGetHealthDiseaseTotalTb(HttpServletRequest request, ModelAndView mv) throws Exception{

		EgovMap tempMap = this.NewParamMap(request);
		mv.setViewName("jsonView");
		
		EgovMap sigunMap = tempMap;
		sigunMap.put("gubun", "sigun");
		List<EgovMap> healthDeadSigunList = commUtilService.CommGetHealthDeadsgTb(sigunMap);		// 온열 사망자 수
		mv.addObject("healthDeadSigunList", healthDeadSigunList);
		
//		String Checker = (String) tempMap.get("healthDB");
//		if(Checker.equals("HealthDisease")) {						// 온열 질환자 수
//			List<EgovMap> healthDList = commUtilService.CommGetHealthDiseaseTotalTb(tempMap);
//			mv.addObject("healthDList", healthDList);			
//		}else if(Checker.equals("HealthDead")) {					// 온열 사망자 수
//			// 시군 타입
//			EgovMap sigunMap = tempMap;
//			sigunMap.put("gubun", "sigun");
//			List<EgovMap> healthDeadSigunList = commUtilService.CommGetHealthDeadsgTb(sigunMap);		
//			
//			// 광역 타입
//			EgovMap wideMap = tempMap;
//			wideMap.put("gubun", "wide");
//			List<EgovMap> healthDeadWideList = commUtilService.CommGetHealthDeadsgTb(wideMap);		
//			
//			mv.addObject("healthDeadSigunList", healthDeadSigunList);			
//			mv.addObject("healthDeadWideList", healthDeadWideList);			
//		}else if(Checker.equals("HealthIncidence")) {				// 온열질환자 발생률
//			List<EgovMap> health_IList = commUtilService.CommGetHealthIncidenceTotalTb(tempMap);		
//			mv.addObject("health_IList", health_IList);			
//		}else if(Checker.equals("HealthDeathRate")) {				// 온열질환자 사망률
//			List<EgovMap> healthDRateList = commUtilService.CommGetHealthDeathRateTb(tempMap);		
//			mv.addObject("healthDRateList", healthDRateList);			
//		}


		return mv;
	}
	
	
	/*
	 * SIDO WIDECD
	 * */
	@RequestMapping(value="/commUtil/getSidoCode.do", method=RequestMethod.GET)
    @ResponseBody
	public ModelAndView CommSearchSido(HttpServletRequest request, ModelAndView mv) throws Exception{
		mv.setViewName("jsonView");
		
		List<EgovMap> tempList = commUtilService.CommSearchSido();
		mv.addObject("sidoList", tempList);

		return mv;
	}
	/*
	 * SGG WIDECD
	 * */
	@RequestMapping(value="/commUtil/getSggCode.do", method=RequestMethod.GET)
    @ResponseBody
	public ModelAndView CommSearchSgg(HttpServletRequest request, ModelAndView mv) throws Exception{
		mv.setViewName("jsonView");
		
		EgovMap tempMap = this.paramMap(request);
		List<EgovMap> tempList = commUtilService.CommSearchSgg(tempMap);
		mv.addObject("sggList", tempList);

		return mv;
	}
	
	/*
	 * 시군기상정보 조회 
	최신 날짜 데이터 row 1개 호출
	기온, 습도, 풍속 데이터. 강수량 데이터 없음
	 * */
	@RequestMapping(value="/commUtil/getInforData.do", method=RequestMethod.GET)
    @ResponseBody
	public ModelAndView CommGetInforData(HttpServletRequest request, ModelAndView mv) throws Exception{
		mv.setViewName("jsonView");
		
		EgovMap tempMap = this.paramMap(request);
		List<EgovMap> tempList = commUtilService.CommGetInforData(tempMap);
		if(tempList.size() > 0) {
			mv.addObject("inforTblData", tempList);
		}
		return mv;
	}
	
	/*
	 * 시군기상정보 조회 
	최신 날짜 데이터 row 1개 호출
	기온, 습도, 풍속 데이터. 강수량 데이터 없음
	 * */
	@RequestMapping(value="/commUtil/commGetWideInforData.do", method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView commGetWideInforData(HttpServletRequest request, ModelAndView mv) throws Exception{
		mv.setViewName("jsonView");
		
		EgovMap tempMap = this.paramMap(request);
		List<EgovMap> tempList = commUtilService.commGetWideInforData(tempMap);
		if(tempList.size() > 0) {
			mv.addObject("inforTblData", tempList);
		}
		return mv;
	}
	
	/*
	 * 퍼즈 연산을 위한 가중치 조회
	 * */
	@RequestMapping(value="/commUtil/getSmatchs.do", method=RequestMethod.GET)
    @ResponseBody
	public ModelAndView CommGetSmatchs(HttpServletRequest request, ModelAndView mv) throws Exception{
		mv.setViewName("jsonView");
		
		List<EgovMap> smatchListH = commUtilService.CommGetSmatchH();	// 습도
		List<EgovMap> smatchListP = commUtilService.CommGetSmatchP();	// 강수량
		List<EgovMap> smatchListT = commUtilService.CommGetSmatchT();	// 기온
		List<EgovMap> smatchListW = commUtilService.CommGetSmatchW();	// 풍속

		mv.addObject("smatchListH", smatchListH);
		mv.addObject("smatchListP", smatchListP);
		mv.addObject("smatchListT", smatchListT);
		mv.addObject("smatchListW", smatchListW);

		return mv;
	}

	
	/*
	 * 조건에 따른 결과값.rx_hist_sg_avg
	 * 결과값 : 각 날짜별 평균들
	 * */
	@RequestMapping(value="/commUtil/getHistSgAvg.do", method=RequestMethod.GET)
    @ResponseBody
	public ModelAndView CommGetHistSgAvg(HttpServletRequest request, ModelAndView mv) throws Exception{
		mv.setViewName("jsonView");
		
		EgovMap tempMap = this.paramMap(request);
		System.out.println(tempMap);
		List<EgovMap> tempList = commUtilService.CommGetHistSgAvg(tempMap);
		if(tempList.size() > 0) {
			mv.addObject("inforTblAvgs", tempList);
		}
		return mv;
	}
	
	/*
	 * 조건에 따른 결과값.rx_hist_sg_avg
	 * 결과값 : 각 날짜별 평균들
	 * */
	@RequestMapping(value="/commUtil/commGetHistWdAvg.do", method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView commGetHistWdAvg(HttpServletRequest request, ModelAndView mv) throws Exception{
		mv.setViewName("jsonView");
		
		EgovMap tempMap = this.paramMap(request);
		System.out.println(tempMap);
		List<EgovMap> tempList = commUtilService.commGetHistWdAvg(tempMap);
		if(tempList.size() > 0) {
			mv.addObject("inforTblAvgs", tempList);
		}
		return mv;
	}
	
	
	

}
