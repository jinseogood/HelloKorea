package com.kh.hello.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardPageController {
	@RequestMapping("reviewWrite.bo")
	public String reviewWrite(){
		return "board/reviewWrite";
	}
	
	@RequestMapping("reportWrite.bo")
	public String reportWrite(){
		return "common/reportWrite";
	}
	
	@RequestMapping("starTest.bo")
	public String starTest(){
		return "board/test";
	}
}
