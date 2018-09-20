package com.kh.hello.message.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class MessageController {
	@RequestMapping("recieveMessageView")
	public String recieveMessageView(){
		return "message/recieveMessage";
	}
	
	@RequestMapping("recieveDetailView")
	public String recieveDetailView(){
		return "message/recieveDetail";
	}
	
	@RequestMapping("sendMessageView")
	public String sendMessageView(){
		return "message/sendMessage";
	}
	
	@RequestMapping("sendDetailView")
	public String sendDatailView(){
		return "message/sendDetail";
	}
	
	@RequestMapping("sendQuestionView")
	public String sendQuestionView(){
		return "message/sendQuestion";
	}
	
	@RequestMapping("sendView")
	public String sendView(){
		return "message/send";
	}
}
