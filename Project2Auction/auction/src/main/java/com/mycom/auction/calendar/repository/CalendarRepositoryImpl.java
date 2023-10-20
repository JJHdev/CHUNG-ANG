package com.mycom.auction.calendar.repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.mycom.auction.calendar.domain.Calendar;

@Repository
public class CalendarRepositoryImpl implements CalendarRepository{

	/*action-mybatis.xml에서   sqlSession이름으로  bean객체만들어진 것을
	 * 자동주입(@Autowired)시켜준다
	<bean id="sqlSession"
		  class="org.mybatis.spring.SqlSessionTemplate">
		<constructor-arg index="0" ref="sqlSessionFactory"></constructor-arg>
	</bean>*/

	//필드
	@Autowired
	private SqlSession sqlSession;
	
	
	/*여기에서는 action-mybatis.xml에서   
	 실행하고자하는 쿼리를 가진 문서는 아래와 같이 설정하였다
	 <property name="mapperLocations" 
	           value="classpath:mybatis/mappers/*.xml" />*/
	//전체 게시물수 조회
	public int getTotalCnt() throws DataAccessException{
		int cnt = (Integer)sqlSession.selectOne("mapper.calendar.totalCnt");
		return cnt;
	}
	//전체 일정 캘린더 조회
		@Override
		public List<Calendar> getCalendarAllList2() throws DataAccessException {
			List<Calendar> list = (ArrayList)sqlSession.selectList("mapper.calendar.calenList");
			return list;
		}

	//전체 목록 조회
	@Override
	public List<Calendar> getCalendarAllList() throws DataAccessException {
		List<Calendar> list = (ArrayList)sqlSession.selectList("mapper.calendar.selectAllList");
		return list;
	}

	//삭제하기
	@Override
	public int deleteCalendar(int no) throws DataAccessException {
		int cnt=sqlSession.delete("mapper.calendar.deleteCalendar",no);
		
		return cnt;
	}
	
	//글등록하기
	@Override
	public int insertCalendar(Calendar calendar) {
		int cnt = (Integer)sqlSession.insert("mapper.calendar.insertCalendar",calendar);
	return cnt;
	}
	
	//특정 게시물 조회
	@Override
	public Calendar getCalendarDetail(int no) {
		return (Calendar)sqlSession.selectOne("mapper.calendar.selectCalenNoList",no);
		
	}
	
	//특정 게시물 수정
	@Override
	public int undateCalendar(Calendar calendar) {
		return sqlSession.update("mapper.calendar.updateCalendar", calendar);
		
	}
	
	

	
}
