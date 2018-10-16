package com.kh.hello.board.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.hello.board.model.vo.Board;
import com.kh.hello.board.model.vo.Reply;
import com.kh.hello.board.model.vo.Report;
import com.kh.hello.board.model.vo.Thumbs;
import com.kh.hello.common.Attachment;
import com.kh.hello.common.PageInfo;

public interface BoardDao { 

	int insertAttachment(Attachment a, SqlSessionTemplate sqlSession);

	int insertBoard(Board b, SqlSessionTemplate sqlSession);

	int deleteAttachment(SqlSessionTemplate sqlSession, String changeFileName);

	int deleteAllUpload(SqlSessionTemplate sqlSession, int mId);

	ArrayList<Attachment> selectUpload(SqlSessionTemplate sqlSession, int mId);

	int updateBoard(SqlSessionTemplate sqlSession, Board b);

	ArrayList<Board> selectReview(SqlSessionTemplate sqlSession, PageInfo pi);

	int selectReviewCount(SqlSessionTemplate sqlSession);

	int insertQ(SqlSessionTemplate sqlSession, Board b);

	int selectQCount(SqlSessionTemplate sqlSession);

	ArrayList<Board> selectQ(SqlSessionTemplate sqlSession, PageInfo pi);

	int selectA(SqlSessionTemplate sqlSession, Reply r);

	ArrayList<Reply> selectQAnswer(SqlSessionTemplate sqlSession);

	Board selectReviewDetail(SqlSessionTemplate sqlSession, int bid);

	ArrayList<Attachment> selectAttachDetail(SqlSessionTemplate sqlSession, int bid);

	ArrayList<Reply> selectRAnswer(SqlSessionTemplate sqlSession, int bid);

	int insertReport(SqlSessionTemplate sqlSession, Report report);

	Report selectReport(SqlSessionTemplate sqlSession, Report report);

	int updateReport(SqlSessionTemplate sqlSession, Report report);

	int deletePrevReview(SqlSessionTemplate sqlSession, int mid);

	Thumbs selectThumbs(SqlSessionTemplate sqlSession, Thumbs thumb);

	int updateThumbs(SqlSessionTemplate sqlSession, Thumbs thumb);

	int insertThumbs(SqlSessionTemplate sqlSession, Thumbs thumb);

}
