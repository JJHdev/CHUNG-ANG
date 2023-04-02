package business.biz.report;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import business.biz.main.MainService;
import business.egov.cmmvo.CounterMeasuresNwVO;
import business.egov.cmmvo.ImpactInfoNwVO;
import business.egov.cmmvo.ImpactLevelCityCountVO;
import business.egov.cmmvo.ImpactLevelNationwideVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import net.sf.json.JSONObject;

@Controller
public class ReportController {
	
	@Resource(name="ReportService")
	private ReportService ReportService;
	
	@Resource(name ="MainService")
	private MainService MainService;
	
	@RequestMapping(value = "/report/all.do", method = RequestMethod.GET)
	public String ctAllSelect(HttpServletRequest request, HttpSession session, HttpServletResponse response, Model model,
							 @RequestParam(required = false, defaultValue = "2022-07-01") String date, @RequestParam(required = false, defaultValue = "0") int wa_code,	 @RequestParam(required = false, defaultValue = "0") int how) throws Exception{
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date dateSelect = dateFormat.parse(date);
		int cnt = this.ReportService.isDataSelect(dateSelect);
		if(cnt == 0) {
		    request.setAttribute("message", "해당하는 날짜에 데이터가 없습니다.");
		}
		ImpactLevelCityCountVO ctTotalLevel= cityImpactLevelCount(dateSelect);
		List waPartImpactLevel= wideareaPartImpactLevel(dateSelect);
		ImpactLevelNationwideVO NwImpactLevel= nationareaPartImpactLevel(dateSelect);
		ImpactLevelCityCountVO ctCountImpactLevel = cityImpactLevelCountHealth(dateSelect);
		List<ImpactInfoNwVO> impactInfoNw=impactInfoNw(dateSelect,how,wa_code);
		List<CounterMeasuresNwVO> cmNw = counterMeasuresNw(dateSelect,how,wa_code);
		List<String> selectCtName = new ArrayList<>();
		if (wa_code > 0) {
		    selectCtName = this.ReportService.selectCityName(wa_code);
		} else {
		    selectCtName.add(""); // Add a default city name to the list
		}
		model.addAttribute("date", date);
		model.addAttribute("wa_code", wa_code);
		model.addAttribute("ctTotalLevel", ctTotalLevel);
		model.addAttribute("NwimpactLevel", NwImpactLevel);
		model.addAttribute("waPartImpactLevel", waPartImpactLevel);
		model.addAttribute("ctCountImpactLevel", ctCountImpactLevel);
		model.addAttribute("ImpactInfoNw", impactInfoNw);
		model.addAttribute("cmNw", cmNw);
		model.addAttribute("selectCtName", selectCtName);
	    return "main/report";
	}
	
	private ImpactLevelCityCountVO cityImpactLevelCount(Date date) throws Exception{
		ImpactLevelCityCountVO ctPartLevle = new ImpactLevelCityCountVO();
		return ctPartLevle = this.ReportService.cityImpactLevleCount(date);
	}
	
	private List wideareaPartImpactLevel(Date date) throws Exception{
		List wideareaPartImpactLevel = new ArrayList();
		return wideareaPartImpactLevel = this.ReportService.wideareaPartImpactLevel(date);
	}
	
	private ImpactLevelNationwideVO nationareaPartImpactLevel(Date date) throws Exception{
		ImpactLevelNationwideVO wideareaPartImpactLevel = new ImpactLevelNationwideVO();
		return wideareaPartImpactLevel = this.ReportService.nationareaPartImpactLevel(date);
	}
	
	private ImpactLevelCityCountVO cityImpactLevelCountHealth(Date date) throws Exception{
		ImpactLevelCityCountVO wideareaPartImpactLevel = new ImpactLevelCityCountVO();
		return wideareaPartImpactLevel = this.ReportService.cityPartHealthLevle(date);
	}
	
	private List<ImpactInfoNwVO> impactInfoNw(Date date,int how,int wa_code) throws Exception{
		List<ImpactInfoNwVO> impactInfoNwList = new ArrayList();
		if(how==1) {
			impactInfoNwList = this.ReportService.impactInfo(date,wa_code);
		}else {
			impactInfoNwList = this.ReportService.impactInfoNw(date);
		}
		String[] keywordList = {"일반인",	"고령자",	"야외노동자",  "1인가구",	"만성질환자",	"저소득계층",	"건설업",	"제조업",	"사무직 및 서비스업",	"사과",	"배","복숭아",	"포도",
				"인삼",	"고추",	"수박",	"넙치",	"가자미",	"놀래미",	"조피볼락","전복",	"소","돼지",	"가금류",	"교통","전력"};
		boolean hasKeyword = false;
		for(String keyword : keywordList) {
			for (ImpactInfoNwVO impactInfoNw : impactInfoNwList) {
				if (impactInfoNw.getNw_division().equals(keyword)) {
					impactInfoNw.setNw_influence_phrase("&#149; " + impactInfoNw.getNw_influence_phrase());
					hasKeyword = true;
					break;
				}else {
					hasKeyword = false;
				}
			}
			if (!hasKeyword) {
				ImpactInfoNwVO impactInfoNwVO = new ImpactInfoNwVO();
				impactInfoNwVO.setNw_division(keyword);
				impactInfoNwVO.setNw_influence_phrase("-");
				impactInfoNwList.add(impactInfoNwVO);
			}
		}
		return impactInfoNwList;
	}
	
	private List<CounterMeasuresNwVO> counterMeasuresNw(Date date,int how,int wa_code) throws Exception{
		List<CounterMeasuresNwVO> cmNwList = new ArrayList();
		String[] keywordList = {"일반인",	"고령자",	"야외노동자",  "1인가구",	"만성질환자",	"저소득계층",	"건설업",	"제조업",	"사무직 및 서비스업",	"사과",	"배","복숭아",	"포도",
				"인삼",	"고추",	"수박",	"넙치",	"가자미",	"놀래미",	"조피볼락","전복",	"소","돼지",	"가금류",	"교통","전력"};
		if(how==1) {
			cmNwList =this.ReportService.counterMeasures(date,wa_code);
		}else {
			cmNwList =this.ReportService.counterMeasuresNw(date);
		}
		boolean hasKeyword = false;
		for (String keyword : keywordList) {
		    for (CounterMeasuresNwVO cmNw : cmNwList) {
		        if (cmNw.getNw_division().equals(keyword)) {
		        	cmNw.setNw_response_phrase("&#149; " + cmNw.getNw_response_phrase());
		            hasKeyword = true;
		        }
		    }
		    if (!hasKeyword) {
		        CounterMeasuresNwVO cmNwVO = new CounterMeasuresNwVO();
		        cmNwVO.setNw_division(keyword);
		        cmNwVO.setNw_response_phrase("-");
		        cmNwList.add(cmNwVO);
		    }
		    hasKeyword = false;
		}
		return cmNwList;
	}
	
	
	
	
	@RequestMapping(value = "/report2/all.do", method = RequestMethod.GET)
	public String selectGetReport2(HttpServletRequest request, HttpSession session, HttpServletResponse response, Model model,@RequestParam("date") String date,@RequestParam("cityName") String cityName) throws Exception{
		int ctCode = report2SelectCtCode(cityName);
		
		model.addAttribute("selectLaLoCode", selectLaLoCode(cityName));
		model.addAttribute("date", date);
		model.addAttribute("cityName", cityName);
	    return "main/report2";
	}
	
	@RequestMapping(value = "/report2/all.do", method = RequestMethod.POST)
	public @ResponseBody Object selectPostReport2(HttpServletRequest request, HttpSession session, HttpServletResponse response, Model model, 
			@RequestParam String date,
			@RequestParam String cityName) throws Exception{
			
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date dateSelect = dateFormat.parse(date);
			Map selectLaLoCode = new HashMap();
			
			
			selectLaLoCode = selectLaLoCode(cityName);
			int ctCode = report2SelectCtCode(cityName);
			
			Map map = new HashMap();
			
			
			map.put("impactLevelCt", impactLevelCt(dateSelect,ctCode));
			map.put("impactInfoCt", impactInfoCt(dateSelect,ctCode));
			map.put("counterMeasuresCt", counterMeasuresCt(dateSelect,ctCode));
			map.put("selectLaLoCode", selectLaLoCode(cityName));
			map.put("cityNameAjax",cityName);
			map.put("dateAjax",date);
			map.put("selectLaLoCode",selectLaLoCode);
			
			System.out.println("22번"+map);
			
	    return map;
	}
	
	
	@RequestMapping(value = "/report2/wideA.do", method = RequestMethod.GET)
	public @ResponseBody Object selectPostReport2(HttpServletRequest request, HttpSession session, HttpServletResponse response, Model model, 
			@RequestParam int wa_code) throws Exception{
			
			List<String> selectCtName = new ArrayList<>();
			selectCtName = this.ReportService.selectCityName(wa_code);
			
			Map map = new HashMap();
			map.put("selectCtName",selectCtName);
	    return map;
	}
	
	
	private int report2SelectCtCode(String cityName) throws Exception{
		int ctCode = this.ReportService.selectCtCode(cityName);
		return  ctCode;
	}
	
	private Map impactLevelCt(Date date,int ctCode) throws Exception{
		Map impactInfoNwList = new HashMap();
			impactInfoNwList = this.ReportService.impactLevelCt(date,ctCode);
		return impactInfoNwList;
	}
	
	private List<Map> impactInfoCt(Date date,int ctCode) throws Exception{
		List<Map> impactInfoNwList = new ArrayList();
			impactInfoNwList = this.ReportService.impactInfoCt(date,ctCode);
		return impactInfoNwList;
	}
	
	private List<Map> counterMeasuresCt(Date date,int ctCode) throws Exception{
		List<Map> cmNwList = new ArrayList();
			cmNwList =this.ReportService.counterMeasuresCt(date,ctCode);
		return cmNwList;
	}
	
	private Map selectLaLoCode(String cityName) throws Exception{
			Map selectLaLoCode = new HashMap();
			selectLaLoCode = this.ReportService.selectLaLoCode(cityName);
		return selectLaLoCode;
	}
	
}
