package egovframework.let.test.service.impl;

import java.util.List;

import egovframework.let.test.service.TestVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("testMapper")
public interface TestMapper {

	List<EgovMap> list(TestVO vo) throws Exception;

	int listCnt(TestVO vo) throws Exception;

	TestVO select(TestVO vo) throws Exception;

	void insert(TestVO vo) throws Exception;

	void update(TestVO vo) throws Exception;

	void delete(TestVO vo) throws Exception;
}
