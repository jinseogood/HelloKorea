package com.kh.hello.board.model.service;

import java.util.ArrayList;

import com.kh.hello.board.model.vo.Board;
import com.kh.hello.board.model.vo.Reply;
import com.kh.hello.board.model.vo.Report;
import com.kh.hello.board.model.vo.Thumbs;
import com.kh.hello.common.Attachment;
import com.kh.hello.common.PageInfo;

public interface BoardService{

	int insertAttachment(Attachment a);

	int insertBoard(Board b);

	int deleteAttachment(String changeFileName);

	int deleteAllUpload(int getmId);

	ArrayList<Attachment> selectUpload(int getmId);

	int updateBoard(Board b);

	ArrayList<Board> selectReview(PageInfo pi);

	int selectReviewCount();

	int insertQ(Board b);

	int selectQCount();

	ArrayList<Board> selectQ(PageInfo pi);

	int insertA(Reply r);

	ArrayList<Reply> selectQAnswer();

	Board selectReviewDetail(int bid);

	ArrayList<Attachment> selectAttachDetail(int bid);

	ArrayList<Reply> selectRAnswer(int bid);

	int insertReport(Report report);

	Report selectReport(Report report);

	int updateReport(Report report);

	int deletePrevReview(int getmId);

	Thumbs selectThumbs(Thumbs thumb);

	int updateThumbs(Thumbs thumb);

	int insertThumbs(Thumbs thumb);

	int selectThumbsCount(Thumbs thumb);

	int updateReply(int reply_id);


	int updateThumbsReview(int ref_id);

	int updateThumbsR(Thumbs thumb); 

} 
