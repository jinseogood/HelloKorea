package com.kh.hello.seller.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hello.seller.model.vo.Company;
import com.kh.hello.seller.model.vo.RegistrationHistory;
import com.kh.hello.seller.model.vo.Room;

@Repository
public class SellerDaoImpl implements SellerDao{

	@Override
	public int insertCompany(Company c, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("Company.insertCompany", c);
	}

	@Override
	public int insertRoom1(Room rm, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("Room.insertRoom", rm);
	}
	
	@Override
	public int insertRoom2(Room rm, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("Room.insertRoom", rm);
	}
	
	@Override
	public int insertRoom3(Room rm, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("Room.insertRoom", rm);
	}

	@Override
	public int insertRH(RegistrationHistory rh, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("RH.insertRH", rh);
	}

}
