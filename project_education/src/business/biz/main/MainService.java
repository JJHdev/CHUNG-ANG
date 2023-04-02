package business.biz.main;

import java.util.Date;
import java.util.List;
import java.util.Map;

import business.egov.cmmvo.ImpactLevelCityCountVO;
import business.egov.cmmvo.ImpactLevelNationwideVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface MainService {
	
	public List<EgovMap> ChkWheter(EgovMap map);
	
	public List ChkFirstMenu(EgovMap map);

}
