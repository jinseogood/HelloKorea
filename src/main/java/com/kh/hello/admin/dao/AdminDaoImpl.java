package com.kh.hello.admin.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hello.admin.model.vo.DatePick;
import com.kh.hello.admin.model.vo.PageInfo;
import com.kh.hello.admin.model.vo.Reservation;
@Repository
public class AdminDaoImpl implements AdminDao{

	//예약 리스트 카운트용
	@Override
	public int getReservationListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("selectReservationListCount");
	}
	
	//예약 리스트
	@Override
	public ArrayList<Reservation> reservationList(SqlSessionTemplate sqlSession, PageInfo pi) {
		ArrayList<Reservation> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("selectReservationList", null, rowBounds);
		return list;
	}

	//예약 리스트 검색 카운트용
	@Override
	public int getSearchReservationListCount(SqlSessionTemplate sqlSession, Reservation r) {
		return sqlSession.selectOne("selectSearchReservationListCount",r);
	}
	
    //예약 리스트 검색
	@Override
	public ArrayList<Reservation> searchReservationList(SqlSessionTemplate sqlSession, Reservation r, PageInfo pi) {
		ArrayList<Reservation> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("selectSearchReservationList", r, rowBounds);
		return list;
	}

	//예약 리스트 날짜 검색 카운트용
	@Override
	public int getSearchDateReservationListCount(SqlSessionTemplate sqlSession, DatePick d) {
		return sqlSession.selectOne("selectSearchDateReservationListCount",d);
	}

	@Override
	public ArrayList<Reservation> searchDateReservationList(SqlSessionTemplate sqlSession, DatePick d, PageInfo pi) {
		ArrayList<Reservation> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("selectSearchDateReservationList", d, rowBounds);
		return list;
	}

	//신고 리스트 카운트용
	@Override
	public int getReportListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("selectReportListCount");
	}


}
