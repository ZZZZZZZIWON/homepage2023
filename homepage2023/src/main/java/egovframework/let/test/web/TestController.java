package egovframework.let.test.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.let.test.service.TestService;
import egovframework.let.test.service.TestVO;
import egovframework.rte.fdl.string.EgovStringUtil;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
@RequestMapping("/test")
public class TestController {

	@Resource(name = "testService")
	private TestService testService;
	
	private final String viewPath = "test/"; 

	@GetMapping("/list.do")
	public String selectList(TestVO testVO, HttpServletRequest request, ModelMap model) throws Exception {
		
		PaginationInfo paginationInfo = new PaginationInfo();

		paginationInfo.setCurrentPageNo(testVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(testVO.getPageUnit());
		paginationInfo.setPageSize(testVO.getPageSize());

		testVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		testVO.setLastIndex(paginationInfo.getRecordCountPerPage());
		testVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<EgovMap> resultList = testService.list(testVO);
		model.addAttribute("resultList", resultList);

		int totCnt = testService.listCnt(testVO);

		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		return viewPath + "List";
	}

	@GetMapping("/select.do")
	public String select(TestVO testVO, HttpServletRequest request, ModelMap model) throws Exception {
		TestVO result = testService.select(testVO);
		model.addAttribute("result", result);
		return viewPath + "Select";
	}

	@GetMapping("/regist.do")
	public String Regist(TestVO testVO, HttpServletRequest request, ModelMap model) throws Exception {
		TestVO result = new TestVO();
		// egovframework.let.utl.fcc.service.EgovStringUtil
		if (!EgovStringUtil.isEmpty(testVO.getTestId())) {
			result = testService.select(testVO);
		}
		model.addAttribute("result", result);

		return viewPath + "Regist";
	}

	@PostMapping("/insert.do")
	public String insert(TestVO testVO, HttpServletRequest request) throws Exception {
		testService.insert(testVO);

		return "redirect:list.do";
	}

	@PostMapping("/update.do")
	public String update(TestVO testVO, HttpServletRequest request) throws Exception {
		testService.update(testVO);
		return "redirect:list.do";
	}

	@GetMapping("/delete.do")
	public String delete(TestVO testVO, HttpServletRequest request) throws Exception {
		testService.delete(testVO);
		return "redirect:list.do";
	}

}
