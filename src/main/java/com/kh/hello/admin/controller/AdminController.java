package com.kh.hello.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class AdminController {
	
	//관리자 마이페이지	
		@RequestMapping("myPageView.ad")
		public String myPageView(){
			return "admin/adminMain";
		}
		
		@RequestMapping("reservationView.ad")
		public String reservationView(){
			return "admin/reservation";
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
