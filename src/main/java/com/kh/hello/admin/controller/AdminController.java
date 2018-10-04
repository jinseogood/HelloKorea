package com.kh.hello.admin.controller;
   
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.hello.admin.model.service.AdminService;
import com.kh.hello.admin.model.vo.Approval;
import com.kh.hello.admin.model.vo.Blacklist;
import com.kh.hello.admin.model.vo.CompanyDetails;
import com.kh.hello.admin.model.vo.DatePick;
import com.kh.hello.common.PageInfo;
import com.kh.hello.admin.model.vo.Question;
import com.kh.hello.admin.model.vo.Report;
import com.kh.hello.admin.model.vo.Reservation;
import com.kh.hello.common.Pagination;
import com.kh.hello.message.model.vo.Message;
@Controller
public class AdminController {
   
	@Autowired
	private AdminService as;

	//관리자 마이페이지	
	@RequestMapping("myPageView.ad")
	public String myPageView(){
		return "admin/adminMain";
	}

	//예약내역조회
	@RequestMapping("selectReservationList.ad")
	public String selectReservationList(String searchParam, String searchWord, String fromDate, String toDate, PageInfo p, Model model){

		if(p.getCurrentPage() == 0){
			p.setCurrentPage(1);
		}

		ArrayList<Reservation> list = null;
		PageInfo pi = null;
		
		//전체 리스트
		if(searchParam == null && searchWord == null){

			int listCount = as.getReservationListCount();
			pi = Pagination.getPageInfo(p.getCurrentPage(), listCount);		
			list = as.selectReservationList(pi);

		//숙박일 검색
		}else if(searchParam.equals("datePick")){

			DatePick d = new DatePick();
			d.setFromDate(fromDate.replaceAll("-", ""));
			d.setToDate(toDate.replaceAll("-", ""));
			
			
			int listCount = as.getSearchDateReservationListCount(d);
			pi = Pagination.getPageInfo(p.getCurrentPage(), listCount);
			list = as.selectSearchDateReservationList(d, pi);
			
		}else{
			Reservation r = new Reservation();
			r.setoId(-99);
			//예약번호 검색
			if(searchParam.equals("oId")){
				r.setoId(Integer.parseInt(searchWord));
			//예약처 검색	
			}else if(searchParam.equals("cName")){
				r.setcName(searchWord);
			//예약자 검색
			}else if(searchParam.equals("paName")){
				r.setPaName(searchWord);
			}
			
			int listCount = as.getSearchWordReservationListCount(r);
			pi = Pagination.getPageInfo(p.getCurrentPage(), listCount);
			list = as.selectSearchWordReservationList(r, pi);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "admin/reservation";
	}

	//신고 내역 조회
	@RequestMapping("selectReportList.ad")
	public String selectReportList(String searchParam, String searchWord, String fromDate, String toDate, PageInfo p, Model model){
		
		if(p.getCurrentPage() == 0){
			p.setCurrentPage(1);
		}
		ArrayList<Report> list = null;
		PageInfo pi = null;

		//전체 리스트
		if(searchParam == null && searchWord == null){

			int listCount = as.getReportListCount();
			pi = Pagination.getPageInfo(p.getCurrentPage(), listCount);		
			list = as.selectReportList(pi);
			
		//신고일 검색
		 }else if(searchParam.equals("datePick")){

			DatePick d = new DatePick();
			d.setFromDate(fromDate.replaceAll("-", ""));
			d.setToDate(toDate.replaceAll("-", ""));
			int listCount = as.getSearchDateReportListCount(d);
			pi = Pagination.getPageInfo(p.getCurrentPage(), listCount);
			list = as.selectSearchDateReportList(d, pi);
			
		}else{
			Report r = new Report();
			r.setrRecordId(-99);
			r.setrTarget(-99);
			//신고번호 검색
			if(searchParam.equals("rRecordId")){
				r.setrRecordId(Integer.parseInt(searchWord));
			//신고 대상 검색	
			}else if(searchParam.equals("rTarget")){
				r.setrTarget(Integer.parseInt(searchWord));
			}
			//미처리건 검색은 mapper에서
			int listCount = as.getSearchWordReportListCount(r);
			pi = Pagination.getPageInfo(p.getCurrentPage(), listCount);
			list = as.selectSearchWordReportList(r, pi);
		}
		
		for(int i = 0; i < list.size(); i++){
			//구분
			if(list.get(i).getrLevel() == 0){
				list.get(i).setrLevelText("게시글");
			}else if(list.get(i).getrLevel() == 1){
				list.get(i).setrLevelText("댓글");
			}else{
				list.get(i).setrLevelText("메세지");
			}
			//처리상황
			if(list.get(i).getResult() == null){
				list.get(i).setResultText("미처리");
			}else{
				if(list.get(i).getResult().equals("Y")){
					list.get(i).setResultText("블랙리스트");
				}else{
					list.get(i).setResultText("반려");
				}
			}
		}
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "admin/report";
	}

	//신고 상세조회
	@RequestMapping("selectReportOne.ad")
	public @ResponseBody HashMap<String, Object> selectReportOne(@RequestParam String rLevel, @RequestParam String refId){

		ArrayList<Report> list = null;
		
		if(Integer.parseInt(rLevel)==0){
			list = as.selectBoardReportOne(Integer.parseInt(refId));
		}else if(Integer.parseInt(rLevel)==1){
			list = as.selectReplyReportOne(Integer.parseInt(refId));
		}else{
			list = as.selectMessageReportOne(Integer.parseInt(refId));
		}
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		for(int i = 0; i < list.size(); i++){

			Format formatter = new SimpleDateFormat("yyyy-MM-dd");
			
			hmap.put("rRecordId" + i, list.get(i).getrRecordId());
			hmap.put("mId" + i, list.get(i).getmId());
			hmap.put("rDate" + i, formatter.format(list.get(i).getrDate()));
			hmap.put("reason" + i, list.get(i).getReason());
			
		}
		hmap.put("result", list.get(0).getResult());
		hmap.put("rLevel", rLevel);
		hmap.put("refId", refId);
		hmap.put("rTarget", list.get(0).getrTarget());
		hmap.put("rContent", list.get(0).getrContent());
		return hmap;
		
	}
	
	//신고 후 블랙리스트 입력
	@RequestMapping("insertBlacklist.ad")
	public String insertBlackList(String rLevel, String refId, String rTarget, String period, String reason, Model model){
		
		Report r = new Report();
		r.setResult("Y");
		r.setrLevel(Integer.parseInt(rLevel));
		r.setRefId(Integer.parseInt(refId));
		
		Blacklist b = new Blacklist();
		b.setmId(Integer.parseInt(rTarget));
		b.setPeriod(Integer.parseInt(period));
		b.setReason(reason);
		int result = as.updateBlacklist(r,b);
		
		if(result > 0){
			int listCount = as.getReportListCount();
			PageInfo pi = Pagination.getPageInfo(1, listCount);		
			ArrayList<Report> list = as.selectReportList(pi);
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			for(int i = 0; i < list.size(); i++){
				//구분
				if(list.get(i).getrLevel() == 0){
					list.get(i).setrLevelText("게시글");
				}else if(list.get(i).getrLevel() == 1){
					list.get(i).setrLevelText("댓글");
				}else{
					list.get(i).setrLevelText("메세지");
				}
				//처리상황
				if(list.get(i).getResult() == null){
					list.get(i).setResultText("미처리");
				}else{
					if(list.get(i).getResult().equals("Y")){
						list.get(i).setResultText("블랙리스트");
					}else{
						list.get(i).setResultText("반려");
					}
				}
			}
			return "admin/report";
		}else{
			model.addAttribute("msg","블랙리스트 등록 실패");
			return "common/errorPage";
		}
		
		
	}
	
	//신고 반려
	@RequestMapping("refuseReport.ad")
	public String refuseReport(String rLevel, String refId, Model model){
		Report r = new Report();
		r.setResult("N");
		r.setrLevel(Integer.parseInt(rLevel));
		r.setRefId(Integer.parseInt(refId));
		
		int result = as.updateReportResult(r);
		
		int listCount = as.getReportListCount();
		PageInfo pi = Pagination.getPageInfo(1, listCount);		
		ArrayList<Report> list = as.selectReportList(pi);
		for(int i = 0; i < list.size(); i++){
			//구분
			if(list.get(i).getrLevel() == 0){
				list.get(i).setrLevelText("게시글");
			}else if(list.get(i).getrLevel() == 1){
				list.get(i).setrLevelText("댓글");
			}else{
				list.get(i).setrLevelText("메세지");
			}
			//처리상황
			if(list.get(i).getResult() == null){
				list.get(i).setResultText("미처리");
			}else{
				if(list.get(i).getResult().equals('Y')){
					list.get(i).setResultText("블랙리스트");
				}else{
					list.get(i).setResultText("반려");
				}
			}
		}

		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "admin/report";
	}
	
	//문의 내역 조회
	@RequestMapping("selectQuestionList.ad")
	public String selectQuestionList(String searchParam, String searchWord, String fromDate, String toDate, PageInfo p, Model model){
		if(p.getCurrentPage() == 0){
			p.setCurrentPage(1);
		}
		ArrayList<Question> list = null;
		PageInfo pi = null;
        int listCount;
		//전체 리스트
		if(searchParam == null && searchWord == null){

			listCount = as.getQuestionListCount();
			pi = Pagination.getPageInfo(p.getCurrentPage(), listCount);		
			list = as.selectQuestionList(pi);
			
		//문의일 검색
		 }else if(searchParam.equals("datePick")){
			DatePick d = new DatePick();
			d.setFromDate(fromDate.replaceAll("-", ""));
			d.setToDate(toDate.replaceAll("-", ""));
			listCount = as.getSearchDateQuestionListCount(d);
			pi = Pagination.getPageInfo(p.getCurrentPage(), listCount);
			list = as.selectSearchDateQuestionList(d, pi);
			
		}else{
			Question q = new Question();
			q.setqRecordId(-99);
			q.setSendId(-99);
			//문의번호 검색
			if(searchParam.equals("qRecordId")){
				q.setqRecordId(Integer.parseInt(searchWord));
			//문의자 검색	
			}else if(searchParam.equals("sendId")){
				q.setSendId(Integer.parseInt(searchWord));
			}
			//미처리건 검색은 mapper에서
			listCount = as.getSearchWordQuestionListCount(q);
			pi = Pagination.getPageInfo(p.getCurrentPage(), listCount);
			list = as.selectSearchWordQuestionList(q, pi);
		}
		
		for(int i = 0; i < list.size(); i++){
			//처리상황
			if(list.get(i).getpDate() == null){
				list.get(i).setStatus("미처리");
			}else{
				list.get(i).setStatus("처리완료");
			}
			
		}
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "admin/question";
	}

	//문의 답변하기
	@RequestMapping("answerQuestion.ad")
	public String insertAnswerMsg(String recieveId, String content, String msgId, Model model){
		Message m = new Message();
		m.setRecieveId(Integer.parseInt(recieveId));
		m.setContent(content);
	    m.setMsgId(Integer.parseInt(msgId));
	    
	    System.out.println(m.getMsgId());
	    
		int result = as.insertAnswerMsg(m);
		
		if(result > 0){
			int listCount = as.getQuestionListCount();
			PageInfo pi = Pagination.getPageInfo(1, listCount);		
			ArrayList<Question> list = as.selectQuestionList(pi);
			for(int i = 0; i < list.size(); i++){
				//처리상황
				if(list.get(i).getpDate() == null){
					list.get(i).setStatus("미처리");
				}else{
					list.get(i).setStatus("처리완료");
				}

			}
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			return "admin/question";
		}else{
			model.addAttribute("msg","문의 답변 발송 실패");
			return "common/errorPage";
		}
	}
	
	//블랙리스트 내역 조회
	@RequestMapping("selectBlacklist.ad")
	public String selectBlacklist(String searchParam, String searchWord, String fromDate, String toDate, PageInfo p, Model model){
		if(p.getCurrentPage() == 0){
			p.setCurrentPage(1);
		}

		ArrayList<Blacklist> list = null;
		PageInfo pi = null;
		int listCount = 0;
		
		//전체 리스트
		if(searchParam == null && searchWord == null){

			listCount = as.getBlacklistCount();
			pi = Pagination.getPageInfo(p.getCurrentPage(), listCount);		
			list = as.selectBlacklist(pi);

		//숙박일 검색
		}else if(searchParam.equals("datePick") || searchParam.equals("datePick2")){

			DatePick d = new DatePick();
			d.setFromDate(fromDate.replaceAll("-", ""));
			d.setToDate(toDate.replaceAll("-", ""));
			//등록일 검색
			if(searchParam.equals("datePick")){
				listCount = as.getSearchRDateBlacklistCount(d);
				pi = Pagination.getPageInfo(p.getCurrentPage(), listCount);
				list = as.selectSearchRDateBlacklist(d, pi);
			}else{ //해지일 검색
				listCount = as.getSearchTDateBlacklistCount(d);
				pi = Pagination.getPageInfo(p.getCurrentPage(), listCount);
				list = as.selectSearchTDateBlacklist(d, pi);
			}
			
		}else if(searchParam.equals("noT")){
			listCount = as.getnoTBlacklistCount();
			pi = Pagination.getPageInfo(p.getCurrentPage(), listCount);
			list = as.selectnoTBlacklist(pi);
		}else{
			
			Blacklist b = new Blacklist();
			b.setbRecordId(-99);
			//블랙리스트번호 검색
			if(searchParam.equals("bRecordId")){
				b.setbRecordId(Integer.parseInt(searchWord));
			//블랙리스트 대상 검색
			}else if(searchParam.equals("mId")){
				b.setmId(Integer.parseInt(searchWord));
			}
			
			listCount = as.getSearchWordBlacklistCount(b);
			pi = Pagination.getPageInfo(p.getCurrentPage(), listCount);
			list = as.selectSearchWordBlacklist(b, pi);
		}
		for(int i = 0; i < list.size(); i++){
			//구분
			if(list.get(i).getbType().equals("R")){
				list.get(i).setbTypeText("등록");
			}else{
				list.get(i).setbTypeText("해지");
			}
		}
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "admin/blacklist";
	}

	//업체신청 이력조회
	@RequestMapping("selectCompanyList.ad")
	public String selectCompanyList(String searchParam, String searchWord, String fromDate, String toDate, PageInfo p, Model model){
		if(p.getCurrentPage() == 0){
			p.setCurrentPage(1);
		}

		ArrayList<Approval> list = null;
		PageInfo pi = null;
		int listCount = 0;
		
		//전체 리스트
		if(searchParam == null && searchWord == null){

			listCount = as.getCompanyListCount();
			pi = Pagination.getPageInfo(p.getCurrentPage(), listCount);		
			list = as.selectCompanyList(pi);

		//신청일,승인일 검색
		}else if(searchParam.equals("datePick") || searchParam.equals("datePick2")){

			DatePick d = new DatePick();
			d.setFromDate(fromDate.replaceAll("-", ""));
			d.setToDate(toDate.replaceAll("-", ""));
			//등록일 검색
			if(searchParam.equals("datePick")){
				listCount = as.getSearchcrDateBlacklistCount(d);
				pi = Pagination.getPageInfo(p.getCurrentPage(), listCount);
				list = as.selectSearchcrDateBlacklist(d, pi);
			}else{ //해지일 검색
				listCount = as.getSearchapDateBlacklistCount(d);
				pi = Pagination.getPageInfo(p.getCurrentPage(), listCount);
				list = as.selectSearchapDateBlacklist(d, pi);
			}
			
		}else{
			Approval a = new Approval();
			a.setCrId(-99);
			//등록이력번호 검색
			if(searchParam.equals("crId")){
				a.setCrId(Integer.parseInt(searchWord));
			//업체명 검색
			}else if(searchParam.equals("cName")){
				a.setcName(searchWord);
		    //대표자명
			}else if(searchParam.equals("cPhone")){
				a.setcPhone(searchWord);
			}
			
			listCount = as.getSearchWordCompanyListCount(a);
			pi = Pagination.getPageInfo(p.getCurrentPage(), listCount);
			list = as.selectSearchWordCompanyList(a, pi);
		}
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "admin/approval";
	}

	//업체 디테일 조회
	@RequestMapping("selectOneCompany.ad")
	public String selectOneCompany(String cId, Model model){
		ArrayList<CompanyDetails> list = as.selectOneCompany(Integer.parseInt(cId));
		model.addAttribute("list", list);
		return "admin/companyDetails";
	}
	
	
	@RequestMapping("depositView.ad")
	public String depositView(){
		return "admin/deposit";
	}

	@RequestMapping("salesStatisticsView.ad")
	public String salesStatistics(){
		return "admin/salesStatistics";
	}

	@RequestMapping("companyStatisticsView.ad")
	public String companyStatistics(){
		return "admin/companyStatistics";
	}

	@RequestMapping("memberStatisticsView.ad")
	public String memberStatistics(){
		return "admin/memberStatistics";
	}

}
