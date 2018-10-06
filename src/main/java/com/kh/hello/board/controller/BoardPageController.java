package com.kh.hello.board.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hello.board.FileDeleteUpload;
import com.kh.hello.board.FileUpload;
import com.kh.hello.board.Response;
import com.kh.hello.board.model.service.BoardService;
import com.kh.hello.board.model.vo.Board;
import com.kh.hello.common.Attachment;
import com.kh.hello.common.PageInfo;
import com.kh.hello.common.Pagination2;
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
	
	@RequestMapping(value="reviewPaging.bo", produces = "application/json; charset=utf8")
	public ModelAndView reviewPaging(/*Model model, */HttpServletResponse response, @RequestParam int page, ModelAndView mv){
		//ModelAndView mv = new ModelAndView();
		response.setContentType("text/html; charset=UTF-8");
		ArrayList<Board> list = null;
		PageInfo pi = null;
		//DateFormat df = new SimpleDateFormat("yyyy년 MM월 dd일");
		
		int listCount = bs.selectReviewCount();
		pi = Pagination2.getPageInfo(page, listCount);
		list = bs.selectReview(pi);
		
		/*for(int i = 0 ; i < list.size() ; i++){
			String tempDate = df.format(list.get(i).getRegist_date());
			list.get(i).setRegist_date(tempDate);
			System.out.println(list.get(i).getRegist_date());
		}*/
		
		mv.addObject("list", list);
		mv.addObject("pi", pi);
		mv.setViewName("jsonView");

		/*System.out.println(list);
		PrintWriter out;
		try {
			out = response.getWriter();
			
			out.println(list);
			out.println(pi);
			
			JSONArray ja = new JSONArray();
			JSONObject json1 = new JSONObject();
			JSONObject json2 = new JSONObject();
			for(Board review : list){
				json1=new JSONObject();
				
				json1.put("bid", review.getBid());
				json1.put("title", URLEncoder.encode(review.getTitle(), "UTF-8"));
				json1.put("text", URLEncoder.encode(review.getText(), "UTF-8"));
				json1.put("board_type", review.getBoard_type());
				json1.put("regist_date", review.getRegist_date());
				json1.put("status", URLEncoder.encode(review.getStatus(), "UTF-8"));
				json1.put("modify_date", review.getModify_date());
				json1.put("grade", review.getGrade());
				json1.put("likey", review.getLikey());
				json1.put("m_id", review.getM_id());
				
				
				ja.add(json1);
			}
			
			json2.put("currentPage", pi.getCurrentPage());
			json2.put("listCount", pi.getListCount());
			json2.put("limit", pi.getLimit());
			json2.put("maxPage", pi.getMaxPage());
			json2.put("startPage", pi.getStartPage());
			json2.put("endPage", pi.getEndPage());
			
			ja.add(json2);
			
			out.print(ja);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		return mv;
	}

	
	/*@RequestMapping(value="insertQA.bo")
	public String insertReview(Model model, HttpServletRequest request){
		int result = 0;
		//result = bs.insertQA();
		
		return "main/main";
	}*/

}
