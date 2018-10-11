package com.kh.hello.message.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hello.common.PageInfo;
import com.kh.hello.message.dao.MessageDao;
import com.kh.hello.message.model.vo.Message;
@Service
public class MessageServiceImpl implements MessageService{

	@Autowired
	MessageDao md;
	@Autowired
    private SqlSessionTemplate sqlSession;
	
	//받은 메세지함 페이징
	@Override
	public int getReceiveMessageCount(String mId) {
		return md.getReceiveMessageCount(sqlSession, mId);
	}

	//받은 메세지함 select
	@Override
	public ArrayList<Message> selectReceiveMessage(String mId, PageInfo pi) {
		return md.selectReceiveMessage(sqlSession, mId, pi);
	}

	//메세지 읽은 날짜 추가
	@Override
	public int updateMessageReadDate(String msgId) {
		return md.updateMessageReadDate(sqlSession, msgId);
	}
	//받은 메세지 detail
	@Override
	public Message selectReceiveMessageDetail(String msgId) {
		return md.selectReceiveMessageDetail(sqlSession, msgId);
	}
	
	//받은 메세지 삭제
	@Override
	public int updateMessageStatus(String msgId) {
		return md.updateMessageStatus(sqlSession, msgId);
	}


}
