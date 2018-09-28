package com.kh.hello.admin.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.hello.admin.model.vo.DatePick;
import com.kh.hello.admin.model.vo.PageInfo;
import com.kh.hello.admin.model.vo.Reservation;

public interface AdminDao {

	ArrayList<Reservation> reservationList(SqlSessionTemplate sqlSession, PageInfo pi);

	int getReservationListCount(SqlSessionTemplate sqlSession);

	int getSearchReservationListCount(SqlSessionTemplate sqlSession, Reservation r);

	ArrayList<Reservation> searchReservationList(SqlSessionTemplate sqlSession, Reservation r, PageInfo pi);

	int getSearchDateReservationListCount(SqlSessionTemplate sqlSession, DatePick d);

	ArrayList<Reservation> searchDateReservationList(SqlSessionTemplate sqlSession, DatePick d, PageInfo pi);

}
