package egovframework.let.test.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface TestService {
	
	public List<EgovMap> list(TestVO vo) throws Exception; 
	
	public int listCnt(TestVO vo) throws Exception; 

	public TestVO select(TestVO vo) throws Exception;

	public String insert(TestVO vo) throws Exception; 
	
	public void update(TestVO vo) throws Exception; 
	
	public void delete(TestVO vo) throws Exception;
	
}
