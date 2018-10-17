package com.kh.hello.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.PasswordEncoder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.hello.member.model.exception.LoginException;
import com.kh.hello.common.Attachment;
import com.kh.hello.member.model.dao.MemberDao;
import com.kh.hello.member.model.vo.BoardAndReply;
import com.kh.hello.member.model.vo.Member;
import com.kh.hello.member.model.vo.MemberGoods;
@Service
public class MemberServiceImpl implements MemberService {
	@Autowired private SqlSessionTemplate sqlSession;
	@Autowired private MemberDao md;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	
	//회원
	@Override
	public int insertMember(Member m) {
	
		return md.insertMember(sqlSession, m);
	}


	//판매자
	@Override
	public int insertSeller(Member m) {
	
		return md.insertSeller(sqlSession,m);
	}



	@Override
	public Member loginMember(Member m) throws LoginException {
		Member loginUser =null;
		
		String encPassword = md.selectEncPassword(sqlSession,m);
		
		if(!passwordEncoder.matches(m.getPassword(), encPassword)){
			throw new LoginException("�α��ν���");
			
		}else{
			loginUser = md.selectMember(sqlSession,m);
			
		}
		
		
		return loginUser;
	}

	@Override
	public int updateAddUser(Member m) {
		// TODO Auto-generated method stub
		return md.updateAddUser(m, sqlSession);
	}


	
	//회원시퀀스
	@Override
	public int selectMemberSequence() {
		// TODO Auto-generated method stub
		return md.selectMemberSequence(sqlSession);
	}



	@Override
	public int selectSellerSequence() {
		// TODO Auto-generated method stub
		return md.selectSellerSequence(sqlSession);
	}



	@Override
	public int updateAddSeller(Member m) {
		// TODO Auto-generated method stub
		return md.updateAddSeller(m,sqlSession);
	}


	@Override
	public int editProfile(Member m) {
		// TODO Auto-generated method stub
		return md.editProfile(m,sqlSession);
	}


	@Override
	public int uploadprofile(Attachment a) {
		// TODO Auto-generated method stub
		return md.uploadprofile(a,sqlSession);
	}





	@Override
	public int insertFacebook(Member m) {
		// TODO Auto-generated method stub
		return md.insertFacebook(m,sqlSession);
	}


	@Override
	public Member selectSnsChceck(HashMap<String, Object> snsInfo) {
		// TODO Auto-generated method stub
		return md.selectSnsChceck(snsInfo,sqlSession);
	}


	@Override
	public ArrayList<MemberGoods> selectGoodsList(int mId) {
		// TODO Auto-generated method stub
		return md.selectGoodsList(mId,sqlSession);
	}


	@Override
	public Attachment selectMemberProfile(int mId) {
		// TODO Auto-generated method stub
		return md.selectMemberProfile(mId,sqlSession);
	}


	@Override
	public Attachment selectMemberProfile1(int mId) {
		// TODO Auto-generated method stub
		return md.selectMemberProfile1(mId,sqlSession);
	}

	//닉네임중복체크
	@Override
	public int nicknameCheck(String nickname) {
		// TODO Auto-generated method stub
		return md.nicknameCheck(nickname,sqlSession);
	}

	//활동내역
	@Override
	public ArrayList<BoardAndReply> selectboreList(int mId) {
		// TODO Auto-generated method stub
		return md.selectboreList(mId,sqlSession);
	}


	@Override
	public int insertGoogole(Member m) {
		// TODO Auto-generated method stub
		return md.insertGoogole(m,sqlSession);
	}

	//댓글갯수
	@Override
	public int selectReplyCount(int mId) {
		// TODO Auto-generated method stub
		return md.selectReplyCount(mId,sqlSession);
	}










	
}
