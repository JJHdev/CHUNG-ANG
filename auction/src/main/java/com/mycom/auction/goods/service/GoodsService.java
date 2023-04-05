package com.mycom.auction.goods.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycom.auction.goods.domain.ProductDTO;
import com.mycom.auction.goods.domain.ProductFinally;
import com.mycom.auction.goods.domain.ProductPurchaseDTO;
import com.mycom.auction.goods.repository.GoodsRepository;
import com.mycom.auction.goodsSell.domain.Product;

@Service
public class GoodsService{

	@Autowired
	GoodsRepository goodsRepository;
	

	public String insertImageGoods(Map newGoodsMap) throws Exception {
		//int article_id에는 article테이블에 지금 입력된 article테이블의 글번호
		String goods=goodsRepository.insertNewGoods(newGoodsMap);
				
			//List<ImageFileVO> imageFileList에는 첨부파일정보
			List<ProductDTO> imageFileList= (ArrayList)newGoodsMap.get("imageFileList");
			for(ProductDTO productDTO : imageFileList) {
				productDTO.setGoods(goods);
				System.out.println("서비스 for문안 imageFileVO="+productDTO);
			}
			goodsRepository.insertGoodsImageFile(imageFileList);
			goodsRepository.insertGoodsSize(newGoodsMap);
			return goods;
	}


	public List<ProductDTO> selectAllGoodsList() {
		List<ProductDTO> goodsInfo = goodsRepository.selectAllGoodsList();
		System.out.println("Servic goodsInfo"+goodsInfo);
		return goodsInfo;
	}


	public ProductDTO selectImageInfo(String goods) {
		ProductDTO ImageInfo=goodsRepository.selectImageInfo(goods);
		return ImageInfo;
	}


	public ProductDTO selectGoodsList(String goods) {
		ProductDTO goodsInfo = goodsRepository.selectGoodsList(goods);
		return goodsInfo;
	}


	public List<ProductDTO> selectImageAllInfo(String goods) {
		List<ProductDTO> ImageInfo=goodsRepository.selectImageAllInfo(goods);
		return ImageInfo;

	}


	public List<ProductDTO> selectGoodsSizeList(String goods) {
		List<ProductDTO> SizeInfo=goodsRepository.selectSizeAllInfo(goods);
		return SizeInfo;
	}


	public List<Product> selectSellGoodsList(String goodsSize, String goods) {
		List<Product> goodsSell=goodsRepository.selectSellGoodsList(goodsSize,goods);
		return goodsSell;
	}


	public List<ProductPurchaseDTO> sellNoGoodsSearch(int sellNo) {
		List<ProductPurchaseDTO> sellNoList=goodsRepository.sellNoGoodsSearch(sellNo);
		return sellNoList;
	}


	public Map<String,List> selectMessageList(String id) {
		Map<String,List> selectMessagePurList=goodsRepository.selectMessageList(id);
		return selectMessagePurList;
	}
	
	public Map<String,List> selectMessageSellList(String id) {
		Map<String,List> selectMessagePurList=goodsRepository.selectMessageList2(id);
		return selectMessagePurList;
	}
	
}








