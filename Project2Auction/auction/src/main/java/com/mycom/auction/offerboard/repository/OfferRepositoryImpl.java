package com.mycom.auction.offerboard.repository;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.mycom.auction.offerboard.domain.OfferBoard;
import com.mycom.auction.offerboard.domain.Page;

@Repository
public class OfferRepositoryImpl implements OfferRepository {

	//필드
	@Autowired
	private SqlSession sqlSession;
	
	//전체목록조회 //spring resultview.jsp 에 뷰 작업해야함
	public List<OfferBoard> getOfferAllList(Page pageNo) throws DataAccessException{
		return sqlSession.selectList("mapper.offerBoard.offerAllList",pageNo);
		
	}
	//전체 게시글 수 
	@Override
	public int getTotal() throws DataAccessException {
		
		return sqlSession.selectOne("mapper.offerBoard.total");
	}

	
	//특정글번호 조회
	@Override
	public OfferBoard getOfferDetail(int no) throws DataAccessException {
		return (OfferBoard)sqlSession.selectOne("mapper.offerBoard.offerDetail",no);
		
	}
	@Override
	public void insertOffer(OfferBoard offerBoard) throws DataAccessException {
		
		sqlSession.insert("mapper.offerBoard.insertoffer", offerBoard);
	}

} 
