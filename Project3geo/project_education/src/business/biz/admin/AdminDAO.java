package business.biz.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import business.egov.cmm.service.impl.EgovComAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("AdminDAO")
public class AdminDAO extends EgovComAbstractDAO{
	
	@Autowired
	private SqlSessionTemplate session;
	
	public List<EgovMap> GetAgentActiveList(EgovMap map) {
		return selectList("admin.getAgentActiveList", map);
	}
}
