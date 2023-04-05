package com.mycom.auction.calendar.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycom.auction.calendar.domain.Calendar;
import com.mycom.auction.calendar.repository.CalendarRepository;

@Service
public class CalendarServiceImpl implements CalendarService{

	
	
	@Autowired
	private CalendarRepository calendarRepository;
	
	
	
	


	public List<Calendar> getCalendarAllList() {
		return calendarRepository.getCalendarAllList();
	}

	public List<Calendar> getCalendarAllList2() {
		return calendarRepository.getCalendarAllList2();
	}


	//수정폼을 위한 조회
	public Calendar getCalendarDetail(int no) {
		return calendarRepository.getCalendarDetail(no);
	}



	public int updateCalendar(Calendar calendar) {
		return calendarRepository.undateCalendar(calendar);
	}


	//삭제하기
	public int deleteCalendar(int no) {
		return calendarRepository.deleteCalendar(no);
	}

	public int insertCalendar(Calendar calendar) {
		return calendarRepository.insertCalendar(calendar);
	}

	

	

	


	
}
