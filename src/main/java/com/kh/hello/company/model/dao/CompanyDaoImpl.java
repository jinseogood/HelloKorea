package com.kh.hello.company.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hello.company.model.vo.Company2;
import com.kh.hello.company.model.vo.Reservation2;
import com.kh.hello.company.model.vo.Room2;

@Repository
public class CompanyDaoImpl implements CompanyDao {


	@Override
	public ArrayList<Company2> selectAllCompany(SqlSessionTemplate sqlSession, Company2 cp) {
		return (ArrayList)sqlSession.selectList("Company2.selectList", cp);
	}

	@Override
	public ArrayList<Room2> selectRoomList(SqlSessionTemplate sqlSession, Room2 roomList) {
		return (ArrayList)sqlSession.selectList("Room2.selectList", roomList);
	}

//	객실주문 insert.
	@Override
	public int insertReservation(SqlSessionTemplate sqlSession, Reservation2 reservation) {
		return sqlSession.insert("Reservation2.insertReservation", reservation);
	}

	@Override
	public int selectCurrval(SqlSessionTemplate sqlSession, Reservation2 reservation) {
		return sqlSession.selectOne("Reservation2.selectOneCurrval", reservation);
	}





	
	

}
