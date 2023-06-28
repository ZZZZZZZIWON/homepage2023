package egovframework.let.join.service.impl;

import egovframework.let.join.service.JoinVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("joinMapper")
public interface JoinMapper {

	// ID 중복체크 
	int duplicateCheck(JoinVO vo) throws Exception;

	// 회원 등록
	void insertJoin(JoinVO vo) throws Exception;

	
}
