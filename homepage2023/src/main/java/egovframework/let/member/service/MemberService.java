package egovframework.let.member.service;

public interface MemberService {

	// 회원 ID 찾기
	public MemberVO findId(MemberVO vo) throws Exception;

	// 회원 비밀번호 수정
	public MemberVO findPassword(MemberVO vo) throws Exception;

	// 회원 비밀번호 업데이트
	public void passwordUpdate(MemberVO vo) throws Exception;
} 
