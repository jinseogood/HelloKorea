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
	.gameSearchText{font-size:20px;}
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
	<!-- 지역의 오락거리검색 Page. -->
	<jsp:include page="../common/searchMenubar.jsp"/>
	<jsp:include page="../common/searchSubmenubar.jsp"/>
	
	
	<section class="container tm-home-section-1" id="more">
		<div class="container">
			<div class="row">
				<div class="tm-section-header section-margin-top">
					<div class="col-lg-3 col-md-3 col-sm-3"><hr></div>
					<div class="col-lg-6 col-md-6 col-sm-6"><h2 class="tm-section-title tm-section-title1">서울 오락거리</h2></div>
					<div class="col-lg-3 col-md-3 col-sm-3"><hr></div>	
				</div>
					<div class="col-lg-3 col-md-3 col-sm-3">
					<div class="festivalSearchArea">
						<select name="festivalYear" style="width:80px; height:25px;">
							<option>------</option>
							<option value="2018">2018년</option>
							<option value="2019">2019년</option>
							<option value="2020">2020년</option>
						</select>
						
						<select name="festivalMonth" style="width:80px; height:25px;">
							<option>------</option>
							<option value="jan">01월</option>
							<option value="feb">02월</option>
							<option value="mar">03월</option>
							<option value="apr">04월</option>
							<option value="may">05월</option>
							<option value="jun">06월</option>
							<option value="july">07월</option>
							<option value="aug">08월</option>
							<option value="sep">09월</option>
							<option value="oct">10월</option>
							<option value="nov">11월</option>
							<option value="dec">12월</option>
						</select>
					</div>	
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6"></div>
					<div class="col-lg-3 col-md-3 col-sm-3" align="right">
						<span class="tm-section-title" style="font-size:20px;">정렬 : <a href="#">이름</a> <a href="#">평점</a></span>
					</div>	
					<br><br>
				<div class="col-lg-3" align="left">
					
					
					<div class="col-lg-12 col-md-12 col-sm-12" align="left">
						<span class="tm-section-title" style="font-size:25px; border-bottom:1px solid #ccc;"><b>오락거리 유형</b></span>
						<br>
						<input type="radio" class="gameSearch" id="festival" name="festivalgroup" style="width:15px; height:15px;"/>
						<label for="festival" class="gameSearchText">&nbsp;&nbsp;축제</label><br>
						<input type="radio" class="gameSearch" id="landmark" name="festivalgroup" style="width:15px; height:15px;"/>
						<label for="landmark" class="gameSearchText">&nbsp;&nbsp;랜드마크</label><br>
						<input type="radio" class="gameSearch" id="shopping" name="festivalgroup" style="width:15px; height:15px;"/>
						<label for="shopping" class="gameSearchText">&nbsp;&nbsp;쇼핑</label><br>
						<input type="radio" class="gameSearch" id="musium" name="festivalgroup" style="width:15px; height:15px;"/>
						<label for="musium" class="gameSearchText">&nbsp;&nbsp;박물관</label><br>
						<input type="radio" class="gameSearch" id="amusmentPark" name="festivalgroup" style="width:15px; height:15px;"/>
						<label for="amusmentPark" class="gameSearchText">&nbsp;&nbsp;놀이공원</label><br>
						<input type="radio" class="gameSearch" id="spar" name="festivalgroup" style="width:15px; height:15px;"/>
						<label for="spar" class="gameSearchText">&nbsp;&nbsp;스파</label><br>
						<input type="radio" class="gameSearch" id="zoo" name="festivalgroup" style="width:15px; height:15px;"/>
						<label for="zoo" class="gameSearchText">&nbsp;&nbsp;동물원/아쿠아리움</label><br>
					</div>
					
					<br><br>
					<!-- 축제 선택시에만 일자 고르는 select-option 나오도록 -->
					<script>
					
					var areaCode = ${param.areaCode};
					var sigunguCode = ${param.sigunguCode};
					var contenttypeid = ${param.contenttypeid};
					var pageNo = ${param.pageNo};
					
					function searchGamePage(){
						if(sigunguCode == 0){
							sigunguCode = "";
						}
						$.ajax({
							url:"searchAreaGame.sub",
							type:"GET",
							data:{areaCode:areaCode, sigunguCode:sigunguCode, contenttypeid:contenttypeid},
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
										output += "<img src="+myData.firstimage+" alt='image' class='img-responsive1'/>";
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
					
					function btnGood(contenttypeid, contentid){
						console.log(contenttypeid);
						console.log(contentid);
						$.ajax({
							url:"dibsGame.good",
							type:"GET",
							data:{contenttypeid:contenttypeid, contentid:contentid},
							success:function(data){
								if(data > 0){
									deleteDibsGame(contentid);
								}else{
									insertDibsGame(contentid);
								}
							}
						});
					}
					
					function insertDibsGame(contentid){
						$.ajax({
							url:"insertDibsGame.good",
							type:"get",
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
					
					function deleteDibsGame(contentid){
						$.ajax({
							url:"deleteDibsGame.good",
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
					
					function detailView(contentid, contenttypeid){
						location.href="${contextPath}/detailGame?contentid="+contentid+"&contenttypeid="+contenttypeid;
					}
					
						$(function(){
							searchGamePage();
							
							$(".festivalSearchArea").hide();
							
							$("input[name=festivalgroup]").click(function(){
								if($("#festival").is(":checked") == true){
									$(".festivalSearchArea").show();
								}else{
									$(".festivalSearchArea").hide();
								}
							});
						});
						
						if(areaCode == 1){
							if(contenttypeid == 12){
								$(".tm-section-title1").text("서울 관광지");
							}else if(contenttypeid == 14){
								$(".tm-section-title1").text("서울 문화시설");
							}else if(contenttypeid == 15){
								$(".tm-section-title1").text("서울 축제공연행사");
							}else{
								$(".tm-section-title1").text("서울 레포츠");
							}
						}else if(areaCode == 2){
							if(contenttypeid == 12){
								$(".tm-section-title1").text("인천 관광지");
							}else if(contenttypeid == 14){
								$(".tm-section-title1").text("인천 문화시설");
							}else if(contenttypeid == 15){
								$(".tm-section-title1").text("인천 축제공연행사");
							}else{
								$(".tm-section-title1").text("인천 레포츠");
							}
						}else if(areaCode == 3){
							if(contenttypeid == 12){
								$(".tm-section-title1").text("대전 관광지");
							}else if(contenttypeid == 14){
								$(".tm-section-title1").text("대전 문화시설");
							}else if(contenttypeid == 15){
								$(".tm-section-title1").text("대전 축제공연행사");
							}else{
								$(".tm-section-title1").text("대전 레포츠");
							}
						}else if(areaCode == 4){
							if(contenttypeid == 12){
								$(".tm-section-title1").text("대구 관광지");
							}else if(contenttypeid == 14){
								$(".tm-section-title1").text("대구 문화시설");
							}else if(contenttypeid == 15){
								$(".tm-section-title1").text("대구 축제공연행사");
							}else{
								$(".tm-section-title1").text("대구 레포츠");
							}
						}else if(areaCode == 5){
							if(contenttypeid == 12){
								$(".tm-section-title1").text("광주 관광지");
							}else if(contenttypeid == 14){
								$(".tm-section-title1").text("광주 문화시설");
							}else if(contenttypeid == 15){
								$(".tm-section-title1").text("광주 축제공연행사");
							}else{
								$(".tm-section-title1").text("광주 레포츠");
							}
						}else if(areaCode == 6){
							if(contenttypeid == 12){
								$(".tm-section-title1").text("부산 관광지");
							}else if(contenttypeid == 14){
								$(".tm-section-title1").text("부산 문화시설");
							}else if(contenttypeid == 15){
								$(".tm-section-title1").text("부산 축제공연행사");
							}else{
								$(".tm-section-title1").text("부산 레포츠");
							}
						}else if(areaCode == 7){
							if(contenttypeid == 12){
								$(".tm-section-title1").text("울산 관광지");
							}else if(contenttypeid == 14){
								$(".tm-section-title1").text("울산 문화시설");
							}else if(contenttypeid == 15){
								$(".tm-section-title1").text("울산 축제공연행사");
							}else{
								$(".tm-section-title1").text("울산 레포츠");
							}
						}else if(areaCode == 8){
							if(contenttypeid == 12){
								$(".tm-section-title1").text("세종시 관광지");
							}else if(contenttypeid == 14){
								$(".tm-section-title1").text("세종시 문화시설");
							}else if(contenttypeid == 15){
								$(".tm-section-title1").text("세종시 축제공연행사");
							}else{
								$(".tm-section-title1").text("세종시 레포츠");
							}
						}else if(areaCode == 31){
							if(contenttypeid == 12){
								$(".tm-section-title1").text("경기도 관광지");
							}else if(contenttypeid == 14){
								$(".tm-section-title1").text("경기도 문화시설");
							}else if(contenttypeid == 15){
								$(".tm-section-title1").text("경기도 축제공연행사");
							}else{
								$(".tm-section-title1").text("경기도 레포츠");
							}
						}else if(areaCode == 32){
							if(contenttypeid == 12){
								$(".tm-section-title1").text("강원도 관광지");
							}else if(contenttypeid == 14){
								$(".tm-section-title1").text("강원도 문화시설");
							}else if(contenttypeid == 15){
								$(".tm-section-title1").text("강원도 축제공연행사");
							}else{
								$(".tm-section-title1").text("강원도 레포츠");
							}
						}else if(areaCode == 33){
							if(contenttypeid == 12){
								$(".tm-section-title1").text("충청북도 관광지");
							}else if(contenttypeid == 14){
								$(".tm-section-title1").text("충청북도 문화시설");
							}else if(contenttypeid == 15){
								$(".tm-section-title1").text("충청북도 축제공연행사");
							}else{
								$(".tm-section-title1").text("충청북도 레포츠");
							}
						}else if(areaCode == 34){
							if(contenttypeid == 12){
								$(".tm-section-title1").text("충청남도 관광지");
							}else if(contenttypeid == 14){
								$(".tm-section-title1").text("충청남도 문화시설");
							}else if(contenttypeid == 15){
								$(".tm-section-title1").text("충청남도 축제공연행사");
							}else{
								$(".tm-section-title1").text("충청남도 레포츠");
							}
						}else if(areaCode == 35){
							if(contenttypeid == 12){
								$(".tm-section-title1").text("경상북도 관광지");
							}else if(contenttypeid == 14){
								$(".tm-section-title1").text("경상북도 문화시설");
							}else if(contenttypeid == 15){
								$(".tm-section-title1").text("경상북도 축제공연행사");
							}else{
								$(".tm-section-title1").text("경상북도 레포츠");
							}
						}else if(areaCode == 36){
							if(contenttypeid == 12){
								$(".tm-section-title1").text("경상남도 관광지");
							}else if(contenttypeid == 14){
								$(".tm-section-title1").text("경상남도 문화시설");
							}else if(contenttypeid == 15){
								$(".tm-section-title1").text("경상남도 축제공연행사");
							}else{
								$(".tm-section-title1").text("경상남도 레포츠");
							}
						}else if(areaCode == 37){
							if(contenttypeid == 12){
								$(".tm-section-title1").text("전라북도 관광지");
							}else if(contenttypeid == 14){
								$(".tm-section-title1").text("전라북도 문화시설");
							}else if(contenttypeid == 15){
								$(".tm-section-title1").text("전라북도 축제공연행사");
							}else{
								$(".tm-section-title1").text("전라북도 레포츠");
							}
						}else if(areaCode == 38){
							if(contenttypeid == 12){
								$(".tm-section-title1").text("전라남도 관광지");
							}else if(contenttypeid == 14){
								$(".tm-section-title1").text("전라남도 문화시설");
							}else if(contenttypeid == 15){
								$(".tm-section-title1").text("전라남도 축제공연행사");
							}else{
								$(".tm-section-title1").text("전라남도 레포츠");
							}
						}else if(areaCode == 39){
							if(contenttypeid == 12){
								$(".tm-section-title1").text("제주도 관광지");
							}else if(contenttypeid == 14){
								$(".tm-section-title1").text("제주도 문화시설");
							}else if(contenttypeid == 15){
								$(".tm-section-title1").text("제주도 축제공연행사");
							}else{
								$(".tm-section-title1").text("제주도 레포츠");
							}
						}
					</script>
					
				</div>
				<div class="col-lg-9" align="right" id="viewArea">
					
				    <div class="tm-home-box-3" id="detailHover">
						<div class="tm-home-box-3-img-container" id="detailClick" onclick="location.href='${contextPath}/detailGame'">
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