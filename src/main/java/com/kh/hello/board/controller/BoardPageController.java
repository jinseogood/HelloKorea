package com.kh.hello.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardPageController {
	@RequestMapping("reviewWrite")
	public String reviewWrite(){
		return "board/reviewWrite";
	}
	
	@RequestMapping("reportWrite")
	public String reportWrite(){
		return "common/reportWrite";
	}
}
