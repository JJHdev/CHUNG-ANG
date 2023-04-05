package com.mycom.auction.goods.domain;

import java.util.Date;

public class ProductFinally {
	
	private int messageNo;
	private int purchaseNo;
	private int sellNo;
	private String title;
	private String content;
	private Date sendTime;
	private String sendId;
	private String receiveId;
	
	@Override
	public String toString() {
		return "ProductFinally [messageNo=" + messageNo + ", purchaseNo=" + purchaseNo + ", sellNo=" + sellNo
				+ ", title=" + title + ", content=" + content + ", sendTime=" + sendTime + ", sendId=" + sendId
				+ ", receiveId=" + receiveId + "]";
	}
	public int getMessageNo() {
		return messageNo;
	}
	public void setMessageNo(int messageNo) {
		this.messageNo = messageNo;
	}
	public int getPurchaseNo() {
		return purchaseNo;
	}
	public void setPurchaseNo(int purchaseNo) {
		this.purchaseNo = purchaseNo;
	}
	public int getSellNo() {
		return sellNo;
	}
	public void setSellNo(int sellNo) {
		this.sellNo = sellNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getSendTime() {
		return sendTime;
	}
	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}
	public String getSendId() {
		return sendId;
	}
	public void setSendId(String sendId) {
		this.sendId = sendId;
	}
	public String getReceiveId() {
		return receiveId;
	}
	public void setReceiveId(String receiveId) {
		this.receiveId = receiveId;
	}
}
