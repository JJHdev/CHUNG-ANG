package com.mycom.auction.review.repository;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.mycom.auction.review.domain.ReviewDTO;
import com.mycom.auction.review.domain.ReviewFileVO;

public interface ReviewRepository {
	
	//전체 리뷰 개수 조회
	public int getTotalCnt() throws DataAccessException;
		
	//특정 리뷰의 글번호 조회
	//파라미터 int no: 조회하고자하는 글번호
	public int getReviewNo(int no) throws DataAccessException;
	
	//특정 리뷰의 제목 조회
	public String getTitleByReviewNo(int no) throws DataAccessException;
	
	//특정 리뷰의 상세 조회
	public ReviewDTO getReviewDetail(int no) throws DataAccessException;
	
	
	
	
	//파일 포함 상세조회
	public ReviewDTO selectReviewDetail(int no) throws DataAccessException;
	
	
	  //파일이미지목록조회? 
	public List selectReviewDetailImage(int no) throws DataAccessException;
	 
	
	
	
	//전체 리뷰 목록 조회
	public List<ReviewDTO> getReviewAllList() throws DataAccessException;
	
	//조회수 증가
	public int increaseViewCnt(int no) throws Exception;
	
	//리뷰 글등록
	 public void insertReview(ReviewDTO reviewDTO) throws DataAccessException;
	 
	//글등록- 첨부파일정보 포함
	//파라미터 Map newReviewMap:글관련정보
	public int insertNewReview(Map newReviewMap) throws DataAccessException;
	//파라미터 List<ReviewFileVO> fileList:첨부파일정보
	public void insertReviewImageFile(List<ReviewFileVO> fileList) throws DataAccessException;
	 
	 
	//특정 리뷰 글수정
	 public int updateReview(ReviewDTO reviewDTO) throws DataAccessException;
	 
	//리뷰 삭제
	public int deleteReview(int no) throws DataAccessException;
	
	

}
