package com.kh.hello.board.model.service;

import com.kh.hello.board.model.vo.Attachment;
import com.kh.hello.board.model.vo.Board;

public interface BoardService{

	int insertAttachment(Attachment a);

	int insertBoard(Board b);

	int deleteAttachment(int i);

}
