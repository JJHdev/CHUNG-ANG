package com.mycom.auction.review.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mycom.auction.review.domain.ReviewDTO;
import com.mycom.auction.review.domain.ReviewFileVO;
import com.mycom.auction.review.service.ReviewService;


@Controller
public class ReviewController extends BaseController {

	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);

	@Autowired
	ReviewService reviewService;
	
	@GetMapping("/review/listForm")
	public String listForm(Model model, @RequestParam(name="ano",required=false,defaultValue="1") int no) throws Exception {
		
		//전체 리뷰 개수 조회
		int totalCnt=reviewService.getTotalCnt();
		
		//전체 리뷰 목록 조회
		List<ReviewDTO> list=reviewService.getReviewAllList();
		
		//Model
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("list", list);
		
		//View
		return"review/reviewList";
	}
	
	//리뷰 상세보기
	@GetMapping("/review/detailForm")
	public String detailForm(Model model, @RequestParam(name="ano",required=false,defaultValue="1") int no) throws Exception {
		
		
		// 조회수 증가
		reviewService.increaseViewCnt(no);
		
		//특정 리뷰의 글번호 조회
		int ano = reviewService.getReviewNo(no);
		
		///특정 리뷰의 제목 조회
		String title = reviewService.getTitleByReviewNo(no);
		
		//특정 리뷰의 상세 조회
	ReviewDTO review = reviewService.getReviewDetail(no);
		
		
		
		System.out.println("컨트롤러  detailForm no="+no);
		//파일 포함 상세 조회
		Map reviewMap = reviewService.reviewDetail(no);
		System.out.println("컨트롤러  detailForm Map reviewMap.get('reviewdto') ="+reviewMap.get("reviewdto"));
		System.out.println("컨트롤러  detailForm Map reviewMap.get(imageList) ="+reviewMap.get("imageList"));

				
		//Model
		model.addAttribute("ReviewNo", ano);
		model.addAttribute("title", title);
		model.addAttribute("review", review);	
		model.addAttribute("reviewMap", reviewMap);
		
		//View
		return"review/reviewDetail";
	}
	
		//리뷰 글등록
	
		//입력폼
		@GetMapping("/review/addForm")
		public String insertReviewForm(HttpServletRequest request) {
			HttpSession session = request.getSession();
			/* String userId = (String) session.getAttribute("AUTHUSER_ID"); 
			 * 
			 		// 로그인한 사용자의 아이디를 세션에서 가져와서 작성자 정보로 넣기
					if (userId != null) {
						return "review/addForm";
					} else {
						return "redirect:/loginForm";
					}
					
			 * */
			session.setAttribute("AUTHUSER_ID", "adminid");//임시
			return "review/addForm";
	}
	
		//입력처리
		//파일저장경로
	  	private static final String REPO_PATH = "C:\\auction\\image_repo";
	  	
		//입력처리
	  	@RequestMapping(value="/review/addNewReview",method={RequestMethod.POST})
		public ResponseEntity submitReviewForm(ModelAndView mv,
				MultipartHttpServletRequest multipartRequest) throws Exception {			
			
	  		Map map = new HashMap(); //글관련정보+첨부파일정보
			Enumeration enu = multipartRequest.getParameterNames();  
			while( enu.hasMoreElements() ) {
				String name = (String)enu.nextElement();
				String value= multipartRequest.getParameter(name);
				System.out.println("컨트롤러 while문안 map.put(name,value)="+name+","+value);
		  		map.put(name,value);
			}
			
			HttpSession session=multipartRequest.getSession();
			/* 
			AuthUser authUser = session.getAttribute("AUTHUSER");
			String id=authUser.getUserId();*/
			session.setAttribute("AUTHUSER_ID","adminid");//임시
			String id = (String)session.getAttribute("AUTHUSER_ID");
			
			List<ReviewFileVO> reviewFileList = upload(multipartRequest);
	/*		
			if( reviewFileList==null && reviewFileList.size()==0) {
			   reviewService.addNewReview~~~(map);//글관련정보
			}
	*/		
			if( reviewFileList!=null && reviewFileList.size()!=0) {
				for( ReviewFileVO reviewFileVO  : reviewFileList) {
					reviewFileVO.setid(id);//등록자id를 set
					System.out.println("컨트롤러 for문안 reviewFileVO="+reviewFileVO);
				}
				map.put("reviewFileList",reviewFileList);
			}//if끝
			
			ResponseEntity resEntity = null;
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/html;charset=utf-8");
			String msg = null;
			String fileName = null;

			try {
				int reviewNo=reviewService.addNewReview(map);//글관련정보+첨부파일정보			
				
				//입력성공이 되면 
				if( reviewFileList!=null && reviewFileList.size()!=0) {
					for( ReviewFileVO reviewFileVO : reviewFileList) {
						fileName=reviewFileVO.getFileName();
						File srcFile = new File(REPO_PATH+"\\temp\\"+fileName);
						File destDir = new File(REPO_PATH+"\\"+reviewNo);
						FileUtils.moveFileToDirectory(srcFile, destDir, true);
					}
				}//if
				
				//2)"글등록이 되었습니다."라는 alert띄우기
				msg = "<script>";
				msg+= "alert('글등록이 되었습니다.');";
				msg+= "location.href='"+multipartRequest.getContextPath()+"/review/listForm';";
				msg+= "</script>";
				//3)입력폼페이지로 이동
			}catch(Exception e) {
				//입력실패 되면 
				//"오류발생."라는 alert띄우기+입력폼페이지로 이동+업로드된 이미지삭제
				//1)업로드된 이미지삭제
				if(reviewFileList!=null && reviewFileList.size()!=0) {
					for( ReviewFileVO reviewFileVO : reviewFileList) {
						fileName=reviewFileVO.getFileName();
						File srcFile = new File(REPO_PATH+"\\temp\\"+fileName);
						srcFile.delete();
					}
				}//if
				
				
				//2)"오류발생."라는 alert띄우기   + 3)입력폼페이지로 이동
				msg = "<script>";
				msg+= "alert('오류가 발생했습니다.PLZ Retry');";
				msg+= "location.href='"+multipartRequest.getContextPath()+"/review/addForm';";
				msg+= "</script>";
				
				e.printStackTrace();
			}
			
			resEntity = new ResponseEntity(msg,responseHeaders,HttpStatus.OK);
			return resEntity;
		
	  	}//입력처리 끝
	
	

	  	
		//특정 리뷰 글수정
		//수정폼보여주기
		@GetMapping("/review/updateForm")
		public String updateReviewForm(@RequestParam("ano") int no, Model model, HttpServletRequest request) throws Exception {
			HttpSession session = request.getSession();
			/* String userId = (String) session.getAttribute("AUTHUSER_ID"); 
			 \	
			 * */
			session.setAttribute("AUTHUSER_ID", "adminid");//임시
			
			ReviewDTO reviewDTO=reviewService.getReviewDetail(no);
			
			/*
			 // 로그인한 사용자의 아이디를 세션에서 가져와서 작성자 정보로 넣기
			 		 //AUTHUSER.grade == 9999 && (authUser.mId == qnaData.qna.q_writer.q_writerid)
					if (AUTHUSER_ID =='adminid' && (AUTHUSER_ID == reviewDTO.getId) {
						return "/review/updateForm";
					} else {
						return "redirect:/loginForm";
					}
					
			 */
			
			model.addAttribute("review",reviewDTO);
			return "/review/updateForm";
		}
	
		//수정처리
	    @PostMapping("/review/updateForm")
	    public ModelAndView submitUpdateForm(ReviewDTO review, ModelAndView mv) throws Exception {
	    	int cnt = reviewService.updateReview(review);
	    	if(cnt==1) { 
	    		mv.setViewName("redirect:/review/listForm");
	    	}else { 
	    		mv.setViewName("redirect:/review/updateForm?ano="+review.getReviewNo());
	    	}
	    	return mv;
	    }
	
	    
	    //리뷰 삭제
		@RequestMapping(value="/review/delete", method= {RequestMethod.POST,RequestMethod.GET})
	    public ModelAndView deleteReview(@RequestParam("ano") int no, HttpServletRequest request) throws Exception {
			HttpSession session = request.getSession();
			/* String userId = (String) session.getAttribute("AUTHUSER_ID"); 
			 \	
			 * */
			session.setAttribute("AUTHUSER_ID", "adminid");//임시
			
			
			int cnt = reviewService.deleteReview(no);
			
			/*
			 // 로그인한 사용자의 아이디를 세션에서 가져와서 작성자 정보로 넣기
			 		 //AUTHUSER.grade == 9999 && (authUser.mId == qnaData.qna.q_writer.q_writerid)
					if (AUTHUSER_ID =='adminid' && (AUTHUSER_ID == reviewDTO.getId) {
			mv.setViewName("redirect:/review/listForm");
			return mv;
					} else {
						return "redirect:/loginForm";
					}
					
			 */
					 System.out.println("cnt="+cnt);
					 ModelAndView mv = new ModelAndView();
					mv.setViewName("redirect:/review/listForm");
					return mv;
			}
	
}