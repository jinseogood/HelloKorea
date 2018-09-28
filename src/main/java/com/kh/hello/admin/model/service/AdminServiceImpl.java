package com.kh.hello.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;

import com.kh.hello.admin.dao.AdminDao;
import com.kh.hello.admin.model.vo.DatePick;
import com.kh.hello.admin.model.vo.PageInfo;
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
	public ArrayList<Reservation> reservationList(PageInfo pi) {
		return ad.reservationList(sqlSession, pi);
	}

	//예약 리스트 검색 카운트용
	@Override
	public int getSearchReservationListCount(Reservation r) {
		return ad.getSearchReservationListCount(sqlSession, r);
	}

	//예약 리스트 검색
	@Override
	public ArrayList<Reservation> searchReservationList(Reservation r, PageInfo pi) {
		return ad.searchReservationList(sqlSession, r, pi);
	}
	
    //예약 리스트 날짜 검색 카운트
	@Override
	public int getSearchDateReservationListCount(DatePick d) {
		return ad.getSearchDateReservationListCount(sqlSession, d);
	}
    //예약 리스트 날짜 검색
	@Override
	public ArrayList<Reservation> searchDateReservationList(DatePick d, PageInfo pi) {
		return ad.searchDateReservationList(sqlSession, d, pi);
	}

	//신고 리스트 카운트용
	@Override
	public int getReportListCount() {
		return ad.getReportListCount(sqlSession);
	}
	


}
