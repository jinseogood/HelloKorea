package com.kh.hello.good.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;

import com.kh.hello.good.model.dao.GoodDao;
import com.kh.hello.good.model.vo.Good;

@Service
public class GoodServiceImpl implements GoodService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private GoodDao gd;
	@Autowired
	private DataSourceTransactionManager transactionManager;

//	이미 찜한 목록인지 확인하는 메소드
	@Override
	public int selectOneDibs(Good gg) {
		return gd.selectOneDibs(sqlSession, gg);
	}

//	찜 추가
	@Override
	public int insertDibsHotel(Good gg) {
		return gd.insertOneDibs(sqlSession, gg);
	}

//	찜 삭제
	@Override
	public int deleteDibsHotel(Good gg) {
		return gd.deleteOneDibs(sqlSession, gg);
	}
	
	
	
	
	
	
	
	

}