package com.kh.hello.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hello.common.Attachment;
import com.kh.hello.member.model.vo.Member;
import com.kh.hello.member.model.vo.MemberGoods;
@Repository
public class MemberDaoImpl implements MemberDao {

	@Override
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		System.out.println("m : " +m);
		
		return sqlSession.insert("Member.insertMember", m);
	}

	@Override
	public int insertSeller(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		return sqlSession.insert("Member.insertSeller",m);
	}
	

	@Override
	public String selectEncPassword(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("Member.selectPwd", m.getEmail());
	}

	@Override
	public Member selectMember(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Member.selectLoginUser",m);
	}
	@Override
	public int updateAddUser(Member m, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.update("Member.updateAddUser",m);
	}
	
	//회원시퀀스
	@Override
	public int selectMemberSequence(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Member.selectMemberSequence");
	}

	@Override
	public int selectSellerSequence(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Member.selectSellerSequence");
	}

	@Override
	public int updateAddSeller(Member m, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.update("Member.updateAddSeller",m);
	}

	@Override
	public int editProfile(Member m, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.update("Member.editProfile", m);
	}

	@Override
	public int uploadprofile(Attachment a, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.insert("Attachment.uploadprofile",a);
	}



	@Override
	public int insertFacebook(Member m, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.insert("Member.insertFacebook",m);
	}

	@Override
	public Member selectSnsChceck(HashMap<String, Object> snsInfo, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Member.selectSnsCheck", snsInfo);
	}

	@Override
	public ArrayList<MemberGoods> selectGoodsList(int mId, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub, 
		ArrayList<MemberGoods> list =(ArrayList) sqlSession.selectList("MemberGoods.selectGoodList", mId);
		
		return list;
	}

	@Override
	public Attachment selectMemberProfile(int mId, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Attachment.selectMemberProfile",mId);
	}

	@Override
	public Attachment selectMemberProfile1(int mId, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Attachment.selectMemberProfile1",mId);
	}
	
	//닉네임체크
	@Override
	public int nicknameCheck(String nickname, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Member.nicknameCheck",nickname);
	}





	

	

	

}
