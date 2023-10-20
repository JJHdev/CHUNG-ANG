package business.biz.main;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

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

import business.biz.Constants;
import business.egov.cmm.EgovWebUtil;
import business.egov.cmmvo.ImpactLevelCityCountVO;
import business.egov.cmmvo.ImpactLevelNationwideVO;
import common.util.WebUtil;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import common.base.BaseController;


@Controller
public class MainController {
	
	private String geoServerUrl = "http://210.113.102.169:8080/geoserver";
	
	@Resource(name ="MainService")
	private MainService MainService;
	
	private static void initScriptValue(ScriptEngine jsEngine) throws ScriptException {
		jsEngine.eval("JAVASCRIPT CODE INSERT");
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/report.do", method = RequestMethod.GET)
	public ModelAndView Report(HttpServletRequest request, ModelAndView mv, HttpSession session, HttpServletResponse response) throws Exception{
		HttpSession httpSession = request.getSession(true);
		HashMap session1 = (HashMap) httpSession.getAttribute("user_info");

		if(httpSession.getAttribute("user_info") == null) {
			String viewName = "main/login";
			mv.setViewName(viewName);
		} else {
			EgovMap map = new EgovMap();
			map.put("agentNm", session1.get("user_agent_code"));
			map.put("menuNm", "main");
			List<EgovMap> Field = this.MainService.ChkWheter(map);
			
			if(Field.size() != 0) {
				String viewName = "main/report";
				mv.setViewName(viewName);
			} else {
				  EgovMap map2 = new EgovMap();
				  
				  map2.put("division", "heat"); 
				  map2.put("agentNm", session1.get("user_agent_code")); 
				  
				  String viewName = "main/report";
				  mv.setViewName(viewName);
			}
		}
		
		try {
	    	System.out.println("report.do");
	    	}catch (Exception e){
	    		System.out.println(e);
	    	}
		
		return mv;
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/report-detail.do", method = RequestMethod.GET)
    public ModelAndView reportDetail(HttpServletRequest request, ModelAndView mv, HttpSession session) throws Exception{
		HttpSession httpSession = request.getSession(true);
		
		HashMap session1 = (HashMap) httpSession.getAttribute("user_info");
		
		if(httpSession.getAttribute("user_info") == null) {
			String viewName = "main/login";
			mv.setViewName(viewName);
		} else {
			EgovMap map = new EgovMap();
			map.put("agentNm", session1.get("user_agent_code"));
			map.put("menuNm", "report");
			List<EgovMap> Field = this.MainService.ChkWheter(map);
			
			if(Field.size() != 0) {
				String viewName = "main/report2";
				mv.setViewName(viewName);
			} else {
				  EgovMap map2 = new EgovMap();
				  
				  map2.put("division", "heat"); 
				  map2.put("agentNm", session1.get("user_agent_code")); 
				  
				  String viewName = "main/report2";
				  mv.setViewName(viewName);
			}
		}
		
    	try {
    	System.out.println("report-detail.do");
    	}catch (Exception e){
    		System.out.println(e);
    	}
    	
    	return mv;
    	
    }
	
	@RequestMapping(value = "/selectWfsLayer.do")
	@ResponseBody
	public void selectWfsLayer(
		HttpServletRequest request, 
		HttpServletResponse response,
		@RequestParam(value = "GWC", defaultValue = "false") String geoWebCache,
		@RequestParam(value = "WP", defaultValue = "/business") String workspace
		) {
		
		String sWMSURL = null;	
		if(geoWebCache.equalsIgnoreCase("false")) {
			sWMSURL = geoServerUrl  + "/wfs";
		}

		response.setContentType("application/json;charset=utf-8");
		EgovWebUtil.getProxyGet(sWMSURL, request, response);
	}
	
	private EgovMap paramMap(HttpServletRequest request) throws UnsupportedEncodingException{
		EgovMap paramMap = new EgovMap();

		Enumeration enu= request.getParameterNames();
		String name = "";
		String arr_value = "";

		while(enu.hasMoreElements()){
		 name = (String)enu.nextElement();
		 String[] value = request.getParameterValues(name);
		 int valueSize = value.length;

			 if(valueSize == 1){
				 Set keySet = request.getParameterMap().keySet();
					Iterator<?> iter = keySet.iterator();
					while(iter.hasNext()){
						String key = (String) iter.next();
						paramMap.put(key, request.getParameter(key));
					}
			 }

			 if(valueSize > 1){
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
	
}
