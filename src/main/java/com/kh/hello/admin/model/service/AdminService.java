package com.kh.hello.admin.model.service;

import java.util.ArrayList;

import com.kh.hello.admin.model.vo.DatePick;
import com.kh.hello.admin.model.vo.PageInfo;
import com.kh.hello.admin.model.vo.Report;
import com.kh.hello.admin.model.vo.Reservation;

public interface AdminService {

	int getReservationListCount();
	ArrayList<Reservation> selectReservationList(PageInfo pi);
	int getSearchDateReservationListCount(DatePick d);
	ArrayList<Reservation> selectSearchDateReservationList(DatePick d, PageInfo pi);
	int getSearchReservationListCount(Reservation r);
	ArrayList<Reservation> selectSearchWordReservationList(Reservation r, PageInfo pi);

	int getReportListCount();
	ArrayList<Report> selectReportList(PageInfo pi);
	int getSearchDateReportListCount(DatePick d);
	ArrayList<Report> selectSearchDateReportList(DatePick d, PageInfo pi);
	int getSearchReportListCount(Report r);
	ArrayList<Report> selectSearchWordReportList(Report r, PageInfo pi);
	ArrayList<Report> selectBoardReportOne(int refId);
	ArrayList<Report> selectReplyReportOne(int refId);
	ArrayList<Report> selectMessageReportOne(int refId);

}
