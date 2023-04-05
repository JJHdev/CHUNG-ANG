package com.mycom.auction.goodsSell.repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.mycom.auction.goods.domain.ProductPurchaseDTO;
import com.mycom.auction.goodsSell.domain.Criteria;
import com.mycom.auction.goodsSell.domain.ImageFileVO;
import com.mycom.auction.goodsSell.domain.Product;

@Repository
public class ProductRepositoryImpl implements ProductRepository{

	
	@Autowired
	private SqlSession sqlSession;
	
	
	//판매하기 게시글 등록
	@Override
	public int insertProductAdd(Map productAdd) throws DataAccessException {
		sqlSession.insert("mapper.product.insertProductAdd",productAdd);
		return Integer.parseInt((String)productAdd.get("sellNo"));
	}
	
	//판매하기 게시글 이미지 등록
	@Override
	public void insertProductImageFile(List<ImageFileVO> fileList) throws DataAccessException {
		for(int i=0; i<fileList.size(); i++) {
			ImageFileVO imageFileVO=(ImageFileVO)fileList.get(i);
			sqlSession.insert("mapper.product.insertProductImageFile",imageFileVO);
		}
	}
	
	//판매하기 게시글 전체 조회
	@Override
	public List<Product> productListSelect() throws DataAccessException {
		List<Product> list = sqlSession.selectList("mapper.product.productAllList");
		return list;
	}

	//판매하기 게시글 상세조회(이미지)
	@Override
	public List<ImageFileVO> productImageSelect(int sellNo) throws DataAccessException {
		List<ImageFileVO> fileList=sqlSession.selectList("mapper.product.imageFileList",sellNo);
		return fileList;
	}
	
	//판매하기 게시글 상세조회(상품 정보)
	@Override
	public Product productSelectOne(int sellNo) throws DataAccessException {
		Product product=sqlSession.selectOne("mapper.product.productDetail",sellNo);
		return product;
	}
	
	//판매하기 게시글 상태 변경
	@Override
	public int goodsGradeUpdate(Map gradeChangeMap) throws DataAccessException {
		int cnt=sqlSession.update("mapper.product.goodsGradeUpdate",gradeChangeMap);
		return cnt;
	}
	
	//판매하기 게시글 목록 갯수 조회
	@Override
	public int productListConut() throws DataAccessException {
		int cnt=sqlSession.selectOne("mapper.product.productListConut");
		return cnt;
	}
	
	//
	@Override
	public List<Product> getListWithPaging(Criteria cri) {
		List<Product> list = sqlSession.selectList("mapper.product.getListWithPaging",cri);
		return list;
	}
	
	//구매하기 상품 상세 정보
	@Override
	public Product productBuyDetail(int sellNo) throws DataAccessException {
		Product product = sqlSession.selectOne("mapper.product.productBuyDetail",sellNo);
		return product;
	}
	
	//구매 상품 등록
	@Override
	public int productBuyInsert(Map map) throws DataAccessException {
			System.out.println("map========"+map);
		int result =0;
		int sellPrice=sqlSession.selectOne("mapper.product.selectSellNoPrice",map);
		int purPrice =(int) map.get("desiredPurPrice");
	
		
		Optional<Integer> optionalBuyPrice = Optional.ofNullable(sqlSession.selectOne("mapper.product.selectBuyPrice", map.get("sellNo")));
		int buyPrice = optionalBuyPrice.orElse(0); // null일 경우 0을 반환
		// int 타입으로 변환한 값(buyPrice)을 사용하여 처리

		
		if(buyPrice==0 && purPrice > sellPrice) {
			result=sqlSession.insert("mapper.product.productBuyInsert",map);
			return result;
		}else if(buyPrice > purPrice && purPrice < sellPrice ) {
			result=3;
			return result;
		}else if(buyPrice > purPrice && purPrice >sellPrice){
			result=2;
			return result;
		} else if(sellPrice < purPrice && purPrice > buyPrice) {
			result=sqlSession.insert("mapper.product.productBuyInsert",map);
			return result;
		} else {
			return result;
		}
	}
	
	//판매 완료 상태물품 조회 후 메세지 발송하여 삭제하기
	@Override
	public int productAutoEnd(int goodsGrade) throws DataAccessException {
		List<Product> productList = sqlSession.selectList("mapper.product.productAutoSelectList", goodsGrade);
		System.out.println("1"+productList);
		if (productList.size() > 0) {
			System.out.println("2");
			for(int i=0; i<productList.size(); i++) {
				System.out.println("3");
				Product product=(Product)productList.get(i);
				System.out.println("4");
				List<ProductPurchaseDTO> productPurchaseDTOList = sqlSession.selectList("mapper.product.selectMaxDesiredPurPricePurchaseNo", product);
				System.out.println("5"+productPurchaseDTOList);
				for(ProductPurchaseDTO productPurchaseDTO : productPurchaseDTOList) {
					System.out.println(productPurchaseDTO);
					System.out.println("6");
					sqlSession.insert("mapper.product.insertEndSellMessage",productPurchaseDTO);
					System.out.println("7"+productPurchaseDTO);
					ProductPurchaseDTO productPurchaseDTO2 = sqlSession.selectOne("mapper.product.selectPurOne", productPurchaseDTO);
					System.out.println("8"+productPurchaseDTO2);
					sqlSession.insert("mapper.product.insertEndPurMessage",productPurchaseDTO2);
					System.out.println("9");
				}
			}
		}
			 int cnt = sqlSession.update("mapper.product.productAutoDelete"); 
		return cnt;
	}
}
