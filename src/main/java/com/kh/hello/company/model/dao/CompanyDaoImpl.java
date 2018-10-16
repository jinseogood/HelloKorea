package com.kh.hello.company.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hello.company.model.vo.Company2;
import com.kh.hello.company.model.vo.Reservation2;
import com.kh.hello.company.model.vo.Reservations;
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

//	객실 insert 후 currval 구해오기.
	@Override
	public int selectCurrval(SqlSessionTemplate sqlSession, Reservation2 reservation) {
		return sqlSession.selectOne("Reservation2.selectOneCurrval", reservation);
	}

//	currval 구해온 후 객실정보 객체에 담기.
	@Override
	public Reservation2 selectOneReservation(SqlSessionTemplate sqlSession, Reservation2 reservation) {
		return sqlSession.selectOne("Reservation2.selectOneReservation", reservation);
	}

//	이름순 정렬
	@Override
	public ArrayList<Company2> selectOrderByName(SqlSessionTemplate sqlSession, Company2 cp) {
		return (ArrayList)sqlSession.selectList("Company2.selectListOrderName", cp);
	}

//	가격정렬 1번. 10 ~ 19.9만
	@Override
	public ArrayList<Company2> selectOrderByMoney1(SqlSessionTemplate sqlSession, Company2 cp) {
		return (ArrayList)sqlSession.selectList("Company2.selectListOrderMoney1", cp);
	}

//	가격정렬2번. 20~29.9만
	@Override
	public ArrayList<Company2> selectOrderByMoney2(SqlSessionTemplate sqlSession, Company2 cp) {
		return (ArrayList)sqlSession.selectList("Company2.selectListOrderMoney2", cp);
	}

//	가격정렬3번. 30만 ~
	@Override
	public ArrayList<Company2> selectOrderByMoney3(SqlSessionTemplate sqlSession, Company2 cp) {
		return (ArrayList)sqlSession.selectList("Company2.selectListOrderMoney3", cp);
	}

	@Override
	public List<Reservations> insertReservations(SqlSessionTemplate sqlSession, List<Reservations> list) {
		List<Reservations> list2 = new ArrayList<Reservations>();
		Reservations res = null;
		for(int i = 0; i < list.size(); i++){
			res = new Reservations();
			sqlSession.insert("Reservations.insertReservations", list.get(i));
			res = sqlSession.selectOne("Reservations.selectListReservations", list.get(i));
			list2.add(res);
		}
		
		return list2;
	}





	
	

}
