package com.kh.hello.board.model.service;

import com.kh.hello.board.model.vo.Board;
import com.kh.hello.common.Attachment;

public interface BoardService{

	int insertAttachment(Attachment a);

	int insertBoard(Board b);

	int deleteAttachment(String changeFileName);

}
