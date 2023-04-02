package business.sys.sec.user;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

/**
 * 사용자 로그인, 회원가입, 세션 처리 등 -------------------------------------------------- 수정일
 * 수정자 수정내용 -------------------------------------------------- 2018.08.13
 * vestap개발 최초 작성 --------------------------------------------------
 * 
 * @author vestap 개발
 * @since 2018.08.13
 *
 */

@Controller
public class UserAccessController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserAccessController.class);
	
	@RequestMapping(value = "/loginPage.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model,HttpServletRequest request) {
		return "user/login";
	}

	/*@RequestMapping(value = "/loginSuccessPage.do", method = { RequestMethod.GET, RequestMethod.POST })
	public RedirectView loginSuccess(HttpServletRequest request) {
		return new RedirectView("/main.do");
	}*/
	
	@RequestMapping(value = "/closeSession.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String closeSession(ModelMap model) {
		return "user/login";
	}

	@RequestMapping(value = "/overlapSession.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String overlapSession(ModelMap model) {
		return "exception/overlap-session";
	}

	@RequestMapping(value = "/accessDenied.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String accessDenied(ModelMap model) {
		return "exception/access-denied";
	}

}
