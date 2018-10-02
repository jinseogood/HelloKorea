package com.kh.hello.board.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hello.board.model.vo.Attachment;
import com.kh.hello.board.model.vo.Board;

@Repository
public class BoardDaoImpl implements BoardDao{

	@Override
	public int insertAttachment(Attachment a, SqlSessionTemplate sqlSession) {
		int result = sqlSession.insert("Attachment.insertReviewAttachment", a);
		
		return result;
	}

	@Override
	public int insertBoard(Board b, SqlSessionTemplate sqlSession) {
		int result = sqlSession.insert("Board.insertReviewBoard", b);
		
		return result;
	}

	@Override
	public int deleteAttachment(SqlSessionTemplate sqlSession, String changeFileName) {
		int result = sqlSession.delete("Attachment.deleteSelectReviewAttachment", changeFileName);
		
		System.out.println(changeFileName);
		
		return result;
	}

}
