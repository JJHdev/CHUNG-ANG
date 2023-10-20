package com.mycom.auction.goodsSell.base;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mycom.auction.goodsSell.domain.*;


public class BaseController {
	

  	//파일저장경로
	private static final String REPO_PATH = "C:\\uploads\\";

  	
  	//업로드하기 : 첨부파일에 대한 정보+upload
  	public List<ImageFileVO> upload(MultipartHttpServletRequest multipartRequest) throws Exception{
  	/* List참조변수명.add(Object value): value추가
  	 * List참조변수명.get(인덱스번호) : value꺼내오기*/
  		List<ImageFileVO> fileList= new ArrayList<ImageFileVO>();
  		
  		//getFileNames():첨부파일이름 가져오기
  		Iterator<String> fileNames = multipartRequest.getFileNames();
  		System.out.println("fileNames===="+fileNames);
  		while(fileNames.hasNext()){ //첨부파일수만큼 반복해서 ->첨부파일정보빼내서+upload->list에 추가
  		  
  			ImageFileVO imageFileVO =new ImageFileVO();
  			
  			String fileName = fileNames.next();//첨부파일이름가져오기	
  			//imageFileVO.setFileType(fileName);  향후 추가
  			MultipartFile mFile = multipartRequest.getFile(fileName);//지정한이름을 가진 File가져오기
  			System.out.println("mFile===="+mFile);
  			//getOriginalFilename(): 사용자가 업로드한 원래 파일명
  			String originalFileName=mFile.getOriginalFilename();
  			System.out.println("originalFilename="+originalFileName);
  			imageFileVO.setSellImages(originalFileName);//사용자가 업로드한 원래 파일명을 이미지파일명으로 set
  			
  			fileList.add(imageFileVO);
  			
  		  //upload------------------------------------------
  			//지정위치 하위에 파일객체생성
  			File file = new File(REPO_PATH+fileName);
  			if(mFile.getSize()!=0) {  //첨부된 파일이 존재한다면. empty이면 0반환
  			 System.out.println("첨부된 파일이 존재한다면");
  			 if( !file.exists() ) { //경로에 파일이 없으면
  			 	if( file.getParentFile().mkdirs()  ) { //해당경로에 폴더를 생성하고
  			 		file.createNewFile();//파일생성한다
  			 	}//if3끝
  			  }//if2끝
  			 mFile.transferTo(new File(REPO_PATH+originalFileName));
  			}else if(file.exists()) {
  				mFile.transferTo(new File(REPO_PATH+System.currentTimeMillis()+originalFileName));//if1끝
  			 } 
  			}//while끝
  		return fileList;
  	}//upload끝
  	

  	
  	
  	
  	//파일삭제 추가
  	private void deleteFile(String fileName) {
  		File file = new File(REPO_PATH+fileName);
  		try {
	  		//리턴값 :true if and only if the file or directory issuccessfully deleted; false otherwise
	  		file.delete();
  		}catch(Exception e) {
  			e.printStackTrace();
  		}
  	}
  	
}//class끝














