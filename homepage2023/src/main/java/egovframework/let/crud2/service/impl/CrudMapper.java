package egovframework.let.crud2.service.impl;

import java.util.List;

import egovframework.let.crud.service.CrudVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("crudMapper")
public interface CrudMapper {
	
		// CRUD 가져오기
		 CrudVO selectCrud(CrudVO vo) throws Exception;
		 
		 // CRUD 등록
		 void insertCrud(CrudVO vo) throws Exception;
		 
		 // CRUD 목록 가져오기
		 List<EgovMap> selectCrudList(CrudVO vo) throws Exception;
		 
		 // CRUD 목록 수
		 int selectCrudListCnt(CrudVO vo) throws Exception;
		 
		 // CRUD 수정
		 void updateCrud(CrudVO vo) throws Exception;
		 
		 // CRUD 삭제
		 void deleteCrud(CrudVO vo) throws Exception;
}
