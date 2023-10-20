package com.mycom.auction.review.service;

import java.util.List;
import java.util.Map;

import com.mycom.auction.review.domain.ReviewDTO;

public interface ReviewService {
	
	
	//전체 리뷰 개수 조회
	public int getTotalCnt() throws Exception;
		
	//특정 리뷰의 글번호 조회
	//파라미터 int no: 조회하고자하는 글번호
	public int getReviewNo(int no) throws Exception;
	
	//특정 리뷰의 제목 조회
	public String getTitleByReviewNo(int no) throws Exception;
	
	//특정 리뷰의 상세 조회
	public ReviewDTO getReviewDetail(int no) throws Exception;
	
	
	
	
	//파일 포함 상세 조회
	public Map reviewDetail(int no) throws Exception;
	
	
	
	
	//전체 리뷰 목록 조회
	public List<ReviewDTO> getReviewAllList() throws Exception;
	
	//조회수 증가
	public int increaseViewCnt(int no) throws Exception;
	
	//리뷰 글등록
	 public void insertReview(ReviewDTO reviewDTO) throws Exception;
	 
	//리뷰 글등록- 첨부파일정보 포함
	public int addNewReview(Map newReviewMap) throws Exception;

	 
	//특정 리뷰 글수정
	 public int updateReview(ReviewDTO reviewDTO) throws Exception;
	 
	//리뷰 삭제
	public int deleteReview(int no) throws Exception;
		

}
