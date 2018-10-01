package com.kh.hello.seller.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;

import org.apache.cxf.helpers.IOUtils;
import org.apache.cxf.io.CachedOutputStream;
import org.aspectj.weaver.GeneratedReferenceTypeDelegate;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import net.sf.json.JSONObject;

@Controller
public class CompanySearchController {
	@RequestMapping(value="searchCompany.sell")
	public void searchCompany(@RequestParam String area, @RequestParam String sigungu, @RequestParam String page, HttpServletResponse response){
        response.setContentType("text/html; charset=utf-8");
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchStay?ServiceKey=";
        String serviceKey = "VOojT%2FUVcidkM%2BUIsxUGc2mInFoFPlSOBUvkCvCqGLi1x7x3MYlKptGiWXnsFP6xPfgI9chYJ6MNNFvtIdZBXg%3D%3D";
        String parameter = "";
        //serviceKey = URLEncoder.encode(serviceKey,"utf-8");
        parameter = parameter + "&" + "arrange=A";
        parameter = parameter + "&" + "areaCode=" + area;
        parameter = parameter + "&" + "sigunguCode=" + sigungu;
        parameter = parameter + "&" + "pageNo=" + page + "&numOfRows=8";
        parameter = parameter + "&" + "MobileOS=ETC";
        parameter = parameter + "&" + "MobileApp=HelloKorea";
        parameter = parameter + "&" + "_type=json";
         
        addr = addr + serviceKey + parameter;
		
		try {
			
			URL url = new URL(addr);
	         
	        InputStream in = url.openStream(); 
	        CachedOutputStream bos = new CachedOutputStream();
	        IOUtils.copy(in, bos);
	        in.close();
	        bos.close();
	        
	        String data = bos.getOut().toString();
	         
	        PrintWriter out = response.getWriter();
	        out.println(data);
	        
	        JSONObject json = new JSONObject();
	        json.put("data", data);
	        
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
