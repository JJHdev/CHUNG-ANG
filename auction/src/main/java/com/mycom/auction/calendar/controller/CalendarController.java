package com.mycom.auction.calendar.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mycom.auction.calendar.domain.Calendar;
import com.mycom.auction.calendar.service.CalendarService;
import com.mycom.auction.member.domain.Member;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

//
//캘린더의 컨트롤러 역할을 하는 클래스입니다.
@Controller
public class CalendarController {

	private static final Logger log = LoggerFactory.getLogger(CalendarController.class);

	// private final ScheduleService sheduleService;
	@Autowired
	CalendarService calendarService;

	// 사용자의 일정 조회를 위한 메서드 R
	@GetMapping("/calendarView")
	public String calendar2(Model model, HttpServletRequest httpServletRequest) {
		HttpSession session = httpServletRequest.getSession();
		Member authUser = (Member) session.getAttribute("AUTHUSER");
		String id = authUser.getId();
		model.addAttribute("AUTHUSER", authUser);
		return "/calendar/fullcalendar";
	}

	// 사용자 일정 조회 캘린더
	@ResponseBody
	@RequestMapping(value = "/events", params = "method=data") // ajax 데이터 전송 URL
	public List<Map<String, Object>> getEvent(Model model, HttpServletRequest httpServletRequest) {
		HttpSession session = httpServletRequest.getSession();
		Member authUser = (Member) session.getAttribute("AUTHUSER");
		String id = authUser.getId();
		model.addAttribute("AUTHUSER", authUser);

		String format = "yyyy-MM-dd";
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		JSONArray jsonArr = new JSONArray();
		JSONObject jsonObj = new JSONObject();
		HashMap<String, Object> hash = new HashMap<>();
		List<Calendar> list = calendarService.getCalendarAllList2();
		for (Calendar calendar : list) {

			hash.put("title", calendar.getCalenTitle());
			hash.put("id", calendar.getCalenNo());
			hash.put("end", sdf.format(calendar.getCalenEnd()));
			hash.put("start", sdf.format(calendar.getCalenStart()));
			jsonObj.putAll(hash);
			jsonArr.add(jsonObj);
		}
		return jsonArr;
	}

	/*
	 * @GetMapping(value="/calendarView2")
	 * 
	 * @ResponseBody public ModelAndView calendar2(Model model) throws Exception{
	 * 
	 * ModelAndView mv = new ModelAndView();
	 * mv.setViewName("calendar/fullcalendar"); mv.addObject("data",
	 * calendarService.getCalendarAllList2()); return mv; }
	 */

	// 관리자의 일정관리를 위한 목록 조회 메서드 R
	@GetMapping("/adminCalendar")
	public String adminCaelndar(Model model, @RequestParam(name = "ano", required = false, defaultValue = "1") int no,
			HttpServletRequest httpServletRequest) throws Exception {
		HttpSession session = httpServletRequest.getSession();
		Member authUser = (Member) session.getAttribute("AUTHUSER");
		String id = authUser.getId();
		model.addAttribute("AUTHUSER", authUser);
		List<Calendar> list = calendarService.getCalendarAllList();

		model.addAttribute("list", list);
		return "/calendar/adminCalendar";
	}

	// 생성을 위한 메서드
	// 입력폼보여주기
	// 요청방식 get
	// 요청주소 ~컨페/article/addForm
	@GetMapping("/calendar/addForm")
	public String insertCalendarForm(Model model, HttpServletRequest httpServletRequest) {
		// 1.파라미터받기 //2.비즈니스로직
		// 3.model
		// 원칙적으로는 (로그인한 user가) 글입력 권한을 가진 사용자가 글입력해야지만
		// 여기에서는 임시로 세션에 정보를 저장하여 진행하겠다
		HttpSession session = httpServletRequest.getSession();
		Member authUser = (Member) session.getAttribute("AUTHUSER");
		model.addAttribute("AUTHUSER", authUser);
		// session.setAttribute("isLogOn",true);
		// session.setAttribute("AUTHUSER_ID", "hongid");//임시
		// 4.view
		return "/calendar/addForm";
	}

	@PostMapping("/calendar/addForm")
	public String insertCalendarForm(Model model, String calenTitle,
			@DateTimeFormat(pattern = "yyyy-MM-dd") Date calenStart,
			@DateTimeFormat(pattern = "yyyy-MM-dd") Date calenEnd, HttpServletRequest httpServletRequest) {
		HttpSession session = httpServletRequest.getSession();
		Member authUser = (Member) session.getAttribute("AUTHUSER");
		String id = authUser.getId();
		model.addAttribute("AUTHUSER", authUser);
		Calendar calendar = new Calendar();

		calendar.setCalenTitle(calenTitle);
		calendar.setCalenStart(calenStart);
		calendar.setCalenEnd(calenEnd);
		calendarService.insertCalendar(calendar);
		return "redirect:/adminCalendar";
	}

	// 수정폼보여주기
	// 방식get
	// 요청주소 ~컨페/article/updateForm?ano=글번호 U
	@GetMapping("/calendar/updateForm")
	public String updateArticleForm(@RequestParam("ano") int no, Model model, HttpServletRequest httpServletRequest)
			throws Exception {
		// db에서 특정게시글의 상세정보를 가져오기 진행예정
		Calendar calendar = calendarService.getCalendarDetail(no);
		HttpSession session = httpServletRequest.getSession();
		Member authUser = (Member) session.getAttribute("AUTHUSER");
		String id = authUser.getId();
		model.addAttribute("AUTHUSER", authUser);
		model.addAttribute("calendar", calendar);
		return "/calendar/updateForm";
	}

	// 수정처리
	// 수정페이지에서 <form action="${contextPath}/article/updateForm" method="post">
		@PostMapping("/calendar/updateForm")
		    public ModelAndView submitUpdateForm(Calendar calendar,
		    		ModelAndView mv,HttpServletRequest httpServletRequest) throws Exception {
			HttpSession session = httpServletRequest.getSession();
			Member authUser = (Member) session.getAttribute("AUTHUSER");
			String id = authUser.getId();
			mv.addObject("AUTHUSER",authUser);
			System.out.println("/calendar/updateForm1 진입");
			
			System.out.println(httpServletRequest.getParameter("calenNo"));
			System.out.println(httpServletRequest.getParameter("calenTitle"));
			System.out.println(httpServletRequest.getParameter("calenStart"));
			System.out.println(httpServletRequest.getParameter("calenEnd"));
			//1.파라미터받기
		    	//2.비즈니스로직수행
			
			  int cnt = calendarService.updateCalendar(calendar); 
			 if(cnt==1) { //성공이면
			 //* 목록보기(여기에서는 resultView) //아래는 요청메서드의 리턴유형이 String인경우의 redirect처리방법 // return
			 //* redirect:요청주소 // return "redirect:/article/req1";
				 mv.setViewName("redirect:/adminCalendar");}
			 else{
				 mv.setViewName("redirect:/calendar/updateForm?ano="+calendar.getCalenNo());
			  //redirect용 view mv.setViewName("/calendar/test"); }else { //실패이면 수정폼을 보여주기
			//아래는 요청메서드의 리턴유형이 String인경우의 redirect처리방법 // return redirect:요청주소 // return
			 // "redirect:/article/updateForm?ano="+article.getArticleNo();
			 
			  }
	    	//3.Model //4.View
	    	return mv;
		    	//3.Model //4.View
		}

	// 삭제를 위한 메서드 D
	// 삭제하기
	// get방식,post방식
	// 요청주소 ~컨페/article/delete?ano=글번호
	@RequestMapping(value = "/calendar/delete", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView deleteCalendar(@RequestParam("ano") int no, Model model, HttpServletRequest httpServletRequest)
			throws Exception {
		HttpSession session = httpServletRequest.getSession();
		Member authUser = (Member) session.getAttribute("AUTHUSER");
		String id = authUser.getId();
		model.addAttribute("AUTHUSER", authUser);
		int cnt = calendarService.deleteCalendar(no);
		System.out.println("cnt=" + cnt);
		// delete가 적용된 레코드수를 반환받는다
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/adminCalendar");
		return mv;
	}

}
