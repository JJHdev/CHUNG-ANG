package com.mycom.auction.goodsSell.repository;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.mycom.auction.goodsSell.domain.Criteria;
import com.mycom.auction.goodsSell.domain.ImageFileVO;
import com.mycom.auction.goodsSell.domain.Product;
import com.mycom.auction.goodsSell.domain.ProductPurchaseDTO;

public interface ProductRepository {
	
	//판매하기 게시글 등록
	public int insertProductAdd(Map productAdd) throws DataAccessException;

	//이미지 파일 저장
	public void insertProductImageFile(List<ImageFileVO> fileList) throws DataAccessException;
	
	//전체글 조회
	public List<Product> productListSelect() throws DataAccessException;
	
	//이미지 저장
	public List<ImageFileVO> productImageSelect(int sellNo) throws DataAccessException;
	
	//판매하기 글 상세보기
	public Product productSelectOne(int sellNo) throws DataAccessException;
	
	//판매하기 게시글 상태 변경
	public int goodsGradeUpdate(Map gradeChangeMap) throws DataAccessException;
	
	//전체 게시글 수 조회(페이징처리)
	public int productListConut() throws DataAccessException;

	//페이징 처리
	public List<Product> getListWithPaging(Criteria cri) throws DataAccessException;
	
	//구매 상품 정보 조회
	public Product productBuyDetail(int sellNo) throws DataAccessException;
	
	//구매 상품 등록
	public int productBuyInsert(Map map) throws DataAccessException;
	
	//판매 완료 상태물품 목록 조회
	public int productAutoEnd(int goodsGrade) throws DataAccessException;
	
}
