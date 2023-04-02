package business.biz.main;

import javax.annotation.Resource;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import business.egov.cmmvo.ImpactLevelCityCountVO;
import business.egov.cmmvo.ImpactLevelNationwideVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("MainService")
@Transactional
public class MainServiceImpl extends EgovAbstractServiceImpl implements MainService {
	
	@Resource(name="MainDAO")
	private MainDAO MainDAO;
	
	public List<EgovMap> ChkWheter(EgovMap map) {
		return this.MainDAO.ChkWheter(map);
	}
	
	public List ChkFirstMenu(EgovMap map) {
		return this.MainDAO.ChkFirstMenu(map);
	}

}
