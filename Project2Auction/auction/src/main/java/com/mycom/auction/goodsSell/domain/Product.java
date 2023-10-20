package com.mycom.auction.goodsSell.domain;

public class Product {
	private int sellNo;
	private String itemSize;
	private int desiredSellPrice;
	private int quantity;
	private int goodsGrade;
	private String id;
	private String startTime;
	private String endTime;
	private String goods;
	private String vailDate;
	private int messageNo;
	@Override
	public String toString() {
		return "Product [sellNo=" + sellNo + ", itemSize=" + itemSize + ", desiredSellPrice=" + desiredSellPrice
				+ ", quantity=" + quantity + ", goodsGrade=" + goodsGrade + ", id=" + id + ", startTime=" + startTime
				+ ", endTime=" + endTime + ", goods=" + goods + ", vailDate=" + vailDate + ", messageNo=" + messageNo
				+ "]";
	}
	public int getSellNo() {
		return sellNo;
	}
	public void setSellNo(int sellNo) {
		this.sellNo = sellNo;
	}
	public String getItemSize() {
		return itemSize;
	}
	public void setItemSize(String itemSize) {
		this.itemSize = itemSize;
	}
	public int getDesiredSellPrice() {
		return desiredSellPrice;
	}
	public void setDesiredSellPrice(int desiredSellPrice) {
		this.desiredSellPrice = desiredSellPrice;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getGoodsGrade() {
		return goodsGrade;
	}
	public void setGoodsGrade(int goodsGrade) {
		this.goodsGrade = goodsGrade;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getGoods() {
		return goods;
	}
	public void setGoods(String goods) {
		this.goods = goods;
	}
	public String getVailDate() {
		return vailDate;
	}
	public void setVailDate(String vailDate) {
		this.vailDate = vailDate;
	}
	public int getMessageNo() {
		return messageNo;
	}
	public void setMessageNo(int messageNo) {
		this.messageNo = messageNo;
	}
	
	
}
