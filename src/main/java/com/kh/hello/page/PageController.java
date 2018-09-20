package com.kh.hello.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {
	@RequestMapping("mainView")
	public String mainView(){
		return "main/main";
	}
	
	@RequestMapping("aboutView")
	public String aboutView(){
		return "aboutArea/aboutAllArea";
	}
	
	@RequestMapping("toursView")
	public String toursView(){
		return "main/tours";
	}
	
	@RequestMapping("contactView")
	public String contactView(){
		return "main/contact";
	}
	
}
