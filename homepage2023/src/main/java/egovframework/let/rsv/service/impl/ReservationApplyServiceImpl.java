package egovframework.let.rsv.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.let.rsv.service.ReservationApplyService;
import egovframework.let.rsv.service.ReservationService;
import egovframework.let.rsv.web.ReservationApplyVO;
import egovframework.let.rsv.web.ReservationVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("reservationApplyService")
public class ReservationApplyServiceImpl implements ReservationApplyService {

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertyService;

	@Resource(name = "egovReqIdGnrService")
	protected EgovIdGnrService idgenService;

	@Resource(name = "reservationService")
	protected ReservationService reservationService;

	@Resource(name = "reservationApplyMapper")
	ReservationApplyMapper reservationApplyMapper;

	// 예약가능 여부 확인
	public ReservationApplyVO rsvCheck(ReservationApplyVO vo) throws Exception {
		// 신청인원 체크
		ReservationVO reservationVO = new ReservationVO();
		reservationVO.setResveId(vo.getResveId());
		ReservationVO result = reservationService.selectReservation(reservationVO);
		if (result.getMaxAplyCnt() <= result.getApplyCnt()) {
			vo.setErrorCode("ERROR-R1");
			vo.setMessage("마감되었습니다");
		} else if (reservationApplyMapper.duplicateApplyCheck(vo) > 0) {
			vo.setErrorCode("ERROR-R2");
			vo.setMessage("이미 예약된 프로그램입니다.");
		}

		return vo;
	}

	// 예약자 등록하기
	public ReservationApplyVO insertReservationApply(ReservationApplyVO vo) throws Exception {
		// 신청인원 체크
		ReservationVO reservationVO = new ReservationVO();
		reservationVO.setResveId(vo.getResveId());
		ReservationVO result = reservationService.selectReservation(reservationVO);
		if (result.getMaxAplyCnt() <= result.getApplyCnt()) {
			vo.setErrorCode("ERROR-R1");
			vo.setMessage("마감되었습니다.");
		} else {
			// 기존신청여부
			if (reservationApplyMapper.duplicateApplyCheck(vo) > 0) {
				vo.setErrorCode("ERROR-R2");
				vo.setMessage("이미 예약된 프로그램입니다");
			} else {
				String id = idgenService.getNextStringId();
				vo.setReqstId(id);
				reservationApplyMapper.insertReservationApply(vo);
			}
		}
		return vo;
	}

	// 예약자 목록 가져오기
	@Override
	public List<EgovMap> selectReservationApplyList(ReservationApplyVO vo) throws Exception {
		return reservationApplyMapper.selectReservationApplyList(vo);
	}

	// 예약자 목록 수
	@Override
	public int selectReservationApplyListCnt(ReservationApplyVO vo) throws Exception {
		return reservationApplyMapper.selectReservationApplyListCnt(vo);
	}

	@Override
	public ReservationApplyVO selectReservationApply(ReservationApplyVO vo) throws Exception{
		return reservationApplyMapper.selectReservationApply(vo);
	}

	@Override
	public void updateReservationApply(ReservationApplyVO vo) throws Exception {
		reservationApplyMapper.updateReservationApply(vo);
	}

	@Override
	public void deleteReservationApply(ReservationApplyVO vo) throws Exception {
		reservationApplyMapper.deleteReservationApply(vo);
	}

}
