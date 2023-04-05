package com.mycom.auction.calendar.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Calendar {
	
	private int calenNo;
	private String calenTitle;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date calenStart;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date calenEnd;
    
	/*set/get메서드*/
	public Calendar() {
	}
	public int getCalenNo() {
		return calenNo;
	}
	public void setCalenNo(int calenNo) {
		this.calenNo = calenNo;
	}
	public String getCalenTitle() {
		return calenTitle;
	}
	public void setCalenTitle(String calenTitle) {
		this.calenTitle = calenTitle;
	}
	public Date getCalenStart() {
		return calenStart;
	}
	public void setCalenStart(Date calenStart) {
		this.calenStart = calenStart;
	}
	public Date getCalenEnd() {
		return calenEnd;
	}
	public void setCalenEnd(Date calenEnd) {
		this.calenEnd = calenEnd;
	}
	@Override
	public String toString() {
		return "Calendar [calenNo=" + calenNo + ", calenTitle=" + calenTitle + ", calenStart=" + calenStart
				+ ", calenEnd=" + calenEnd + "]";
	}
	
}
