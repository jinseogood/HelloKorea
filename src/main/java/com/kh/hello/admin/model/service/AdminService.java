package com.kh.hello.admin.model.service;

import java.util.ArrayList;

import com.kh.hello.admin.model.vo.DatePick;
import com.kh.hello.admin.model.vo.PageInfo;
import com.kh.hello.admin.model.vo.Reservation;

public interface AdminService {

	ArrayList<Reservation> reservationList(PageInfo pi);

	int getReservationListCount();

	int getSearchReservationListCount(Reservation r);

	ArrayList<Reservation> searchReservationList(Reservation r, PageInfo pi);

	int getSearchDateReservationListCount(DatePick d);

	ArrayList<Reservation> searchDateReservationList(DatePick d, PageInfo pi);

	int getReportListCount();

}
