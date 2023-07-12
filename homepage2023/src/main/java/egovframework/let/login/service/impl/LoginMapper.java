package egovframework.let.login.service.impl;

import egovframework.com.cmm.LoginVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("loginMapper")
public interface LoginMapper {
	
	// 일반 로그인 처리
	LoginVO actionLogin(LoginVO vo) throws Exception;

	
}
