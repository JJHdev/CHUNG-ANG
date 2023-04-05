package com.mycom.auction.member.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.mycom.auction.member.domain.Criteria;
import com.mycom.auction.member.domain.Member;
import com.mycom.auction.member.domain.Page;
import com.mycom.auction.member.domain.User;

@Repository
public class MemberRepositoryImpl implements MemberRepository {

	@Autowired
	private SqlSession sqlSession;

	//회원가입
	public void memberJoin(Member member) throws DataAccessException {
		sqlSession.insert("mapper.member.memberJoin",member);
	}
	//회원상세조회
	public Member getMember(String id) throws DataAccessException {
		return (Member)sqlSession.selectOne("mapper.member.getMember",id);
	}
	//회원목록조회
	public List<Member> getMemberList() throws DataAccessException {
		List<Member> memberlist = sqlSession.selectList("mapper.member.getMemberList");
		return memberlist;
	}
	//회원목록조회(페이징)
	public List<Member> getMemberListPaging(Criteria cri) throws DataAccessException {
		List<Member> memberlist=sqlSession.selectList("mapper.member.getMemberListPaging",cri);
		return memberlist;
	}
	//회원목록조회(페이징+검색)
	public List<Member> getMemberListPagingSearch(Criteria cri) throws DataAccessException {
		List<Member> memberlist=sqlSession.selectList("mapper.member.getMemberListPagingSearch",cri);
		return memberlist;
	}
	//전체 멤버수 조회
	public int totalMember(Criteria cri) throws DataAccessException {
		int cnt=(Integer)sqlSession.selectOne("mapper.member.totalMember",cri);
		return cnt;
	}
	//회원수정
	public int memberUpdate(Member member) throws DataAccessException {
		int cnt = sqlSession.update("mapper.member.memberUpdate",member);
		return cnt;
	}
	//회원탈퇴
	public void memberDelete(String id) throws DataAccessException {
		sqlSession.selectOne("mapper.member.memberDelete",id);
	}
	//로그인
	public Member memberLogin(Member member) throws DataAccessException {
		return (Member)sqlSession.selectOne("mapper.member.memberLogin", member);
	}
	//아이디찾기
	public Member memberFindId(Member member) throws DataAccessException {
		return (Member)sqlSession.selectOne("mapper.member.memberFindId", member);
	}
	//비밀번호찾기
	public Member memberFindPwd(Member member) throws DataAccessException {
		return (Member)sqlSession.selectOne("mapper.member.memberFindPwd", member);
	}
	//아이디 중복체크
	public int idChk(Member member) throws DataAccessException {
		int result = (Integer)sqlSession.selectOne("mapper.member.idChk", member);
		return result;
	}
}
