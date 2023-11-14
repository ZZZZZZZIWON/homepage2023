package egovframework.let.rsv.service.impl;

import java.util.List;

import egovframework.let.rsv.web.ReservationApplyVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("reservationApplyMapper")
public interface ReservationApplyMapper {

	// 기존 신청 여부
	int duplicateApplyCheck(ReservationApplyVO vo) throws Exception;

	// 예약자 등록하기
	void insertReservationApply(ReservationApplyVO vo) throws Exception;

	// 예약자 목록 가져오기
	List<EgovMap> selectReservationApplyList(ReservationApplyVO vo) throws Exception;

	// 예약자 목록 수
	int selectReservationApplyListCnt(ReservationApplyVO vo) throws Exception;

	// 예약자 상세정보
	ReservationApplyVO selectReservationApply(ReservationApplyVO vo) throws Exception;

	// 예약자 변경
	void updateReservationApply(ReservationApplyVO vo) throws Exception;

	// 예약자 삭제
	void deleteReservationApply(ReservationApplyVO vo) throws Exception;

}
