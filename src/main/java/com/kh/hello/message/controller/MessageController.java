package com.kh.hello.message.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.hello.common.PageInfo;
import com.kh.hello.common.Pagination;
import com.kh.hello.message.model.service.MessageService;
import com.kh.hello.message.model.vo.Message;
@Controller
public class MessageController {
	@Autowired
	MessageService ms;
	
	//받은 메세지함
	@RequestMapping("receiveMessageView")
	public String receiveMessageView(String mId, PageInfo p, Model model){
		if(p.getCurrentPage() == 0){
			p.setCurrentPage(1);
		}
		int listCount = ms.getReceiveMessageCount(mId);
		PageInfo pi = Pagination.getPageInfo(p.getCurrentPage(), listCount);		
		ArrayList<Message> list = ms.selectReceiveMessage(mId, pi); 
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "message/receiveMessage";
	}
	
	//받은 메세지 디테일
	@RequestMapping("receiveDetailView")
	public String receiveDetailView(String msgId, String pDate, Model model){
		if(pDate.equals("미처리")||pDate.equals("읽지 않음")){
			int result = ms.updateMessageReadDate(msgId);
			
			if(result > 0){
				Message m = ms.selectReceiveMessageDetail(msgId);
				model.addAttribute("m", m);
				return "message/receiveDetail";
			}else{
				model.addAttribute("msg","메세지 상세 페이지 실패");
				return "common/errorPage";
			}
		}
		Message m = ms.selectReceiveMessageDetail(msgId);
		model.addAttribute("m", m);
		return "message/receiveDetail";
	}
	
	//메세지 삭제
	@RequestMapping("deleteMessage")
	public String deleteMessage(String msgId, String mId, Model model){
		int result = ms.updateMessageStatus(msgId);
		if(result > 0){
			
			int listCount = ms.getReceiveMessageCount(mId);
			PageInfo pi = Pagination.getPageInfo(1, listCount);		
			ArrayList<Message> list = ms.selectReceiveMessage(mId, pi); 
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			return "message/receiveMessage";
		}else{
			model.addAttribute("msg","메세지 삭제 실패");
			return "common/errorPage";
		}
		
	}
	
	//답장 화면
	@RequestMapping("sendView")
	public String sendView(String receiveId, String nickname, String mId, Model model){
		model.addAttribute("mId", mId);
		model.addAttribute("receiveId", receiveId);
		model.addAttribute("nickname", nickname);
		return "message/send";
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
	
}
