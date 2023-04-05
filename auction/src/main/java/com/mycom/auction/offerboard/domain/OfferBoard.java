package com.mycom.auction.offerboard.domain;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

public class OfferBoard {

	//필드
	private int offerno; //게시글 번호
	private String id;	//사용자 ID
	private String offertitle; //제목
	private String offerpoint; // 거래장소
	private int pay; 			//급여
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date wttime;	//거래 일시
	private String offercontent; //본문내용
	private int viewcnt; //조회수
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date starttime; //대행 시작일시
	
	
	//페이징 필드
	
	private int totalcnt;
	private int currentpage;
	private List<OfferBoard> contents;
	private int totalpages;
	private int startpage;
	private int endpage;

	@Override
	public String toString() {
		return "OfferBoard [offerno=" + offerno + ", id=" + id + ", offertitle=" + offertitle + ", offerpoint="
				+ offerpoint + ", pay=" + pay + ", wttime=" + wttime + ", offercontent=" + offercontent + ", viewcnt="
				+ viewcnt + ", starttime=" + starttime + ", totalcnt=" + totalcnt
				+ ", currentpage=" + currentpage + ", contents=" + contents + ", totalpages=" + totalpages
				+ ", startpage=" + startpage + ", endpage=" + endpage + "]";
	}






	//기본생성자
	public OfferBoard() {}

	
	



		public Integer getOfferno() {
		return offerno;
	}






	public void setOfferno(Integer offerno) {
		this.offerno = offerno;
	}






	public String getId() {
		return id;
	}






	public void setId(String id) {
		this.id = id;
	}






	public String getOffertitle() {
		return offertitle;
	}






	public void setOffertitle(String offertitle) {
		this.offertitle = offertitle;
	}






	public String getOfferpoint() {
		return offerpoint;
	}






	public void setOfferpoint(String offerpoint) {
		this.offerpoint = offerpoint;
	}






	public int getPay() {
		return pay;
	}






	public void setPay(int pay) {
		this.pay = pay;
	}






	public Date getWttime() {
		return wttime;
	}






	public void setWttime(Date wttime) {
		this.wttime = wttime;
	}






	public String getOffercontent() {
		return offercontent;
	}

	public void setOffercontent(String offercontent) {
		this.offercontent = offercontent;
	}
	public int getViewcnt() {
		return viewcnt;
	}

	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}

	

	public Date getStarttime() {
		return starttime;
	}

	public void setStarttime(Date starttime) {
		this.starttime = starttime;
	}

	public int getTotalcnt() {
		return totalcnt;
	}






	public void setTotalcnt(int totalcnt) {
		this.totalcnt = totalcnt;
	}






	public int getCurrentpage() {
		return currentpage;
	}






	public void setCurrentpage(int currentpage) {
		this.currentpage = currentpage;
	}






	public List<OfferBoard> getContents() {
		return contents;
	}






	public void setContents(List<OfferBoard> contents) {
		this.contents = contents;
	}

	public int getTotalpages() {
		return totalpages;
	}


	public void setTotalpages(int totalpages) {
		this.totalpages = totalpages;
	}

	public int getStartpage() {
		return startpage;
	}

	public void setStartpage(int startpage) {
		this.startpage = startpage;
	}

	public int getEndpage() {
		return endpage;
	}

	public void setEndpage(int endpage) {
		this.endpage = endpage;
	}






		//페이징 생성자
		public OfferBoard(int totalcnt, int currentPage, 
				   int size, List<OfferBoard> contents) {
			this.totalcnt = totalcnt;
			this.currentpage = currentPage;
			this.contents = contents;
			if (totalcnt == 0) { 		//게시물이 존재하지 않는 경우
				totalpages = 0;
				startpage = 0;
				endpage = 0;
			}else{ 				//게시물이 존재하는 경우
				totalpages = totalcnt/size; //총페이지수=전체게시물수/1page당 보여줄 게시물수
				if (totalcnt%size>0) {      //나머지가 0보다 크면
					totalpages++;        //전체페이수를 1씩증가
				}
				int modVal=currentPage%5;  //user가보고싶은 요청페이지를 5로 나눈 나머지를 저장
				startpage =currentPage/5*5 + 1;
				//modVal==0은 요청페이지가 5의배수인 5 10 15....
				if (modVal==0) 
				startpage-=5;//startPage=startPage-5;
				endpage = startpage + 4;
				//endPage가 전체페이수보다크면  endPage값을 전체페이수로 적용해라
				if(endpage>totalpages)endpage=totalpages;
			}
		}

	
	
}
