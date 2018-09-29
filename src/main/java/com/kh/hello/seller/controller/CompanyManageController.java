package com.kh.hello.seller.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.hello.seller.model.vo.Company;

@Controller
public class CompanyManageController {
	@RequestMapping(value="insert.com")
	public String addCompany(Company com, Model model, @RequestParam(name="companyFile", required=false)MultipartFile comFile, @RequestParam(name="personalFile", required=false)MultipartFile perFile){
		
		System.out.println("Company : " + com);
		
		System.out.println("contentId : " + com.getContentId());
		
		
		return "seller/sellerMain";
	}
}
