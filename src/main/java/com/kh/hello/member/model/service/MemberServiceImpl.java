package com.kh.hello.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.PasswordEncoder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.hello.member.model.exception.LoginException;
import com.kh.hello.member.model.dao.MemberDao;
import com.kh.hello.member.model.vo.Member;
@Service
public class MemberServiceImpl implements MemberService {
	@Autowired private SqlSessionTemplate sqlSession;
	@Autowired private MemberDao md;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	
	//
	@Override
	public int insertMember(Member m) {
	
		return md.insertMember(sqlSession, m);
	}



	//
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






	
}
