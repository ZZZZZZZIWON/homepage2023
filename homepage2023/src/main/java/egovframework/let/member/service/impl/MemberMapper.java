package egovframework.let.member.service.impl;

import java.util.List;

import egovframework.let.member.service.MemberVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("memberMapper")
public interface MemberMapper {
	
	// 회원 ID 찾기
	MemberVO findId(MemberVO vo) throws Exception;

	// 회원 비밀번호 수정
	MemberVO findPassword(MemberVO vo) throws Exception;

	// 회원 비밀번호 업데이트
	void passwordUpdate(MemberVO vo) throws Exception;

	// 회원 목록
	List<EgovMap> selectMemberList(MemberVO vo) throws Exception;

	// 회원 목록 수
	int selectMemberListCnt(MemberVO vo) throws Exception;

	//회원 상세
	EgovMap selectMember(MemberVO vo) throws Exception;
}
