package com.mycom.auction.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mycom.auction.member.domain.Criteria;
import com.mycom.auction.member.domain.Member;
import com.mycom.auction.member.domain.Page;
import com.mycom.auction.member.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	//main
	@RequestMapping(value="/main")
	public String main() {
		return "main";
	}
	//회원가입폼
	@GetMapping("/member/join")
	public String MemberjoinFrm(@ModelAttribute("NewMember") Member member) {
		return "member/joinFrm";
	}
	//회원가입처리
	@PostMapping("/member/join")
	public String MemberJoin(@ModelAttribute("NewMember") Member member) throws Exception {
		memberService.memberJoin(member);
		return "member/loginFrm";
	}
	//회원상세조회
/*	@GetMapping("/member/info")
	public String getMember(@RequestParam("id") String id, Model model) throws Exception {
		Member member = memberService.getMember(id);
		model.addAttribute("member", member);
		return "member/memberInfo";
	}*/
	//회원상세조회
	@GetMapping("/member/info")
	public String getMember(@RequestParam("id") String id, Model model,@ModelAttribute("cri") Criteria cri) throws Exception {
		Member member = memberService.getMember(id);
		model.addAttribute("member", member);
		return "member/memberInfo";
		}
	//회원목록조회
/*	@GetMapping("/member/list")
	public String getMemberList(Model model) throws Exception {
		List<Member> memberlist = memberService.getMemberList();
		model.addAttribute("memberlist", memberlist);
		return "member/memberList";
	}
*/
	//회원목록조회(페이징)
	@GetMapping("/member/list")
	public String getMemberListPaging(Model model,Criteria cri) throws Exception {
		model.addAttribute("memberlist", memberService.getMemberListPaging(cri));
		int total = memberService.totalMember(cri);
		Page page = new Page(cri, total);
		model.addAttribute("page", page);
		return "member/memberList";
	}
	//전체회원수
	@GetMapping("/member/total")
	public String totalMember(@RequestParam("id") String id, Model model,@ModelAttribute("cri") Criteria cri) throws Exception {
		int cnt = memberService.totalMember(cri);
		model.addAttribute("cnt", cnt);
		return "member/resultView";
	}
	//회원정보수정폼
	@GetMapping("/member/update")
	public ModelAndView memberUpdateFrm(ModelAndView mv,@RequestParam("id") String id,@ModelAttribute("NewMember") Member member,@ModelAttribute("cri") Criteria cri) throws Exception {
		member = memberService.getMember(id);
		mv.addObject("member", member);
		mv.addObject("id", id); 
		mv.setViewName("member/updateFrm");
		return mv;
	}
	//회원수정
	@PostMapping("/member/update")
	public ModelAndView memberUpdate(@ModelAttribute("NewMember") Member member,ModelAndView mv) throws Exception {
			
			int cnt = memberService.memberUpdate(member);
			if(cnt==1) {
				mv.setViewName("redirect:/member/info?id="+member.getId());
			}else {
				mv.setViewName("redirect:/member/updateFrm?id="+member.getId());
			}
			return mv;
		}
	//회원탈퇴
	@GetMapping("/member/delete")
	public String memberDelete(@RequestParam("id") String id,HttpSession session) throws Exception {
		if(session!=null) {
			session.invalidate();
			memberService.memberDelete(id);
		}
		return "/acutionGoods/auctionGoodsListPage";
	}
	//로그인폼
	@GetMapping("/member/login")
	public String MemberLoginFrm(@ModelAttribute("NewMember") Member member) {
		return "member/loginFrm";
	}
	//로그인
	@PostMapping("/member/login")
	public String memberLogin(@ModelAttribute("NewMember") Member member, HttpSession session) throws Exception {
		
		Member loginmember = memberService.memberLogin(member);
		
		if(loginmember==null) {
			session.setAttribute("notmember", "아이디와 비밀번호가 일치하지 않습니다.");
			session.setAttribute("url", "/member/login");
			return "member/notLoginMember";			
		}else{
			session.setAttribute("AUTHUSER", loginmember);
		}
		return "/calendar/fullcalendar";
	}
	//로그아웃
	@GetMapping("/member/logout")
	public String memberLogout(HttpSession session) {
		if(session!=null) {
			session.invalidate();
		}
		return "/calendar/fullcalendar";
	}
	//아이디찾기 폼
	@GetMapping("/member/findId")
	public String memberFindIdFrm(@ModelAttribute("NewMember") Member member) {
		return "member/findIdFrm";
	}
	//아이디찾기
	@PostMapping("/member/findId")
	public String memberFindId(@ModelAttribute("NewMember") Member member, Model model) throws Exception {
		Member idFindUser = memberService.memberFindId(member);
	
		if(idFindUser == null) { 
			model.addAttribute("check", 0);
		} else { 
			model.addAttribute("check", 1);
			model.addAttribute("user",idFindUser);
		}
		return "member/findId";
	}
	//비밀번호찾기 폼
	@GetMapping("/member/findPwd")
	public String memberFindPwdFrm(@ModelAttribute("NewMember") Member member) {
		return "member/findPwdFrm";
	}
	//비밀번호찾기
	@PostMapping("/member/findPwd")
	public String memberFindPwd(@ModelAttribute("NewMember") Member member, Model model) throws Exception {
		Member pwdFindUser = memberService.memberFindPwd(member);
		
		if(pwdFindUser == null) { 
			model.addAttribute("check", 0);
		} else { 
			model.addAttribute("check", 1);
			model.addAttribute("user",pwdFindUser);
		}
		return "member/findPwd";
	}
	//아이디 중복체크
	@ResponseBody
	@PostMapping("/member/idChk")
	public int idChk(Member member) throws Exception {
		int result = memberService.idChk(member);
		return result;
	}
}
