package com.kh.hello.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;

import com.kh.hello.board.model.dao.BoardDao;
import com.kh.hello.board.model.vo.Board;
import com.kh.hello.board.model.vo.Reply;
import com.kh.hello.board.model.vo.Report;
import com.kh.hello.board.model.vo.Thumbs;
import com.kh.hello.common.Attachment;
import com.kh.hello.common.PageInfo;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private BoardDao bd;
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	@Override
	public int insertAttachment(Attachment a) {
		int result = 0;
		//int bid = bd.bidCurrval(sqlSession);
		
		result = bd.insertAttachment(a, sqlSession);
		
		return result;	
	}

	@Override
	public int insertBoard(Board b) {
		int result = bd.insertBoard(b, sqlSession);
		
		return result;
	}

	@Override
	public int deleteAttachment(String changeFileName) {
		int result = bd.deleteAttachment(sqlSession, changeFileName);
		
		return result;
	}

	@Override
	public int deleteAllUpload(int mId) {
		int result = bd.deleteAllUpload(sqlSession, mId);
		
		return result;
	}

	@Override
	public ArrayList<Attachment> selectUpload(int mId) {
		ArrayList<Attachment> at = null;
		at = bd.selectUpload(sqlSession, mId);
		
		return at;
	}

	@Override
	public int updateBoard(Board b) {
		int result = 0;
		result = bd.updateBoard(sqlSession, b);
		
		return result;
	}

	@Override
	public ArrayList<Board> selectReview(PageInfo pi) {
		ArrayList<Board> list = null;
		list = bd.selectReview(sqlSession, pi);
		
		return list;
	}

	@Override
	public int selectReviewCount() {
		
		return bd.selectReviewCount(sqlSession);
	}

	@Override
	public int insertQ(Board b) {
		
		return bd.insertQ(sqlSession, b);
	}

	@Override
	public int selectQCount() {
		
		return bd.selectQCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectQ(PageInfo pi) {
		
		return bd.selectQ(sqlSession, pi);
	}

	@Override
	public int insertA(Reply r) {

		return bd.selectA(sqlSession, r);
	}

	@Override
	public ArrayList<Reply> selectQAnswer() {
		
		return bd.selectQAnswer(sqlSession);
	}

	@Override
	public Board selectReviewDetail(int bid) {
		
		return bd.selectReviewDetail(sqlSession, bid);
	}

	@Override
	public ArrayList<Attachment> selectAttachDetail(int bid) {
		
		return bd.selectAttachDetail(sqlSession, bid);
	}

	@Override
	public ArrayList<Reply> selectRAnswer(int bid) {

		return bd.selectRAnswer(sqlSession, bid);
	}

	@Override
	public int insertReport(Report report) {
		
		return bd.insertReport(sqlSession, report);
	}

	@Override
	public Report selectReport(Report report) {
	
		return bd.selectReport(sqlSession, report);
	}

	@Override
	public int updateReport(Report report) {
		
		return bd.updateReport(sqlSession, report);
	}

	@Override
	public int deletePrevReview(int mid) {

		return bd.deletePrevReview(sqlSession, mid);
	}

	@Override
	public Thumbs selectThumbs(Thumbs thumb) {
		
		return bd.selectThumbs(sqlSession, thumb);
	}

	@Override
	public int updateThumbs(Thumbs thumb) {
	
		return bd.updateThumbs(sqlSession, thumb);
	}

	@Override
	public int insertThumbs(Thumbs thumb) {
		
		return bd.insertThumbs(sqlSession, thumb); 
	}

	@Override
	public int selectThumbsCount(Thumbs thumb) {
		
		return bd.selectThumbsCount(sqlSession, thumb);
	}

	@Override
	public int updateReply(int ref_id) {
		
		return bd.updateReply(sqlSession, ref_id);
	}


	@Override
	public int updateThumbsReview(int ref_id) {
		
		return bd.updateThumbsReview(sqlSession, ref_id);
	}

	@Override
	public int updateThumbsR(Thumbs thumb) {
		
		return bd.updateThumbsR(sqlSession, thumb);
	}

	@Override
	public int selectReviewCount2(int bid) {
		
		return bd.selectReviewCount2(sqlSession, bid);
	}

	@Override
	public int selectReplyCount(int bid) {
		
		return bd.selectReplyCount(sqlSession, bid);
	}
 
}
