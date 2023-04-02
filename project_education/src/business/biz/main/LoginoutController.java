package business.biz.main;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import business.sys.sec.user.LoginRequest;
import common.base.BaseController;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class LoginoutController  extends BaseController {
	
	@Resource(name ="LoginService")
	private LoginService loginService;
	
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
    public ModelAndView loginForm(LoginRequest logReq, @CookieValue(value="REMEMBER", required=false) Cookie rememberCookie) throws Exception {
    	ModelAndView mv = new ModelAndView();
    	String viewName = "main/login";
    	
    	System.out.println("login.do");
    	
    	mv.setViewName(viewName);
    	return mv;
    }
	
	@RequestMapping(value ="/loginSuccessPage.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView loingSuccessPage(HttpServletRequest request, HttpSession session, ModelAndView mv) throws Exception{
		String viewName = "main/main";
		mv.setViewName(viewName);
		
		return mv;
	}
	
	/**
     * @param request
     * @param 
     * @return
     * @throws Exception
     */
	@RequestMapping(value="/checkSession.do", method=RequestMethod.POST)
    @ResponseBody
	public Object CheckSession(HttpServletRequest request) throws Exception{
		
		HttpSession httpSession = request.getSession(true);
	        
  	    Enumeration<String> attrNames = httpSession.getAttributeNames();                

		while(attrNames.hasMoreElements()){
			String attrName = attrNames.nextElement();
			Object attrValue = httpSession.getAttribute(attrName);
			System.out.println(attrName + " : " + attrValue);
		}
		
		
        JSONObject returnJson = new JSONObject();
        returnJson.put("data", httpSession.getAttribute("user_info"));
        
		return returnJson;
		
	}
	
	/*	
	 * Type : JSON
	 * AJAX
	 * 로그
	 * 
	 * */
	@RequestMapping(value="/loginProc.do", method=RequestMethod.POST)
    @ResponseBody
	public JSONObject DoLogin(HttpServletRequest request) throws Exception{
		
		HashMap tempM = super.getHashMapFromRequestBody(request);
        
        List tempList = loginService.LoginProc(tempM);

        JSONObject returnJson = new JSONObject();
		if(!tempList.isEmpty()) {
			
			HashMap userInfoMap = (HashMap) tempList.get(0);
	        returnJson.put("db_select_count", tempList.size());
	        
	        
	        if(userInfoMap.get("use_yn").equals("Y")) {
		        	if(userInfoMap.get("is_valid_pw").equals("SUCCESS")) {

				        boolean isRegistered = super.setUserInfoToSession(request, userInfoMap);

				        HashMap userSessionData = super.getUserInfo(request);
				        if(isRegistered) {
					    	// Success Login
					        returnJson.put("data", userSessionData);
					        returnJson.put("msg", "SUCCESS");
				        }else {
				        	returnJson.put("data", userSessionData);
					        returnJson.put("msg", "FAIL");
				        }
				        
				    }else {

				    	// others
				    	// 1. wrong pw
				    	// update wrong login count
				    	returnJson.put("data", null);
				    	returnJson.put("msg", userInfoMap.get("is_valid_pw"));
				    }
				    
	        }else {
	    		returnJson.put("data", null);
		    	returnJson.put("msg", "해당 계정은 사용중이 아닙니다.");
	        }
		    
		}else {

			returnJson.put("data", null);
	    	returnJson.put("msg", "해당 아이디가 없습니다.");
		}
		
		System.out.println(returnJson);
		return returnJson;
	}
	
	
	/**
     * @param request
     * @param 
     * @return
     * @throws Exception
     */
	@RequestMapping("/loginOut.do")
    public String LogOut(HttpServletRequest request, ModelMap model) throws Exception {
		HttpSession httpSession = request.getSession(true);
		httpSession.removeAttribute("user_info");
	    return "main/login";
    }
	
}
