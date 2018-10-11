package com.kh.hello.message.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hello.admin.model.vo.Reservation;
import com.kh.hello.common.PageInfo;
import com.kh.hello.message.model.vo.Message;
@Repository
public class MessageDaoImpl implements MessageDao{

	//받은 메세지 페이징
	@Override
	public int getReceiveMessageCount(SqlSessionTemplate sqlSession, String mId) {
		return sqlSession.selectOne("getReceiveMessageCount", Integer.parseInt(mId));
	}

	//받은 메세지 select
	@Override
	public ArrayList<Message> selectReceiveMessage(SqlSessionTemplate sqlSession, String mId, PageInfo pi) {
		ArrayList<Message> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("selectReceiveMessage", Integer.parseInt(mId), rowBounds);
		return list;
	}

	//메세지 읽은 날짜 추가
	@Override
	public int updateMessageReadDate(SqlSessionTemplate sqlSession, String msgId) {
		return sqlSession.update("updateMessageReadDate",Integer.parseInt(msgId));
	}
	
	//받은 메세지 detail
	@Override
	public Message selectReceiveMessageDetail(SqlSessionTemplate sqlSession, String msgId) {
		return sqlSession.selectOne("selectReceiveMessageDetail", Integer.parseInt(msgId));
	}

	//받은 메세지 삭제
	@Override
	public int updateMessageStatus(SqlSessionTemplate sqlSession, String msgId) {
		return sqlSession.update("updateMessageStatus", Integer.parseInt(msgId));
	}


	
}
