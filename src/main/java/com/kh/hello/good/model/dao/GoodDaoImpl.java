package com.kh.hello.good.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hello.good.model.vo.Good;
import com.kh.hello.good.model.vo.Good2;

@Repository
public class GoodDaoImpl implements GoodDao {

//	찜한 목록인지 조회
	@Override
	public int selectOneDibs(SqlSessionTemplate sqlSession, Good gg) {
		return sqlSession.selectOne("Good.selectOneDibs", gg);
	}

//	찜 목록 추가
	@Override
	public int insertOneDibs(SqlSessionTemplate sqlSession, Good gg) {
		return sqlSession.insert("Good.insertOneDibsHotel", gg);
	}

//	찜 목록 삭제
	@Override
	public int deleteOneDibs(SqlSessionTemplate sqlSession, Good gg) {
		return sqlSession.delete("Good.deleteOneDibsHotel", gg);
	}

	@Override
	public int selectOneDibsCheckFG(SqlSessionTemplate sqlSession, Good2 gg) {
		return sqlSession.selectOne("Good.selectOneDibsCheck", gg);
	}

	
	
	

}
