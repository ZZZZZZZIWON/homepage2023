package egovframework.let.temp3.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.let.temp3.service.Temp3Service;
import egovframework.let.temp3.service.Temp3VO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("temp3Service")
public class Temp3ServiceImpl extends EgovAbstractServiceImpl implements Temp3Service {

//	@Resource(name = "tempDAO")
//	private TempDAO tempDAO;
	
	@Resource(name = "temp3Mapper") // Mapper의 name이랑 동일
	private Temp3Mapper temp3Mapper;
	
	
	@Resource(name = "egovTempIdGnrService")
	private EgovIdGnrService idgenService;
	
	
//	public TempVO selectTemp(TempVO vo) throws Exception {
//		return tempDAO.selectTemp(vo);
//	}
	
	// 임시 데이터 가져오기
	public Temp3VO selectTemp(Temp3VO vo) throws Exception {
		return temp3Mapper.selectTemp(vo);
	}	
	// 임시 데이터 목록 가져오기
	public List<EgovMap> selectTempList(Temp3VO vo) throws Exception {
		return temp3Mapper.selectTempList(vo);	
	}
	// 임시 데이터 목록 수
	public int selectTempListCnt(Temp3VO vo) throws Exception {
		return temp3Mapper.selectTempListCnt(vo);
	}
	// 임시 데이터 등록하기
	public String insertTemp(Temp3VO vo) throws Exception {
		String id = idgenService.getNextStringId();
		vo.setTempId(id);
		
		temp3Mapper.insertTemp(vo);
		return id;
	}
	
	// 임시 데이터 수정하기
	public void updateTemp(Temp3VO vo) throws Exception {
		temp3Mapper.updateTemp(vo);
	}
	
	// 임시 데이터 삭제하기
	public void deleteTemp(Temp3VO vo) throws Exception {
		temp3Mapper.deleteTemp(vo);
	}
}
