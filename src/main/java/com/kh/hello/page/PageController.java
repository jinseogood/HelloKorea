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
	
	@RequestMapping("aboutAreaHotel")
	public String aboutAreaHotel(){
		return "aboutArea/searchAreaHotel";
	}
	
	@RequestMapping("aboutAreaFood")
	public String aboutAreaFood(){
		return "aboutArea/searchAreaFood";
	}
	
	@RequestMapping("aboutAreaGame")
	public String aboutAreaGame(){
		return "aboutArea/searchAreaGame";
	}
	
	@RequestMapping("deatilHotel")
	public String detailHotelView(){
		return "aboutDetail/detailHotel";
	}
}
