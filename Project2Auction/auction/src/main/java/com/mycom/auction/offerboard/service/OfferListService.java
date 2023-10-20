package com.mycom.auction.offerboard.service;

import com.mycom.auction.offerboard.domain.OfferBoard;
import com.mycom.auction.offerboard.domain.Page;

public interface OfferListService {

	//전체 게시글 내용
	//public List<OfferBoard> getOfferAllList() throws Exception;
	
	
	 //특정글 상세 내용 조회
	public OfferBoard getOfferDetail(int no) throws Exception;
	
	
	//전체 게시글 수 
	//public int getTotalCnt() throws Exception;
	
	
	public OfferBoard getArticlePage(Page pageNo) throws Exception;
	
	public void insertOffer(OfferBoard offerBoard) throws Exception; 
	

	
}
