package com.mycom.auction.calendar.repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.mycom.auction.calendar.domain.Calendar;

public interface CalendarRepository {

	
		//전체 게시물수 조회
		public int getTotalCnt() throws DataAccessException;
		
		//전체일정 캘린더 조회(사용자용)
		public List<Calendar> getCalendarAllList2() throws DataAccessException;
		
		//전체 일정 목록 조회(관리자용)
		public List<Calendar> getCalendarAllList() throws DataAccessException;

		
		//특정 번호 삭제
		public int deleteCalendar(int no) throws DataAccessException;

		//일정등록
		public int insertCalendar(Calendar calendar);

		//특정번호 조회
		public Calendar getCalendarDetail(int no);

		//수정처리
		public int undateCalendar(Calendar calendar);

		
}
