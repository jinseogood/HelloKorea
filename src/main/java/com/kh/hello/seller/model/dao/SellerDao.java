package com.kh.hello.seller.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.hello.seller.model.vo.Company;
import com.kh.hello.seller.model.vo.RegistrationHistory;
import com.kh.hello.seller.model.vo.Room;

public interface SellerDao {

	int insertCompany(Company c, SqlSessionTemplate sqlSession);

	int insertRoom1(Room rm, SqlSessionTemplate sqlSession);

	int insertRoom2(Room rm, SqlSessionTemplate sqlSession);
	
	int insertRoom3(Room rm, SqlSessionTemplate sqlSession);

	int insertRH(RegistrationHistory rh, SqlSessionTemplate sqlSession);

}
