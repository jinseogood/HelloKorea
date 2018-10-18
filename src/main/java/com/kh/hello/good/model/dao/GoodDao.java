package com.kh.hello.good.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.hello.good.model.vo.Good;
import com.kh.hello.good.model.vo.Good2;

public interface GoodDao {

	int selectOneDibs(SqlSessionTemplate sqlSession, Good gg);

	int insertOneDibs(SqlSessionTemplate sqlSession, Good gg);

	int deleteOneDibs(SqlSessionTemplate sqlSession, Good gg);

	int selectOneDibsCheckFG(SqlSessionTemplate sqlSession, Good2 gg);


}
