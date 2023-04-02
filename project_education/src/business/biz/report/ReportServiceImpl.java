package business.biz.report;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import business.egov.cmmvo.CounterMeasuresNwVO;
import business.egov.cmmvo.ImpactInfoNwVO;
import business.egov.cmmvo.ImpactLevelCityCountVO;
import business.egov.cmmvo.ImpactLevelNationwideVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("ReportService")
@Transactional
public class ReportServiceImpl extends EgovAbstractServiceImpl implements ReportService{

	@Resource(name="ReportDAO")
	private ReportDAO ReportDAO;

	@Override
	public ImpactLevelCityCountVO cityPartHealthLevle(Date date) {
		return this.ReportDAO.cityPartHealthLevle(date);
	}

	@Override
	public List<ImpactInfoNwVO> impactInfoNw(Date date) {
		return this.ReportDAO.impactInfoNw(date);
	}

	@Override
	public List<CounterMeasuresNwVO> counterMeasuresNw(Date date) {
		return this.ReportDAO.counterMeasuresNw(date);
	}

	@Override
	public List<ImpactInfoNwVO> impactInfo(Date date, int wa_code) {
		return this.ReportDAO.impactInfo(date,wa_code);
	}

	@Override
	public List<CounterMeasuresNwVO> counterMeasures(Date date, int wa_code) {
		return this.ReportDAO.counterMeasures(date,wa_code);
	}

	
	 @Override public int isDataSelect(Date dateSelect) { 
		 return	this.ReportDAO.isDataSelect(dateSelect); }
	 
	
	@Override
	public ImpactLevelCityCountVO cityImpactLevleCount(Date selectDate) {
		return this.ReportDAO.cityImpactLevleCount(selectDate);
	}

	@Override
	public List wideareaPartImpactLevel(Date selectDate) {
		return this.ReportDAO.wideareaPartImpactLevel(selectDate);
	}

	@Override
	public ImpactLevelNationwideVO nationareaPartImpactLevel(Date selectDate) {
		return this.ReportDAO.nationareaPartImpactLevel(selectDate);
	}

	@Override
	public List selectCityName(int wa_code) {
		return this.ReportDAO.selectCityName(wa_code);
	}

	@Override
	public int selectCtCode(String cityName) {
		return this.ReportDAO.selectCtCode(cityName);
	}

	@Override
	public Map impactLevelCt(Date date,int ctCode) {
		return this.ReportDAO.impactLevelCt(date,ctCode);
	}
	
	@Override
	public List<Map> impactInfoCt(Date date,int ctCode) {
		return this.ReportDAO.impactInfoCt(date,ctCode);
	}

	@Override
	public List<Map> counterMeasuresCt(Date date,int ctCode) {
		return this.ReportDAO.counterMeasuresCt(date,ctCode);
	}

	@Override
	public Map selectLaLoCode(String cityName) {
		System.out.println("7번");
		return this.ReportDAO.selectLaLoCode(cityName);
	}
	
}
