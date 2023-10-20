package com.mycom.auction.offerboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycom.auction.offerboard.domain.OfferBoard;
import com.mycom.auction.offerboard.domain.Page;
import com.mycom.auction.offerboard.repository.OfferRepository;

@Service
public class OfferListServiceImpl implements OfferListService {

	@Autowired
	OfferRepository offerRepository ;
	
	/*
	 * //전체 데이터 리스트 조회 public List<OfferBoard> getOfferAllList() throws Exception{
	 * 
	 * return offerRepository.getOfferAllList(page); }
	 */
	
	//특정글 상세조회
	 @Override 
	 public OfferBoard getOfferDetail(int no) throws Exception {
		 
	 return	offerRepository.getOfferDetail(no);
	 }	

	 
		
	@Override
	public OfferBoard getArticlePage(Page pageNo) throws Exception {
		
		int total = offerRepository.getTotal(); //전체 게시글 수 
		List<OfferBoard> OfferAllList = offerRepository.getOfferAllList(pageNo);
		return new OfferBoard(total,pageNo.getPageNo(),5, OfferAllList);
	}


	@Override
	public void insertOffer(OfferBoard offerBoard) throws Exception {
		offerRepository.insertOffer(offerBoard);
		
	}

	
	
	 
	
	
	
	
	
	
	
	
	
	
	
	
}
