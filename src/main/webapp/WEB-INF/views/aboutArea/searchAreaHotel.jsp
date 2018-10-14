<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Hello Korea</title>
<style>
	#more{margin-top:5%;}
	#detailClick:hover{cursor:pointer}
	.hotelSearchText{font-size:20px;}
	#detailHover{max-width:750px; height:225px;}
	#detailInfo-1{max-width:500px;}
	#tm-home-box-2-link-1{width:50px;}
	#tm-home-box-2-link-2{width:445px; display:inline-block;}
	#dibsBtn{padding:20px; width:55px; height:60px;}
	#infoTextArea{height:175px; padding:10px 20px 44px; overflow:auto; text-align:left; }
	.img-responsive1{width:250px; height:225px;}
	.oderByClass{cursor:pointer;}
</style>
</head>
<body>
	<!-- 지역의 호텔검색 Page. -->
	<jsp:include page="../common/searchMenubar.jsp"/>
	<jsp:include page="../common/searchSubmenubar.jsp"/>
	
	
	<section class="container tm-home-section-1" id="more">
		<div class="container">
			<div class="row">
				<div class="tm-section-header section-margin-top">
					<div class="col-lg-3 col-md-3 col-sm-3"><hr></div>
					<div class="col-lg-6 col-md-6 col-sm-6"><h2 class="tm-section-title tm-section-title1">서울 호텔</h2></div>
					<div class="col-lg-3 col-md-3 col-sm-3"><hr></div>	
				</div>
					<div class="col-lg-3 col-md-3 col-sm-3">
						<span class="tm-section-title" style="font-size:25px;"><b>호텔검색</b></span>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6"></div>
					<div class="col-lg-3 col-md-3 col-sm-3" align="right">
						<span class="tm-section-title" style="font-size:20px;">정렬 : <a class="orderByClass" onclick="orderByHotel('name');">이름</a> <a class="oderByClass" onclick="orderByHotel('grade');">평점</a></span>
					</div>	
					<br><br>
				<div class="col-lg-3" align="left">
					
					<div class="form-group">
						<div class='input-group date-time' id='datetimepicker3'>
							<input type='text' class="form-control" placeholder="체크인" />
								<span class="input-group-addon">
									<span class="fa fa-calendar"></span>
								</span>
						</div>
					</div>
					<div class="form-group">
						<div class='input-group date-time' id='datetimepicker4'>
							<input type='text' class="form-control" placeholder="체크아웃" />
								<span class="input-group-addon">
									<span class="fa fa-calendar"></span>
								</span>
						</div>
					</div>
					
					<div class="col-lg-12 col-md-12 col-sm-12" align="left">
						<span class="tm-section-title" style="font-size:25px; border-bottom:1px solid #ccc;"><b>가격</b></span>
						<br>
						<input type="radio" class="hotelSearch" id="wifi" name="hotelSearchConditionMoney" style="width:17px; height:17px;"/>
						<label for="wifi" class="hotelSearchText">&nbsp;&nbsp;무료 와이파이</label><br>
						<input type="radio" class="hotelSearch" id="parking" name="hotelSearchConditionMoney" style="width:17px; height:17px;"/>
						<label for="parking" class="hotelSearchText">&nbsp;&nbsp;무료 주차</label><br>
						<input type="radio" class="hotelSearch" id="fitness" name="hotelSearchConditionMoney" style="width:17px; height:17px;"/>
						<label for="fitness" class="hotelSearchText">&nbsp;&nbsp;피트니스 센터</label><br><br>
					</div>
					
					<br><br>
					
					<div class="col-lg-12 col-md-12 col-sm-12" align="left">
						<span class="tm-section-title" style="font-size:25px; border-bottom:1px solid #ccc;"><b>유형</b></span>
						<br>
						<input type="radio" onclick="searchHotelGoodStay();" class="hotelSearchGoodStay" value="goodStay" id="goodStay" name="hotelSearchCondition" style="width:17px; height:17px;"/>
						<label for="goodStay" class="hotelSearchText">&nbsp;&nbsp;굿스테이</label><br>
						<input type="radio" onclick="searchHotelHanOk();" class="hotelSearchHanOk" value="hanOk" id="hanOk" name="hotelSearchCondition" style="width:17px; height:17px;"/>
						<label for="hanOk" class="hotelSearchText">&nbsp;&nbsp;한옥</label><br>
						<input type="radio" onclick="searchHotelBenikia();" class="hotelSearchBenikia" value="benikia" id="benikia" name="hotelSearchCondition" style="width:17px; height:17px;"/>
						<label for="benikia" class="hotelSearchText">&nbsp;&nbsp;베니키아</label><br><br>
					</div>
					
					<br>
					<div class="col-lg-12 col-md-12 col-sm-12" align="left">
						<span class="tm-section-title" style="font-size:25px; border-bottom:1px solid #ccc;"><b>평점</b></span>
						<br>
						<input type="radio" class="hotelSearch" id="fiveStar" name="hotelAvg" style="width:15px; height:15px;"/>
						<label for="fiveStar" class="hotelSearchText">&nbsp;&nbsp;★★★★★</label><br>
						<input type="radio" class="hotelSearch" id="fourStar" name="hotelAvg" style="width:15px; height:15px;"/>
						<label for="fourStar" class="hotelSearchText">&nbsp;&nbsp;★★★★☆ 이상</label><br>
						<input type="radio" class="hotelSearch" id="threeStar" name="hotelAvg" style="width:15px; height:15px;"/>
						<label for="threeStar" class="hotelSearchText">&nbsp;&nbsp;★★★☆☆ 이상</label><br>
						<input type="radio" class="hotelSearch" id="twoStar" name="hotelAvg" style="width:15px; height:15px;"/>
						<label for="twoStar" class="hotelSearchText">&nbsp;&nbsp;★★☆☆☆ 이상</label><br>
					</div>
					
					
					
				</div>
				<div class="col-lg-9" align="right" id="viewArea">
					
				    <div class="tm-home-box-3" id="detailHover">
						<div class="tm-home-box-3-img-container" id="detailClick" onclick="location.href='${contextPath}/detailHotel'">
							<img src="${ contextPath }/resources/img/index-09.jpg" alt="image" class="img-responsive1">	
						</div>						
						<div class="tm-home-box-3-info" id="detailInfo-1">
							<p class="tm-home-box-3-description" id="infoTextArea">Proin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum</p>
					        <div class="tm-home-box-2-container">
							<a href="#" class="tm-home-box-2-link" id="tm-home-box-2-link-1"><i class="fa fa-heart tm-home-box-2-icon border-right" id="dibsBtn"></i></a>
							<a href="#" class="tm-home-box-2-link" id="tm-home-box-2-link-2"><span class="tm-home-box-2-description box-3">Travel</span></a>
							<!-- <a href="#" class="tm-home-box-2-link" id="tm-home-box-2-link-1"><i class="fa fa-edit tm-home-box-2-icon border-left"></i></a> -->
						</div>
						</div>						
					</div>
					<div class="tm-home-box-3" id="detailHover">
						<div class="tm-home-box-3-img-container" id="detailClick" onclick="location.href='${contextPath}/detailHotel'">
							<img src="${ contextPath }/resources/img/index-09.jpg" alt="image" class="img-responsive1">	
						</div>						
						<div class="tm-home-box-3-info" id="detailInfo-1">
							<p class="tm-home-box-3-description" id="infoTextArea">Proin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum</p>
					        <div class="tm-home-box-2-container">
							<a href="#" class="tm-home-box-2-link" id="tm-home-box-2-link-1"><i class="fa fa-heart tm-home-box-2-icon border-right" id="dibsBtn"></i></a>
							<a href="#" class="tm-home-box-2-link" id="tm-home-box-2-link-2"><span class="tm-home-box-2-description box-3">Travel</span></a>
							<!-- <a href="#" class="tm-home-box-2-link" id="tm-home-box-2-link-1"><i class="fa fa-edit tm-home-box-2-icon border-left"></i></a> -->
						</div>
						</div>						
					</div>
					<div class="tm-home-box-3" id="detailHover">
						<div class="tm-home-box-3-img-container" id="detailClick" onclick="location.href='${contextPath}/detailHotel'">
							<img src="${ contextPath }/resources/img/index-09.jpg" alt="image" class="img-responsive1">	
						</div>						
						<div class="tm-home-box-3-info" id="detailInfo-1">
							<p class="tm-home-box-3-description" id="infoTextArea">Proin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum</p>
					        <div class="tm-home-box-2-container">
							<a href="#" class="tm-home-box-2-link" id="tm-home-box-2-link-1"><i class="fa fa-heart tm-home-box-2-icon border-right" id="dibsBtn"></i></a>
							<a href="#" class="tm-home-box-2-link" id="tm-home-box-2-link-2"><span class="tm-home-box-2-description box-3">Travel</span></a>
							<!-- <a href="#" class="tm-home-box-2-link" id="tm-home-box-2-link-1"><i class="fa fa-edit tm-home-box-2-icon border-left"></i></a> -->
						</div>
						</div>						
					</div>
					<div class="tm-home-box-3" id="detailHover">
						<div class="tm-home-box-3-img-container" id="detailClick" onclick="location.href='${contextPath}/detailHotel'">
							<img src="${ contextPath }/resources/img/index-09.jpg" alt="image" class="img-responsive1">	
						</div>						
						<div class="tm-home-box-3-info" id="detailInfo-1">
							<p class="tm-home-box-3-description" id="infoTextArea">Proin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsumProin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum</p>
					        <div class="tm-home-box-2-container">
							<a href="#" class="tm-home-box-2-link" id="tm-home-box-2-link-1"><i class="fa fa-heart tm-home-box-2-icon border-right" id="dibsBtn"></i></a>
							<a href="#" class="tm-home-box-2-link" id="tm-home-box-2-link-2"><span class="tm-home-box-2-description box-3">Travel</span></a>
							<!-- <a href="#" class="tm-home-box-2-link" id="tm-home-box-2-link-1"><i class="fa fa-edit tm-home-box-2-icon border-left"></i></a> -->
						</div>
						</div>						
					</div>
			    </div>
			</div>
		</div>
		<script>
			
			if(sessionStorage.getItem("areaCode") == 1){
				$(".tm-section-title1").text("서울 호텔");
			}else if(sessionStorage.getItem("areaCode") == 2){
				$(".tm-section-title1").text("인천 호텔");
			}else if(sessionStorage.getItem("areaCode") == 3){
				$(".tm-section-title1").text("대전 호텔");
			}else if(sessionStorage.getItem("areaCode") == 4){
				$(".tm-section-title1").text("대구 호텔");
			}else if(sessionStorage.getItem("areaCode") == 5){
				$(".tm-section-title1").text("광주 호텔");
			}else if(sessionStorage.getItem("areaCode") == 6){
				$(".tm-section-title1").text("부산 호텔");
			}else if(sessionStorage.getItem("areaCode") == 7){
				$(".tm-section-title1").text("울산 호텔");
			}else if(sessionStorage.getItem("areaCode") == 8){
				$(".tm-section-title1").text("세종특별자치시 호텔");
			}else if(sessionStorage.getItem("areaCode") == 31){
				$(".tm-section-title1").text("경기도 호텔");
			}else if(sessionStorage.getItem("areaCode") == 32){
				$(".tm-section-title1").text("강원도 호텔");
			}else if(sessionStorage.getItem("areaCode") == 33){
				$(".tm-section-title1").text("충청북도 호텔");
			}else if(sessionStorage.getItem("areaCode") == 34){
				$(".tm-section-title1").text("충청남도 호텔");
			}else if(sessionStorage.getItem("areaCode") == 35){
				$(".tm-section-title1").text("경상북도 호텔");
			}else if(sessionStorage.getItem("areaCode") == 36){
				$(".tm-section-title1").text("경상남도 호텔");
			}else if(sessionStorage.getItem("areaCode") == 37){
				$(".tm-section-title1").text("전라북도 호텔");
			}else if(sessionStorage.getItem("areaCode") == 38){
				$(".tm-section-title1").text("전라남도 호텔");
			}else if(sessionStorage.getItem("areaCode") == 39){
				$(".tm-section-title1").text("제주도 호텔");
			}
			
			var areaCode = sessionStorage.getItem("areaCode");
			//var areaCode = ${param.areaCode};
			console.log("호텔검색 : " + areaCode);
			var sigunguCode = sessionStorage.getItem("sigunguCode");
			//var sigunguCode = ${param.sigunguCode};
			console.log("호텔검색 : " + sigunguCode);
			var pageNo = sessionStorage.getItem("pageNo");
			//var pageNo = ${param.pageNo};
			var contenttypeid = 32;
			var contentid = 0;
			var name = "name";
			var grade = "grade";
			
			function searchHotelGoodStay(){
				var searchValue = $(".hotelSearchGoodStay").val();
				console.log(searchValue);
				$.ajax({
					url:"searchGoodStay.sub",
					type:"GET",
					data:{areaCode:areaCode, sigunguCode:sigunguCode},
					dataType:"json",
					success:function(data){
						console.log(data);
						var myData = data.response.body.items.item;
						var viewArea = $("#viewArea");
						viewArea.html("");
						var output = "";
						if(myData == null){
							output += "<div align='center'><h1>정보가 없습니다.</h1></div>"
							document.getElementById("viewArea").innerHTML += output;
						}else if(data.response.body.totalCount == 1){
							contenttypeid = myData.contenttypeid;
							contentid = myData.contentid;
							output += "<div class='tm-home-box-3' id='detailHover'>";
							output += "<div class='tm-home-box-3-img-container' id='detailClick' onclick='detailView("+contentid+","+contenttypeid+");'>";
							if(myData.firstimage == null){
								output += "<img src='${contextPath}/resources/img/noImage.gif' alt='image' class='img-responsive1'>";
							}else{
								output += "<img src="+myData.firstimage+" alt='image' class='img-responsive1'>";
							}
							output += "</div>";
							output += "<div class='tm-home-box-3-info' id='detailInfo-1'>";
							output += "<p class='tm-home-box-3-description' id='infoTextArea'>"+myData.addr1+"</p>";
							output += "<div class='tm-home-box-2-container'>";
							output += "<a onclick='btnGood("+contenttypeid+","+contentid+");' class='tm-home-box-2-link' id='tm-home-box-2-link-1'><i class='fa fa-heart tm-home-box-2-icon border-right' id='dibsBtn'></i></a>";
							output += "<a href='#' class='tm-home-box-2-link' id='tm-home-box-2-link-2'><span class='tm-home-box-2-description box-3'>"+myData.title+"</span></a>";
							output += "</div></div></div>";
							document.getElementById("viewArea").innerHTML += output;
						}else{
							for(var i = 0; i < myData.length; i++){
								contenttypeid = myData[i].contenttypeid;
								contentid = myData[i].contentid;
								output = "";
								output += "<div class='tm-home-box-3' id='detailHover'>";
								output += "<div class='tm-home-box-3-img-container' id='detailClick' onclick='detailView("+contentid+","+contenttypeid+");'>";
								if(myData[i].firstimage == null){
									output += "<img src='${contextPath}/resources/img/noImage.gif' alt='image' class='img-responsive1'>";
								}else{
									output += "<img src="+myData[i].firstimage+" alt='image' class='img-responsive1'>";
								}
								output += "</div>";
								output += "<div class='tm-home-box-3-info' id='detailInfo-1'>";
								output += "<p class='tm-home-box-3-description' id='infoTextArea'>"+myData[i].addr1+"</p>";
								output += "<div class='tm-home-box-2-container'>";
								output += "<a onclick='btnGood("+contenttypeid+","+contentid+");' class='tm-home-box-2-link' id='tm-home-box-2-link-1'><i class='fa fa-heart tm-home-box-2-icon border-right' id='dibsBtn'></i></a>";
								output += "<a href='#' class='tm-home-box-2-link' id='tm-home-box-2-link-2'><span class='tm-home-box-2-description box-3'>"+myData[i].title+"</span></a>";
								output += "</div></div></div>";
								document.getElementById("viewArea").innerHTML += output;
							}
						}
					},
					error:function(data){
						console.log(data);
					}
				});
			}
			
			function searchHotelHanOk(){
				var searchValue = $(".hotelSearchHanOk").val();
				console.log(searchValue);
				$.ajax({
					url:"searchHanOk.sub",
					type:"GET",
					data:{areaCode:areaCode, sigunguCode:sigunguCode},
					dataType:"json",
					success:function(data){
						console.log(data);
						var myData = data.response.body.items.item;
						var viewArea = $("#viewArea");
						viewArea.html("");
						var output = "";
						if(myData == null){
							output += "<div align='center'><h1>정보가 없습니다.</h1></div>"
							document.getElementById("viewArea").innerHTML += output;
						}else if(data.response.body.totalCount == 1){
							contenttypeid = myData.contenttypeid;
							contentid = myData.contentid;
							output += "<div class='tm-home-box-3' id='detailHover'>";
							output += "<div class='tm-home-box-3-img-container' id='detailClick' onclick='detailView("+contentid+","+contenttypeid+");'>";
							if(myData.firstimage == null){
								output += "<img src='${contextPath}/resources/img/noImage.gif' alt='image' class='img-responsive1'>";
							}else{
								output += "<img src="+myData.firstimage+" alt='image' class='img-responsive1'>";
							}
							output += "</div>";
							output += "<div class='tm-home-box-3-info' id='detailInfo-1'>";
							output += "<p class='tm-home-box-3-description' id='infoTextArea'>"+myData.addr1+"</p>";
							output += "<div class='tm-home-box-2-container'>";
							output += "<a onclick='btnGood("+contenttypeid+","+contentid+");' class='tm-home-box-2-link' id='tm-home-box-2-link-1'><i class='fa fa-heart tm-home-box-2-icon border-right' id='dibsBtn'></i></a>";
							output += "<a href='#' class='tm-home-box-2-link' id='tm-home-box-2-link-2'><span class='tm-home-box-2-description box-3'>"+myData.title+"</span></a>";
							output += "</div></div></div>";
							document.getElementById("viewArea").innerHTML += output;
						}else{
							for(var i = 0; i < myData.length; i++){
								contenttypeid = myData[i].contenttypeid;
								contentid = myData[i].contentid;
								output = "";
								output += "<div class='tm-home-box-3' id='detailHover'>";
								output += "<div class='tm-home-box-3-img-container' id='detailClick' onclick='detailView("+contentid+","+contenttypeid+");'>";
								if(myData[i].firstimage == null){
									output += "<img src='${contextPath}/resources/img/noImage.gif' alt='image' class='img-responsive1'>";
								}else{
									output += "<img src="+myData[i].firstimage+" alt='image' class='img-responsive1'>";
								}
								output += "</div>";
								output += "<div class='tm-home-box-3-info' id='detailInfo-1'>";
								output += "<p class='tm-home-box-3-description' id='infoTextArea'>"+myData[i].addr1+"</p>";
								output += "<div class='tm-home-box-2-container'>";
								output += "<a onclick='btnGood("+contenttypeid+","+contentid+");' class='tm-home-box-2-link' id='tm-home-box-2-link-1'><i class='fa fa-heart tm-home-box-2-icon border-right' id='dibsBtn'></i></a>";
								output += "<a href='#' class='tm-home-box-2-link' id='tm-home-box-2-link-2'><span class='tm-home-box-2-description box-3'>"+myData[i].title+"</span></a>";
								output += "</div></div></div>";
								document.getElementById("viewArea").innerHTML += output;
							}
						}
					},
					error:function(data){
						console.log(data);
					}
				});
			}
			
			function searchHotelBenikia(){
				var searchValue = $(".hotelSearchBenikia").val();
				console.log(searchValue);
				$.ajax({
					url:"searchBenikia.sub",
					type:"GET",
					data:{areaCode:areaCode, sigunguCode:sigunguCode},
					dataType:"json",
					success:function(data){
						console.log(data);
						var myData = data.response.body.items.item;
						var viewArea = $("#viewArea");
						viewArea.html("");
						var output = "";
						if(myData == null){
							output += "<div align='center'><h1>정보가 없습니다.</h1></div>"
							document.getElementById("viewArea").innerHTML += output;
						}else if(data.response.body.totalCount == 1){
							contenttypeid = myData.contenttypeid;
							contentid = myData.contentid;
							output += "<div class='tm-home-box-3' id='detailHover'>";
							output += "<div class='tm-home-box-3-img-container' id='detailClick' onclick='detailView("+contentid+","+contenttypeid+");'>";
							if(myData.firstimage == null){
								output += "<img src='${contextPath}/resources/img/noImage.gif' alt='image' class='img-responsive1'>";
							}else{
								output += "<img src="+myData.firstimage+" alt='image' class='img-responsive1'>";
							}
							output += "</div>";
							output += "<div class='tm-home-box-3-info' id='detailInfo-1'>";
							output += "<p class='tm-home-box-3-description' id='infoTextArea'>"+myData.addr1+"</p>";
							output += "<div class='tm-home-box-2-container'>";
							output += "<a onclick='btnGood("+contenttypeid+","+contentid+");' class='tm-home-box-2-link' id='tm-home-box-2-link-1'><i class='fa fa-heart tm-home-box-2-icon border-right' id='dibsBtn'></i></a>";
							output += "<a href='#' class='tm-home-box-2-link' id='tm-home-box-2-link-2'><span class='tm-home-box-2-description box-3'>"+myData.title+"</span></a>";
							output += "</div></div></div>";
							document.getElementById("viewArea").innerHTML += output;
						}else{
							for(var i = 0; i < myData.length; i++){
								contenttypeid = myData[i].contenttypeid;
								contentid = myData[i].contentid;
								output = "";
								output += "<div class='tm-home-box-3' id='detailHover'>";
								output += "<div class='tm-home-box-3-img-container' id='detailClick' onclick='detailView("+contentid+","+contenttypeid+");'>";
								if(myData[i].firstimage == null){
									output += "<img src='${contextPath}/resources/img/noImage.gif' alt='image' class='img-responsive1'>";
								}else{
									output += "<img src="+myData[i].firstimage+" alt='image' class='img-responsive1'>";
								}
								output += "</div>";
								output += "<div class='tm-home-box-3-info' id='detailInfo-1'>";
								output += "<p class='tm-home-box-3-description' id='infoTextArea'>"+myData[i].addr1+"</p>";
								output += "<div class='tm-home-box-2-container'>";
								output += "<input type='hidden' value="+contenttypeid+">";
								output += "<input type='hidden' value="+contentid+">";
								output += "<a onclick='btnGood("+contenttypeid+","+contentid+");' class='tm-home-box-2-link' id='tm-home-box-2-link-1'><i class='fa fa-heart tm-home-box-2-icon border-right' id='dibsBtn'></i></a>";
								output += "<a href='#' class='tm-home-box-2-link' id='tm-home-box-2-link-2'><span class='tm-home-box-2-description box-3'>"+myData[i].title+"</span></a>";
								output += "</div></div></div>";
								document.getElementById("viewArea").innerHTML += output;
							}
						}
					},
					error:function(data){
						console.log(data);
					}
				});
			}
			
			 function searchHotelPage(){
				$.ajax({
					url:"searchHotelAreaPage.com",
					type:"GET",
					data:{areaCode:areaCode, sigunguCode:sigunguCode},
					dataType:"json",
					async:false,
					success:function(data){
						console.log("와줘");
						console.log(data);
						var viewArea = $("#viewArea");
						viewArea.html("");
						var titleArea = $("#tm-home-box-2-link-2");
						var output = "";
						var cid = 0;
						for(var i = 0; i < data.length; i++){
							contentid = data[i].contentid;
							cid = data[i].cid;
							output = "";
							output += "<div class='tm-home-box-3' id='detailHover'>";
							output += "<div class='tm-home-box-3-img-container' id='detailClick' onclick='detailView("+contentid+","+contenttypeid+","+cid+");'>";
							if(data[i].firstimage == null){
								//hotelImageLoad(contentid);
								$.ajax({
									url:"hotelImageLoad.sub",
									type:"get",
									data:{contentid:contentid},
									dataType:"json",
									async:false,
									success:function(result){
										if(result.response.body.items.item.firstimage != null){
											output += "<img src="+result.response.body.items.item.firstimage+" alt='image' class='img-responsive1' />";
										}else{
											output += "<img src='${contextPath}/resources/img/noImage.gif' alt='image' class='img-responsive1'>";
										}
									},error:function(result){console.log(result);}
								});
							}else{
								output += "<img src='${contextPath}/resources/img/noImage.gif' alt='image' class='img-responsive1'>";
							}
							output += "</div>";
							output += "<div class='tm-home-box-3-info' id='detailInfo-1'>";
							output += "<p class='tm-home-box-3-description' id='infoTextArea'><b>주소</b> : "+data[i].cAddress+"</p>";
							output += "<div class='tm-home-box-2-container'>";
							output += "<a onclick='btnGood("+contenttypeid+","+contentid+");' class='tm-home-box-2-link' id='tm-home-box-2-link-1'><i class='fa fa-heart tm-home-box-2-icon border-right' id='dibsBtn'></i></a>";
							output += "<a href='#' class='tm-home-box-2-link' id='tm-home-box-2-link-2'><span class='tm-home-box-2-description box-3'>"+data[i].cName+"</span></a>";
							output += "</div></div></div>";
							document.getElementById("viewArea").innerHTML += output;
							//hotelImageLoad(contentid);
						}
					},
					error:function(data){
						console.log("오지말아줘");
						console.log(data);
					}
				});
			}
			 

			/* function hotelImageLoad(contentid){
				console.log("호텔이미지로드 : " + contentid);
				var imageArea = $("#detailClick");
				imageArea.html("");
					$.ajax({
						url:"hotelImageLoad.sub",
						type:"get",
						data:{contentid:contentid},
						dataType:"json",
						async:false,
						success:function(result){
							console.log("성공와줘..");
							console.log(result);
							var myData = result.response.body.items.item;
							var output = "";
							output += "<img src="+myData.firstimage+" alt='image' class='img-responsive1' />";
							return output;
							for(var ii in myData){
								output = "";
								if(myData.firstimage == null){
									output += "<img src='${contextPath}/resources/img/noImage.gif' alt='image' class='img-responsive1' />";
								}else{
									output += "<img src="+myData[ii].firstimage+" alt='image' class='img-responsive1' />";
								}
								//document.getElementById("detailClick").innerHTML += output;
							}
						},
						error:function(data){
							console.log("에러오지마..");
							console.log(data);
						}
					});
				} */
			
			
			/* function searchHotelPage(){
				
				$.ajax({
					url:"searchAreaHotel.sub",
					type:"GET",
					data:{areaCode:areaCode, sigunguCode:sigunguCode},
					dataType:"json",
					success:function(data){
						console.log(data);
						var myData = data.response.body.items.item;
						var viewArea = $("#viewArea");
						viewArea.html("");
						var output = "";
						if(myData == null){
							output += "<div align='center'><h1>정보가 없습니다.</h1></div>";
							document.getElementById("viewArea").innerHTML += output;
						}else if(data.response.body.totalCount == 1){
							contenttypeid = myData.contenttypeid;
							contentid = myData.contentid;
							output += "<div class='tm-home-box-3' id='detailHover'>";
							output += "<div class='tm-home-box-3-img-container' id='detailClick' onclick='detailView("+contentid+","+contenttypeid+");'>";
							if(myData.firstimage == null){
								output += "<img src='${contextPath}/resources/img/noImage.gif' alt='image' class='img-responsive1'>";
							}else{
								output += "<img src="+myData.firstimage+" alt='image' class='img-responsive1'>";
							}
							output += "</div>";
							output += "<div class='tm-home-box-3-info' id='detailInfo-1'>";
							output += "<p class='tm-home-box-3-description' id='infoTextArea'>"+myData.addr1+"</p>";
							output += "<div class='tm-home-box-2-container'>";
							output += "<a onclick='btnGood("+contenttypeid+","+contentid+");' class='tm-home-box-2-link' id='tm-home-box-2-link-1'><i class='fa fa-heart tm-home-box-2-icon border-right' id='dibsBtn'></i></a>";
							output += "<a href='#' class='tm-home-box-2-link' id='tm-home-box-2-link-2'><span class='tm-home-box-2-description box-3'>"+myData.title+"</span></a>";
							output += "</div></div></div>";
							document.getElementById("viewArea").innerHTML += output;
						}else{
							for(var i = 0; i < myData.length; i++){
								contenttypeid = myData[i].contenttypeid;
								contentid = myData[i].contentid;
								output = "";
								output += "<div class='tm-home-box-3' id='detailHover'>";
								output += "<div class='tm-home-box-3-img-container' id='detailClick' onclick='detailView("+contentid+","+contenttypeid+");'>";
								if(myData[i].firstimage == null){
									output += "<img src='${contextPath}/resources/img/noImage.gif' alt='image' class='img-responsive1'>";
								}else{
									output += "<img src="+myData[i].firstimage+" alt='image' class='img-responsive1'>";
								}
								output += "</div>";
								output += "<div class='tm-home-box-3-info' id='detailInfo-1'>";
								output += "<p class='tm-home-box-3-description' id='infoTextArea'>"+myData[i].addr1+"</p>";
								output += "<div class='tm-home-box-2-container'>";
								output += "<input type='hidden' value="+contenttypeid+">";
								output += "<input type='hidden' value="+contentid+">";
								output += "<a onclick='btnGood("+contenttypeid+","+contentid+");' class='tm-home-box-2-link' id='tm-home-box-2-link-1'><i class='fa fa-heart tm-home-box-2-icon border-right' id='dibsBtn'></i></a>";
								output += "<a href='#' class='tm-home-box-2-link' id='tm-home-box-2-link-2'><span class='tm-home-box-2-description box-3'>"+myData[i].title+"</span></a>";
								output += "</div></div></div>";
								document.getElementById("viewArea").innerHTML += output;
							}
						}
					},
					error:function(data){
						console.log(data);
					}
				});
			} */
			
			function btnGood(contenttypeid, contentid){
				console.log(contenttypeid);
				console.log(contentid);
				
				if(contenttypeid == 32){
					$.ajax({
						url:"dibsHotel.good",
						type:"GET",
						data:{contenttypeid:contenttypeid, contentid:contentid},
						success:function(data){
							// 1일시, 이미 찜한 목록 => delete요청.
							// 0일시, 새로 찜에 추가 => insert요청.
							if(data > 0){
								deleteDibsHotel(contentid);
							}else{
								insertDibsHotel(contentid);
							}
						},
						error:function(data){
							console.log(data);
						}
					});
				}
			}
			
			function insertDibsHotel(contentid){
				$.ajax({
					url:"insertDibsHotel.good",
					type:"GET",
					data:{contenttypeid:contenttypeid, contentid:contentid},
					success:function(data){
						if(data > 0){
							alert("찜 목록에 추가되었습니다.");
						}
					},
					error:function(data){
						console.log(data);
					}
				});
			}
			
			function deleteDibsHotel(contentid){
				$.ajax({
					url:"deleteDibsHotel.good",
					type:"GET",
					data:{contenttypeid:contenttypeid, contentid:contentid},
					success:function(data){
						alert("찜 목록에서 삭제되었습니다.");
					},
					error:function(data){
						console.log(data);
					}
				});
			}
			
			function detailView(contentid,contenttypeid,cid){
				location.href="${contextPath}/detailHotel?contentid="+contentid+"&contenttypeid="+contenttypeid+"&cid="+cid;
			}
			
			function orderByHotel(value){
				console.log("value: " + value);
				$.ajax({
					url:"orderByHotel.com",
					type:"GET",
					data:{areaCode:areaCode, sigunguCode:sigunguCode, value:value},
					dataType:"json",
					async:false,
					success:function(data){
						console.log("와줘");
						console.log(data);
						var viewArea = $("#viewArea");
						viewArea.html("");
						var titleArea = $("#tm-home-box-2-link-2");
						var output = "";
						var cid = 0;
						for(var i = 0; i < data.length; i++){
							contentid = data[i].contentid;
							cid = data[i].cid;
							output = "";
							output += "<div class='tm-home-box-3' id='detailHover'>";
							output += "<div class='tm-home-box-3-img-container' id='detailClick' onclick='detailView("+contentid+","+contenttypeid+","+cid+");'>";
							if(data[i].firstimage == null){
								//hotelImageLoad(contentid);
								$.ajax({
									url:"hotelImageLoad.sub",
									type:"get",
									data:{contentid:contentid},
									dataType:"json",
									async:false,
									success:function(result){
										if(result.response.body.items.item.firstimage != null){
											output += "<img src="+result.response.body.items.item.firstimage+" alt='image' class='img-responsive1' />";
										}else{
											output += "<img src='${contextPath}/resources/img/noImage.gif' alt='image' class='img-responsive1'>";
										}
									},error:function(result){console.log(result);}
								});
							}else{
								output += "<img src='${contextPath}/resources/img/noImage.gif' alt='image' class='img-responsive1'>";
							}
							output += "</div>";
							output += "<div class='tm-home-box-3-info' id='detailInfo-1'>";
							output += "<p class='tm-home-box-3-description' id='infoTextArea'><b>주소</b> : "+data[i].cAddress+"</p>";
							output += "<div class='tm-home-box-2-container'>";
							output += "<a onclick='btnGood("+contenttypeid+","+contentid+");' class='tm-home-box-2-link' id='tm-home-box-2-link-1'><i class='fa fa-heart tm-home-box-2-icon border-right' id='dibsBtn'></i></a>";
							output += "<a onclick='detailView("+contentid+","+contenttypeid+","+cid+");' class='tm-home-box-2-link' id='tm-home-box-2-link-2'><span class='tm-home-box-2-description box-3'>"+data[i].cName+"</span></a>";
							output += "</div></div></div>";
							document.getElementById("viewArea").innerHTML += output;
							//hotelImageLoad(contentid);
						}
					},
					error:function(data){
						console.log("오지말아줘");
						console.log(data);
					}
				});
			}
			
			
		
			$(function(){
				
				searchHotelPage();
				
			});
		</script>
	</section>		
	
	<!-- white bg -->
	<section class="tm-white-bg section-padding-bottom">
	</section>
	
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
		$(function() {

			// https://css-tricks.com/snippets/jquery/smooth-scrolling/
		  	$('a[href*=#]:not([href=#])').click(function() {
			    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
			      var target = $(this.hash);
			      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
			      if (target.length) {
			        $('html,body').animate({
			          scrollTop: target.offset().top
			        }, 1000);
			        return false;
			      }
			    }
		  	});		  	
		});
		$(window).load(function(){
			// Flexsliders
		  	$('.flexslider.flexslider-banner').flexslider({
			    controlNav: false
		    });
		  	$('.flexslider').flexslider({
		    	animation: "slide",
		    	directionNav: false,
		    	slideshow: false
		  	});
		});
	</script>
</body>
</html>