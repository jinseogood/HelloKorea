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
import com.kh.hello.board.model.vo.Board;
import com.kh.hello.common.Attachment;
import com.kh.hello.member.model.vo.Member;

@Controller
public class BoardPageController {
	
	@Autowired
	private BoardService bs;
	
	@RequestMapping(value = "reviewWrite.bo")
	public String reviewWrite(Model model, HttpServletRequest request/*, @RequestParam("file") MultipartFile[] file*/){
		
		Board b = new Board();
		Member m = (Member)request.getSession().getAttribute("loginUser");
		b.setM_id(m.getmId());
		
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
    public Response handleFileUpload(@RequestParam("file") MultipartFile[] file, HttpServletRequest request) {

        List<String> result = new ArrayList<String>();
        FileUpload fileUpload = new FileUpload();
        for (int i = 0; i < file.length; i++) {
            result.add(fileUpload.process(file[i]));
        }

        Attachment a = new Attachment();
        a.setOriginName(fileUpload.originalName());
        a.setFilePath("D:/git/HelloKorea/src/main/webapp/resources/uploadFiles/"+fileUpload.changeName());
        a.setChangeName(fileUpload.changeName());
        a.setStatus("Y");
        a.setaLevel(0);
        Member m = (Member)request.getSession().getAttribute("loginUser");
        
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

        //선택삭제
        int result1 = bs.deleteAttachment(changeFileName);
        
        return new Response(result);
    }
	
	@RequestMapping(value="deleteAllUpload.bo")
	public String deleteAllUpload(HttpServletRequest request){
		Member m = (Member)request.getSession().getAttribute("loginUser");
		FileDeleteUpload fileDeleteUpload = new FileDeleteUpload();
		int result = 0;
		
		ArrayList<Attachment> at = null;
		at = bs.selectUpload(m.getmId());
		
		if(at != null){
			for(int i = 0 ; i < at.size() ; i++){
				fileDeleteUpload.process(at.get(i).getChangeName());
			}
			//취소시 일괄삭제
			result = bs.deleteAllUpload(m.getmId());
		}
		
		return "main/main";
	}
	
	@RequestMapping(value="insertReview.bo")
	public String insertReview(Model model, Board b, HttpServletRequest request){
		int result = 0;
		Member m = (Member)request.getSession().getAttribute("loginUser");
		b.setM_id(m.getmId());
		result = bs.updateBoard(b);
		
		return "main/main";
	}

	
	/*@RequestMapping(value="insertQA.bo")
	public String insertReview(Model model, HttpServletRequest request){
		int result = 0;
		//result = bs.insertQA();
		
		return "main/main";
	}*/

}
