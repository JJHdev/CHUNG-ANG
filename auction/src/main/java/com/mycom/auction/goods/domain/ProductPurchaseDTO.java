package com.mycom.auction.goods.domain;

public class ProductPurchaseDTO {
	private int sellNo;
	private String goodsSize;
	private int desiredPurPrice;
	private int purchaseNo;
	private String goodsName;
	private String id;
	private int desireQuantity;
	private int messageNo;
	public int getSellNo() {
		return sellNo;
	}
	public void setSellNo(int sellNo) {
		this.sellNo = sellNo;
	}
	public String getGoodsSize() {
		return goodsSize;
	}
	public void setGoodsSize(String goodsSize) {
		this.goodsSize = goodsSize;
	}
	public int getDesiredPurPrice() {
		return desiredPurPrice;
	}
	public void setDesiredPurPrice(int desiredPurPrice) {
		this.desiredPurPrice = desiredPurPrice;
	}
	public int getPurchaseNo() {
		return purchaseNo;
	}
	public void setPurchaseNo(int purchaseNo) {
		this.purchaseNo = purchaseNo;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getDesireQuantity() {
		return desireQuantity;
	}
	public void setDesireQuantity(int desireQuantity) {
		this.desireQuantity = desireQuantity;
	}
	public int getMessageNo() {
		return messageNo;
	}
	public void setMessageNo(int messageNo) {
		this.messageNo = messageNo;
	}
	@Override
	public String toString() {
		return "ProductPurchaseDTO [sellNo=" + sellNo + ", goodsSize=" + goodsSize + ", desiredPurPrice="
				+ desiredPurPrice + ", purchaseNo=" + purchaseNo + ", goodsName=" + goodsName + ", id=" + id
				+ ", desireQuantity=" + desireQuantity + ", messageNo=" + messageNo + "]";
	}
	
	
	
}
