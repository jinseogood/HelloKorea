package com.kh.hello.company.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.hello.company.model.vo.Company2;
import com.kh.hello.company.model.vo.Reservation2;
import com.kh.hello.company.model.vo.Room2;

public interface CompanyDao {

	ArrayList<Company2> selectAllCompany(SqlSessionTemplate sqlSession, Company2 cp);

	ArrayList<Room2> selectRoomList(SqlSessionTemplate sqlSession, Room2 roomList);

	int insertReservation(SqlSessionTemplate sqlSession, Reservation2 reservation);

	int selectCurrval(SqlSessionTemplate sqlSession, Reservation2 reservation);

	Reservation2 selectOneReservation(SqlSessionTemplate sqlSession, Reservation2 reservation);

	ArrayList<Company2> selectOrderByName(SqlSessionTemplate sqlSession, Company2 cp);






}