package com.kh.hello.board.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.hello.board.FileDeleteUpload;
import com.kh.hello.board.FileUpload;
import com.kh.hello.board.Response;
import com.kh.hello.board.model.service.BoardService;
import com.kh.hello.board.model.vo.Attachment;
import com.kh.hello.board.model.vo.Board;
import com.kh.hello.member.model.vo.Member;

@Controller
public class BoardPageController {
	
	@Autowired
	private BoardService bs;
	
	@RequestMapping(value = "reviewWrite.bo")
	public String reviewWrite(Model model, HttpServletRequest request/*, @RequestParam("file") MultipartFile[] file*/){
		
		Board b = new Board();
		
		int result = bs.insertBoard(b);
		
		return "board/reviewWrite";
	}
	
	@RequestMapping("reportWrite.bo")
	public String reportWrite(){
		return "common/reportWrite";
	}
	
	/*@RequestMapping("starTest.bo")
	public String starTest(){
		return "board/test";
	}*/
	
	@RequestMapping(value="/upload.bo", method=RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public Response handleFileUpload(@RequestParam("file") MultipartFile[] file) {

        List<String> result = new ArrayList<String>();
        FileUpload fileUpload = new FileUpload();
        for (int i = 0; i < file.length; i++) {
            result.add(fileUpload.process(file[i]));
        }

        Attachment a = new Attachment();
        a.setOrigin_name(fileUpload.originalName());
        a.setFile_path("D:/git/HelloKorea/src/main/webapp/resources/uploadFiles/"+fileUpload.changeName());
        a.setChange_name(fileUpload.changeName());
        a.setStatus("Y");
        a.setA_level("리뷰");
        
        int result1 = bs.insertAttachment(a);
        
        return new Response(result);	
        
        
    }
	
	@RequestMapping(value="/deleteUpload.bo")
    @ResponseBody
    public Response handleFileDeleteUpload(HttpServletRequest request) {
		String changeFileName = request.getParameter("response1");
		Member m = (Member)request.getSession().getAttribute("loginUser");
		
        List<String> result = new ArrayList<String>();
        FileDeleteUpload fileDeleteUpload = new FileDeleteUpload();
        result.add(fileDeleteUpload.process(changeFileName));

        int result1 = bs.deleteAttachment(m.getmId());
        
        return new Response(result);
    }

}
