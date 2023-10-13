package egovframework.let.rsv.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.let.rsv.service.ReservationService;
import egovframework.let.rsv.service.ReservationVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("reservationService")
public class ReservationServiceImpl implements ReservationService {

	@Resource(name="propertiesService")
	protected EgovPropertyService propertyService;
	
	@Resource(name="reservationMapper")
	protected ReservationMapper reservationMapper;
	
	@Resource(name="egovRsvIdGnrService")
	protected EgovIdGnrService idgenService;
	
	
	@Override
	public List<EgovMap> selectReservationList(ReservationVO vo) throws Exception {
		return reservationMapper.selectReservationList(vo);
	}

	@Override
	public int selectReservationListCnt(ReservationVO vo) throws Exception {
		return reservationMapper.selectReservationListCnt(vo);
	}

	@Override
	public ReservationVO selectReservation(ReservationVO vo) throws Exception {
		return reservationMapper.selectReservation(vo);
	}

	@Override
	public String insertReservation(ReservationVO vo) throws Exception {
		String id = idgenService.getNextStringId();
		vo.setResveId(id);
		reservationMapper.insertReservation(vo);
		return id;
	}

	@Override
	public void updateReservation(ReservationVO vo) throws Exception {
		reservationMapper.updateReservation(vo);
	}

	@Override
	public void deleteReservation(ReservationVO vo) throws Exception {
		reservationMapper.deleteReservation(vo);
	}

}
