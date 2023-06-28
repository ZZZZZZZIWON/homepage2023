package egovframework.let.join.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.let.join.service.JoinService;
import egovframework.let.join.service.JoinVO;
import egovframework.let.utl.fcc.service.EgovStringUtil;
import egovframework.let.utl.sim.service.EgovFileScrty;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Service("joinService")
public class JoinServiceImpl extends EgovAbstractServiceImpl implements JoinService {

	@Resource(name = "joinMapper")
	private JoinMapper joinMapper;
	
	@Resource(name="joinIdGnrService")
	private EgovIdGnrService idgenService;

	// ID 중복체크
	@Override
	public int duplicateCheck(JoinVO vo) throws Exception {
		return joinMapper.duplicateCheck(vo);
	}

	// 회원 등록
	@Override
	public String insertJoin(JoinVO vo) throws Exception {
		String esntlId = idgenService.getNextStringId();
		vo.setEsntlId(esntlId);
		
		// 입력한 비밀번호를 암호화하기
		String enpassword = EgovFileScrty.encryptPassword(vo.getPassword(), vo.getEmplyrId());
		vo.setPassword(enpassword);
		
		// 이메일
		if(EgovStringUtil.isEmpty(vo.getEmailId()) && EgovStringUtil.isEmpty(vo.getEmailDomain())) {
			vo.setEmailAdres(vo.getEmailId() + "@" + vo.getEmailDomain());
		}
		joinMapper.insertJoin(vo);
		return esntlId;
	}
}
