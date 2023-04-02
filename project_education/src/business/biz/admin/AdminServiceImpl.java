package business.biz.admin;

import javax.annotation.Resource;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("AdminService")
@Transactional
public class AdminServiceImpl extends EgovAbstractServiceImpl implements AdminService {
	
	@Resource(name="AdminDAO")
	private AdminDAO AdminDAO;
	
	public List<EgovMap> GetAgentActiveList(EgovMap map) {
		return this.AdminDAO.GetAgentActiveList(map);
	}
}
