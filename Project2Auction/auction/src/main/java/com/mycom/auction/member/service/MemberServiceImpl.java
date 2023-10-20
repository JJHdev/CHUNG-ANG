package com.mycom.auction.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycom.auction.member.domain.Criteria;
import com.mycom.auction.member.domain.Member;
import com.mycom.auction.member.domain.Page;
import com.mycom.auction.member.domain.User;
import com.mycom.auction.member.repository.MemberRepository;

@Service
public class MemberServiceImpl implements MemberService {
		@Autowired
		private MemberRepository memberRepository;
	
		//회원가입
		public void memberJoin(Member member) throws Exception{
			memberRepository.memberJoin(member);
		}
		//회원상세조회
		public Member getMember(String id) throws Exception{
			return memberRepository.getMember(id);
		}
		//회원목록조회
		public List<Member> getMemberList() throws Exception{
			List<Member> memberlist = memberRepository.getMemberList();
			return memberlist;
		}
		//회원목록조회(페이징)
		public List<Member> getMemberListPaging(Criteria cri) throws Exception{
			List<Member> memberlist = memberRepository.getMemberListPaging(cri);
			return memberlist;
		}
		//회원목록조회(페이징+검색)
		public List<Member> getMemberListPagingSearch(Criteria cri) throws Exception{
			List<Member> memberlist = memberRepository.getMemberListPaging(cri);
			return memberlist;
				}
		//전체 멤버수 조회
		public int totalMember(Criteria cri) throws Exception{
			return memberRepository.totalMember(cri);
		}
		//회원수정
		public int memberUpdate(Member member) throws Exception{
			int cnt = memberRepository.memberUpdate(member);
			return cnt;
		}
		//회원탈퇴
		public void memberDelete(String id) throws Exception{
			memberRepository.memberDelete(id);
		}
		//로그인
		public Member memberLogin(Member memeber) throws Exception{
			return memberRepository.memberLogin(memeber);
		}
		//아이디찾기
		public Member memberFindId(Member member)throws Exception {
			return memberRepository.memberFindId(member);
		}
		//비밀번호찾기
		public Member memberFindPwd(Member member) throws Exception {
			return memberRepository.memberFindPwd(member);
		}
		//아이디 중복체크
		public int idChk(Member member) throws Exception {
			int result = memberRepository.idChk(member);
			return result;
		}
}
