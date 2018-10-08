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
	.foodSearchText{font-size:20px;}
	#detailHover{max-width:750px;}
	#detailInfo-1{max-width:500px;}
	#tm-home-box-2-link-1{width:50px;}
	#tm-home-box-2-link-2{width:445px; display:inline-block;}
	#dibsBtn{padding:15px; width:50px; height:50px;}
	#infoTextArea{height:175px; padding:10px 20px 44px; overflow:auto; text-align:left; }
	.img-responsive1{width:250px; height:225px;}
</style>
</head>
<body>
	<!-- 지역의 음식점검색 Page. -->
	<jsp:include page="../common/searchMenubar.jsp"/>
	<jsp:include page="../common/searchSubmenubar.jsp"/>
	
	
	<section class="container tm-home-section-1" id="more">
		<div class="container">
			<div class="row">
				<div class="tm-section-header section-margin-top">
					<div class="col-lg-3 col-md-3 col-sm-3"><hr></div>
					<div class="col-lg-6 col-md-6 col-sm-6"><h2 class="tm-section-title tm-section-title1">서울 음식점</h2></div>
					<div class="col-lg-3 col-md-3 col-sm-3"><hr></div>	
				</div>
					<div class="col-lg-3 col-md-3 col-sm-3">
						<span class="tm-section-title" style="font-size:25px;"></span>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6"></div>
					<div class="col-lg-3 col-md-3 col-sm-3" align="right">
						<span class="tm-section-title" style="font-size:20px;">정렬 : <a href="#">이름</a> <a href="#">평점</a></span>
					</div>	
					<br><br>
				<div class="col-lg-3" align="left">
					
					<div class="col-lg-12 col-md-12 col-sm-12" align="left">
						<span class="tm-section-title" style="font-size:25px; border-bottom:1px solid #ccc;"><b>음식점 유형</b></span>
						<br>
						
						<input type="radio" class="foodSearch" id="koreaFood" value="A05020100" name="foodSearchCondition" style="width:15px; height:15px;"/>　
						<label for="koreaFood">한식</label><br>
						<input type="radio" class="foodSearch" id="americanFood" value="A05020200" name="foodSearchCondition" style="width:15px; height:15px;"/>　
						<label for="americanFood">서양식</label><br>
						<input type="radio" class="foodSearch" id="japanFood" value="A05020300" name="foodSearchCondition" style="width:15px; height:15px;"/>　
						<label for="japanFood">일식</label><br>
						<input type="radio" class="foodSearch" id="chinaFood" value="A05020400" name="foodSearchCondition" style="width:15px; height:15px;"/>　
						<label for="chinaFood">중식</label><br>
						<input type="radio" class="foodSearch" id="asiaFood" value="A05020500" name="foodSearchCondition" style="width:15px; height:15px;"/>　
						<label for="asiaFood">아시아식</label><br>
						<input type="radio" class="foodSearch" id="familyRestaurant" value="A05020600" name="foodSearchCondition" style="width:15px; height:15px;"/>　
						<label for="familyRestaurant">패밀리레스토랑</label><br>
						<input type="radio" class="foodSearch" id="unUsualFood" value="A05020700" name="foodSearchCondition" style="width:15px; height:15px;"/>　
						<label for="unUsualFood">이색음식점</label><br>
						<input type="radio" class="foodSearch" id="vegetableFood" value="A05020800" name="foodSearchCondition" style="width:15px; height:15px;"/>　
						<label for="vegetableFood">채식전문점</label><br>
						<input type="radio" class="foodSearch" id="cafe" value="A05020900" name="foodSearchCondition" style="width:15px; height:15px;"/>　
						<label for="cafe">바/카페</label><br>
						<input type="radio" class="foodSearch" id="club" value="A05021000" name="foodSearchCondition" style="width:15px; height:15px;"/>　
						<label for="club">클럽</label><br>
					</div>
					<br>
					<div class="col-lg-12 col-md-12 col-sm-12" align="left"><br>
						<span class="tm-section-title" style="font-size:25px; border-bottom:1px solid #ccc;"><b>평점</b></span>
						<br>
						<input type="radio" class="foodSearch" id="fiveStar" name="foodAvg" style="width:15px; height:15px;"/>
						<label for="fiveStar" class="foodSearchText">&nbsp;&nbsp;★★★★★</label><br>
						<input type="radio" class="foodSearch" id="fourStar" name="foodAvg" style="width:15px; height:15px;"/>
						<label for="fourStar" class="foodSearchText">&nbsp;&nbsp;★★★★☆ 이상</label><br>
						<input type="radio" class="foodSearch" id="threeStar" name="foodAvg" style="width:15px; height:15px;"/>
						<label for="threeStar" class="foodSearchText">&nbsp;&nbsp;★★★☆☆ 이상</label><br>
						<input type="radio" class="foodSearch" id="twoStar" name="foodAvg" style="width:15px; height:15px;"/>
						<label for="twoStar" class="foodSearchText">&nbsp;&nbsp;★★☆☆☆ 이상</label><br>
					</div>
						
						
					
					
				</div>
				<div class="col-lg-9" align="right" id="viewArea">
					
				    <div class="tm-home-box-3" id="detailHover">
						<div class="tm-home-box-3-img-container" id="detailClick" onclick="location.href='${contextPath}/detailFood'">
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
					</div><div class="tm-home-box-3" id="detailHover">
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
					</div><div class="tm-home-box-3" id="detailHover">
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
					</div><div class="tm-home-box-3" id="detailHover">
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
			var areaCode = sessionStorage.getItem("areaCode");
			var sigunguCode = sessionStorage.getItem("sigunguCode");
			/* var getParam = function(key){
				var _params = {};
				document.location.search.replace(/\??(?:([^=]+)=([^&]*)&?)/g, function(){
					function decode(s){
						return decodeURIComponent(s.split("+").join(" "));
					}
					_params[decode(arguments[1])] = decode(arguments[2]);
				});
				return _params[key];
			} */
			var cat3 = sessionStorage.getItem("cat3");
			var checkValue = "";
			
			if(areaCode == 1){
				$(".tm-section-title1").text("서울 음식점");
			}else if(areaCode == 2){
				$(".tm-section-title1").text("인천 음식점");
			}else if(areaCode == 3){
				$(".tm-section-title1").text("대전 음식점");
			}else if(areaCode == 4){
				$(".tm-section-title1").text("대구 음식점");
			}else if(areaCode == 5){
				$(".tm-section-title1").text("광주 음식점");
			}else if(areaCode == 6){
				$(".tm-section-title1").text("부산 음식점");
			}else if(areaCode == 7){
				$(".tm-section-title1").text("울산 음식점");
			}else if(areaCode == 8){
				$(".tm-section-title1").text("세종시 음식점");
			}else if(areaCode == 31){
				$(".tm-section-title1").text("경기도 음식점");
			}else if(areaCode == 32){
				$(".tm-section-title1").text("강원도 음식점");
			}else if(areaCode == 33){
				$(".tm-section-title1").text("충청북도 음식점");
			}else if(areaCode == 34){
				$(".tm-section-title1").text("충청남도 음식점");
			}else if(areaCode == 35){
				$(".tm-section-title1").text("경상북도 음식점");
			}else if(areaCode == 36){
				$(".tm-section-title1").text("경상남도 음식점");
			}else if(areaCode == 37){
				$(".tm-section-title1").text("전라북도 음식점");
			}else if(areaCode == 38){
				$(".tm-section-title1").text("전라남도 음식점");
			}else if(areaCode == 39){
				$(".tm-section-title1").text("제주도 음식점");
			}
			
			$(function(){
				searchFoodStore();
				$(".foodSearch").click(function(){
					checkValue = $("input[type=radio][name=foodSearchCondition]:checked").val();
					console.log(checkValue);
					searchFoodCondition(areaCode, sigunguCode, checkValue);
				})
			});
			
			function searchFoodCondition(areaCode, sigunguCode, cat3){
				$.ajax({
					url:"searchAreaFood.sub",
					type:"GET",
					data:{areaCode:areaCode, sigunguCode:sigunguCode, cat3:cat3},
					dataType:"json",
					success:function(data){
						console.log("searchFood");
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
								output += "<img src='${contextPath}/resources/img/noImage.gif' alt='image'class='img-responsive1'>";
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
							for(var i in myData){
								contenttypeid = myData[i].contenttypeid;
								contentid = myData[i].contentid;
								output = "";
								output += "<div class='tm-home-box-3' id='detailHover'>";
								output += "<div class='tm-home-box-3-img-container' id='detailClick' onclick='detailView("+contentid+","+contenttypeid+");'>";
								if(myData[i].firstimage == null){
									output += "<img src='${contextPath}/resources/img/noImage.gif' alt='image'class='img-responsive1'>";
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
			
			
			function searchFoodStore(){
				console.log("searchFoodStore : " + areaCode);
				console.log("searchFoodStore : " + sigunguCode);
				console.log("searchFoodStore : " + cat3);
				$.ajax({
					url:"searchAreaFood.sub",
					type:"GET",
					data:{areaCode:areaCode, sigunguCode:sigunguCode, cat3:cat3},
					dataType:"json",
					success:function(data){
						console.log("searchFood");
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
								output += "<img src='${contextPath}/resources/img/noImage.gif' alt='image'class='img-responsive1'>";
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
							for(var i in myData){
								contenttypeid = myData[i].contenttypeid;
								contentid = myData[i].contentid;
								output = "";
								output += "<div class='tm-home-box-3' id='detailHover'>";
								output += "<div class='tm-home-box-3-img-container' id='detailClick' onclick='detailView("+contentid+","+contenttypeid+");'>";
								if(myData[i].firstimage == null){
									output += "<img src='${contextPath}/resources/img/noImage.gif' alt='image'class='img-responsive1'>";
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
			
			function btnGood(contenttypeid, contentid){
				console.log(contenttypeid);
				console.log(contentid);
				if(contenttypeid == 39){
					$.ajax({
						url:"dibsFood.good",
						type:"GET",
						data:{contenttypeid:contenttypeid, contentid:contentid},
						success:function(data){
							// 1일시, 이미 찜한 목록 => delete요청.
							// 0일시, 새로 찜에 추가 => insert요청.
							if(data > 0){
								deleteDibsFood(contentid);
							}else{
								insertDibsFood(contentid);
							}
						},
						error:function(data){
							console.log(data);
						}
					});
				}
			}
			
			function insertDibsFood(contentid){
				$.ajax({
					url:"insertDibsFood.good",
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
			
			function deleteDibsFood(contentid){
				$.ajax({
					url:"deleteDibsFood.good",
					type:"GET",
					data:{contenttypeid:contenttypeid, contentid:contentid},
					success:function(data){
						if(data > 0){
							alert("찜 목록에서 삭제되었습니다.");
						}
					},
					error:function(data){
						console.log(data);
					}
				});
			}
			
			function detailView(contentid, contenttpyeid){
				location.href="${contextPath}/detailFood?contenttypeid="+contenttypeid+"&contentid="+contentid;
			}
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