package com.mycom.auction.goodsSell.domain;


public class Criteria {
	
	private int pageNum;
	private int amount;
	private int goodsGrade;
	
	public Criteria() {
		this(1,10);
	}
	
	
	public int getGoodsGrade() {
		return goodsGrade;
	}
	public void setGoodsGrade(int goodsGrade) {
		this.goodsGrade = goodsGrade;
	}

	public Criteria(int pageNum,int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}

	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", amount=" + amount + ", goodsGrade=" + goodsGrade + "]";
	}
	
	
	
	
	
}
