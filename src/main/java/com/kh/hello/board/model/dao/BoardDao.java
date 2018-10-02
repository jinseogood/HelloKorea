package com.kh.hello.board.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.hello.board.model.vo.Board;
import com.kh.hello.common.Attachment;

public interface BoardDao {

	int insertAttachment(Attachment a, SqlSessionTemplate sqlSession);

	int insertBoard(Board b, SqlSessionTemplate sqlSession);

	int deleteAttachment(SqlSessionTemplate sqlSession, String changeFileName);

}
