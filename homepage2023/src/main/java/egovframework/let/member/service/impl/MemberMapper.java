package egovframework.let.member.service.impl;

import egovframework.let.member.service.MemberVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("memberMapper")
public interface MemberMapper {
	
	// 회원 ID 찾기
	MemberVO findId(MemberVO vo) throws Exception;

	// 회원 비밀번호 수정
	MemberVO findPassword(MemberVO vo) throws Exception;

	// 회원 비밀번호 업데이트
	void passwordUpdate(MemberVO vo) throws Exception;
}
