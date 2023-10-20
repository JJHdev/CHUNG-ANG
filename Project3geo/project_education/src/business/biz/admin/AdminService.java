package business.biz.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface AdminService {
	public List<EgovMap> GetAgentActiveList(EgovMap map);
}
