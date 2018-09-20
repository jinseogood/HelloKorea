package com.kh.hello.subPage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SubPageController {
	
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
	
	@RequestMapping("detailHotel")
	public String detailHotelView(){
		return "aboutDetail/detailHotel";
	}
	
	@RequestMapping("detailFood")
	public String detailFoodView(){
		return "aboutDetail/detailFood";
	}
	
	@RequestMapping("detailGame")
	public String detailGameView(){
		return "aboutDetail/detailGame";
	}
	
	@RequestMapping("themeMain")
	public String themeMainView(){
		return "themeTour/themeTourMain";
	}
	
	@RequestMapping("themeDetail")
	public String themeDetailView(){
		return "themeTour/themeTourDetail";
	}
	
	

}
