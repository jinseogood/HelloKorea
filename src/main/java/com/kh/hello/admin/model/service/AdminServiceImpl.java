package com.kh.hello.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.kh.hello.admin.dao.AdminDao;
import com.kh.hello.admin.model.vo.Blacklist;
import com.kh.hello.admin.model.vo.DatePick;
import com.kh.hello.admin.model.vo.PageInfo;
import com.kh.hello.admin.model.vo.Question;
import com.kh.hello.admin.model.vo.Report;
import com.kh.hello.admin.model.vo.Reservation;
@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
    private SqlSessionTemplate sqlSession;
    @Autowired
    private AdminDao ad;
    @Autowired
	private DataSourceTransactionManager transactionManager;
    
    //예약 리스트 카운트용
	@Override
	public int getReservationListCount() {
		return ad.getReservationListCount(sqlSession);
	}
	
	//예약 리스트
	@Override
	public ArrayList<Reservation> selectReservationList(PageInfo pi) {
		return ad.selectReservationList(sqlSession, pi);
	}

    //예약 리스트 날짜 검색 카운트
	@Override
	public int getSearchDateReservationListCount(DatePick d) {
		return ad.getSearchDateReservationListCount(sqlSession, d);
	}
    //예약 리스트 날짜 검색
	@Override
	public ArrayList<Reservation> selectSearchDateReservationList(DatePick d, PageInfo pi) {
		return ad.selectSearchDateReservationList(sqlSession, d, pi);
	}

	//예약 리스트 검색 카운트용
	@Override
	public int getSearchWordReservationListCount(Reservation r) {
		return ad.getSearchWordReservationListCount(sqlSession, r);
	}

	//예약 리스트 검색
	@Override
	public ArrayList<Reservation> selectSearchWordReservationList(Reservation r, PageInfo pi) {
		return ad.selectSearchWordReservationList(sqlSession, r, pi);
	}

	//신고 리스트 카운트용
	@Override
	public int getReportListCount() {
		return ad.getReportListCount(sqlSession);
	}
    
	//신고 리스트
	@Override
	public ArrayList<Report> selectReportList(PageInfo pi) {
		return ad.selectReportList(sqlSession, pi);
	}

	//신고일 검색 카운트
	@Override
	public int getSearchDateReportListCount(DatePick d) {
		return ad.getSearchDateReportListCount(sqlSession, d);
	}

	//신고일 검색
	@Override
	public ArrayList<Report> selectSearchDateReportList(DatePick d, PageInfo pi) {
		return ad.selectSearchDateReportList(sqlSession, d, pi);
	}

	//신고 리스트 검색 카운트
	@Override
	public int getSearchWordReportListCount(Report r) {
		return ad.getSearchWordReportListCount(sqlSession, r);
	}

	//신고 리스트 검색
	@Override
	public ArrayList<Report> selectSearchWordReportList(Report r, PageInfo pi) {
		return ad.selectSearchWordReportList(sqlSession, r, pi);
	}

	//신고 상세 게시글
	@Override
	public ArrayList<Report> selectBoardReportOne(int refId) {
		return ad.selectBoardReportOne(sqlSession, refId);
	}

	//신고 상세 댓글
	@Override
	public ArrayList<Report> selectReplyReportOne(int refId) {
		return ad.selectReplyReportOne(sqlSession, refId);
	}

	//신고 상세 메세지
	@Override
	public ArrayList<Report> selectMessageReportOne(int refId) {
		return ad.selectMessageReportOne(sqlSession, refId);
	}

	//신고 반려 시 업데이트
	@Override
	public int updateReportResult(Report r) {
		return ad.updateReportResult(sqlSession, r);
	}

	//신고 블랙리스트 등록
	@Override
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.SERIALIZABLE, rollbackFor={Exception.class})
	public int updateBlacklist(Report r, Blacklist b) {
        int result = -99;
		
		int result1 = ad.updateReportResult(sqlSession, r);
		int result2 = ad.insertBlacklist(sqlSession, b);
		int result3 = ad.updateMemberStatus(sqlSession, b);
		int result4 = 0;
		if(r.getrLevel()==0){
			result4 = ad.updateBoardStatus(sqlSession, r.getRefId());
		}else if(r.getrLevel()==1){
			result4 = ad.updateReplyStatus(sqlSession, r.getRefId());
		}else{
			result4 = ad.updateMessageStatus(sqlSession, r.getRefId());
		}
		
		if(result1 > 0 && result2 > 0 && result3 > 0 && result4 > 0){
			result = 1;
		}else{
			result = 0;
		}
		return result;
	}

	//블랙리스트 전체 리스트 카운트
	@Override
	public int getBlacklistCount() {
		return ad.getBlacklistCount(sqlSession);
	}

	@Override
	public ArrayList<Blacklist> selectBlacklist(PageInfo pi) {
		return ad.selectBlacklist(sqlSession, pi);
	}

	@Override
	public int getSearchRDateBlacklistCount(DatePick d) {
		return ad.getSearchRDateBlacklistCount(sqlSession, d);
	}

	@Override
	public ArrayList<Blacklist> selectSearchRDateBlacklist(DatePick d, PageInfo pi) {
		return ad.selectSearchRDateBlacklist(sqlSession, d, pi);
	}

	@Override
	public int getSearchTDateBlacklistCount(DatePick d) {
		return ad.getSearchTDateBlacklistCount(sqlSession, d);
	}

	@Override
	public ArrayList<Blacklist> selectSearchTDateBlacklist(DatePick d, PageInfo pi) {
		return ad.selectSearchTDateBlacklist(sqlSession, d, pi);
	}
	@Override
	public int getnoTBlacklistCount() {
		return ad.getnoTBlacklistCount(sqlSession);
	}

	@Override
	public ArrayList<Blacklist> selectnoTBlacklist(PageInfo pi) {
		return ad.selectnoTBlacklist(sqlSession, pi);
	}
	
	@Override
	public int getSearchWordBlacklistCount(Blacklist b) {
		return ad.getSearchWordBlacklistCount(sqlSession, b);
	}

	@Override
	public ArrayList<Blacklist> selectSearchWordBlacklist(Blacklist b, PageInfo pi) {
		return ad.selectSearchWordBlacklist(sqlSession, b, pi);
	}

	@Override
	public int getQuestionListCount() {
		return ad.getQuestionListCount(sqlSession);
	}

	@Override
	public ArrayList<Question> selectQuestionList(PageInfo pi) {
		// TODO Auto-generated method stub
		return ad.selectQuestionList(sqlSession, pi);
	}

	@Override
	public int getSearchDateQuestionListCount(DatePick d) {
		return ad.getSearchDateQuestionListCount(sqlSession, d);
	}

	@Override
	public ArrayList<Question> selectSearchDateQuestionList(DatePick d, PageInfo pi) {
		return ad.selectSearchDateQuestionList(sqlSession, d, pi);

	}

	@Override
	public int getSearchWordQuestionListCount(Question q) {
		return ad.getSearchWordQuestionListCount(sqlSession, q);
	}

	@Override
	public ArrayList<Question> selectSearchWordQuestionList(Question q, PageInfo pi) {
		return ad.selectSearchWordQuestionList(sqlSession, q, pi);
	}

}
