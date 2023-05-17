package egovframework.let.board.service;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class BoardVO extends ComDefaultVO implements Serializable {

	//게사물명
	private String boardSj;
	
	//게시물 내용
	private String boardCn;
	
	//조회수
	private int inqireCo;
	
	//등록자IP
	private String creatIp;
	
	//공지여부
	private String noticeAt;
	
	//비공개여부
	private String othbcAt;
	
	//사용여부
	private String useAt;
	
	//첨부파일ID
	private String atchFileId;
	
	//최초등록시정
	private java.util.Date frstRegistPnttm;
	
	//최초등록자ID
	private String frstRegisterId;
	
	//최초수정시점
	private java.util.Date lastUpdtPnttm;
	
	//최종수정자ID
	private String lastUpdusrId;
	
	//사용자ID
	private String userId;
	
	//관리자여부
	private String mngAt;
	
	//게시물타입
	private String boardType;
	
	//게사판ID
	private String boardId;
	
	
	public String getBoardId() {
		return boardId;
	}

	public void setBoardId(String boardId) {
		this.boardId = boardId;
	}

	public String getBoardSj() {
		return boardSj;
	}

	public void setBoardSj(String boardSj) {
		this.boardSj = boardSj;
	}

	public String getBoardCn() {
		return boardCn;
	}

	public void setBoardCn(String boardCn) {
		this.boardCn = boardCn;
	}

	public int getInqireCo() {
		return inqireCo;
	}

	public void setInqireCo(int inqireCo) {
		this.inqireCo = inqireCo;
	}

	public String getCreatIp() {
		return creatIp;
	}

	public void setCreatIp(String creatIp) {
		this.creatIp = creatIp;
	}

	public String getNoticeAt() {
		return noticeAt;
	}

	public void setNoticeAt(String noticeAt) {
		this.noticeAt = noticeAt;
	}

	public String getOthbcAt() {
		return othbcAt;
	}

	public void setOthbcAt(String othbcAt) {
		this.othbcAt = othbcAt;
	}

	public String getUseAt() {
		return useAt;
	}

	public void setUseAt(String useAt) {
		this.useAt = useAt;
	}

	public String getAtchFileId() {
		return atchFileId;
	}

	public void setAtchFileId(String atchFileId) {
		this.atchFileId = atchFileId;
	}

	public java.util.Date getFrstRegistPnttm() {
		return frstRegistPnttm;
	}

	public void setFrstRegistPnttm(java.util.Date frstRegistPnttm) {
		this.frstRegistPnttm = frstRegistPnttm;
	}

	public String getFrstRegisterId() {
		return frstRegisterId;
	}

	public void setFrstRegisterId(String frstRegisterId) {
		this.frstRegisterId = frstRegisterId;
	}

	public java.util.Date getLastUpdtPnttm() {
		return lastUpdtPnttm;
	}

	public void setLastUpdtPnttm(java.util.Date lastUpdtPnttm) {
		this.lastUpdtPnttm = lastUpdtPnttm;
	}

	public String getLastUpdusrId() {
		return lastUpdusrId;
	}

	public void setLastUpdusrId(String lastUpdusrId) {
		this.lastUpdusrId = lastUpdusrId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getMngAt() {
		return mngAt;
	}

	public void setMngAt(String mngAt) {
		this.mngAt = mngAt;
	}

	public String getBoardType() {
		return boardType;
	}

	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}
	
}
