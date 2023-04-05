package com.mycom.auction.offerboard.domain;

public class Page {

	int pageNo;
	int start;
	int end;

	public Page() {}
	public Page(int pageNo) {
		this.pageNo = pageNo;
		this.start = (pageNo-1)*5;
		this.end = pageNo*5;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	@Override
	public String toString() {
		return "Page [pageNo=" + pageNo + ", start=" + start + ", end=" + end + "]";
	}
	
	
}
