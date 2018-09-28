package com.kh.hello.main.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainPageController {
	
	@RequestMapping(value="areaView.main")
	public String areaView(){
		return "aboutArea/aboutAllArea";
	}
	
	
	
	
	
	
	
	
	

}
