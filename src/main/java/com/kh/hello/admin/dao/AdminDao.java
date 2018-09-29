package com.kh.hello.admin.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.hello.admin.model.vo.DatePick;
import com.kh.hello.admin.model.vo.PageInfo;
import com.kh.hello.admin.model.vo.Report;
import com.kh.hello.admin.model.vo.Reservation;

public interface AdminDao {

	int getReservationListCount(SqlSessionTemplate sqlSession);
	ArrayList<Reservation> selectReservationList(SqlSessionTemplate sqlSession, PageInfo pi);
	int getSearchDateReservationListCount(SqlSessionTemplate sqlSession, DatePick d);
	ArrayList<Reservation> selectSearchDateReservationList(SqlSessionTemplate sqlSession, DatePick d, PageInfo pi);
	int getSearchReservationListCount(SqlSessionTemplate sqlSession, Reservation r);
	ArrayList<Reservation> selectSearchWordReservationList(SqlSessionTemplate sqlSession, Reservation r, PageInfo pi);

	int getReportListCount(SqlSessionTemplate sqlSession);
	ArrayList<Report> selectReportList(SqlSessionTemplate sqlSession, PageInfo pi);
	int getSearchDateReportListCount(SqlSessionTemplate sqlSession, DatePick d);
	ArrayList<Report> selectSearchDateReportList(SqlSessionTemplate sqlSession, DatePick d, PageInfo pi);
	int getSearchReportListCount(SqlSessionTemplate sqlSession, Report r);
	ArrayList<Report> selectSearchWordReportList(SqlSessionTemplate sqlSession, Report r, PageInfo pi);
	ArrayList<Report> selectBoardReportOne(SqlSessionTemplate sqlSession, int refId);
	ArrayList<Report> selectReplyReportOne(SqlSessionTemplate sqlSession, int refId);
	ArrayList<Report> selectMessageReportOne(SqlSessionTemplate sqlSession, int refId);

}
