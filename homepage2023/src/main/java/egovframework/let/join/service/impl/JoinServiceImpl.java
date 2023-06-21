package egovframework.let.join.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.let.join.service.JoinService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("joinService")
public class JoinServiceImpl extends EgovAbstractServiceImpl implements JoinService {

	@Resource(name = "joinMapper")
	private JoinMapper joinMapper;
	
}
