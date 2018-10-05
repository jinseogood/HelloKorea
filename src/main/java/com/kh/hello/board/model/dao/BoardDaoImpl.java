package com.kh.hello.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hello.board.model.vo.Board;
import com.kh.hello.common.Attachment;
import com.kh.hello.common.PageInfo;

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

	@Override
	public int deleteAllUpload(SqlSessionTemplate sqlSession, int mId) {
		int result = sqlSession.delete("Attachment.deleteAllReviewAttachment", mId);
		
		return result;
	}

	@Override
	public ArrayList<Attachment> selectUpload(SqlSessionTemplate sqlSession, int mId) {
		ArrayList<Attachment> at = null;
		at = (ArrayList)sqlSession.selectList("Attachment.selectAttachment", mId);
		
		System.out.println(at);
		
		return at;
	}

	@Override
	public int updateBoard(SqlSessionTemplate sqlSession, Board b) {
		int result = 0;
		System.out.println(b);
		result = sqlSession.update("Board.updateReviewBoard", b);
		
		return result;
	}

	@Override
	public ArrayList<Board> selectReview(SqlSessionTemplate sqlSession, PageInfo pi) {
		ArrayList<Board> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		list = (ArrayList)sqlSession.selectList("Board.selectReview", null, rowBounds);
		
		return list;
	}

	@Override
	public int selectReviewCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("Board.selectReviewCount");
	} 

}
