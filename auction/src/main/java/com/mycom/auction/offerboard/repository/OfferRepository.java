package com.mycom.auction.offerboard.repository;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.mycom.auction.offerboard.domain.OfferBoard;
import com.mycom.auction.offerboard.domain.Page;

public interface OfferRepository {
	
	
	
	//전체 목록조회
	public List<OfferBoard> getOfferAllList(Page pageNo) throws DataAccessException;
	
	
	//특정글 번호로 상세조회하기
	public OfferBoard getOfferDetail(int no) throws DataAccessException;
	
	
	//전체 게시글 수
	public int getTotal() throws DataAccessException;

	public void insertOffer(OfferBoard offerBoard) throws DataAccessException;	
	
}
