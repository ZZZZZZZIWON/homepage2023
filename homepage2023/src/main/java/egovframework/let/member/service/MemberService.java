package egovframework.let.member.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface MemberService {

	// 회원 ID 찾기
	 MemberVO findId(MemberVO vo) throws Exception;

	// 회원 비밀번호 수정
	 MemberVO findPassword(MemberVO vo) throws Exception;

	// 회원 비밀번호 업데이트
	 void passwordUpdate(MemberVO vo) throws Exception;

	// 회원 목록 가져오기
	 List<EgovMap> selectMemberList(MemberVO vo) throws Exception;

	// 회원 수 가져오기 
	 int selectMemberListCnt(MemberVO vo) throws Exception;

	// 회원 상세 
	EgovMap selectMember(MemberVO vo) throws Exception;
} 
