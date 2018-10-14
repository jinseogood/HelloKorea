package com.kh.hello.company.model.service;

import java.util.ArrayList;

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
		int count = 0;
		result = cd.insertReservation(sqlSession, reservation);
		System.out.println("객실주문 서비스메소드 result : " + result);
		count = cd.selectCurrval(sqlSession, reservation);
		System.out.println("객실주문 서비스 메소드 currval : " + count);
		
		return reservation;
	}




	
	

}
