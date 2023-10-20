package com.mycom.auction.member.repository;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.mycom.auction.member.domain.Criteria;
import com.mycom.auction.member.domain.Member;
import com.mycom.auction.member.domain.Page;
import com.mycom.auction.member.domain.User;

public interface MemberRepository {
	
		//회원가입
		public void memberJoin(Member member) throws DataAccessException;
		//회원상세조회
		public Member getMember(String id) throws DataAccessException;
		//회원목록조회
		public List<Member> getMemberList() throws DataAccessException;
		//회원목록조회(페이징)
		public List<Member> getMemberListPaging(Criteria cri) throws DataAccessException;
		//회원목록조회(페이징+검색)
		public List<Member> getMemberListPagingSearch(Criteria cri) throws DataAccessException;
		//전체 멤버수 조회
		public int totalMember(Criteria cri) throws DataAccessException;
		//회원수정
		public int memberUpdate(Member member) throws DataAccessException;
		//회원탈퇴
		public void memberDelete(String id) throws DataAccessException;
		//로그인
		public Member memberLogin(Member member) throws DataAccessException;
		//아이디찾기
		public Member memberFindId(Member member)throws DataAccessException;
		//비밀번호찾기
		public Member memberFindPwd(Member member) throws DataAccessException;
		//아이디 중복체크
		public int idChk(Member member) throws DataAccessException;

}
