<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
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
	#infoTextArea{height:175px; padding:10px 20px 44px; text-align:left; }
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
					<br>
					<div class="col-lg-12 col-md-12 col-sm-12" align="left">
						<span class="tm-section-title" style="font-size:25px; border-bottom:1px solid #ccc;"><b>가격</b></span>
						<br>
						<input type="radio" class="hotelSearchMoney" value="1" id="price1" name="hotelSearchConditionMoney" style="width:17px; height:17px;"/>
						<label for="price1" class="hotelSearchText">&nbsp;&nbsp;100,000 ~ 199,000</label><br>
						<input type="radio" class="hotelSearchMoney" value="2" id="price2" name="hotelSearchConditionMoney" style="width:17px; height:17px;"/>
						<label for="price2" class="hotelSearchText">&nbsp;&nbsp;200,000 ~ 299,000</label><br>
						<input type="radio" class="hotelSearchMoney" value="3" id="price3" name="hotelSearchConditionMoney" style="width:17px; height:17px;"/>
						<label for="price3" class="hotelSearchText">&nbsp;&nbsp;300,000 ~</label><br><br>
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
						<input type="radio" class="hotelSearchAvg" value="fiveAvg" id="fiveStar" name="hotelAvg" style="width:15px; height:15px;"/>
						<label for="fiveStar" class="hotelSearchText">&nbsp;&nbsp;★★★★★</label><br>
						<input type="radio" class="hotelSearchAvg" value="fourAvg" id="fourStar" name="hotelAvg" style="width:15px; height:15px;"/>
						<label for="fourStar" class="hotelSearchText">&nbsp;&nbsp;★★★★☆ 이상</label><br>
						<input type="radio" class="hotelSearchAvg" value="threeAvg" id="threeStar" name="hotelAvg" style="width:15px; height:15px;"/>
						<label for="threeStar" class="hotelSearchText">&nbsp;&nbsp;★★★☆☆ 이상</label><br>
						<input type="radio" class="hotelSearchAvg" value="twoAvg" id="twoStar" name="hotelAvg" style="width:15px; height:15px;"/>
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
							output += "<a onclick='btnGood("+contenttypeid+","+contentid+");' class='tm-home-box-2-link goodBtn' id='tm-home-box-2-link-1'><i class='fa fa-heart-o tm-home-box-2-icon border-right' id='dibsBtn'></i></a>";
							output += "<a class='tm-home-box-2-link titleZone' id='tm-home-box-2-link-2'><span class='tm-home-box-2-description box-3'>"+myData.title+"</span></a>";
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
								output += "<a onclick='btnGood("+contenttypeid+","+contentid+");' class='tm-home-box-2-link goodBtn' id='tm-home-box-2-link-1'><i class='fa fa-heart tm-home-box-2-icon border-right' id='dibsBtn'></i></a>";
								output += "<a class='tm-home-box-2-link titleZone' id='tm-home-box-2-link-2'><span class='tm-home-box-2-description box-3'>"+myData[i].title+"</span></a>";
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
							output += "<a onclick='btnGood("+contenttypeid+","+contentid+");' class='tm-home-box-2-link goodBtn' id='tm-home-box-2-link-1'><i class='fa fa-heart tm-home-box-2-icon border-right' id='dibsBtn'></i></a>";
							output += "<a class='tm-home-box-2-link titleZone' id='tm-home-box-2-link-2'><span class='tm-home-box-2-description box-3'>"+myData.title+"</span></a>";
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
								output += "<a onclick='btnGood("+contenttypeid+","+contentid+");' class='tm-home-box-2-link goodBtn' id='tm-home-box-2-link-1'><i class='fa fa-heart tm-home-box-2-icon border-right' id='dibsBtn'></i></a>";
								output += "<a class='tm-home-box-2-link titleZone' id='tm-home-box-2-link-2'><span class='tm-home-box-2-description box-3'>"+myData[i].title+"</span></a>";
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
							output += "<a onclick='btnGood("+contenttypeid+","+contentid+");' class='tm-home-box-2-link goodBtn' id='tm-home-box-2-link-1'><i class='fa fa-heart-o tm-home-box-2-icon border-right' id='dibsBtn'></i></a>";
							output += "<a class='tm-home-box-2-link titleZone' id='tm-home-box-2-link-2'><span class='tm-home-box-2-description box-3'>"+myData.title+"</span></a>";
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
								output += "<a onclick='btnGood("+contenttypeid+","+contentid+");' class='tm-home-box-2-link goodBtn' id='tm-home-box-2-link-1'><i class='fa fa-heart-o tm-home-box-2-icon border-right' id='dibsBtn'></i></a>";
								output += "<a class='tm-home-box-2-link titleZone' id='tm-home-box-2-link-2'><span class='tm-home-box-2-description box-3'>"+myData[i].title+"</span></a>";
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
							/* if(data[i].firstimage == null){
								//hotelImageLoad(contentid);
								$.ajax({
									url:"hotelImageLoad.sub",
									type:"get",
									data:{contentid:contentid},
									dataType:"json",
									async:false,
									success:function(result){
										console.log("이미지로드 펑션 ajax : ");
										console.log(result);
										if(result.response.body.items.item.firstimage != null){
											output += "<img src="+result.response.body.items.item.firstimage+" alt='image' class='img-responsive1' />";
										}else{
											output += "<img src='${contextPath}/resources/img/noImage.gif' alt='image' class='img-responsive1'>";
										}
									},error:function(result){console.log(result);}
								});
							}else{
								output += "<img src='${contextPath}/resources/img/noImage.gif' alt='image' class='img-responsive1'>";
							} */
							output += "</div>";
							output += "<div class='tm-home-box-3-info' id='detailInfo-1'>";
							output += "<p class='tm-home-box-3-description' id='infoTextArea'>";
							output += "<span style='font-size:23px;'>"+data[i].cName +"</span><br>";
							$.ajax({
								url:"detailHotelInformation.sub",
								type:"GET",
								data:{contenttypeid:contenttypeid, contentid:contentid},
								dataType:"json",
								async:false,
								success:function(ddate){
									var overview = ddate.response.body.items.item.overview;
									if(overview.length > 190){
										output += overview.substring(0, 191) + "...";
									}else{
										output += overview;
									}
								},error:function(ddate){console.log(ddate);}
							});
							output += "</p>";
							output += "<div class='tm-home-box-2-container'>";
							output += "<a onclick='btnGood("+contenttypeid+","+contentid+","+cid+");' class='tm-home-box-2-link goodBtn' id='tm-home-box-2-link-1'><i class='fa fa-heart-o tm-home-box-2-icon border-right' id='dibsBtn'></i></a>";
							output += "<a class='tm-home-box-2-link titleZone' id='tm-home-box-2-link-2'>";
							output += "<span class='tm-home-box-2-description box-3' onclick='detailView("+contentid+","+contenttypeid+","+cid+");'>";
							if(data[i].grade == 0){
								output += "<i class='far fa-star' style='font-size:20px;'></i>";
								output += "<i class='far fa-star' style='font-size:20px;'></i>";
								output += "<i class='far fa-star' style='font-size:20px;'></i>";
								output += "<i class='far fa-star' style='font-size:20px;'></i>";
								output += "<i class='far fa-star' style='font-size:20px;'></i>";
							}
							if(data[i].grade > 0 && data[i].grade <= 0.5){
								output += "<i class='far fa-star-half-alt' style='font-size:20px;'></i>";
								output += "<i class='far fa-star' style='font-size:20px;'></i>";
								output += "<i class='far fa-star' style='font-size:20px;'></i>";
								output += "<i class='far fa-star' style='font-size:20px;'></i>";
								output += "<i class='far fa-star' style='font-size:20px;'></i>";
							}
							if(data[i].grade > 0.5 && data[i].grade <= 1){
								output += "<i class='fas fa-star' style='font-size:20px;'></i>";
								output += "<i class='far fa-star' style='font-size:20px'></i>";
								output += "<i class='far fa-star' style='font-size:20px'></i>";
								output += "<i class='far fa-star' style='font-size:20px'></i>";
								output += "<i class='far fa-star' style='font-size:20px'></i>";
							}
							if(data[i].grade > 1 && data[i].grade <= 1.5){
								output += "<i class='fas fa-star' style='font-size:20px;'></i>";
								output += "<i class='fas fa-star-half-alt' style='font-size:20px'></i>";
								output += "<i class='far fa-star' style='font-size:20px'></i>";
								output += "<i class='far fa-star' style='font-size:20px'></i>";
								output += "<i class='far fa-star' style='font-size:20px'></i>";
							}
							if(data[i].grade > 1.5 && data[i].grade <= 2){
								output += "<i class='fas fa-star' style='font-size:20px;'></i>";
								output += "<i class='fas fa-star' style='font-size:20px'></i>";
								output += "<i class='far fa-star' style='font-size:20px'></i>";
								output += "<i class='far fa-star' style='font-size:20px'></i>";
								output += "<i class='far fa-star' style='font-size:20px'></i>";
							}
							if(data[i].grade > 2 && data[i].grade <= 2.5){
								output += "<i class='fas fa-star' style='font-size:20px;'></i>";
								output += "<i class='fas fa-star' style='font-size:20px'></i>";
								output += "<i class='fas fa-star-half-alt' style='font-size:20px'></i>";
								output += "<i class='far fa-star' style='font-size:20px'></i>";
								output += "<i class='far fa-star' style='font-size:20px'></i>";
							}
							if(data[i].grade > 2.5 && data[i].grade <= 3){
								output += "<i class='fas fa-star' style='font-size:20px;'></i>";
								output += "<i class='fas fa-star' style='font-size:20px'></i>";
								output += "<i class='fas fa-star' style='font-size:20px'></i>";
								output += "<i class='far fa-star' style='font-size:20px'></i>";
								output += "<i class='far fa-star' style='font-size:20px'></i>";
							}
							if(data[i].grade > 3 && data[i].grade <= 3.5){
								output += "<i class='fas fa-star' style='font-size:20px;'></i>";
								output += "<i class='fas fa-star' style='font-size:20px'></i>";
								output += "<i class='far fa-star' style='font-size:20px'></i>";
								output += "<i class='fas fa-star-half-alt' style='font-size:20px'></i>";
								output += "<i class='far fa-star' style='font-size:20px'></i>";
							}
							if(data[i].grade > 3.5 && data[i].grade <= 4){
								output += "<i class='fas fa-star' style='font-size:20px;'></i>";
								output += "<i class='fas fa-star' style='font-size:20px'></i>";
								output += "<i class='fas fa-star' style='font-size:20px'></i>";
								output += "<i class='fas fa-star' style='font-size:20px'></i>";
								output += "<i class='far fa-star' style='font-size:20px'></i>";
							}
							if(data[i].grade > 4 && data[i].grade <= 4.5){
								output += "<i class='fas fa-star' style='font-size:20px;'></i>";
								output += "<i class='fas fa-star' style='font-size:20px'></i>";
								output += "<i class='fas fa-star' style='font-size:20px'></i>";
								output += "<i class='fas fa-star' style='font-size:20px'></i>";
								output += "<i class='fas fa-star-half-alt' style='font-size:20px'></i>";
							}
							if(data[i].grade > 4.5 && data[i].grade <= 5){
								output += "<i class='fas fa-star' style='font-size:20px;'></i>";
								output += "<i class='fas fa-star' style='font-size:20px'></i>";
								output += "<i class='fas fa-star' style='font-size:20px'></i>";
								output += "<i class='fas fa-star' style='font-size:20px'></i>";
								output += "<i class='fas fa-star' style='font-size:20px'></i>";
							}
							output += "</span></a>";
							output += "</div></div></div>";
							document.getElementById("viewArea").innerHTML += output;
						}
						
					},
					error:function(data){
						console.log("오지말아줘");
						console.log(data);
					}
				});
			}
			
			</script>
			<c:if test="${!empty sessionScope.loginUser}">
			<script>
			function btnGood(contenttypeid, contentid, cid){
				console.log(contenttypeid);
				console.log(contentid);
				
					$.ajax({
						url:"dibsHotel.good",
						type:"GET",
						data:{contenttypeid:contenttypeid, contentid:contentid, cid:cid},
						success:function(data){
							// 1일시, 이미 찜한 목록 => delete요청.
							// 0일시, 새로 찜에 추가 => insert요청.
							if(data > 0){
								deleteDibsHotel(contentid, cid);
							}else{
								insertDibsHotel(contentid, cid);
							}
						},
						error:function(data){
							console.log(data);
						}
					});
			}
			</script>
			</c:if>
			<c:if test="${empty sessionScope.loginUser}">
			<script>
				function btnGood(contenttypeid, contentid, cid){
					alert("로그인이 필요한 서비스입니다.");
				}
			</script>
			</c:if>
			<script>
			function insertDibsHotel(contentid, cid){
				$.ajax({
					url:"insertDibsHotel.good",
					type:"GET",
					data:{contenttypeid:contenttypeid, contentid:contentid, cid:cid},
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
							/* if(data[i].firstimage == null){
								$.ajax({
									url:"hotelImageLoad.sub",
									type:"get",
									data:{contentid:contentid},
									dataType:"json",
									async:false,
									success:function(result){
										console.log(result);
										if(result.response.body.items.item.firstimage != null){
											output += "<img src="+result.response.body.items.item.firstimage+" alt='image' class='img-responsive1' />";
										}else{
											output += "<img src='${contextPath}/resources/img/noImage.gif' alt='image' class='img-responsive1'>";
										}
									},error:function(result){console.log(result);}
								});
							}else{
								output += "<img src='${contextPath}/resources/img/noImage.gif' alt='image' class='img-responsive1'>";
							} */
							output += "</div>";
							output += "<div class='tm-home-box-3-info' id='detailInfo-1'>";
							output += "<p class='tm-home-box-3-description' id='infoTextArea'>";
							output += "<span style='font-size:23px;'>"+data[i].cName +"</span><br>";
							$.ajax({
								url:"detailHotelInformation.sub",
								type:"GET",
								data:{contenttypeid:contenttypeid, contentid:contentid},
								dataType:"json",
								async:false,
								success:function(ddate){
									var overview = ddate.response.body.items.item.overview;
									if(overview.length > 190){
										output += overview.substring(0, 191) + "...";
									}else{
										output += overview;
									}
								},error:function(ddate){console.log(ddate);}
							});
							output += "</p>";
							output += "<div class='tm-home-box-2-container'>";
							output += "<a onclick='btnGood("+contenttypeid+","+contentid+");' class='tm-home-box-2-link goodBtn' id='tm-home-box-2-link-1'><i class='fa fa-heart-o tm-home-box-2-icon border-right' id='dibsBtn'></i></a>";
							output += "<a onclick='detailView("+contentid+","+contenttypeid+","+cid+");' class='tm-home-box-2-link titleZone' id='tm-home-box-2-link-2'>";
							output += "<span class='tm-home-box-2-description box-3'>";
							if(data[i].grade == 0){
								output += "<i class='far fa-star' style='font-size:20px;'></i>";
								output += "<i class='far fa-star' style='font-size:20px;'></i>";
								output += "<i class='far fa-star' style='font-size:20px;'></i>";
								output += "<i class='far fa-star' style='font-size:20px;'></i>";
								output += "<i class='far fa-star' style='font-size:20px;'></i>";
							}
							if(data[i].grade > 0 && data[i].grade <= 0.5){
								output += "<i class='far fa-star-half-alt' style='font-size:20px;'></i>";
								output += "<i class='far fa-star' style='font-size:20px;'></i>";
								output += "<i class='far fa-star' style='font-size:20px;'></i>";
								output += "<i class='far fa-star' style='font-size:20px;'></i>";
								output += "<i class='far fa-star' style='font-size:20px;'></i>";
							}
							if(data[i].grade > 0.5 && data[i].grade <= 1){
								output += "<i class='fas fa-star' style='font-size:20px;'></i>";
								output += "<i class='far fa-star' style='font-size:20px'></i>";
								output += "<i class='far fa-star' style='font-size:20px'></i>";
								output += "<i class='far fa-star' style='font-size:20px'></i>";
								output += "<i class='far fa-star' style='font-size:20px'></i>";
							}
							if(data[i].grade > 1 && data[i].grade <= 1.5){
								output += "<i class='fas fa-star' style='font-size:20px;'></i>";
								output += "<i class='fas fa-star-half-alt' style='font-size:20px'></i>";
								output += "<i class='far fa-star' style='font-size:20px'></i>";
								output += "<i class='far fa-star' style='font-size:20px'></i>";
								output += "<i class='far fa-star' style='font-size:20px'></i>";
							}
							if(data[i].grade > 1.5 && data[i].grade <= 2){
								output += "<i class='fas fa-star' style='font-size:20px;'></i>";
								output += "<i class='fas fa-star' style='font-size:20px'></i>";
								output += "<i class='far fa-star' style='font-size:20px'></i>";
								output += "<i class='far fa-star' style='font-size:20px'></i>";
								output += "<i class='far fa-star' style='font-size:20px'></i>";
							}
							if(data[i].grade > 2 && data[i].grade <= 2.5){
								output += "<i class='fas fa-star' style='font-size:20px;'></i>";
								output += "<i class='fas fa-star' style='font-size:20px'></i>";
								output += "<i class='fas fa-star-half-alt' style='font-size:20px'></i>";
								output += "<i class='far fa-star' style='font-size:20px'></i>";
								output += "<i class='far fa-star' style='font-size:20px'></i>";
							}
							if(data[i].grade > 2.5 && data[i].grade <= 3){
								output += "<i class='fas fa-star' style='font-size:20px;'></i>";
								output += "<i class='fas fa-star' style='font-size:20px'></i>";
								output += "<i class='fas fa-star' style='font-size:20px'></i>";
								output += "<i class='far fa-star' style='font-size:20px'></i>";
								output += "<i class='far fa-star' style='font-size:20px'></i>";
							}
							if(data[i].grade > 3 && data[i].grade <= 3.5){
								output += "<i class='fas fa-star' style='font-size:20px;'></i>";
								output += "<i class='fas fa-star' style='font-size:20px'></i>";
								output += "<i class='far fa-star' style='font-size:20px'></i>";
								output += "<i class='fas fa-star-half-alt' style='font-size:20px'></i>";
								output += "<i class='far fa-star' style='font-size:20px'></i>";
							}
							if(data[i].grade > 3.5 && data[i].grade <= 4){
								output += "<i class='fas fa-star' style='font-size:20px;'></i>";
								output += "<i class='fas fa-star' style='font-size:20px'></i>";
								output += "<i class='fas fa-star' style='font-size:20px'></i>";
								output += "<i class='fas fa-star' style='font-size:20px'></i>";
								output += "<i class='far fa-star' style='font-size:20px'></i>";
							}
							if(data[i].grade > 4 && data[i].grade <= 4.5){
								output += "<i class='fas fa-star' style='font-size:20px;'></i>";
								output += "<i class='fas fa-star' style='font-size:20px'></i>";
								output += "<i class='fas fa-star' style='font-size:20px'></i>";
								output += "<i class='fas fa-star' style='font-size:20px'></i>";
								output += "<i class='fas fa-star-half-alt' style='font-size:20px'></i>";
							}
							if(data[i].grade > 4.5 && data[i].grade <= 5){
								output += "<i class='fas fa-star' style='font-size:20px;'></i>";
								output += "<i class='fas fa-star' style='font-size:20px'></i>";
								output += "<i class='fas fa-star' style='font-size:20px'></i>";
								output += "<i class='fas fa-star' style='font-size:20px'></i>";
								output += "<i class='fas fa-star' style='font-size:20px'></i>";
							}
							output += "</span></a>";
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
				$(".hotelSearchMoney").click(function(){
					var value = $("input[name=hotelSearchConditionMoney]:checked").val();
					console.log(value);
					orderByHotel(value);
				});
				
				$(".hotelSearchAvg").click(function(){
					var value = $("input[name=hotelAvg]:checked").val();
					console.log(value);
					orderByHotel(value);
				});
				
				$(".goodBtn").click(function(){
					
				});
				
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