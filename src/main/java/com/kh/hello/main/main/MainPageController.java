package com.kh.hello.main.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainPageController {
	
	@RequestMapping(value="areaView.main")
	public String areaView(@RequestParam int areaCode){
		return "aboutArea/aboutAllArea";
	}
	
	
	
	
	
	
	
	
	

}
