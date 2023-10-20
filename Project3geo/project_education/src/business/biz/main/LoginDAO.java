package business.biz.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import business.egov.cmm.service.impl.EgovComAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("LoginDAO")
public class LoginDAO extends EgovComAbstractDAO{
	
	@Autowired
	private SqlSessionTemplate session;
	
	public List LoginProc(HashMap map) {
		return selectList("Login.loginProc", map);
	}
	
	/*
	 * public int UpdateWrongCount(HashMap map){ return
	 * selectOne("Login.updateWrongCount", map); }
	 */
}
