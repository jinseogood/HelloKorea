package com.kh.hello.admin.controller;
     
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;

import com.kh.hello.admin.model.service.AdminSchedulerService;

@Controller
public class AdminSchedulerController {
	@Autowired
	private AdminSchedulerService ass;
	
	@Scheduled(cron="0 43 10 * * ?") 
	 public void terminateBlacklist(){
		ass.terminateBlacklist();
	    System.out.println("controller" +new Date());
	 }
}
