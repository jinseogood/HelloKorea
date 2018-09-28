package com.kh.hello.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.hello.admin.model.service.AdminService;
import com.kh.hello.admin.model.vo.DatePick;
import com.kh.hello.admin.model.vo.PageInfo;
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
	public String reservationView(String searchParam, String searchWord, String fromDate, String toDate, PageInfo p, Model model){

		if(p.getCurrentPage() == 0){
			p.setCurrentPage(1);
		}

		//전체 리스트
		if(searchParam == null && searchWord == null){

			int listCount = as.getReservationListCount();
			PageInfo pi = Pagination.getPageInfo(p.getCurrentPage(), listCount);		
			ArrayList<Reservation> list = as.reservationList(pi);
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			return "admin/reservation";

		//숙박일 검색
		}else if(searchParam.equals("datepick")){

			DatePick d = new DatePick();
			d.setFromDate(fromDate);
			d.setToDate(toDate);
			int listCount = as.getSearchDateReservationListCount(d);
			PageInfo pi = Pagination.getPageInfo(p.getCurrentPage(), listCount);
			ArrayList<Reservation> list = as.searchDateReservationList(d, pi);
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			return "admin/reservation";
			
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
			PageInfo pi = Pagination.getPageInfo(p.getCurrentPage(), listCount);
			ArrayList<Reservation> list = as.searchReservationList(r, pi);
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			return "admin/reservation";
		}
	}

	@RequestMapping("reportView.ad")
	public String reportView(){
		return "admin/report";
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
