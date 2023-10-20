package business.biz.admin;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import org.json.simple.JSONObject;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import business.biz.Constants;
import business.biz.rxutil.DownloadView;
import business.egov.cmm.EgovWebUtil;
import common.util.WebUtil;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import common.base.BaseController;

@Controller
@SuppressWarnings({"rawtypes", "unused"})
public class AdminController extends BaseController {
	
	private String geoServerUrl = "http://210.113.102.169:8080/geoserver";
	
	@Resource(name ="AdminService")
	private AdminService adminService;
	
	private EgovMap paramMap(HttpServletRequest request) throws UnsupportedEncodingException{
		EgovMap paramMap = new EgovMap();

		Enumeration enu= request.getParameterNames();
		String name = "";
		String arr_value = "";

		while(enu.hasMoreElements()){
		 name = (String)enu.nextElement();
		 String[] value = request.getParameterValues(name);
		 int valueSize = value.length;

			 if(valueSize == 1){ //배열이 아닌것
				 Set keySet = request.getParameterMap().keySet();
					Iterator<?> iter = keySet.iterator();
					while(iter.hasNext()){
						String key = (String) iter.next();
						paramMap.put(key, request.getParameter(key));
					}
			 }

			 if(valueSize > 1){ //배열인것
				 ArrayList<String> tempList = new ArrayList<String>();
				 for(int j=0; j<valueSize; j++){
					 tempList.add(value[j]);
				 }
				 
				 String newName = new String(name);
				 if(newName.indexOf('[') != -1) {
					 newName = newName.substring(0, newName.indexOf('['));
				 }
				 paramMap.put(newName, tempList);
			 }
		}
		
		return paramMap;
	}
	
	@RequestMapping(value="/api/admin/GetAgentActiveList.do", method=RequestMethod.POST)
    @ResponseBody
    public Object GetAgentActiveList(HttpServletRequest request) throws Exception{
		
		EgovMap map = this.paramMap(request);
        
        List userList = adminService.GetAgentActiveList(map);
		
        JSONObject returnJson = new JSONObject();
        returnJson.put("db_agent_list", userList);

        return returnJson;
	}
}
