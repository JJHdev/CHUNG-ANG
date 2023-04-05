package com.mycom.auction.goodsSell.domain;

import java.util.Date;

//article테이블에  첨부되는 이미지파일들용 객체
public class ImageFileVO {
	
	private int sellNo;	//글번호.articleno컬럼 (article.articleno fk)
	private int sellImageNo;	//이미지번호
	private String sellImages;//이미지파일명
	
	
	public ImageFileVO(int sellNo, int sellImageNo, String sellImages) {
		this.sellNo = sellNo;
		this.sellImageNo = sellImageNo;
		this.sellImages = sellImages;
	}


	public ImageFileVO() {
	}
	public int getSellNo() {
		return sellNo;
	}
	public void setSellNo(int sellNo) {
		this.sellNo = sellNo;
	}
	public int getSellImageNo() {
		return sellImageNo;
	}
	public void setSellImageNo(int sellImageNo) {
		this.sellImageNo = sellImageNo;
	}
	public String getSellImages() {
		return sellImages;
	}
	public void setSellImages(String sellImages) {
		this.sellImages = sellImages;
	}


	@Override
	public String toString() {
		return "ImageFileVO [sellNo=" + sellNo + ", sellImageNo=" + sellImageNo + ", sellImages=" + sellImages + "]";
	}
	
}



