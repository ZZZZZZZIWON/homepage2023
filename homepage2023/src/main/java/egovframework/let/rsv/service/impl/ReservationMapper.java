package egovframework.let.rsv.service.impl;

import java.util.List;

import egovframework.let.rsv.service.ReservationVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("reservationMapper")
public interface ReservationMapper {

	List<EgovMap> selectReservationList(ReservationVO vo) throws Exception;

	int selectReservationListCnt(ReservationVO vo) throws Exception;

	ReservationVO selectReservation(ReservationVO vo) throws Exception;

	void insertReservation(ReservationVO vo) throws Exception;

	void updateReservation(ReservationVO vo) throws Exception;

	void deleteReservation(ReservationVO vo) throws Exception;

}
