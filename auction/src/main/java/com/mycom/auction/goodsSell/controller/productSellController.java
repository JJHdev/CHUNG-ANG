package com.mycom.auction.goodsSell.controller;

import java.time.LocalDate;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.mycom.auction.goodsSell.base.BaseController;
import com.mycom.auction.goodsSell.domain.Criteria;
import com.mycom.auction.goodsSell.domain.ImageFileVO;
import com.mycom.auction.goodsSell.domain.PageDTO;
import com.mycom.auction.goodsSell.domain.Product;
import com.mycom.auction.goodsSell.domain.ProductPurchaseDTO;
import com.mycom.auction.goodsSell.repository.ProductRepository;
import com.mycom.auction.goodsSell.service.ProductService;

@Controller
@Component
public class productSellController extends  BaseController implements WebMvcConfigurer{
	
	//파일저장경로
  	private static final String REPO_PATH = "C:\\uploads\\";
	
	@Autowired
	ProductService productService;
	@Autowired
	ProductRepository productRepository;
	
	 //판매하기 글 등록 페이지
	 @RequestMapping(value="/productAddForm", method= {RequestMethod.GET})
		public String productSell(HttpServletRequest request, String goodsSize,String goods,Model model) {
		 	
		 	//임시 userId
		 System.out.println("goodsSize"+goodsSize);
		 System.out.println("goods"+goods);
			model.addAttribute("goodsSize",goodsSize);
			model.addAttribute("goods", goods);
			return "auctionGoodsSell/productAddForm";
		}
	 
	 //판매동의 페이지
	 @GetMapping("/productSalesAgreement")
	 public String productSalesAgreement(HttpServletRequest request, String goodsSize,String goods,Model model) {
			model.addAttribute("goodsSize",goodsSize);
			model.addAttribute("goods", goods);
		 
		 return "auctionGoodsSell/productSalesAgreement";
	 }
	 
	 
	 //판매하기 글 등록
	@RequestMapping(value="/productAdd",method= {RequestMethod.POST})
	public ModelAndView productAdd(ModelAndView mv,
			MultipartHttpServletRequest multipartRequest) throws Exception {
		
		Map map = new HashMap(); //글관련정보+첨부파일정보
  		
		//1.form요소 중에서(<input type="file">이 아닌 요소의 name속성의 값)파라미터명 가져오기
		Enumeration enu = multipartRequest.getParameterNames();   
		while( enu.hasMoreElements() ) {
			//map에는 key이름으로  파라미터명으로(form의 name속성값) 사용하겠다
			//value는 가져온 파라미터명을 이용하여 추출
			String name = (String)enu.nextElement();
			String value= multipartRequest.getParameter(name);
			System.out.println("컨트롤러 while문안 map.put(name,value)="+name+","+value);
	  		map.put(name,value);  //name에 들어가는 "memberId","file1","file2","file3"
	  		//<input type="file">이 아닌 것들에 대한 파라미터명과  값이 담긴다
		}
		
				
		//2.form요소 중에서<input type="file"> 가져오기		
		//여기에서는 다중파일업로드이므로  n개이니 List로 처리하겠다
		//여기에서는 BaseController로 부터 상속받은 upload()호출
		List<ImageFileVO> imageFileList = upload(multipartRequest);
		if( imageFileList!=null && imageFileList.size()!=0) {
			for( ImageFileVO imageFileVO  : imageFileList) {
				System.out.println("컨트롤러 for문안 imageFileVO="+imageFileVO);
			}
			map.put("imageFileList",imageFileList);
		}//if끝
	    //<input type="file">인 것들에 대한 => 업로드된 파일의 정보가 담긴다
		int sellNo=productService.productAdd(map);//글관련정보+첨부파일정보
		
	    //model처리
		mv.addObject("sellNo", sellNo);//입력된 글번호
		mv.addObject("map",map);
		mv.setViewName("redirect:/productList"); //ajax용 진행예정
		return mv;
	}
	
	// 전체 상품 목록
	@GetMapping("/productList")
	public String productList(Model model,Criteria cri) throws Exception {
		
		int count =productService.productListCount();
		//페이징 처리 전체 목록 조회
		model.addAttribute("list",productService.getListWithPaging(cri));
		model.addAttribute("pageMaker",new PageDTO(cri, count));
		
		return "auctionGoodsSell/productList";
	}
	
	//판매 상품 상세보기
	@GetMapping("/productDetail")
	public String productDetail (@RequestParam("sellNo") int sellNo,
								@RequestParam("pageNum") int pageNum,
								@RequestParam("amount") int amount,Model model,Criteria cri) throws Exception {
		
		//페이징 처리
		model.addAttribute("pageNum",cri.getPageNum());
		model.addAttribute("amount",cri.getAmount());
		
		//물품 상세 정보
		Product product = productService.productDetail(sellNo);
		 List<ImageFileVO> imageFile = productService.productImageList(sellNo);
		 model.addAttribute("productFileList",imageFile);
		 model.addAttribute("product",product);
		
		return "auctionGoodsSell/productDetail";
	}
	
	
	// 상품 상태 변경
	@PostMapping("/GoodsGradeChange")
	public String goodsGradeChange(@RequestParam("sellNo") int sellNo,
								   @RequestParam("grade") int grade, 
								   @RequestParam("vailDate") int vailDate,
								   @RequestParam("pageNum") int pageNum,
									@RequestParam("amount") int amount,Model model,Criteria cri) throws Exception {
		Map<String, Integer> map = new HashMap<>();
		map.put("sellNo", sellNo);
		map.put("grade", grade);
		map.put("vailDate", vailDate);
		
		productService.goodsGradeChange(map);
		
		return "redirect:/productDetail?sellNo="+sellNo+"&pageNum="+pageNum+"&amount="+amount;
	}
	
	//구매하기 페이지
	@GetMapping("/productBuyForm")
	public String productBuy(Model model,String goodsSize,String goods,int sellNo, HttpServletRequest request) throws Exception {
		
		
		/*
		 * Map map = new HashMap(); map.put("itemSize",goodsSize);
		 * map.put("goods",goods);
		 */
		
		//물품 상제 정보 조회
		Product product =productService.productBuyDetail(sellNo);
		model.addAttribute("product",product);
		model.addAttribute("sellNo",sellNo);
		return "auctionGoodsSell/productBuyForm";
	}
	
	
	//구매하기 상품 등록
	@PostMapping("/productBuy")
	public String productBuy(Model model,@ModelAttribute ProductPurchaseDTO productPurchaseDTO) throws Exception {
		
		Map map = new HashMap();
		map.put("desiredPurPrice", productPurchaseDTO.getDesiredPurPrice());
		map.put("desireQuantity", productPurchaseDTO.getDesireQuantity());
		map.put("goodsName", productPurchaseDTO.getGoodsName());
		map.put("goodsSize", productPurchaseDTO.getGoodsSize());
		map.put("id", productPurchaseDTO.getId());
		map.put("sellNo", productPurchaseDTO.getSellNo());
		
		int result = productService.productBuy(map);
		int comment = 0;
		if(result==3) {
		    comment = 3;
		    return "redirect:/alertForm";
		} else if(result==2) {
		    comment = 2;
		    return "redirect:/alertForm";
		} else if(result==1){
		    comment = 1;
		    return "redirect:/alertSuccessForm";
		}
		model.addAttribute("comment", comment);
		return null;
		}
	
		@RequestMapping("/alertForm")
		public String alert() {
			
			return "auctionGoodsSell/alertForm";
		}
		
		@RequestMapping("/alertSuccessForm")
		public String alertSuccess() {
			
			return "auctionGoodsSell/alertSuccessForm";
		}
	
		@Scheduled(cron = "*/5 * * * * *")
		public void autoUpdate() throws Exception {
			System.out.println("실행중");
		   LocalDate now = LocalDate.now();
		   int cnt = 0;
		   int goodsGrade = 3;
		   cnt = productService.productAutoEnd(goodsGrade);
		   System.out.println("autoUpdate()");
		   if (cnt != 0) {
		      System.out.println("삭제 완료" + now.toString());
		   } else {
		      System.out.println("삭제 데이터 없음");
		   }
		}
		
}










