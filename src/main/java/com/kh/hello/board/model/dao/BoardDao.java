package com.kh.hello.board.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.hello.board.model.vo.Attachment;
import com.kh.hello.board.model.vo.Board;

public interface BoardDao {

	int insertAttachment(Attachment a, SqlSessionTemplate sqlSession);

	int insertBoard(Board b, SqlSessionTemplate sqlSession);

	int deleteAttachment(SqlSessionTemplate sqlSession, int m);

}
