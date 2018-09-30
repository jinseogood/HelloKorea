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
	public int insertRoom(Room rm, SqlSessionTemplate sqlSession) {
		
		if(rm.getRoomType2() != null){
			
			if(rm.getRoomType3() != null){
				sqlSession.insert("Room.insertRoom1", rm);
				sqlSession.insert("Room.insertRoom2", rm);
				return sqlSession.insert("Room.insertRoom3", rm);
			}
			else{
				sqlSession.insert("Room.insertRoom1", rm);
				return sqlSession.insert("Room.insertRoom2", rm);
			}
		}
		else{
			return sqlSession.insert("Room.insertRoom1", rm);
		}
	}

	@Override
	public int insertRH(RegistrationHistory rh, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("RH.insertRH", rh);
	}

}
