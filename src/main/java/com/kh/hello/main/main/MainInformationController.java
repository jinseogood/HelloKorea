package com.kh.hello.main.main;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.cxf.io.CachedOutputStream;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class MainInformationController {
	
	@RequestMapping("mainHotel1.in")
	public void mainHotelInfo(HttpServletRequest request, HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=";
		String serviceKey = "gjHNkA6CuLpGqjZjThqF2cAG485WmBKdnpGonBzSFk0L7qAnKuRm87jwXCq6%2BGv3WI2VRkHcp9Rzbiba1tjddQ%3D%3D";
		String parameter="";
		
		PrintWriter out = response.getWriter();
		parameter = parameter + "&" + "contentTypeId=32";
		parameter = parameter + "&" + "contentId=143033";
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
		parameter = parameter + "&" + "defaultYN=Y";
		parameter = parameter + "&" + "firstImageYN=Y";
		parameter = parameter + "&" + "areacodeYN=Y";
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
	
	
	@RequestMapping("mainHotel2.in")
	public void mainHotelInfo2(HttpServletRequest request, HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=";
		String serviceKey = "gjHNkA6CuLpGqjZjThqF2cAG485WmBKdnpGonBzSFk0L7qAnKuRm87jwXCq6%2BGv3WI2VRkHcp9Rzbiba1tjddQ%3D%3D";
		String parameter="";
		
		PrintWriter out = response.getWriter();
		parameter = parameter + "&" + "contentTypeId=32";
		parameter = parameter + "&" + "contentId=142790";
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
		parameter = parameter + "&" + "defaultYN=Y";
		parameter = parameter + "&" + "firstImageYN=Y";
		parameter = parameter + "&" + "areacodeYN=Y";
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
	
	
	@RequestMapping("mainHotel3.in")
	public void mainHotelInfo3(HttpServletRequest request, HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=";
		String serviceKey = "gjHNkA6CuLpGqjZjThqF2cAG485WmBKdnpGonBzSFk0L7qAnKuRm87jwXCq6%2BGv3WI2VRkHcp9Rzbiba1tjddQ%3D%3D";
		String parameter="";
		
		PrintWriter out = response.getWriter();
		parameter = parameter + "&" + "contentTypeId=32";
		parameter = parameter + "&" + "contentId=142750";
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
		parameter = parameter + "&" + "defaultYN=Y";
		parameter = parameter + "&" + "firstImageYN=Y";
		parameter = parameter + "&" + "areacodeYN=Y";
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
	
	
	@RequestMapping("mainThemeShopping.tm")
	public void mainThemeShopping(HttpServletRequest request, HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=";
		String serviceKey = "gjHNkA6CuLpGqjZjThqF2cAG485WmBKdnpGonBzSFk0L7qAnKuRm87jwXCq6%2BGv3WI2VRkHcp9Rzbiba1tjddQ%3D%3D";
		String parameter="";
		
		PrintWriter out = response.getWriter();
		parameter = parameter + "&" + "contentTypeId=38";
		parameter = parameter + "&" + "contentId=132593";
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
		parameter = parameter + "&" + "defaultYN=Y";
		parameter = parameter + "&" + "firstImageYN=Y";
		parameter = parameter + "&" + "areacodeYN=Y";
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
	
	@RequestMapping("mainThemeShopping2.tm")
	public void mainThemeShopping2(HttpServletRequest request, HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=";
		String serviceKey = "gjHNkA6CuLpGqjZjThqF2cAG485WmBKdnpGonBzSFk0L7qAnKuRm87jwXCq6%2BGv3WI2VRkHcp9Rzbiba1tjddQ%3D%3D";
		String parameter="";
		
		PrintWriter out = response.getWriter();
		parameter = parameter + "&" + "contentTypeId=38";
		parameter = parameter + "&" + "contentId=132248";
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
		parameter = parameter + "&" + "defaultYN=Y";
		parameter = parameter + "&" + "firstImageYN=Y";
		parameter = parameter + "&" + "areacodeYN=Y";
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
	
	@RequestMapping("mainThemeShopping3.tm")
	public void mainThemeShopping3(HttpServletRequest request, HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=";
		String serviceKey = "gjHNkA6CuLpGqjZjThqF2cAG485WmBKdnpGonBzSFk0L7qAnKuRm87jwXCq6%2BGv3WI2VRkHcp9Rzbiba1tjddQ%3D%3D";
		String parameter="";
		
		PrintWriter out = response.getWriter();
		parameter = parameter + "&" + "contentTypeId=38";
		parameter = parameter + "&" + "contentId=2017158";
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
		parameter = parameter + "&" + "defaultYN=Y";
		parameter = parameter + "&" + "firstImageYN=Y";
		parameter = parameter + "&" + "areacodeYN=Y";
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
	
	@RequestMapping("mainThemeShopping4.tm")
	public void mainThemeShopping4(HttpServletRequest request, HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=";
		String serviceKey = "gjHNkA6CuLpGqjZjThqF2cAG485WmBKdnpGonBzSFk0L7qAnKuRm87jwXCq6%2BGv3WI2VRkHcp9Rzbiba1tjddQ%3D%3D";
		String parameter="";
		
		PrintWriter out = response.getWriter();
		parameter = parameter + "&" + "contentTypeId=38";
		parameter = parameter + "&" + "contentId=2359162";
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
		parameter = parameter + "&" + "defaultYN=Y";
		parameter = parameter + "&" + "firstImageYN=Y";
		parameter = parameter + "&" + "areacodeYN=Y";
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
	
	
	
	
	
	

}
