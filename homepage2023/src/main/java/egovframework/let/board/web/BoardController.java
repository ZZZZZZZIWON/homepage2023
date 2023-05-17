package egovframework.let.board.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.let.board.service.BoardService;
import egovframework.let.board.service.BoardVO;
import egovframework.let.crud.service.CrudVO;
import egovframework.rte.fdl.string.EgovStringUtil;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class BoardController {

	@Resource(name = "boardService")
	private BoardService boardService;
	
	// 게시물 목록 가져오기
	@RequestMapping(value = "/board/selectList.do")
	public String selectList(@ModelAttribute("searchVO") BoardVO searchVO, HttpServletRequest request, ModelMap model) throws Exception {
	
		//공지 게시 글
		searchVO.setNoticeAt("Y");
		
		//java.util.list
		List<EgovMap> noticeResultList = boardService.selectBoardList(searchVO);
		model.addAttribute("noticeResultList", noticeResultList);
		
		PaginationInfo paginationInfo = new PaginationInfo();

		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getRecordCountPerPage());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		searchVO.setNoticeAt("N");
		List<EgovMap> resultList = boardService.selectBoardList(searchVO);
		model.addAttribute("resultList", resultList);

		int totCnt = boardService.selectBoardListCnt(searchVO);

		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		model.addAttribute("USER_INFO", user);
		
	return "board/BoardSelectList";
	}
	
	// 게시물 등록/수정
		@RequestMapping(value = "/board/boardRegist.do")
		public String boardRegist(@ModelAttribute("searchVO") BoardVO boardVO, HttpServletRequest request, ModelMap model) throws Exception {
			LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
			if(user == null || user.getId() == null) {
				model.addAttribute("message", "로그인 후 사용 가능합니다.");
				return "forward:/board/selectList.do";
			} else {
				model.addAttribute("USER_INFO", user);
			}
			
			BoardVO result = new BoardVO();
			// egovframework.let.utl.fcc.service.EgovStringUtil
			if(!EgovStringUtil.isEmpty(boardVO.getBoardId())) {
//				result = boardService.selectBoard(boardVO);
				// 본인 및 관리자만 허용
				if(!user.getId().equals(result.getFrstRegisterId()) && !"admin".equals(user.getId())) {
					model.addAttribute("message", "작성자 본인만 가능합니다.");
					return "forward:/board/selectList.do";
				} 
			}
			model.addAttribute("result", result);
			
			request.getSession().removeAttribute("sessionBoard");

			return "board/BoardRegist";
		}
}
