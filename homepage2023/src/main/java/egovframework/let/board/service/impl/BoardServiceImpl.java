package egovframework.let.board.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.let.board.service.BoardService;
import egovframework.let.board.service.BoardVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("boardService")
public class BoardServiceImpl extends EgovAbstractServiceImpl implements BoardService {

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertyService;
	
	@Resource(name = "boardMapper")
	private BoardMapper boardMapper;
	
	
	@Resource(name = "egovBoardIdGnrService")
	private EgovIdGnrService idgenService;
	
	// 게시물 목록 가져오기
	public List<EgovMap> selectBoardList(BoardVO vo) throws Exception {
		return boardMapper.selectBoardList(vo);	
	}
	
	// 게시물 목록 수
	public int selectBoardListCnt(BoardVO vo) throws Exception {
		return boardMapper.selectBoardListCnt(vo);
	}

	// 게시물 등록하기
	public String insertBoard(BoardVO vo) throws Exception {
		String id = idgenService.getNextStringId();
		vo.setBoardId(id);
		boardMapper.insertBoard(vo);
		return id;
	}
	
	// CRUD 가져오기
	public BoardVO selectBoard(BoardVO vo) throws Exception {
		return boardMapper.selectBoard(vo);
	}	
	
	// CRUD 수정하기
	public void updateBoard(BoardVO vo) throws Exception {
		boardMapper.updateBoard(vo);
	}
	
	// CRUD 삭제하기
	public void deleteBoard(BoardVO vo) throws Exception {
		boardMapper.deleteBoard(vo);
	}
}
