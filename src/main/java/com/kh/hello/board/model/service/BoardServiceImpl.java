package com.kh.hello.board.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;

import com.kh.hello.board.model.dao.BoardDao;
import com.kh.hello.board.model.vo.Board;
import com.kh.hello.common.Attachment;

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

}
