package com.kh.hello.subPage;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.hello.board.model.service.BoardService;
import com.kh.hello.board.model.vo.Board;
import com.kh.hello.common.PageInfo;
import com.kh.hello.common.Pagination2;



@Controller
public class SubPageController {
	
	@Autowired
	private BoardService bs;
	
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
	public String detailHotelView(Model model, PageInfo p){

		ArrayList<Board> list = null;
		
		if(p.getCurrentPage() == 0){
			p.setCurrentPage(1);
		}
		
		PageInfo pi = null;

		int listCount = bs.selectReviewCount();
		pi = Pagination2.getPageInfo(p.getCurrentPage(), listCount);
		list= bs.selectReview(pi);
		
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		System.out.println(list);
		System.out.println(pi);
		
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
