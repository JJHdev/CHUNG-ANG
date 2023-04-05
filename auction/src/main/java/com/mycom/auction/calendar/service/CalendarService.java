package com.mycom.auction.calendar.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


import com.mycom.auction.calendar.domain.Calendar;

public interface CalendarService {

	//전체목록조회
	public List<Calendar> getCalendarAllList();
	
	//전체 캘린더 조회
	public List<Calendar> getCalendarAllList2();
	//해당 월 일정 조회

	
	//특정 일정의 상세 데이터 조회 특정 번호의 셀렉트문
	public Calendar getCalendarDetail(int no);
	
	//특정 일정 등록
	public int insertCalendar(Calendar calendar);
	//특정 일정 수정
	public int updateCalendar(Calendar calendar);
	
	
	//특정 일정 삭제
	//public abstract int 딜리트 where 특정번호
	public int deleteCalendar(int no);


	

	


	


	
}
