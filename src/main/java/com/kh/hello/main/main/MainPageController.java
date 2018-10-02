package com.kh.hello.main.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainPageController {
	
	@RequestMapping(value="areaHotelView.main")
	public String areaView(@RequestParam int areaCode, @RequestParam int sigunguCode, @RequestParam int pageNo){
		return "aboutArea/searchAreaHotel";
	}
	
	@RequestMapping(value="areaAllView.main")
	public String areaAllView(@RequestParam int areaCode){
		System.out.println(areaCode);
		return "aboutArea/aboutAllArea";
	}
	
	
	
	
	
	
	
	

}
