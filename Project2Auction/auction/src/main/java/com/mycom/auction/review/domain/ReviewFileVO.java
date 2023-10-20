package com.mycom.auction.review.domain;

import java.util.Date;

public class ReviewFileVO {
	
	private int fileNo;			//이미지번호
	private int reviewNo;		//글번호
	private String fileName;	//이미지파일명
	//private String fileType; //파일타입
	//private String id;		//글등록자id
	private String id;		//작성자
	private Date creDate;		//등록일
	
	public ReviewFileVO() {
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	

	public String getid() {
		return id;
	}

	public void setid(String id) {
		this.id = id;
	}

	public Date getCreDate() {
		return creDate;
	}

	public void setCreDate(Date creDate) {
		this.creDate = creDate;
	}

	@Override
	public String toString() {
		return "ReviewFileVO [fileNo=" + fileNo + ", reviewNo=" + reviewNo + ", fileName=" + fileName + ", id=" + id
				+ ", creDate=" + creDate + "]";
	}



	
	
	
	
}
