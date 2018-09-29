package com.kh.hello.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;

import com.kh.hello.admin.dao.AdminDao;
import com.kh.hello.admin.model.vo.DatePick;
import com.kh.hello.admin.model.vo.PageInfo;
import com.kh.hello.admin.model.vo.Report;
import com.kh.hello.admin.model.vo.Reservation;
@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
    private SqlSessionTemplate sqlSession;
    @Autowired
    private AdminDao ad;
    @Autowired
	private DataSourceTransactionManager transactionManager;
    
    //예약 리스트 카운트용
	@Override
	public int getReservationListCount() {
		return ad.getReservationListCount(sqlSession);
	}
	
	//예약 리스트
	@Override
	public ArrayList<Reservation> selectReservationList(PageInfo pi) {
		return ad.selectReservationList(sqlSession, pi);
	}

    //예약 리스트 날짜 검색 카운트
	@Override
	public int getSearchDateReservationListCount(DatePick d) {
		return ad.getSearchDateReservationListCount(sqlSession, d);
	}
    //예약 리스트 날짜 검색
	@Override
	public ArrayList<Reservation> selectSearchDateReservationList(DatePick d, PageInfo pi) {
		return ad.selectSearchDateReservationList(sqlSession, d, pi);
	}

	//예약 리스트 검색 카운트용
	@Override
	public int getSearchReservationListCount(Reservation r) {
		return ad.getSearchReservationListCount(sqlSession, r);
	}

	//예약 리스트 검색
	@Override
	public ArrayList<Reservation> selectSearchWordReservationList(Reservation r, PageInfo pi) {
		return ad.selectSearchWordReservationList(sqlSession, r, pi);
	}

	//신고 리스트 카운트용
	@Override
	public int getReportListCount() {
		return ad.getReportListCount(sqlSession);
	}
    
	//신고 리스트
	@Override
	public ArrayList<Report> selectReportList(PageInfo pi) {
		return ad.selectReportList(sqlSession, pi);
	}

	//신고일 검색 카운트
	@Override
	public int getSearchDateReportListCount(DatePick d) {
		return ad.getSearchDateReportListCount(sqlSession, d);
	}

	//신고일 검색
	@Override
	public ArrayList<Report> selectSearchDateReportList(DatePick d, PageInfo pi) {
		return ad.selectSearchDateReportList(sqlSession, d, pi);
	}

	//신고 리스트 검색 카운트
	@Override
	public int getSearchReportListCount(Report r) {
		return ad.getSearchReportListCount(sqlSession, r);
	}

	//신고 리스트 검색
	@Override
	public ArrayList<Report> selectSearchWordReportList(Report r, PageInfo pi) {
		return ad.selectSearchWordReportList(sqlSession, r, pi);
	}

	//신고 상세 게시글
	@Override
	public ArrayList<Report> selectBoardReportOne(int refId) {
		return ad.selectBoardReportOne(sqlSession, refId);
	}

	//신고 상세 댓글
	@Override
	public ArrayList<Report> selectReplyReportOne(int refId) {
		return ad.selectReplyReportOne(sqlSession, refId);
	}

	//신고 상세 메세지
	@Override
	public ArrayList<Report> selectMessageReportOne(int refId) {
		return ad.selectMessageReportOne(sqlSession, refId);
	}

	
	
	
	


}
