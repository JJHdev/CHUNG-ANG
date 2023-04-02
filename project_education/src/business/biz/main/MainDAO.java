package business.biz.main;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import business.egov.cmmvo.ImpactLevelCityCountVO;
import business.egov.cmmvo.ImpactLevelNationwideVO;
import business.egov.cmmvo.ImpactLevelWideareaVO;
import business.egov.cmm.service.impl.EgovComAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("MainDAO")
public class MainDAO extends EgovComAbstractDAO{
	
	@Autowired
	private SqlSessionTemplate session;
	
	public List<EgovMap> ChkWheter(EgovMap map) {
		return selectList("main.ChkWheter", map);
	}
	
	public List ChkFirstMenu(EgovMap map) {
		return selectList("main.ChkFirstMenu", map);
	}
	
}
