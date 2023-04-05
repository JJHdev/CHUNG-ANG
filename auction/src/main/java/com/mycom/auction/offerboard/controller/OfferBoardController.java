package com.mycom.auction.offerboard.controller;





import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycom.auction.member.domain.Member;
import com.mycom.auction.offerboard.domain.OfferBoard;
import com.mycom.auction.offerboard.domain.Page;
import com.mycom.auction.offerboard.service.OfferListService;
import com.sun.org.glassfish.external.probe.provider.annotations.ProbeParam;

// 구인구직컨트롤러
@Controller
public class OfferBoardController {

	private static final Logger logger = LoggerFactory.getLogger(OfferBoardController.class);
	
	@Autowired
	OfferListService offerListService;
	/*
	  //offerBoard 구인게시판 목록 보여주기
    @RequestMapping("/offerBoard/offerBoardForm")
    public String offerBoard(Model model,@RequestParam(name="ano", required=false,defaultValue="1") int no) throws Exception {
    	
    	//전체 리스트 조회
    	List<OfferBoard> list= offerListService.getOfferAllList();
    	
    	//전체 게시글 수
    	int totalCnt = offerListService.getTotalCnt();
    	
    	
    	//특정글번호 조회
    	OfferBoard offerBoard = offerListService.getOfferDetail(no);
    	
    	model.addAttribute("list",list); //전체 목록 검색
    	model.addAttribute("offerBoard",offerBoard); //전체 목록 검색
    	model.addAttribute("totalCnt",totalCnt); //전체 게시물 수
    	
    	
    	return "/offerBoard/offerBoardForm";
    }
    */
    
    
  //게시글전체조회
  	@GetMapping("/offerBoard/offerBoardForm")
  	public String articleList(Model model,HttpServletRequest request) throws Exception {
  		
  		
  		String strPageNo = request.getParameter("pageNo"); //보고싶은페이지
  		int pageNo = 1;   
  		if(strPageNo!=null) {
  			pageNo = Integer.parseInt(strPageNo);			
  		}
  		Page page = new Page(pageNo);
  		
  		OfferBoard offerBoard  = offerListService.getArticlePage(page);
  		model.addAttribute("offerBoard", offerBoard);
  		
  		return "/offerBoard/offerBoardForm";
  	}
    
  	 //입력폼보여주기
  	//요청방식 get
    //offerinsertForm 구인 등록 폼 보여주기
  	
  	@GetMapping("/offerBoard/offerInsertForm")
    public String offerform(@ModelAttribute OfferBoard offerBoard, HttpServletRequest request)  throws Exception{
		//1.파라미터받기 //2.비즈니스로직
  		//3.model
  		//원칙적으로는 (로그인한 user가) 글입력 권한을 가진 사용자가 글입력해야지만
  		//여기에서는 임시로 세션에 정보를 저장하여 진행하겠다
	  		HttpSession session = request.getSession();
	  		 Member authUser = (Member) session.getAttribute("AUTHUSER");
	  		String id = authUser.getId();
	  		 
	  		//session.setAttribute("isLogOn",true);
	  		//session.setAttribute("AUTHUSER_ID", "hongid");//임시 글번호
	  		session.setAttribute("AUTHUSER_ID", "hongid");//임시
	  		
	  		
  		//4.view
    	return "/offerBoard/offerInsertForm";
    }
  	
  	
  //입력폼에서 입력 처리 담당
  	//요청방식 get
    //offerinsertForm 구인 등록 폼 보여주기 http://localhost:8081/auction/offerBoard/offerInsertForm
	@GetMapping("/offerBoard/offerInsertForm1")
    public String offerinsert(@ModelAttribute OfferBoard offerBoard, HttpServletRequest request,Model model) throws Exception{
		
		//LocalTime starttime1 = offerBoard.getStarttime();
		
		offerListService.insertOffer(offerBoard);
		System.out.println("offerBoard==offerinsert"+offerBoard);
		
		model.addAttribute("offerBoard", offerBoard);
		//model.addAttribute("starttime",starttime1);
		
		
		return "redirect:/offerBoard/offerBoardForm";
    }
  /*
    //입력폼 정상유무 확인 후 알트 팝업 후 리스트로 보내줌
	@PostMapping("/offerBoard/offerSelectForm1")
	public String offercheck(@ModelAttribute OfferBoard offerBoard, HttpServletRequest request) throws Exception {
		
		offerListService.insertOffer(offerBoard);
		
  	
		return "offerBoard/offerBoardForm";
	}
	
	*/
	  //offerSelect 입력된 구인게시글 내용폼 보여주기
	
	  @GetMapping("/offerBoard/offerSelectForm") 
	  public String offerSelect(@RequestParam("offerno")int no,Model model) throws Exception{
	
		  
		  OfferBoard offerBoard =offerListService.getOfferDetail(no);
		  
	    	model.addAttribute("offerBoard",offerBoard); //전체 목록 검색

	    	System.out.println("offerBoard==offerSelect=="+offerBoard);
		  
		  return "offerBoard/offerSelectForm"; 
	 }
	

    
}
