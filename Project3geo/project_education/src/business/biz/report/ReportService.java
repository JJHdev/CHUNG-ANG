package business.biz.report;

import java.util.Date;
import java.util.List;
import java.util.Map;

import business.egov.cmmvo.CounterMeasuresNwVO;
import business.egov.cmmvo.ImpactInfoNwVO;
import business.egov.cmmvo.ImpactLevelCityCountVO;
import business.egov.cmmvo.ImpactLevelNationwideVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface ReportService {

	public ImpactLevelCityCountVO cityPartHealthLevle(Date date);

	public List<ImpactInfoNwVO> impactInfoNw(Date date);

	public List<CounterMeasuresNwVO> counterMeasuresNw(Date date);

	public List<ImpactInfoNwVO> impactInfo(Date date, int wa_code);

	public List<CounterMeasuresNwVO> counterMeasures(Date date, int wa_code);

	public int isDataSelect(Date dateSelect);
	
	public ImpactLevelCityCountVO cityImpactLevleCount(Date string);

	public List wideareaPartImpactLevel(Date date);

	public ImpactLevelNationwideVO nationareaPartImpactLevel(Date date);

	public List selectCityName(int wa_code);

	public int selectCtCode(String cityName);

	public Map impactLevelCt(Date date,int ctCode);
	
	public List<Map> impactInfoCt(Date date,int ctCode);
	
	public List<Map> counterMeasuresCt(Date date,int ctCode);

	public Map selectLaLoCode(String cityName);
	
}
