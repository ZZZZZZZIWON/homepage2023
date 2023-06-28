package egovframework.let.join.web;

import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mysql.fabric.Response;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.let.join.service.JoinService;
import egovframework.let.join.service.JoinVO;
import net.sf.json.JSONObject;

@Controller
public class JoinController {
	
	@Resource(name="egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	@Resource(name="joinService")
	private JoinService joinService;
	
	// 약관 동의
	@RequestMapping(value="/join/siteUseAgree.do")
	public String siteUseAgree(@ModelAttribute("searchVO") JoinVO vo, HttpServletRequest request, ModelMap model, HttpSession session) throws Exception {
		
		return "join/SiteUseAgree";
	}
	
	// 회원 구분
	@RequestMapping(value="/join/memberType.do")
	public String memberType(@ModelAttribute("searchVO") JoinVO vo, HttpServletRequest request, ModelMap model, HttpSession session) throws Exception {
		
		return "join/MemberType";
	}
	
	// 회원 등록 폼
	@RequestMapping(value="/join/memberRegist.do")
	public String memberRegist(@ModelAttribute("searchVO") JoinVO vo, HttpServletRequest request, ModelMap model, HttpSession session) throws Exception {
		
		return "join/MemberRegist";
	}
	
	// 아이디 중복 체크
	@RequestMapping(value="/join/duplicateCheck.do")
	public void duplicateCheck(@ModelAttribute("searchVO") JoinVO vo, HttpServletRequest request, HttpServletResponse response,  ModelMap model) 
			throws Exception {
		String successYn = "Y";
		String message = "성공";
		
		JSONObject jo = new JSONObject();
		response.setContentType("application/json; charset=utf-8");
		
		int duplicateCnt = joinService.duplicateCheck(vo);
		if(duplicateCnt > 0) {
			successYn = "N";
			message = egovMessageSource.getMessage("fail.duplicate.member"); // 이미 사용 중인 ID입니다.
		} 
		
		jo.put("successYn", successYn);
		jo.put("message", message);

		PrintWriter printwriter = response.getWriter();
		printwriter.println(jo.toString());
		printwriter.flush();
		printwriter.close();
	}
	
	// 회원 가입
	@RequestMapping(value = "/join/insertMember.do")
	public String insertMember(@ModelAttribute("searchVO") JoinVO vo, HttpServletRequest request, ModelMap model) throws Exception {
		
		if(joinService.duplicateCheck(vo) > 0) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.duplicate.member"));
			return "forward:/join/memberType.do";
		} else {
			joinService.insertJoin(vo);
			model.addAttribute("message", egovMessageSource.getMessage("join.request.msg"));
		}
		return "join/MemberComplete";	
	}
}
