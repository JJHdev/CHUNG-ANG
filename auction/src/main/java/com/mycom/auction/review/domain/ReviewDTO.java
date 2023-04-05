package com.mycom.auction.review.domain;

import java.sql.Date;

	public class ReviewDTO {
	    private int reviewNo; // 리뷰글번호
	    private String id; // 회원 아이디(작성자)
	    //private int sellNo; // 판매등록번호
	    private String reviewTitle; // 리뷰 제목
	    private String reviewContent; // 리뷰 내용
	    private Date reviewDate; // 리뷰 작성일
	    //private String filePath; //첨부파일경로
        private String starRating; //별점
        //private int recommendCnt; //추천수
        private int viewCnt; //조회수
        private String review_fileName;	//이미지파일명
		

      


		public String getReview_fileName() {
			return review_fileName;
		}


		public void setReview_fileName(String review_fileName) {
			this.review_fileName = review_fileName;
		}


		//생성자
        public ReviewDTO() {
		}


	    //getter, setter

		public int getReviewNo() {
			return reviewNo;
		}


		public void setReviewNo(int reviewNo) {
			this.reviewNo = reviewNo;
		}


		public String getId() {
			return id;
		}


		public void setId(String id) {
			this.id = id;
		}


		/*
		 * public int getSellNo() { return sellNo; }
		 * 
		 * 
		 * public void setSellNo(int sellNo) { this.sellNo = sellNo; }
		 */

		public String getReviewTitle() {
			return reviewTitle;
		}


		public void setReviewTitle(String reviewTitle) {
			this.reviewTitle = reviewTitle;
		}


		public String getReviewContent() {
			return reviewContent;
		}


		public void setReviewContent(String reviewContent) {
			this.reviewContent = reviewContent;
		}


		public Date getReviewDate() {
			return reviewDate;
		}


		public void setReviewDate(Date reviewDate) {
			this.reviewDate = reviewDate;
		}


		/*
		 * public String getFilePath() { return filePath; }
		 * 
		 * 
		 * public void setFilePath(String filePath) { this.filePath = filePath; }
		 */

		public String getStarRating() {
			return starRating;
		}


		public void setStarRating(String starRating) {
			this.starRating = starRating;
		}


		/*
		 * public int getRecommendCnt() { return recommendCnt; }
		 * 
		 * 
		 * public void setRecommendCnt(int recommendCnt) { this.recommendCnt =
		 * recommendCnt; }
		 */


		public int getViewCnt() {
			return viewCnt;
		}


		public void setViewCnt(int viewCnt) {
			this.viewCnt = viewCnt;
		}


		@Override
		public String toString() {
			return "ReviewDTO [reviewNo=" + reviewNo + ", id=" + id + ", reviewTitle=" + reviewTitle
					+ ", reviewContent=" + reviewContent + ", reviewDate=" + reviewDate + ", starRating=" + starRating
					+ ", viewCnt=" + viewCnt + ", review_fileName=" + review_fileName + "]";
		}




		//toString 메서드 
	

		
		/*
		 * @Override public String toString() { return "ReviewDTO [reviewNo=" + reviewNo
		 * + ", id=" + id + ", sellNo=" + sellNo + ", reviewTitle=" + reviewTitle +
		 * ", reviewContent=" + reviewContent + ", reviewDate=" + reviewDate +
		 * ", filePath=" + filePath + ", starRating=" + starRating + ", recommendCnt=" +
		 * recommendCnt + ", viewCnt=" + viewCnt + "]"; }
		 * 
		 */
}
