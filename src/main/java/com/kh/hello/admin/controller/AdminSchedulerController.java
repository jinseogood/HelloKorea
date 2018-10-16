package com.kh.hello.admin.controller;
     
import java.util.Date;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;

import com.kh.hello.admin.model.service.AdminSchedulerService;

@Controller
public class AdminSchedulerController {
	
	@Scheduled(cron="30 05 15 * * ?") 
	 public void terminateBlacklist(){
		AdminSchedulerService ass = new AdminSchedulerService();
		int result = ass.terminateBlacklist();
	    System.out.println("controller" +new Date());
	 }
}
