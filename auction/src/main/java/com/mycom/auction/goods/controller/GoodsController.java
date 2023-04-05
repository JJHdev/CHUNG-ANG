package com.mycom.auction.goods.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
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
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mycom.auction.goods.domain.ProductDTO;
import com.mycom.auction.goods.domain.ProductFinally;
import com.mycom.auction.goods.domain.ProductPurchaseDTO;
import com.mycom.auction.goods.service.GoodsService;
import com.mycom.auction.goodsSell.domain.Product;
import com.mycom.auction.member.domain.Member;

import net.coobird.thumbnailator.Thumbnails;
import net.sf.json.JSONObject;


@Controller
@EnableScheduling
public class GoodsController {

	private static final Logger logger = LoggerFactory.getLogger(GoodsController.class);
	
	@Autowired
	GoodsService goodsService;
	
	private static final String REPO_PATH = "C:\\uploads";

	@GetMapping("/goodsRegisterForm")
	public String registerGetGoods(HttpServletRequest request) {
		/*
		 * HttpSession session = request.getSession();
		 * session.setAttribute("AUTHUSER_ID", "hongid");//임시
		 */			
		return "/acutionGoods/auctionGoodsRegisterPage";
	}
		
	  	
	@RequestMapping(value="/goodsRegisterForm" ,method={RequestMethod.POST})
	public ResponseEntity registerPostGoods(ModelAndView mv,MultipartHttpServletRequest multipartRequest) throws Exception {			
		/* multipartRequest.setCharacterEncoding("utf-8"); */
		Map map = new HashMap();
		Enumeration enu = multipartRequest.getParameterNames();  
		while( enu.hasMoreElements() ) {
			String name = (String)enu.nextElement();
			String value= multipartRequest.getParameter(name);
			logger.info("컨트롤러 while문안 map.put(name,value)="+name+","+value);
	  		map.put(name,value);
		}
		
		List<ProductDTO> imageFileList = upload(multipartRequest);
		if( imageFileList!=null && imageFileList.size()!=0) {
			map.put("imageFileList",imageFileList);
		}//if끝
		
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html;charset=utf-8");
		String msg = null;
		String imageFileName = null;
		
		try {
			String goods=goodsService.insertImageGoods(map);//글관련정보+첨부파일정보
			//입력성공이 되면 
			//글등록이 되었습니다. 라는 alert 띄우기 + 입력폼페이지로 이동 + 업로드된 이미지 출력
			//1)임시파일을 저장소로 복사 (temp폴더 안의 임시파일을 글번호 폴더 생성후 그 하위에 이동)
			if( imageFileList!=null && imageFileList.size()!=0){
				for(ProductDTO productDTO  : imageFileList) {
					imageFileName=productDTO.getImage();
					File srcFile = new File(REPO_PATH+"\\"+imageFileName); 
					File destDir = new File(REPO_PATH+"\\"+goods);
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
				}
			}
			//2)글등록이 되었습니다. 라는 alert띄우기
			msg   = "<script>;";
			msg  += "alert('상품이 등록되었습니다.');";
			msg  += "location.href='"+multipartRequest.getContextPath()+"/goodsRegisterForm';";
			msg  += "</script>";
			//3)입력폼 페이지로 이동
		}catch(Exception e) {
			//입력 실패되면
			// "글등록이 실패되었습니다." 라는 alert 띄우기 + 입력폼페이지로 이동 + 업로드된 이미지 출력
			//1)업로드된 이미지 삭제
			if( imageFileList!=null && imageFileList.size()!=0){
				for(ProductDTO productDTO  : imageFileList) {
					imageFileName=productDTO.getImage();
					File srcFile = new File(REPO_PATH+"\\temp\\"+imageFileName); 
					srcFile.delete();
				}
			}
			//2)오류발생 되었습니다. 라는 alert띄우기
			msg   = "<script>;";
			msg  += "alert('중복된 모델을 입력하셨습니다.');";
			msg  += "location.href='"+multipartRequest.getContextPath()+"/goodsRegisterForm';";
			msg  += "</script>";
			//3)입력폼 페이지로 이동
			e.printStackTrace();
		}
		resEntity=	new ResponseEntity(msg,responseHeaders,HttpStatus.OK); 
		return resEntity;
	}
		
  	public List<ProductDTO> upload(MultipartHttpServletRequest multipartRequest) throws Exception{
  		List<ProductDTO> fileList= new ArrayList<ProductDTO>();
  		Iterator<String> fileNames = multipartRequest.getFileNames();
  		while(fileNames.hasNext()){
  			ProductDTO productDTO =new ProductDTO();
  			String fileName = fileNames.next();
  			System.out.println("실제 파일 가져왓니?"+fileName);
  			MultipartFile mFile = multipartRequest.getFile(fileName);
  			String originalFileName=mFile.getOriginalFilename();
  			System.out.println("originalFilename="+originalFileName);
  			productDTO.setImage(originalFileName);
  			fileList.add(productDTO);
  			
  			File file = new File(REPO_PATH+"\\"+fileName);
  			if(mFile.getSize()!=0) {  
  			 System.out.println("관리자가 등록한 파일을 첨부했으면");
  			 if( !file.exists() ) { 
  				 System.out.println("폴더가 없당.");
  			 	if( file.getParentFile().mkdirs()) { 
  			 		file.createNewFile();
  			 		System.out.println("폴더를 만들어랏.");
  			 	}
  			  }
  			 System.out.println("originalFileName 이름은 정확하니?"+originalFileName);
  			mFile.transferTo(new File(REPO_PATH+"\\"+originalFileName));
  			}
  		}
  		return fileList;
  	}//upload끝
	
	
  	@RequestMapping(value ="/goodsListForm", method = RequestMethod.GET)
	public ModelAndView goodsGetListForm(ModelAndView mv) throws Exception {
  		//1. db에 있는 product 정보 가져오기 (1번 image// List Vo 모델명은 전부다 .  다른곳에서 실행 이미지는 맨 앞번호 1개만 로   2번 파일내용 List Vo)
  		List<ProductDTO> goodsInfo=goodsService.selectAllGoodsList();
  		//2. form 에 뿌려주기
  		mv.addObject("goodsInfo",goodsInfo);
		mv.setViewName("/acutionGoods/auctionGoodsListPage");
		return mv;
	}
	
	
	
	
  	@RequestMapping("/download")
	public void goodsGetImageForm(@RequestParam("goods") String goods,
            HttpServletResponse response) throws Exception {
		
  		ProductDTO ImageInfo=goodsService.selectImageInfo(goods);
  		
		System.out.println("2번째 download");
		OutputStream out = response.getOutputStream();
		String filePath = REPO_PATH + "\\"+goods+"\\"+ImageInfo.getImage();
		File image = new File(filePath);//다운로드할 파일객체생성
		
		//thumbnail용 이미지 생성 
		int lastIndex =ImageInfo.getImage().lastIndexOf("."); // 파일이름에서 .png에서 .을 찾아 인덱스번호숫자를 준다.
		String thumbfileName = ImageInfo.getImage().substring(0,lastIndex); // .을 제외한 앞자리 숫자와 순수한 파일 이름만 추출한다.
		File thumbnail = new File(REPO_PATH+"\\thumbnail\\"+thumbfileName+".png");//썸네일용 다운로드할 파일객체생성
		if(image.exists()) {
			thumbnail.getParentFile().mkdirs();
			//가로세로 size를 50px인 png썸네일 이미지를 생성.
			Thumbnails.of(image).size(450,450).outputFormat("png").toFile(thumbnail);
		}
		
		//response.setHeader()  응답헤더정보 설정
		//Cache-Control   HTTP 1.1 버전에서 지원하는 헤더로서, 이 헤더의 값을 "no-cache"로 지정하면 웹 브라우저는 응답 결과를 캐시하지 않는다.
		/*캐시란?-브라우저(클라이언트)가 저장해 놓은 데이터
		-웹 브라우저가 WAS에 같은 jsp파일을 2번 이상 요청할 때 불필요한 응답 요청을 방지하기 위해 사용한다.
		-웹 브라우저의 응답속도 향상되는 효과가 있다.*/
		response.setHeader("Cache-Control","no-cache");
		response.addHeader("Content-disposition","attachment; fileName="+ImageInfo.getImage());//Content-Disposition을 통해 파일명을 설정
		
		//버퍼를 이용하여   파일정보를     한 번에 8byte씩  읽어들이고 
		FileInputStream in = new FileInputStream(thumbnail);
		byte[] buffer = new byte[1024 * 8];
		while (true) {
			int count = in.read(buffer); 
			if (count == -1) //더 이상 읽어들일 것이 없다면
			break; //읽어들이는 것을 멈추어라
			out.write(buffer, 0, count); //읽은 내용 브라우저에 전송하기(-> 웹브라우저에 출력됨. 여기에서는 result.jsp문서에 출력됨)
		}
		in.close();//입력스트림닫기
		out.close();//출력스트림닫기
	}
	
	
	
  	@RequestMapping("/download2")
	public void goodsGetImageForm2(@RequestParam("goods") String goods,	String imageName,Model model, HttpServletResponse response) throws Exception {
  		System.out.println("goods"+goods);
  		System.out.println("imageName"+imageName);
		OutputStream out = response.getOutputStream();
		//이미지저장위치에  글번호별로 폴더생성하여 다운로드할 파일을 저장
		String filePath = REPO_PATH + "\\" + goods+"\\"+ imageName;

  		File image = new File(filePath);//다운로드할 파일객체생성

  		//thumbnail용 이미지 출력
  		if(image.exists()) {
  			//가로세로size를 지정하여 png썸네일이미지로 출력
  			Thumbnails.of(image).size(800,750).outputFormat("png").toOutputStream(out);
  		}else {
  			return;
  		}
  		
  		//response.setHeader()  응답헤더정보 설정
  		//Cache-Control	HTTP 1.1 버전에서 지원하는 헤더로서, 이 헤더의 값을 "no-cache"로 지정하면 웹 브라우저는 응답 결과를 캐시하지 않는다.
  		/*캐시란?-브라우저(클라이언트)가 저장해 놓은 데이터
  		 -웹 브라우저가 WAS에 같은 jsp파일을 2번 이상 요청할 때 불필요한 응답 요청을 방지하기 위해 사용한다.
  		 -웹 브라우저의 응답속도 향상되는 효과가 있다.*/
  		response.setHeader("Cache-Control", "no-cache");
  		response.addHeader("Content-disposition", "attachment; fileName=" + imageName);//Content-Disposition을 통해 파일명을 설정
  		

  		byte[] buffer = new byte[1024 * 8];
  		out.write(buffer); //읽은 내용 브라우저에 전송하기(-> 웹브라우저에 출력됨. 여기에서는 result.jsp문서에 출력됨)
  		out.close();//출력스트림닫기
	}
	
	
	
	
	@GetMapping("/goodsDetail")
	public String DetailGetGoods(@RequestParam("goods") String goods,Model model) {
		
		ProductDTO goodsInfo=goodsService.selectGoodsList(goods);
		List<ProductDTO> goodsSizeInfo=goodsService.selectGoodsSizeList(goods);
		List<ProductDTO> goodsImageInfo=goodsService.selectImageAllInfo(goods);
		System.out.println("goodsImageInfo"+goodsImageInfo);
		System.out.println("goodsSizeInfo"+goodsSizeInfo);
		
		model.addAttribute("goodsInfo",goodsInfo);
		model.addAttribute("goodsImageInfo",goodsImageInfo);
		model.addAttribute("goodsSizeInfo",goodsSizeInfo);
		
		return "/acutionGoods/auctionGoodsDetailPage";
	}
	
	
	@PostMapping("/goodsDetail")
	public String DetailPostGoods(Model model) {
		return "/acutionGoods/auctionGoodsDetailPage";
	}
	
	@RequestMapping(value="/sizeSearch",method=RequestMethod.GET,produces="application/text;charset=utf8")
	public @ResponseBody String sizeGoodsSearch(@RequestParam("goodsSize") String goodsSize,
								  		 @RequestParam("goods") String goods) throws Exception  {
		
		List<Product> goodsSell=goodsService.selectSellGoodsList(goodsSize,goods);
		
		
		//JSONObject객체생성
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("goodsSell",goodsSell);
		
		//JSONObject객체를 문자열로 변환
		String jsonInfo = jsonObject.toString(); 
		return jsonInfo; //클라이언트에게 응답
	}
	
	
	@RequestMapping(value="/sellNoSearch",method=RequestMethod.GET,produces="application/text;charset=utf8")
	public @ResponseBody String sellNoGoodsSearch(@RequestParam("sellNo") int sellNo) throws Exception  {
		
		List<ProductPurchaseDTO> sellNoSearch=goodsService.sellNoGoodsSearch(sellNo);
		
		//JSONObject객체생성
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("sellNoSearch",sellNoSearch);
		
		//JSONObject객체를 문자열로 변환
		String jsonInfo = jsonObject.toString(); 
		
		return jsonInfo; //클라이언트에게 응답
	}
	
	
	@GetMapping("/productPurMessage")
	public String productGetPurMessage(Model model,HttpServletRequest httpServletRequest) {
	 	HttpSession session = httpServletRequest.getSession();
	   Member authUser = (Member) session.getAttribute("AUTHUSER");
	   String id = authUser.getId();
	   
	   Map<String,List> selectMessagePur=goodsService.selectMessageList(id);
	   
	   List<ProductFinally> messageList = selectMessagePur.get("selectMessageList");
	   List<ProductPurchaseDTO> PurList = selectMessagePur.get("selectPurList");
	   
	   System.out.println("messageList1"+messageList);
	   System.out.println("PurList1"+PurList);
	   
	   model.addAttribute("messageList", messageList);
	   model.addAttribute("PurList", PurList);
		
		return "/acutionGoods/auctionGoodsPurMessage";
	}
	
	
	@GetMapping("/productSellMessage")
	public String productGetSellMessage(Model model,HttpServletRequest httpServletRequest) {
	   HttpSession session = httpServletRequest.getSession();
	   Member authUser = (Member) session.getAttribute("AUTHUSER");
	   String id = authUser.getId();
	   
	   Map<String,List> selectMessagePur=goodsService.selectMessageSellList(id);
	   
	   List<ProductFinally> messageList = selectMessagePur.get("selectMessageList");
	   List<ProductPurchaseDTO> PurList = selectMessagePur.get("selectPurList");
	   
	   System.out.println("messageList2"+messageList);
	   System.out.println("PurList2"+PurList);
	   
	   model.addAttribute("messageList", messageList);
	   model.addAttribute("PurList", PurList);
		
		return "/acutionGoods/auctionGoodsSellMessage";
	}
	
	
}

