package business.biz.report;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import business.egov.cmmvo.CounterMeasuresNwVO;
import business.egov.cmmvo.ImpactInfoNwVO;
import business.egov.cmmvo.ImpactLevelCityCountQuery;
import business.egov.cmmvo.ImpactLevelCityCountVO;
import business.egov.cmmvo.ImpactLevelNationwideVO;
import business.egov.cmmvo.ImpactLevelWideareaVO;
import business.egov.cmm.service.impl.EgovComAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("ReportDAO")
public class ReportDAO extends EgovComAbstractDAO {

	public ImpactLevelCityCountVO cityPartHealthLevle(Date date) {
		ImpactLevelCityCountVO cityPartHealthLevle = new ImpactLevelCityCountVO();
		ImpactLevelCityCountQuery impactLevelCityCountQuery = new ImpactLevelCityCountQuery();
		List<String> columns = Arrays.asList("ct_health", "ct_seniors", "ct_general_people", "ct_outdoor_workers",
				"ct_chronic_patients", "ct_single_person", "ct_low_income", "ct_industry_no",
				"ct_construction_industry", "ct_manufacturing_industry", "ct_office_service", "ct_agriculture",
				"ct_apple", "ct_pears", "ct_peach", "ct_grape", "ct_ginseng", "ct_peppers", "ct_watermelons",
				"ct_livestock_industry", "ct_cow", "ct_pig", "ct_poultry", "ct_aquaculture", "ct_flounder", "ct_tuna",
				"ct_scorpionfish", "ct_jacopever", "ct_abalone", "ct_traffic", "ct_road", "ct_train", "ct_electric",
				"ct_fire");
		impactLevelCityCountQuery.setColumns(columns);
		impactLevelCityCountQuery.setSelectDate(date);
		return cityPartHealthLevle = selectOne("report.impactLevelCityCountVO", impactLevelCityCountQuery);
	}

	public ImpactLevelCityCountVO cityImpactLevleCount(Date selectDate) {
		ImpactLevelCityCountVO impactLevelCityTotalVO = new ImpactLevelCityCountVO();
		return impactLevelCityTotalVO = selectOne("report.cityImpactLevleCount", selectDate);
	}

	public List wideareaPartImpactLevel(Date selectDate) {
		List<ImpactLevelWideareaVO> impactLevelWideareaVO = selectList("report.ImpactWaPart", selectDate);
		return impactLevelWideareaVO;
	}

	public ImpactLevelNationwideVO nationareaPartImpactLevel(Date selectDate) {
		ImpactLevelNationwideVO impactLevelNationwideVO = selectOne("report.ImpactNwPart", selectDate);
		return impactLevelNationwideVO;
	}

	public List<ImpactInfoNwVO> impactInfoNw(Date date) {
		List<ImpactInfoNwVO> impactInfoNw = new ArrayList<ImpactInfoNwVO>();
		return impactInfoNw = selectList("report.impactInfoNw", date);
	}

	public List<CounterMeasuresNwVO> counterMeasuresNw(Date date) {
		List<CounterMeasuresNwVO> cmNw = new ArrayList<CounterMeasuresNwVO>();
		return cmNw = selectList("report.counterMeasuresNw", date);
	}

	public List<ImpactInfoNwVO> impactInfo(Date date, int wa_code) {
		List<ImpactInfoNwVO> impactInfoNw = new ArrayList<ImpactInfoNwVO>();
		Map map = new HashMap();
		map.put("date", date);
		map.put("wa_code", wa_code);
		impactInfoNw = selectList("report.impactInfo", map);
		return impactInfoNw;
	}

	public List<CounterMeasuresNwVO> counterMeasures(Date date, int wa_code) {
		List<CounterMeasuresNwVO> cmNw = new ArrayList<CounterMeasuresNwVO>();
		Map map = new HashMap();
		map.put("date", date);
		map.put("wa_code", wa_code);
		cmNw = selectList("report.counterMeasures", map);
		return cmNw;
	}

	
	 public int isDataSelect(Date dateSelect) { 
	 return  selectOne("report.isDataSelect", dateSelect); 
	 }

	public List selectCityName(int wa_code) {
		List<String> cityName = new ArrayList<String>();
		String wideName = "no";
		switch (wa_code) {
		    case 1: wideName = "서울.인천.경기도";  break;
		    case 2: wideName = "부산.울산.경상남도";  break;
		    case 3: wideName = "대구.경상북도";      break;
		    case 4: wideName = "광주.전라남도";      break;
		    case 5: wideName = "전라북도";          break;
		    case 6: wideName = "대전.세종.충청남도";  break;
		    case 7: wideName = "충청북도";         break;
		    case 8: wideName = "강원도";        break;
		    case 9: wideName = "제주도";        break;
		    default: wideName = "no";       break;
		}
		cityName = selectList("report.selectCityName", wideName);
		return cityName;
	}

	public int selectCtCode(String cityName) {
		int ctCode = selectOne("report.selectCtCode", cityName);
		return ctCode;
	}
	
	
	
	public Map impactLevelCt(Date date,int ctCode) {
		Map mapPara = new HashMap();
		Map mapResu = new HashMap();
		
		mapPara.put("date", date);
		mapPara.put("ctCode", ctCode);
		
		mapResu = selectOne("report.impactLevelCt",mapPara);
		return mapResu;
	}
	
	public List<Map> impactInfoCt(Date date,int ctCode) {
		Map mapPara = new HashMap();
		List<Map> mapResu = new ArrayList();
		
		mapPara.put("date", date);
		mapPara.put("ctCode", ctCode);
		
		
		mapResu = selectList("report.impactInfoCt",mapPara);
		return mapResu;
	}

	public List<Map> counterMeasuresCt(Date date,int ctCode) {
		Map mapPara = new HashMap();
		List<Map> mapResu = new ArrayList();
		
		
		mapPara.put("date", date);
		mapPara.put("ctCode", ctCode);
		
		mapResu = selectList("report.counterMeasuresCt",mapPara);
		return mapResu;
	}

	public Map selectLaLoCode(String cityName) {
		Map mapResu = new HashMap();
		mapResu = selectOne("report.selectLaLoCode",cityName);
		return mapResu;
	}

}
