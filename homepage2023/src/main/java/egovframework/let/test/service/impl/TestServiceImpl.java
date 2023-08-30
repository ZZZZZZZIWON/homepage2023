package egovframework.let.test.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.let.crud.service.CrudVO;
import egovframework.let.test.service.TestService;
import egovframework.let.test.service.TestVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("testService")
public class TestServiceImpl extends EgovAbstractServiceImpl implements TestService {

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertyService;
	
	@Resource(name = "testMapper")
	private TestMapper testMapper;
	
	
	@Resource(name = "egovTestIdGnrService")
	private EgovIdGnrService idgenService;
	
	public List<EgovMap> list(TestVO vo) throws Exception {
		return testMapper.list(vo);	
	}
	
	public int listCnt(TestVO vo) throws Exception {
		return testMapper.listCnt(vo);
	}
	
	public TestVO select(TestVO vo) throws Exception {
		return testMapper.select(vo);
	}	
	
	public String insert(TestVO vo) throws Exception {
		String id = idgenService.getNextStringId();
		vo.setTestId(id);
		testMapper.insert(vo);
		return id;
	}
	
	public void update(TestVO vo) throws Exception {
		testMapper.update(vo);
	}
	
	public void delete(TestVO vo) throws Exception {
		testMapper.delete(vo);
	}
}
