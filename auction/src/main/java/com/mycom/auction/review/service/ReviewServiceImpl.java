package com.mycom.auction.review.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycom.auction.review.domain.ReviewDTO;
import com.mycom.auction.review.domain.ReviewFileVO;
import com.mycom.auction.review.repository.ReviewRepository;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	private ReviewRepository reviewRepository;

	
	//전체 리뷰 개수 조회
	@Override
	public int getTotalCnt() throws Exception{
	return reviewRepository.getTotalCnt();
	}
	
	//특정 리뷰의 글번호 조회
	//파라미터 int no: 조회하고자하는 글번호
	@Override
	public int getReviewNo(int no) throws Exception{
	return reviewRepository.getReviewNo(no);
	}
	
	//특정 리뷰의 제목 조회
	@Override
	public String getTitleByReviewNo(int no) throws Exception {
	return reviewRepository.getTitleByReviewNo(no);
	}
	//특정 리뷰의 상세 조회
	@Override
	public ReviewDTO getReviewDetail(int no) throws Exception {
	return reviewRepository.getReviewDetail(no);
	}
	
	
	//파일 포함 상세조회
	@Override
	public Map reviewDetail(int no) throws Exception {
		
		Map<String,Object> reviewMap = new HashMap<String,Object>();
		
		ReviewDTO reviewdto = reviewRepository.selectReviewDetail(no);
		reviewMap.put("reviewdto", reviewdto);
		
		  //List : 상품이미지목록조회 
		List<ReviewFileVO> imageList = reviewRepository.selectReviewDetailImage(no);
		  reviewMap.put("imageList",imageList);
		 
		return reviewMap;
	}
	
	
	
	
	//전체 리뷰 목록 조회
	@Override
	public List<ReviewDTO> getReviewAllList() throws Exception{
	List<ReviewDTO> reivewList = reviewRepository.getReviewAllList();
	return reivewList;
	}
	
	 //조회수 증가
    @Override
    public int increaseViewCnt(int no) throws Exception {
        return reviewRepository.increaseViewCnt(no);
    }

	//리뷰 글등록
	@Override
	public void insertReview(ReviewDTO reivewDTO) throws Exception {
		reviewRepository.insertReview(reivewDTO);
	}
	 
	//리뷰 글등록-첨부파일포함
	@Override
	public int addNewReview(Map newReviewMap) throws Exception {

		//int reviewNo에는 review테이블에 지금 입력된 review테이블의 글번호
		//입력한 reviewNo를 반환
		int reviewNo=reviewRepository.insertNewReview(newReviewMap);
		
		//List<ReviewFileVO> reviewFileList에는 첨부파일정보
		List<ReviewFileVO> reviewFileList= (ArrayList)newReviewMap.get("reviewFileList");
		for(ReviewFileVO reviewFileVO : reviewFileList) {
			reviewFileVO.setReviewNo(reviewNo);
			System.out.println("서비스 for문안 reviewFileVO="+reviewFileVO);
		}
		reviewRepository.insertReviewImageFile(reviewFileList);
		return reviewNo;
	}
	
	//특정 리뷰 글수정
	@Override
	public int updateReview(ReviewDTO reivewDTO) throws Exception {
	return reviewRepository.updateReview(reivewDTO);
	}
	
	
	//파일 수정
	
	  
	
	//리뷰 삭제
	@Override
	public int deleteReview(int no) throws Exception {
	return reviewRepository.deleteReview(no);
	}



}
