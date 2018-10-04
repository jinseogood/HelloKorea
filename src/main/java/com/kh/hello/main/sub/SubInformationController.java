package com.kh.hello.main.sub;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.cxf.io.CachedOutputStream;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import net.sf.json.JSONObject;

@Controller
public class SubInformationController {
	
	@RequestMapping(value="searchAreaHotel.sub")
	public void searchAreaHotel(HttpServletRequest request, HttpServletResponse response, @RequestParam int areaCode, @RequestParam int sigunguCode) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		System.out.println("subInfo_areaCode : " + areaCode);
		System.out.println("subInfo_sigunguCode : " + sigunguCode);
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchStay?ServiceKey=";
		String serviceKey = "gjHNkA6CuLpGqjZjThqF2cAG485WmBKdnpGonBzSFk0L7qAnKuRm87jwXCq6%2BGv3WI2VRkHcp9Rzbiba1tjddQ%3D%3D";
		String parameter = "";
		
		PrintWriter out = response.getWriter();
		parameter = parameter + "&" + "areaCode="+areaCode;
		parameter = parameter + "&" + "sigunguCode="+sigunguCode;
		parameter = parameter + "&" + "listYN=Y";
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
		parameter = parameter + "&" + "arrange=A";
		parameter = parameter + "&" + "numOfRows=12";
		parameter = parameter + "&" + "pageNo=1";
		parameter = parameter + "&" + "_type=json";
		
		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);
		
		InputStream in = url.openStream();
		CachedOutputStream bos = new CachedOutputStream();
		IOUtils.copy(in, bos);
		in.close();
		bos.close();
		
		String data = bos.getOut().toString();
		out.println(data);
		
		JSONObject json = new JSONObject();
		json.put("data", data);
		
	}
	
	
	@RequestMapping(value="aboutMainSeoulHotel.sub")
	public void aboutMainSeoul(HttpServletRequest request, HttpServletResponse response, @RequestParam int areaCode, @RequestParam int sigunguCode) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchStay?ServiceKey=";
		String serviceKey = "gjHNkA6CuLpGqjZjThqF2cAG485WmBKdnpGonBzSFk0L7qAnKuRm87jwXCq6%2BGv3WI2VRkHcp9Rzbiba1tjddQ%3D%3D";
		String parameter = "";
		
		PrintWriter out = response.getWriter();
		parameter = parameter + "&" + "areaCode="+areaCode;
		parameter = parameter + "&" + "sigunguCode="+sigunguCode;
		parameter = parameter + "&" + "listYN=Y";
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
		parameter = parameter + "&" + "arrange=A";
		parameter = parameter + "&" + "numOfRows=12";
		parameter = parameter + "&" + "pageNo=1";
		parameter = parameter + "&" + "_type=json";
		
		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);
		
		InputStream in = url.openStream();
		CachedOutputStream bos = new CachedOutputStream();
		IOUtils.copy(in, bos);
		in.close();
		bos.close();
		
		String data = bos.getOut().toString();
		out.println(data);
		
		JSONObject json = new JSONObject();
		json.put("data", data);
		
	}
	
	
	@RequestMapping(value="aboutMainSeoulFood.sub")
	public void aboutMainSeoulFood(HttpServletRequest request, HttpServletResponse response, @RequestParam int areaCode) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=";
		String serviceKey = "gjHNkA6CuLpGqjZjThqF2cAG485WmBKdnpGonBzSFk0L7qAnKuRm87jwXCq6%2BGv3WI2VRkHcp9Rzbiba1tjddQ%3D%3D";
		String parameter = "";
		
		PrintWriter out = response.getWriter();
		parameter = parameter + "&" + "contentTypeId=39";
		parameter = parameter + "&" + "areaCode="+areaCode;
		parameter = parameter + "&" + "cat1=A05";
		parameter = parameter + "&" + "cat=A0502&cat3=";
		parameter = parameter + "&" + "listYN=Y";
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
		parameter = parameter + "&" + "arrange=A";
		parameter = parameter + "&" + "numOfRows=12";
		parameter = parameter + "&" + "pageNo=1";
		parameter = parameter + "&" + "_type=json";
		
		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);
		
		InputStream in = url.openStream();
		CachedOutputStream bos = new CachedOutputStream();
		IOUtils.copy(in, bos);
		in.close();
		bos.close();
		
		String data = bos.getOut().toString();
		out.println(data);
		
		JSONObject json = new JSONObject();
		json.put("data", data);
	}
	
	
	@RequestMapping(value="aboutMainSeoulGame.sub")
	public void aboutMainSeoulGame(HttpServletRequest request, HttpServletResponse response, @RequestParam int areaCode) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=";
		String serviceKey = "gjHNkA6CuLpGqjZjThqF2cAG485WmBKdnpGonBzSFk0L7qAnKuRm87jwXCq6%2BGv3WI2VRkHcp9Rzbiba1tjddQ%3D%3D";
		String parameter = "";
		
		PrintWriter out = response.getWriter();
		parameter = parameter + "&" + "contentTypeId=12";
		parameter = parameter + "&" + "areaCode="+areaCode;
		parameter = parameter + "&" + "sigunguCode=";
		parameter = parameter + "&" + "cat1=A02";
		parameter = parameter + "&" + "cat=A0205&cat3=";
		parameter = parameter + "&" + "listYN=Y";
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
		parameter = parameter + "&" + "arrange=A";
		parameter = parameter + "&" + "numOfRows=12";
		parameter = parameter + "&" + "pageNo=1";
		parameter = parameter + "&" + "_type=json";
		
		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);
		
		InputStream in = url.openStream();
		CachedOutputStream bos = new CachedOutputStream();
		IOUtils.copy(in, bos);
		in.close();
		bos.close();
		
		String data = bos.getOut().toString();
		out.println(data);
		
		JSONObject json = new JSONObject();
		json.put("data", data);
	}
	
	
	@RequestMapping(value="detailHotelInformation.sub")
	public void detailHotelInformation(HttpServletRequest request, HttpServletResponse response, @RequestParam int contenttypeid, @RequestParam int contentid) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=";
		String serviceKey = "gjHNkA6CuLpGqjZjThqF2cAG485WmBKdnpGonBzSFk0L7qAnKuRm87jwXCq6%2BGv3WI2VRkHcp9Rzbiba1tjddQ%3D%3D";
		String parameter = "";
		
		PrintWriter out = response.getWriter();
		parameter = parameter + "&" + "contentTypeId="+contenttypeid;
		parameter = parameter + "&" + "contentId="+contentid;
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
		parameter = parameter + "&" + "defaultYN=Y";
		parameter = parameter + "&" + "firstImageYN=Y";
		parameter = parameter + "&" + "areaCodeYN=Y";
		parameter = parameter + "&" + "catcodeYN=Y";
		parameter = parameter + "&" + "addrinfoYN=Y";
		parameter = parameter + "&" + "mapinfoYN=Y";
		parameter = parameter + "&" + "overviewYN=Y";
		parameter = parameter + "&" + "transGuideYN=Y";
		parameter = parameter + "&" + "_type=json";
		
		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);
		
		InputStream in = url.openStream();
		CachedOutputStream bos = new CachedOutputStream();
		IOUtils.copy(in, bos);
		in.close();
		bos.close();
		
		String data = bos.getOut().toString();
		out.println(data);
		
		JSONObject json = new JSONObject();
		json.put("data", data);
	}
	
	
	@RequestMapping(value="detailHotelImage.sub")
	public void detailHotelImage(HttpServletRequest request, HttpServletResponse response, @RequestParam int contenttypeid, @RequestParam int contentid) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailImage?ServiceKey=";
		String serviceKey = "gjHNkA6CuLpGqjZjThqF2cAG485WmBKdnpGonBzSFk0L7qAnKuRm87jwXCq6%2BGv3WI2VRkHcp9Rzbiba1tjddQ%3D%3D";
		String parameter = "";
		
		PrintWriter out = response.getWriter();
		parameter = parameter + "&" + "contentTypeId="+contenttypeid;
		parameter = parameter + "&" + "contentId="+contentid;
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
		parameter = parameter + "&" + "imageYN=Y";
		parameter = parameter + "&" + "_type=json";
		
		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);
		
		InputStream in = url.openStream();
		CachedOutputStream bos = new CachedOutputStream();
		IOUtils.copy(in, bos);
		in.close();
		bos.close();
		
		String data = bos.getOut().toString();
		out.println(data);
		
		JSONObject json = new JSONObject();
		json.put("data", data);
	}
	
	
	@RequestMapping(value="detailHotelIntro.sub")
	public void detailHotelIntro(HttpServletRequest request, HttpServletResponse response, @RequestParam int contenttypeid, @RequestParam int contentid) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro?ServiceKey=";
		String serviceKey = "gjHNkA6CuLpGqjZjThqF2cAG485WmBKdnpGonBzSFk0L7qAnKuRm87jwXCq6%2BGv3WI2VRkHcp9Rzbiba1tjddQ%3D%3D";
		String parameter = "";
		
		PrintWriter out = response.getWriter();
		parameter = parameter + "&" + "contentTypeId="+contenttypeid;
		parameter = parameter + "&" + "contentId="+contentid;
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
		parameter = parameter + "&" + "introYN=Y";
		parameter = parameter + "&" + "_type=json";
		
		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);
		
		InputStream in = url.openStream();
		CachedOutputStream bos = new CachedOutputStream();
		IOUtils.copy(in, bos);
		in.close();
		bos.close();
		
		String data = bos.getOut().toString();
		out.println(data);
		
		JSONObject json = new JSONObject();
		json.put("data", data);
	}
	
	
	@RequestMapping(value="detailRoomInfo.sub")
	public void detailRoomInfo(HttpServletRequest request, HttpServletResponse response, @RequestParam int contenttypeid, @RequestParam int contentid) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailInfo?ServiceKey=";
		String serviceKey = "gjHNkA6CuLpGqjZjThqF2cAG485WmBKdnpGonBzSFk0L7qAnKuRm87jwXCq6%2BGv3WI2VRkHcp9Rzbiba1tjddQ%3D%3D";
		String parameter = "";
		
		PrintWriter out = response.getWriter();
		parameter = parameter + "&" + "contentTypeId="+contenttypeid;
		parameter = parameter + "&" + "contentId="+contentid;
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
		parameter = parameter + "&" + "listYN=Y";
		parameter = parameter + "&" + "_type=json";
		
		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);
		
		InputStream in = url.openStream();
		CachedOutputStream bos = new CachedOutputStream();
		IOUtils.copy(in, bos);
		in.close();
		bos.close();
		
		String data = bos.getOut().toString();
		out.println(data);
		
		JSONObject json = new JSONObject();
		json.put("data", data);
	}
	
	
	
	
	
	
	

}
