package com.mycom.auction.goods.domain;

import java.util.Date;

public class ProductDTO {
	private String goods;
	private String goodsName;
	private String color;
	private String goodsContent;
	private int firstPrice;
	private int imageNo;
	private Date releaseDate;
	private String goodsSize;
	private String image;
	
	
	@Override
	public String toString() {
		return "ProductDTO [goods=" + goods + ", goodsName=" + goodsName + ", color=" + color + ", goodsContent="
				+ goodsContent + ", firstPrice=" + firstPrice + ", imageNo=" + imageNo + ", releaseDate=" + releaseDate
				+ ", goodsSize=" + goodsSize + ", image=" + image + "]";
	}
	public String getGoods() {
		return goods;
	}
	public void setGoods(String goods) {
		this.goods = goods;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getGoodsContent() {
		return goodsContent;
	}
	public void setGoodsContent(String goodsContent) {
		this.goodsContent = goodsContent;
	}
	public int getFirstPrice() {
		return firstPrice;
	}
	public void setFirstPrice(int firstPrice) {
		this.firstPrice = firstPrice;
	}
	public int getImageNo() {
		return imageNo;
	}
	public void setImageNo(int imageNo) {
		this.imageNo = imageNo;
	}
	public Date getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}
	public String getGoodsSize() {
		return goodsSize;
	}
	public void setGoodsSize(String goodsSize) {
		this.goodsSize = goodsSize;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
}
