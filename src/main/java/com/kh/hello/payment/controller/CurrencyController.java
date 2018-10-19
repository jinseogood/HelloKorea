package com.kh.hello.payment.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.cxf.helpers.IOUtils;
import org.apache.cxf.io.CachedOutputStream;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import net.sf.json.JSONObject;

@Controller
@SessionAttributes("cur")
public class CurrencyController {
	
	@RequestMapping(value="currencyCheck.pay")
	public void currencyCheck(String cur, HttpServletResponse response){
		System.out.println("cur : " + cur);
		response.setContentType("text/html; charset=utf-8");
		
		String addr = "https://www.koreaexim.go.kr/site/program/financial/exchangeJSON?authkey=";
        String serviceKey = "forZLoVVwIvqXCL19weyohSBqll9az59";
        String parameter = "";
        parameter = parameter + "&" + "data=AP01";
         
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
	
	@RequestMapping(value="currencySetting.pay")
	public void currencySetting(String sCur, Model model, HttpServletRequest request, HttpServletResponse response){
		int result=0;
		
		if(sCur != null){
			
			model.addAttribute("cur", sCur);
			
			result=1;
		}
		else{
			result=0;
		}
		
		try {
			PrintWriter out=response.getWriter();
			
			out.print(result);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}