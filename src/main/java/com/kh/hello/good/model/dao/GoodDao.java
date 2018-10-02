package com.kh.hello.good.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.hello.good.model.vo.Good;

public interface GoodDao {

	int selectOneDibs(SqlSessionTemplate sqlSession, Good gg);

	int insertOneDibs(SqlSessionTemplate sqlSession, Good gg);

	int deleteOneDibs(SqlSessionTemplate sqlSession, Good gg);

}
