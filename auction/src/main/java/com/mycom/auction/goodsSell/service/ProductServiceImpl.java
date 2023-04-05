package com.mycom.auction.goodsSell.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycom.auction.goodsSell.repository.ProductRepository;
import com.mycom.auction.goodsSell.domain.*;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	ProductRepository productRepository;
	
	
	//판매 상품 등록
	@Override
	public int productAdd(Map productAdd) throws Exception {
		
		System.out.println("productAdd service 진입");
		int sellNo=productRepository.insertProductAdd(productAdd);
		//파일 정보 저장
		List<ImageFileVO> imageFileList =(ArrayList)productAdd.get("imageFileList");
		for(ImageFileVO imageFileVO : imageFileList) {
			imageFileVO.setSellNo(sellNo);
			System.out.println("서비스 for문안 imageFileVO="+imageFileVO);
		}
		productRepository.insertProductImageFile(imageFileList);
		return sellNo;
	}

	//판매 상품 리스트 조회
	@Override
	public List<Product> productList() throws Exception {
		return productRepository.productListSelect();
	}

	//판매 상품 사진 조회
	@Override
	public List<ImageFileVO> productImageList(int num) throws Exception {
		return productRepository.productImageSelect(num);
	}

	//판매 상품 상세조회
	@Override
	public Product productDetail(int num) throws Exception {
		return productRepository.productSelectOne(num);
	}

	//판매 상품 등급 변경
	@Override
	public int goodsGradeChange(Map gradeChangeMap) throws Exception {
		return productRepository.goodsGradeUpdate(gradeChangeMap);
	}
	
	
	//판매하기 게시글 갯수 조회 (페이징 처리)
	@Override
	public int productListCount() throws Exception {
		return productRepository.productListConut();
	}

	//페이징 처리
	@Override
	public List<Product> getListWithPaging(Criteria cri) throws Exception {
		return productRepository.getListWithPaging(cri);
	}

	//구매 상품상세 정보
	@Override
	public Product productBuyDetail(int sellNo) throws Exception {
		return productRepository.productBuyDetail(sellNo);
	}
	
	//구매 상품 등록
	@Override
	public int productBuy(Map map) throws Exception{
		return productRepository.productBuyInsert(map);
	}
	
	//판매 완료 상태물품 목록 조회
	@Override
	public int productAutoEnd(int goodsGrade) throws Exception {
		System.out.println("productAutoEnd Ser()");
		return productRepository.productAutoEnd(goodsGrade);
	}
	
	
	//판매 상품 최고가 조회
	/*
	 * @Override public int checkDesiredSellPrice(Map map2) throws Exception {
	 * return productRepository.selectDesiredSellPrice(map2); }
	 */

}
