package com.mycom.auction.member.domain;

public class Page {
	

    private int startPage; //시작페이지
    private int endPage; //끝페이지
    private boolean prev, next; //이전페이지 다음페이지 유무
    private int total; //전체게시물수
    private Criteria cri; //현재페이지, 페이지당 게시물 표시수 정보
	
    public Page(Criteria cri, int total) {
        
        this.cri = cri;
        this.total = total;
        
        this.endPage = (int)(Math.ceil(cri.getPageNum()/10.0))*10; //마지막
        this.startPage = this.endPage - 9; //시작
        
        int realEnd = (int)(Math.ceil(total * 1.0/cri.getAmount())); //전체 마지막 페이지
        if(realEnd < this.endPage) {
            this.endPage = realEnd;
        }
        this.prev = this.startPage > 1; //시작페이지값이 1보다 큰경우 - true
        this.next = this.endPage < realEnd; //마지막페이지값이 1보다 큰경우 - true
    }
	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}

	@Override
	public String toString() {
		return "Page [startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next
				+ ", total=" + total + ", cri=" + cri + "]";
	}
    
}
