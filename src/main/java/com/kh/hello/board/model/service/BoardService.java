package com.kh.hello.board.model.service;

import java.util.ArrayList;

import com.kh.hello.board.model.vo.Board;
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

}
