package com.kh.hello.admin.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hello.admin.model.vo.DatePick;
import com.kh.hello.admin.model.vo.PageInfo;
import com.kh.hello.admin.model.vo.Report;
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
	public ArrayList<Reservation> selectReservationList(SqlSessionTemplate sqlSession, PageInfo pi) {
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
	public ArrayList<Reservation> selectSearchWordReservationList(SqlSessionTemplate sqlSession, Reservation r, PageInfo pi) {
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

	//예약 리스트 날짜 검색
	@Override
	public ArrayList<Reservation> selectSearchDateReservationList(SqlSessionTemplate sqlSession, DatePick d, PageInfo pi) {
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

	//신고 리스트
	@Override
	public ArrayList<Report> selectReportList(SqlSessionTemplate sqlSession, PageInfo pi) {
		ArrayList<Report> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("selectReportList", null, rowBounds);
		return list;
	}

	//신고일 리스트 카운트
	@Override
	public int getSearchDateReportListCount(SqlSessionTemplate sqlSession, DatePick d) {
		return sqlSession.selectOne("selectSearchDateReportListCount",d);
	}

	//신고일 검색
	@Override
	public ArrayList<Report> selectSearchDateReportList(SqlSessionTemplate sqlSession, DatePick d, PageInfo pi) {
		ArrayList<Report> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("selectSearchDateReportList", d, rowBounds);
		return list;
	}

	//신고 검색 리스트 카운트
	@Override
	public int getSearchReportListCount(SqlSessionTemplate sqlSession, Report r) {
		return sqlSession.selectOne("selectSearchReportListCount",r);
	}

	//신고 검색 리스트
	@Override
	public ArrayList<Report> selectSearchWordReportList(SqlSessionTemplate sqlSession, Report r, PageInfo pi) {
		ArrayList<Report> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("selectSearchReportList", r, rowBounds);
		return list;
	}

	//신고 상세 게시글
	@Override
	public ArrayList<Report> selectBoardReportOne(SqlSessionTemplate sqlSession, int refId) {
		return (ArrayList)sqlSession.selectList("selectBoardReportOne", refId);
	}
	
    //신고 상세 댓글
	@Override
	public ArrayList<Report> selectReplyReportOne(SqlSessionTemplate sqlSession, int refId) {
		return (ArrayList)sqlSession.selectList("selectReplyReportOne", refId);
	}

	//신고 상세 메세지
	@Override
	public ArrayList<Report> selectMessageReportOne(SqlSessionTemplate sqlSession, int refId) {
		return (ArrayList)sqlSession.selectList("selectMessageReportOne", refId);
	}



}
