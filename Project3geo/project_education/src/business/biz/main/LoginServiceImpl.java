package business.biz.main;

import javax.annotation.Resource;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("LoginService")
@Transactional
public class LoginServiceImpl extends EgovAbstractServiceImpl implements LoginService {
	
	@Resource(name="LoginDAO")
	private LoginDAO LoginDAO;
	
	public List LoginProc(HashMap map) {
		return this.LoginDAO.LoginProc(map);
	}

	/*
	 * @Override public int UpdateWrongCount(HashMap map) { return
	 * this.LoginDAO.UpdateWrongCount(map); }
	 */
}
