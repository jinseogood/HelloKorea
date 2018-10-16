package com.kh.hello.company.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.kh.hello.company.model.dao.CompanyDao;
import com.kh.hello.company.model.vo.Company2;
import com.kh.hello.company.model.vo.Reservation2;
import com.kh.hello.company.model.vo.Reservations;
import com.kh.hello.company.model.vo.Room2;

@Service
public class CompanyServiceImpl implements CompanyService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private CompanyDao cd;
	@Autowired DataSourceTransactionManager transactionManager;
	
//	지역 전체 조회.
	@Override
	public ArrayList<Company2> selectAllCompany(Company2 cp) {
		return cd.selectAllCompany(sqlSession, cp);
	}

	@Override
	public ArrayList<Room2> selectRoomList(Room2 roomList) {
		return cd.selectRoomList(sqlSession, roomList);
	}

//	객실 주문 insert.
	@Override
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.SERIALIZABLE, rollbackFor={Exception.class})
	public Reservation2 insertReservation(Reservation2 reservation) {
		int result = -99;
		int oid = 0;
		result = cd.insertReservation(sqlSession, reservation);
		System.out.println("객실주문 서비스메소드 result : " + result);
		oid = cd.selectCurrval(sqlSession, reservation);
		System.out.println("객실주문 서비스 메소드 currval : " + oid);
		reservation.setOid(oid);
		reservation = cd.selectOneReservation(sqlSession, reservation);
		System.out.println("객실주문 서비스 메소드 reservation : " + reservation);
		
		return reservation;
	}

//	이름순서 정렬
	@Override
	public ArrayList<Company2> selectOrderByName(Company2 cp) {
		return cd.selectOrderByName(sqlSession, cp);
	}

//	가격정렬 10만 ~ 19만9천
	@Override
	public ArrayList<Company2> selectOrderByMoney1(Company2 cp) {
		return cd.selectOrderByMoney1(sqlSession, cp);
	}

//	가격정렬 20만 ~ 29만9천
	@Override
	public ArrayList<Company2> selectOrderByMoney2(Company2 cp) {
		return cd.selectOrderByMoney2(sqlSession, cp);
	}

//	가격정렬 30만 ~
	@Override
	public ArrayList<Company2> selectOrderByMoney3(Company2 cp) {
		return cd.selectOrderByMoney3(sqlSession, cp);
	}

//	List로 객실주문 insert.
	@Override
	public List<Reservations> insertReservations(List<Reservations> list) {
		return cd.insertReservations(sqlSession, list);
	}

//	평점 높은순서대로 정렬
	@Override
	public ArrayList<Company2> selectOrderByGrade(Company2 cp) {
		return cd.selectOrderByGrade(sqlSession, cp);
	}




	
	

}
