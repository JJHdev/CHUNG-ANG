package com.mycom.auction.review.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.mycom.auction.review.domain.ReviewDTO;
import com.mycom.auction.review.domain.ReviewFileVO;

@Repository
public class ReviewRepositoryImpl implements ReviewRepository{
	
    @Autowired
    private SqlSession sqlSession;

    //전체 리뷰 개수 조회
    @Override
  	public int getTotalCnt() throws DataAccessException{
		int cnt = (Integer)sqlSession.selectOne("mapper.review.totalCnt");
		return cnt;
	}
  		
  	//특정 리뷰의 글번호 조회
  	//파라미터 int no: 조회하고자하는 글번호
    @Override
	public int getReviewNo(int no) throws DataAccessException {
		return sqlSession.selectOne("mapper.review.getReviewNo",no);
	}
  	
  	//특정 리뷰의 제목 조회
    @Override
	public String getTitleByReviewNo(int no)  throws DataAccessException {
		return (String)sqlSession.selectOne("mapper.review.titleByReviewNo",no);
	}
  	
  	//특정 리뷰의 상세 조회
    @Override
	public ReviewDTO getReviewDetail(int no) throws DataAccessException {
		return (ReviewDTO)sqlSession.selectOne("mapper.review.reviewDetail", no);
	}
  	
    
    
    
    //파일 포함 상세조회
    @Override
	public ReviewDTO selectReviewDetail(int no) throws DataAccessException {
		return (ReviewDTO)sqlSession.selectOne("mapper.review.selectReviewDetail", no);
	}
	
	  //이미지목록조회??     
	  
	  @Override 
	  public List selectReviewDetailImage(int no) throws DataAccessException { 
		  return (List)sqlSession.selectList("mapper.review.selectReviewDetailImage", no); 
	}
	  
	 
    
    
    
  	//전체 리뷰 목록 조회
    @Override
	public List<ReviewDTO> getReviewAllList() throws DataAccessException {
		List<ReviewDTO> list = sqlSession.selectList("mapper.review.reviewAllList");
		return list;
	}
    
    //조회수 증가
    @Override
    public int increaseViewCnt(int no) throws Exception {
        return sqlSession.update("mapper.review.increaseViewCnt", no);
    }
  	
  	//리뷰 글등록
    @Override
	 public void insertReview(ReviewDTO review) throws DataAccessException { 
		 int cnt = sqlSession.insert("mapper.review.insertReview", review);
		 System.out.println("cnt="+cnt);
	  }
    
    
  //글등록- 첨부파일정보 포함
  	//파라미터 Map newReviewMap:글관련정보
  	//리턴      int 입력된 글번호
  	@Override
  	public int insertNewReview(Map newReviewMap) throws DataAccessException {
  		//sqlSession.insert("실행쿼리문id",파라미터);
  		sqlSession.insert("mapper.review.insertNewReview",newReviewMap);
  		return (Integer)newReviewMap.get("reviewNo"); //입력한 reviewNo를 반환
  	}

  	//글등록- 첨부파일정보 포함
  	@Override
  	public void insertReviewImageFile(List<ReviewFileVO> fileList) throws DataAccessException {
  		System.out.println("dao  fileList.size()="+fileList.size());
  		//첨부파일의 수 만큼  insert문을 실행
  		for(int i=0; i<fileList.size();i++){
  			ReviewFileVO reviewFileVO=(ReviewFileVO)fileList.get(i);
  			System.out.println(i+"번째 ReviewFileVO="+reviewFileVO);
  			sqlSession.insert("mapper.review.insertReviewImageFile",reviewFileVO);
  		}
  	}
  	
  	 
  	//특정 리뷰 글수정
    @Override
	 public int updateReview(ReviewDTO review) throws DataAccessException {
		 int cnt = sqlSession.update("mapper.review.updateReview", review);
		 System.out.println("cnt="+cnt);
		 return cnt;
	 }
  	 
  	//리뷰 삭제
    @Override
	public int deleteReview(int no) throws DataAccessException {
		int cnt = sqlSession.delete("mapper.review.deleteReview", no);
		 System.out.println("cnt="+cnt);
		 return cnt;
	}

	
  	
}

