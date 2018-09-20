package com.kh.hello.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardPageController {
	@RequestMapping("helpView")
	public String helpView(){
		return "help/helpPage";
	}
	
	@RequestMapping("helpDetailView")
	public String helpDetailView(){
		return "help/helpDetailPage";
	}
	
	@RequestMapping("reviewWrite")
	public String reviewWrite(){
		return "board/reviewWrite";
	}
	
	@RequestMapping("reportWrite")
	public String reportWrite(){
		return "common/reportWrite";
	}
}
