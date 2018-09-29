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
import com.kh.hello.admin.model.vo.DatePick;
import com.kh.hello.admin.model.vo.PageInfo;
import com.kh.hello.admin.model.vo.Report;
import com.kh.hello.admin.model.vo.Reservation;
import com.kh.hello.common.Pagination;
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
			d.setFromDate(fromDate);
			d.setToDate(toDate);
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
			
			int listCount = as.getSearchReservationListCount(r);
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
			d.setFromDate(fromDate);
			d.setToDate(toDate);
			int listCount = as.getSearchDateReportListCount(d);
			pi = Pagination.getPageInfo(p.getCurrentPage(), listCount);
			list = as.selectSearchDateReportList(d, pi);
			
		}else{
			Report r = new Report();
			r.setrRecordId(-99);
			//신고번호 검색
			if(searchParam.equals("rRecordId")){
				r.setrRecordId(Integer.parseInt(searchWord));
			//신고 대상 검색	
			}else if(searchParam.equals("rTarget")){
				r.setrTarget(Integer.parseInt(searchWord));
			//미처리건 검색은 mapper에서
			}else{
				System.out.println("미처리 건 검색");
			}
			int listCount = as.getSearchReportListCount(r);
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

			Format formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			
			hmap.put("rRecordId" + i, list.get(i).getrRecordId());
			hmap.put("mId" + i, list.get(i).getmId());
			hmap.put("rDate" + i, formatter.format(list.get(i).getrDate()));
			hmap.put("reason" + i, list.get(i).getReason());
			
		}
		hmap.put("rTarget", list.get(0).getrTarget());
		hmap.put("rContent", list.get(0).getrContent());
		return hmap;
		
	}
	
	@RequestMapping("questionView.ad")
	public String questionView(){
		return "admin/question";
	}

	@RequestMapping("blacklistView.ad")
	public String blacklistView(){
		return "admin/blacklist";
	}

	@RequestMapping("approvalView.ad")
	public String approvalView(){
		return "admin/approval";
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
