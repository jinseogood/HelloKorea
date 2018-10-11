package com.kh.hello.admin.model.dao;
    
import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hello.admin.model.vo.Approval;
import com.kh.hello.admin.model.vo.Blacklist;
import com.kh.hello.admin.model.vo.CompanyAreaStatistics;
import com.kh.hello.admin.model.vo.CompanyDetails;
import com.kh.hello.admin.model.vo.CompanyPeriodStatistics;
import com.kh.hello.admin.model.vo.CompanyRegistStatistics;
import com.kh.hello.admin.model.vo.DatePick;
import com.kh.hello.admin.model.vo.Deposit;
import com.kh.hello.admin.model.vo.InterestStatistics;
import com.kh.hello.admin.model.vo.NationalStatistics;
import com.kh.hello.admin.model.vo.PlatformStatistics;
import com.kh.hello.common.Attachment;
import com.kh.hello.common.PageInfo;
import com.kh.hello.admin.model.vo.Question;
import com.kh.hello.admin.model.vo.Report;
import com.kh.hello.admin.model.vo.Reservation;
import com.kh.hello.admin.model.vo.SalesStatistics;
import com.kh.hello.message.model.vo.Message;
@Repository
public class AdminDaoImpl implements AdminDao{
   
	//예약 리스트 카운트용
	@Override
	public int getReservationListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("selectReservationListCount");
	}
	
	//예약 리스트
	@Override
	public ArrayList<Reservation> selectReservationList(SqlSessionTemplate sqlSession, PageInfo pi) {
		ArrayList<Reservation> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("selectReservationList", null, rowBounds);
		return list;
	}

	//예약 리스트 검색 카운트용
	@Override
	public int getSearchWordReservationListCount(SqlSessionTemplate sqlSession, Reservation r) {
		return sqlSession.selectOne("selectSearchWordReservationListCount",r);
	}
	
    //예약 리스트 검색
	@Override
	public ArrayList<Reservation> selectSearchWordReservationList(SqlSessionTemplate sqlSession, Reservation r, PageInfo pi) {
		ArrayList<Reservation> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("selectSearchReservationList", r, rowBounds);
		return list;
	}

	//예약 리스트 날짜 검색 카운트용
	@Override
	public int getSearchDateReservationListCount(SqlSessionTemplate sqlSession, DatePick d) {
		return sqlSession.selectOne("selectSearchDateReservationListCount",d);
	}

	//예약 리스트 날짜 검색
	@Override
	public ArrayList<Reservation> selectSearchDateReservationList(SqlSessionTemplate sqlSession, DatePick d, PageInfo pi) {
		ArrayList<Reservation> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("selectSearchDateReservationList", d, rowBounds);
		return list;
	}

	//신고 리스트 카운트용
	@Override
	public int getReportListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("selectReportListCount");
	}

	//신고 리스트
	@Override
	public ArrayList<Report> selectReportList(SqlSessionTemplate sqlSession, PageInfo pi) {
		ArrayList<Report> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("selectReportList", null, rowBounds);
		return list;
	}

	//신고일 리스트 카운트
	@Override
	public int getSearchDateReportListCount(SqlSessionTemplate sqlSession, DatePick d) {
		return sqlSession.selectOne("selectSearchDateReportListCount",d);
	}

	//신고일 검색
	@Override
	public ArrayList<Report> selectSearchDateReportList(SqlSessionTemplate sqlSession, DatePick d, PageInfo pi) {
		ArrayList<Report> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("selectSearchDateReportList", d, rowBounds);
		return list;
	}

	//신고 검색 리스트 카운트
	@Override
	public int getSearchWordReportListCount(SqlSessionTemplate sqlSession, Report r) {
		return sqlSession.selectOne("selectSearchWordReportListCount",r);
	}

	//신고 검색 리스트
	@Override
	public ArrayList<Report> selectSearchWordReportList(SqlSessionTemplate sqlSession, Report r, PageInfo pi) {
		ArrayList<Report> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("selectSearchReportList", r, rowBounds);
		return list;
	}

	//신고 상세 게시글
	@Override
	public ArrayList<Report> selectBoardReportOne(SqlSessionTemplate sqlSession, int refId) {
		return (ArrayList)sqlSession.selectList("selectBoardReportOne", refId);
	}
	
    //신고 상세 댓글
	@Override
	public ArrayList<Report> selectReplyReportOne(SqlSessionTemplate sqlSession, int refId) {
		return (ArrayList)sqlSession.selectList("selectReplyReportOne", refId);
	}

	//신고 상세 메세지
	@Override
	public ArrayList<Report> selectMessageReportOne(SqlSessionTemplate sqlSession, int refId) {
		return (ArrayList)sqlSession.selectList("selectMessageReportOne", refId);
	}

	//신고 결과 업데이트
	@Override
	public int updateReportResult(SqlSessionTemplate sqlSession, Report r) {
		return sqlSession.update("updateReportResult", r);
	}

	//블랙리스트 insert
	@Override
	public int insertBlacklist(SqlSessionTemplate sqlSession, Blacklist b) {
		return sqlSession.insert("insertBlacklist",b);
	}
	
	//멤버 상태 업데이트
	@Override
	public int updateMemberStatus(SqlSessionTemplate sqlSession, Blacklist b) {
		return sqlSession.update("updateMemberStatus", b);
	}

	//블랙리스트 해당 글 삭제
	@Override
	public int updateBoardStatus(SqlSessionTemplate sqlSession, int refId) {
		return sqlSession.update("updateBoardStatus", refId);
	}
	
	//블랙리스트 해당 댓글 삭제
	@Override
	public int updateReplyStatus(SqlSessionTemplate sqlSession, int refId) {
		return sqlSession.update("updateReplyStatus", refId);
	}

	//블랙리스트 해당 메세지 삭제
	@Override
	public int updateMessageStatus(SqlSessionTemplate sqlSession, int refId) {
		return sqlSession.update("updateMessageStatus", refId);
	}

	//블랙리스트 전체리스트 카운트
	@Override
	public int getBlacklistCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("selectBlacklistCount");
	}
    
	//블랙리스트 전체리스트
	@Override
	public ArrayList<Blacklist> selectBlacklist(SqlSessionTemplate sqlSession, PageInfo pi) {
		ArrayList<Blacklist> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("selectBlacklist", null, rowBounds);
		return list;
	}
	
	//블랙리스트 등록일 검색 카운트용
	@Override
	public int getSearchRDateBlacklistCount(SqlSessionTemplate sqlSession, DatePick d) {
		return sqlSession.selectOne("selectSearchRDateBlacklistCount",d);
	}

	//블랙리스트 등록일 검색 리스트
	@Override
	public ArrayList<Blacklist> selectSearchRDateBlacklist(SqlSessionTemplate sqlSession, DatePick d, PageInfo pi) {
		ArrayList<Blacklist> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("selectSearchRDateBlacklist", d, rowBounds);
		return list;
	}

	//블랙리스트 해지일 검색 카운트용
	@Override
	public int getSearchTDateBlacklistCount(SqlSessionTemplate sqlSession, DatePick d) {
		return sqlSession.selectOne("selectSearchTDateBlacklistCount",d);

	}

	//블랙리스트 해지일 검색 리스트
	@Override
	public ArrayList<Blacklist> selectSearchTDateBlacklist(SqlSessionTemplate sqlSession, DatePick d, PageInfo pi) {
		ArrayList<Blacklist> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("selectSearchTDateBlacklist", d, rowBounds);
		return list;
	}
	
    //블랙리스트 미해지건 검색 리스트 카운트
	@Override
	public int getnoTBlacklistCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("selectnoTBlacklistCount");

	}
	//블랙리스트 미해지건 검색 리스트
	@Override
	public ArrayList<Blacklist> selectnoTBlacklist(SqlSessionTemplate sqlSession, PageInfo pi) {
		ArrayList<Blacklist> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("selectnoTBlacklist", null, rowBounds);
		return list;
	}

	//블랙리스트 번호,대상 검색 카운트
	@Override
	public int getSearchWordBlacklistCount(SqlSessionTemplate sqlSession, Blacklist b) {
		return sqlSession.selectOne("selectSearchWordBlacklistCount",b);

	}
	
    //블랙리스트 번호,대상 검색 리스트
	@Override
	public ArrayList<Blacklist> selectSearchWordBlacklist(SqlSessionTemplate sqlSession, Blacklist b, PageInfo pi) {
		ArrayList<Blacklist> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("selectSearchWordBlacklist", b, rowBounds);
		return list;
	}

	//문의 리스트 카운트
	@Override
	public int getQuestionListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("getQuestionListCount");
	}

	//문의 리스트
	@Override
	public ArrayList<Question> selectQuestionList(SqlSessionTemplate sqlSession, PageInfo pi) {
		ArrayList<Question> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("selectQuestionList", null, rowBounds);
		return list;
	}

	//문의일 검색 카운트
	@Override
	public int getSearchDateQuestionListCount(SqlSessionTemplate sqlSession, DatePick d) {
		return sqlSession.selectOne("getSearchDateQuestionListCount", d);
	}

	//문의일 검색 리스트
	@Override
	public ArrayList<Question> selectSearchDateQuestionList(SqlSessionTemplate sqlSession, DatePick d, PageInfo pi) {
		ArrayList<Question> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("selectSearchDateQuestionList", d, rowBounds);
		return list;
	}

	//문의 검색 카운트
	@Override
	public int getSearchWordQuestionListCount(SqlSessionTemplate sqlSession, Question q) {
		return sqlSession.selectOne("getSearchWordQuestionListCount", q);
	}

	//문의 검색 리스트
	@Override
	public ArrayList<Question> selectSearchWordQuestionList(SqlSessionTemplate sqlSession, Question q, PageInfo pi) {
		ArrayList<Question> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("selectSearchWordQuestionList", q, rowBounds);
		return list;
	}

	//문의 답변 발송
	@Override
	public int insertAnswerMsg(SqlSessionTemplate sqlSession, Message m) {
		return sqlSession.insert("insertAnswerMsg", m);
	}

	//답변 된 문의 pDate 업데이트
	@Override
	public int updatepDate(SqlSessionTemplate sqlSession, Message m) {
		return sqlSession.update("updatepDate", m);
	}

	//업체 승인 신청 리스트 카운트
	@Override
	public int getCompanyListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("selectCompanyListCount");
	}

	//업체 승인 신청 리스트
	@Override
	public ArrayList<Approval> selectCompanyList(SqlSessionTemplate sqlSession, PageInfo pi) {
		ArrayList<Approval> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("selectCompanyList", null, rowBounds);
		return list;
	}

	//업체 등록일 검색 리스트 카운트
	@Override
	public int getSearchcrDateCompanyListCount(SqlSessionTemplate sqlSession, DatePick d) {
		return sqlSession.selectOne("selectSearchcrDateBlacklistCount", d);
	}

	//업체 등록일 검색 리스트
	@Override
	public ArrayList<Approval> selectSearchcrDateCompanyList(SqlSessionTemplate sqlSession, DatePick d, PageInfo pi) {
		ArrayList<Approval> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("selectSearchcrDateBlacklist", d, rowBounds);
		return list;
	}
	
	//업체 승인일 검색 리스트 카운트
	@Override
	public int getSearchapDateCompanyListCount(SqlSessionTemplate sqlSession, DatePick d) {
		return sqlSession.selectOne("selectSearchapDateBlacklistCount", d);

	}
	
	//업체 승인일 검색 리스트
	@Override
	public ArrayList<Approval> selectSearchapDateCompanyList(SqlSessionTemplate sqlSession, DatePick d, PageInfo pi) {
		ArrayList<Approval> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("selectSearchapDateBlacklist", d, rowBounds);
		return list;
	}

	//업체 검색 리스트 카운트
	@Override
	public int getSearchWordCompanyListCount(SqlSessionTemplate sqlSession, Approval a) {
		return sqlSession.selectOne("selectSearchWordCompanyListCount", a);
	}

	//업체 검색 리스트
	@Override
	public ArrayList<Approval> selectSearchWordCompanyList(SqlSessionTemplate sqlSession, Approval a, PageInfo pi) {
		ArrayList<Approval> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("selectSearchWordCompanyList", a, rowBounds);
		return list;
	}

	//업체 디테일
	@Override
	public ArrayList<CompanyDetails> selectOneCompany(SqlSessionTemplate sqlSession, int crId) {
		return (ArrayList)sqlSession.selectList("selectOneCompany", crId);
	}

	//업체 첨부파일
	@Override
	public ArrayList<Attachment> selectCompanyFiles(SqlSessionTemplate sqlSession, int refId) {
		return (ArrayList)sqlSession.selectList("selectCompanyFiles", refId);
	}

	//첨부파일 정보 읽어가기
	@Override
	public Map<String, Object> selectFileInfo(SqlSessionTemplate sqlSession, int fId) {
		return (Map<String, Object>)sqlSession.selectOne("selectFileInfo", fId);

	}

	//회사 승인
	@Override
	public int updateCompanyRegist(SqlSessionTemplate sqlSession, CompanyDetails cd) {
		return sqlSession.update("updateCompanyRegist", cd);
	}

	//회사 해지
	@Override
	public int updateCompanyStatus(SqlSessionTemplate sqlSession, String crId) {
		return sqlSession.update("updateCompanyStatus", Integer.parseInt(crId));
	}

	//해지 메세지 발송을 위해 찾아오기
	@Override
	public Message selectRecieveId(SqlSessionTemplate sqlSession, String crId) {
		return sqlSession.selectOne("selectRecieveId", Integer.parseInt(crId));
	}

	//해지 메세지 발송
	@Override
	public int insertTerminateMsg(SqlSessionTemplate sqlSession, Message m) {
		return sqlSession.insert("insertTerminateMsg", m);
	}

	//입금 처리를 위한 리스트 카운트
	@Override
	public int getDepositListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("selectDepositListCount");
	}
	//입금 처리를 위한 리스트
	@Override
	public ArrayList<Deposit> selectDepositList(SqlSessionTemplate sqlSession, PageInfo pi) {
		ArrayList<Deposit> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("selectDepositList", null, rowBounds);
		return list;
	}

	//입금처리를 위한 리스트 검색 카운트
	@Override
	public int getSearchWordDepositListCount(SqlSessionTemplate sqlSession, Deposit d) {
		return sqlSession.selectOne("selectSearchWordDepositListCount",d);
	}

	//입금처리를 위한 리스트 검색
	@Override
	public ArrayList<Deposit> selectSearchWordDepositList(SqlSessionTemplate sqlSession, Deposit d, PageInfo pi) {
		ArrayList<Deposit> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("selectSearchWordDepositList", d, rowBounds);
		return list;
	}

	//업체 입금해주기
	@Override
	public int insertDepositHistory(SqlSessionTemplate sqlSession, Deposit d) {
		return sqlSession.insert("insertDepositHistory",d);
	}

	//입금내역 리스트 카운트
	@Override
	public int getDepositHistoryListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("selectDepositHistoryListCount");
	}

	//입금내역 리스트
	@Override
	public ArrayList<Deposit> selectDepositHistoryList(SqlSessionTemplate sqlSession, PageInfo pi) {
		ArrayList<Deposit> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("selectDepositHistoryList", null, rowBounds);
		return list;
	}

	//입금내역 입금일 검색 카운트
	@Override
	public int getSearchDateDepositHistoryListCount(SqlSessionTemplate sqlSession, DatePick d) {
		return sqlSession.selectOne("selectSearchDateDepositHistoryListCount",d);
	}

	//입금내역 입금일 검색
	@Override
	public ArrayList<Deposit> selectSearchDateDepositHistoryList(SqlSessionTemplate sqlSession, DatePick d,
			PageInfo pi) {
		ArrayList<Deposit> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("selectSearchDateDepositHistoryList", d, rowBounds);
		return list;
	}

	//입금내역 검색 카운트
	@Override
	public int getSearchWordDepositHistroyListCount(SqlSessionTemplate sqlSession, Deposit d) {
		return sqlSession.selectOne("selectSearchWordDepositHistroyListCount",d);
	}

	//입금내역 검색
	@Override
	public ArrayList<Deposit> selectSearchWordDepositHistoryList(SqlSessionTemplate sqlSession, Deposit d,
			PageInfo pi) {
		ArrayList<Deposit> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("selectSearchWordDepositHistoryList", d, rowBounds);
		return list;
	}

	//국가별 가입자수(월별)
	@Override
	public ArrayList<NationalStatistics> selectNationalStatistics(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("selectNationalStatistics");
	}

	//회원 관심분야 통계
	@Override
	public ArrayList<InterestStatistics> selectInterestStatistics(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("selectInterestStatistics");
	}

	//회원 플랫폼 통계
	@Override
	public ArrayList<PlatformStatistics> selectPlatformStatistics(SqlSessionTemplate sqlSession, int row) {
		return (ArrayList)sqlSession.selectList("selectPlatformStatistics",row);
	}

	//업체 등록 지역 통계
	@Override
	public ArrayList<CompanyAreaStatistics> selectCompanyAreaStatistics(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("selectCompanyAreaStatistics");
	}

	//업체 등록 기간 통계
	@Override
	public ArrayList<CompanyPeriodStatistics> selectCompanyPeriodStatistics(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("selectCompanyPeriodStatistics");
	}

	//업체 등록 건수 통계
	@Override
	public ArrayList<CompanyRegistStatistics> selectCompanyRegistStatistics(SqlSessionTemplate sqlSession, int row) {
		return (ArrayList)sqlSession.selectList("selectCompanyRegistStatistics",row);
	}

	//매출 통계 리스트 카운트
	@Override
	public int selectSalesStatisticsListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("selectSalesStatisticsListCount");
	}

	//매출 통계 리스트
	@Override
	public ArrayList<SalesStatistics> selectSalesStatisticsList(SqlSessionTemplate sqlSession, PageInfo pi) {
		ArrayList<SalesStatistics> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("selectSalesStatisticsList", null, rowBounds);
		return list;
	}

	//매출 통계(메인)
	@Override
	public ArrayList<SalesStatistics> selectMainSalesStatistics(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("selectMainSalesStatistics");
	}

	//메인 이번달 수익
	@Override
	public ArrayList<SalesStatistics> selectMainProfit(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("selectMainProfit");
	}

	//메인 미승인 업체 수
	@Override
	public int selectUnapprovedCompanyCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("selectUnapprovedCompanyCount");
	}

	//제휴만료도래 
	@Override
	public ArrayList<CompanyDetails> selectExpirationList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("selectExpirationList");
	}

	//블랙리스트 해지 
	//해당자 검색
	@Override
	public ArrayList<Blacklist> selectTerminateList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("selectTerminateList");
	}

	//블랙리스트 이력내에서 업데이트
	@Override
	public int insertTerminateHistroy(SqlSessionTemplate sqlSession, ArrayList<Blacklist> b) {
		return sqlSession.insert("insertTerminateHistroy", b);
	}

	@Override
	public int updateMemberStatus2(SqlSessionTemplate sqlSession, ArrayList<Blacklist> b) {
		// TODO Auto-generated method stub
		return 0;
	}

}
