<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Hello Korea</title>
<style>
	.img-responsive0{width:346px; height:346.98px;}
	.img-responsive1{width:250px; height:225px;}
	.img-responsive2{width:100%; height:auto;}
	.themeBtn{width:250px; height:60px; background-color:#00aef0; color:white;}
	#themeText{height:164px; overflow:hidden; padding:30px 30px 54px;}
	.mainSearchArea{font-size:15px; width:150px; height:60px; background-color:#00aef0; color:white;}
	.subSearchArea{font-size:15px; width:150px; height:60px; background-color:#00aef0; color:white;}
	#searchAreaBox{position:absolute; text-align:center; top:18%; z-index:3;}
	.areaSearchBtn{height:60px;}
	.themeAreaSelect{cursor:pointer; color:blue;}
	.themeAreaSelect:hover{color:#00aef0;}
	.tm-home-box-2-description .box-3{width:244px;}
	.tm-home-box-2-link{cursor:pointer;}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<!-- Banner -->
	<section class="tm-banner">
		<!-- Flexslider -->
		<div id="searchAreaBox" class="col-lg-12 col-md-12 col-sm-12">
			<select class="mainSearchArea" name="searchCondition">
				<option value="0">지역선택</option>
				<option value="1">서울</option>
				<option value="2">인천</option>
				<option value="3">대전</option>
				<option value="4">대구</option>
				<option value="5">광주</option>
				<option value="6">부산</option>
				<option value="7">울산</option>
				<option value="8">세종특별자치시</option>
				<option value="31">경기도</option>
				<option value="32">강원도</option>
				<option value="33">충청북도</option>
				<option value="34">충청남도</option>
				<option value="35">경상북도</option>
				<option value="36">경상남도</option>
				<option value="37">전라북도</option>
				<option value="38">전라남도</option>
				<option value="39">제주도</option>
			</select>
			<select class="subSearchArea">
				<option value="0">분류</option>
				<option value="A05020100">한식</option>
				<option value="A05020200">서양식</option>
				<option value="A05020300">일식</option>
				<option value="A05020400">중식</option>
				<option value="A05020500">아시아식</option>
				<option value="A05020600">패밀리레스토랑</option>
				<option value="A05020700">이색음식점</option>
				<option value="A05020800">채식전문점</option>
				<option value="A05020900">바/카페</option>
				<option value="A05021000">클럽</option>
			</select>
			<input type="button" class="tm-banner-link areaSearchBtn" value="검색">
		</div>
		
		<div class="flexslider flexslider-banner">
		  <ul class="slides">
		    <li>
			    <div class="tm-banner-inner">
					<h1 class="tm-banner-title">Find <span class="tm-yellow-text">The Best</span> Place</h1>
					<p class="tm-banner-subtitle">For Your Holidays</p>
				</div>
				<img src="${ contextPath }/resources/img/banner-1.jpg" alt="Image" />	
		    </li>
		    <li>
			    <div class="tm-banner-inner">
					<h1 class="tm-banner-title">Lorem <span class="tm-yellow-text">Ipsum</span> Dolor</h1>
					<p class="tm-banner-subtitle">Wonderful Destinations</p>
					
				</div>
		      <img src="${ contextPath }/resources/img/banner-2.jpg" alt="Image" />
		    </li>
		    <li>
			    <div class="tm-banner-inner">
					<h1 class="tm-banner-title">Proin <span class="tm-yellow-text">Gravida</span> Nibhvell</h1>
					<p class="tm-banner-subtitle">Velit Auctor</p>
				</div>
		      <img src="${ contextPath }/resources/img/banner-3.jpg" alt="Image" />
		    </li>
		  </ul>
		</div>
	</section>
	<script>
	
		var areaCode = 0;
		var sigunguCode = 0;
		var cat3 = "";
		var pageNo = 1;
	
		$(function(){
			
			$(".areaSearchBtn").click(function(){
				areaCode = $(".mainSearchArea").val();
				cat3 = $(".subSearchArea").val();
				console.log("mainSearchAreaValue : " + areaCode);
				console.log("subSearchAreaValue : " + cat3);
				
				if(areaCode == 0){
					alert("지역을 선택해 주세요.");
				}else if(areaCode == 1){
					if(cat3 == 0){
						location.href="${contextPath}/areaAllView.main?areaCode="+areaCode;
					}else{
						location.href="${contextPath}/areaFoodView.main?areaCode="+areaCode+"&cat3="+cat3;
					}
				}else if(areaCode == 2){
					if(cat3 == 0){
						location.href="${contextPath}/areaAllView.main?areaCode="+areaCode;
					}else{
						location.href="${contextPath}/areaFoodView.main?areaCode="+areaCode+"&cat3="+cat3;
					}
				}else if(areaCode == 3){
					if(cat3 == 0){
						location.href="${contextPath}/areaAllView.main?areaCode="+areaCode;
					}else{
						location.href="${contextPath}/areaFoodView.main?areaCode="+areaCode+"&cat3="+cat3;
					}
				}else if(areaCode == 4){
					if(cat3 == 0){
						location.href="${contextPath}/areaAllView.main?areaCode="+areaCode;
					}else{
						location.href="${contextPath}/areaFoodView.main?areaCode="+areaCode+"&cat3="+cat3;
					}
				}else if(areaCode == 5){
					if(cat3 == 0){
						location.href="${contextPath}/areaAllView.main?areaCode="+areaCode;
					}else{
						location.href="${contextPath}/areaFoodView.main?areaCode="+areaCode+"&cat3="+cat3;
					}
				}else if(areaCode == 6){
					if(cat3 == 0){
						location.href="${contextPath}/areaAllView.main?areaCode="+areaCode;
					}else{
						location.href="${contextPath}/areaFoodView.main?areaCode="+areaCode+"&cat3="+cat3;
					}
				}else if(areaCode == 7){
					if(cat3 == 0){
						location.href="${contextPath}/areaAllView.main?areaCode="+areaCode;
					}else{
						location.href="${contextPath}/areaFoodView.main?areaCode="+areaCode+"&cat3="+cat3;
					}
				}else if(areaCode == 8){
					if(cat3 == 0){
						location.href="${contextPath}/areaAllView.main?areaCode="+areaCode;
					}else{
						location.href="${contextPath}/areaFoodView.main?areaCode="+areaCode+"&cat3="+cat3;
					}
				}else if(areaCode == 31){
					if(cat3 == 0){
						location.href="${contextPath}/areaAllView.main?areaCode="+areaCode;
					}else{
						location.href="${contextPath}/areaFoodView.main?areaCode="+areaCode+"&cat3="+cat3;
					}
				}else if(areaCode == 32){
					if(cat3 == 0){
						location.href="${contextPath}/areaAllView.main?areaCode="+areaCode;
					}else{
						location.href="${contextPath}/areaFoodView.main?areaCode="+areaCode+"&cat3="+cat3;
					}
				}else if(areaCode == 33){
					if(cat3 == 0){
						location.href="${contextPath}/areaAllView.main?areaCode="+areaCode;
					}else{
						location.href="${contextPath}/areaFoodView.main?areaCode="+areaCode+"&cat3="+cat3;
					}
				}else if(areaCode == 34){
					if(cat3 == 0){
						location.href="${contextPath}/areaAllView.main?areaCode="+areaCode;
					}else{
						location.href="${contextPath}/areaFoodView.main?areaCode="+areaCode+"&cat3="+cat3;
					}
				}else if(areaCode == 35){
					if(cat3 == 0){
						location.href="${contextPath}/areaAllView.main?areaCode="+areaCode;
					}else{
						location.href="${contextPath}/areaFoodView.main?areaCode="+areaCode+"&cat3="+cat3;
					}
				}else if(areaCode == 36){
					if(cat3 == 0){
						location.href="${contextPath}/areaAllView.main?areaCode="+areaCode;
					}else{
						location.href="${contextPath}/areaFoodView.main?areaCode="+areaCode+"&cat3="+cat3;
					}
				}else if(areaCode == 37){
					if(cat3 == 0){
						location.href="${contextPath}/areaAllView.main?areaCode="+areaCode;
					}else{
						location.href="${contextPath}/areaFoodView.main?areaCode="+areaCode+"&cat3="+cat3;
					}
				}else if(areaCode == 38){
					if(cat3 == 0){
						location.href="${contextPath}/areaAllView.main?areaCode="+areaCode;
					}else{
						location.href="${contextPath}/areaFoodView.main?areaCode="+areaCode+"&cat3="+cat3;
					}
				}else if(areaCode == 39){
					if(cat3 == 0){
						location.href="${contextPath}/areaAllView.main?areaCode="+areaCode;
					}else{
						location.href="${contextPath}/areaFoodView.main?areaCode="+areaCode+"&cat3="+cat3;
					}
				}
				
			});
			
			
				
			
			
			/* $.ajax({
				url:"mainHotel1.in",
				type:"GET",
				dataType:"json",
				success:function(data){
					var rowArea = $("#rowArea #rowArea1");
					rowArea.html("");
					var firstData = data.response.body.items.item;
					var output = "";
					output += "<div class='tm-home-box-1 tm-home-box-1-2 tm-home-box-1-center'>";
					output += "<img src="+firstData.firstimage+" alt='image' class='img-responsive0'>";
					output += "<a href='#'>";
					output += "<div class='tm-green-gradient-bg tm-city-price-container'>";
					output += "<span>"+firstData.title+"</span>";
					output += "</div></a></div>";
					rowArea.html(output);
				},
				error:function(data){
					console.log("1fail..");
					console.log(data);
				}
			});
			
			$.ajax({
				url:"mainHotel2.in",
				type:"GET",
				dataType:"json",
				success:function(data){
					var rowArea = $("#rowArea #rowArea2");
					rowArea.html("");
					var firstData = data.response.body.items.item;
					var output = "";
					output += "<div class='tm-home-box-1 tm-home-box-1-2 tm-home-box-1-center'>";
					output += "<img src="+firstData.firstimage+" alt='image' class='img-responsive0'>";
					output += "<a href='#'>";
					output += "<div class='tm-green-gradient-bg tm-city-price-container'>";
					output += "<span>"+firstData.title+"</span>";
					output += "</div></a></div>";
					rowArea.html(output);
				},
				error:function(data){
					console.log("fail..");
					console.log(data);
				}
			});
			
			$.ajax({
				url:"mainHotel3.in",
				type:"GET",
				dataType:"json",
				success:function(data){
					var rowArea = $("#rowArea #rowArea3");
					rowArea.html("");
					var firstData = data.response.body.items.item;
					var output = "";
					output += "<div class='tm-home-box-1 tm-home-box-1-2 tm-home-box-1-center'>";
					output += "<img src="+firstData.firstimage+" alt='image' class='img-responsive0'>";
					output += "<a href='#'>";
					output += "<div class='tm-green-gradient-bg tm-city-price-container'>";
					output += "<span>"+firstData.title+"</span>";
					output += "</div></a></div>";
					rowArea.html(output);
				},
				error:function(data){
					console.log("fail..");
					console.log(data);
				}
			}); */
		});
		
	</script>
	

	<!-- 상단 호텔 3개 부분 -->	
	<section class="container tm-home-section-1" id="more">
		<div class="row" id="rowArea">
			<div class="col-lg-4 col-md-4 col-sm-6" id="rowArea1">
				<div class="tm-home-box-1 tm-home-box-1-2 tm-home-box-1-center">
					<img src="${ contextPath }/resources/img/index-01.jpg" alt="image" class="img-responsive0">
					<a href="#">
						<div class="tm-green-gradient-bg tm-city-price-container">
							<span>ㅇㅇㅇ호텔</span>
							<span>00건의 리뷰</span>
						</div>	
					</a>			
				</div>				
			</div>

			<div class="col-lg-4 col-md-4 col-sm-6" id="rowArea2">
				<div class="tm-home-box-1 tm-home-box-1-2 tm-home-box-1-center">
					<img src="${ contextPath }/resources/img/index-01.jpg" alt="image" class="img-responsive0">
					<a href="#">
						<div class="tm-green-gradient-bg tm-city-price-container">
							<span>ㅇㅇㅇ호텔</span>
							<span>00건의 리뷰</span>
						</div>	
					</a>			
				</div>				
			</div>
			<div class="col-lg-4 col-md-4 col-sm-6" id="rowArea3">
				<div class="tm-home-box-1 tm-home-box-1-2 tm-home-box-1-right">
					<img src="${ contextPath }/resources/img/index-02.jpg" alt="image" class="img-responsive0">
					<a href="#">
						<div class="tm-red-gradient-bg tm-city-price-container">
							<span>ㅇㅇㅇ호텔</span>
							<span>00건의 리뷰</span>
						</div>	
					</a>					
				</div>				
			</div>
		</div>
	</section>
	
	
	<!-- 테마여행 view 부분 -->
	<section class="tm-white-bg section-padding-bottom">
	<div class="container">
		<div class="row">				
			<div class="section-margin-top">
				<div class="tm-section-header">
					<div class="col-lg-3 col-md-3 col-sm-3"><hr></div>
					<div class="col-lg-6 col-md-6 col-sm-6"><h2 class="tm-section-title">테마여행</h2></div>
					<div class="col-lg-3 col-md-3 col-sm-3"><hr></div>	
				</div>
				<div align="right">
					<a class="themeAreaSelect" onclick="shoppingTheme();">쇼핑</a> | 
					<a class="themeAreaSelect" onclick="beautyTheme();">뷰티</a> | 
					<a class="themeAreaSelect" onclick="classicTheme();">전통</a> | 
					<a class="themeAreaSelect" onclick="leisureTheme();">레져</a> | 
					<a class="themeAreaSelect" onclick="koreaWaveTheme();">한류</a>&nbsp;&nbsp;&nbsp;&nbsp;
				</div><br>
			</div>
			<div class="col-lg-6">
					<div class="tm-home-box-3" id="subContainer1">
						<div class="tm-home-box-3-img-container">
							<img src="${ contextPath }/resources/img/index-07.jpg" alt="image" class="img-responsive1">	
						</div>						
						<div class="tm-home-box-3-info">
							<p class="tm-home-box-3-description" id="themeText">Proin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum</p>
					        <div class="tm-home-box-2-container">
							<a href="#" class="tm-home-box-2-link"><i class="fa fa-heart tm-home-box-2-icon border-right"></i></a>
							<a href="#" class="tm-home-box-2-link"><span class="tm-home-box-2-description box-3" id="themeSpan">Travel</span></a>
							<a href="#" class="tm-home-box-2-link"><i class="fa fa-edit tm-home-box-2-icon border-left"></i></a>
						</div>
						</div>						
					</div>					
			     </div>
			     <div class="col-lg-6">
			        <div class="tm-home-box-3" id="subContainer2">
						<div class="tm-home-box-3-img-container">
							<img src="${ contextPath }/resources/img/index-08.jpg" alt="image" class="img-responsive1">	
						</div>						
						<div class="tm-home-box-3-info">
							<p class="tm-home-box-3-description">Proin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum</p>
					        <div class="tm-home-box-2-container">
							<a href="#" class="tm-home-box-2-link"><i class="fa fa-heart tm-home-box-2-icon border-right"></i></a>
							<a href="#" class="tm-home-box-2-link"><span class="tm-home-box-2-description box-3">Travel</span></a>
							<a href="#" class="tm-home-box-2-link"><i class="fa fa-edit tm-home-box-2-icon border-left"></i></a>
						</div>
						</div>						
					</div>
				</div>
				<div class="col-lg-6">
				    <div class="tm-home-box-3" id="subContainer3">
						<div class="tm-home-box-3-img-container">
							<img src="${ contextPath }/resources/img/index-09.jpg" alt="image" class="img-responsive1">	
						</div>						
						<div class="tm-home-box-3-info">
							<p class="tm-home-box-3-description">Proin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum</p>
					        <div class="tm-home-box-2-container">
							<a href="#" class="tm-home-box-2-link"><i class="fa fa-heart tm-home-box-2-icon border-right"></i></a>
							<a href="#" class="tm-home-box-2-link"><span class="tm-home-box-2-description box-3">Travel</span></a>
							<a href="#" class="tm-home-box-2-link"><i class="fa fa-edit tm-home-box-2-icon border-left"></i></a>
						</div>
						</div>						
					</div>
			    </div>
			    <div class="col-lg-6">
			        <div class="tm-home-box-3" id="subContainer4">
						<div class="tm-home-box-3-img-container">
							<img src="${ contextPath }/resources/img/index-10.jpg" alt="image" class="img-responsive1">	
						</div>						
						<div class="tm-home-box-3-info">
							<p class="tm-home-box-3-description">Proin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum</p>
					        <div class="tm-home-box-2-container">
							<a href="#" class="tm-home-box-2-link"><i class="fa fa-heart tm-home-box-2-icon border-right"></i></a>
							<a href="#" class="tm-home-box-2-link"><span class="tm-home-box-2-description box-3">Travel</span></a>
							<a href="#" class="tm-home-box-2-link"><i class="fa fa-edit tm-home-box-2-icon border-left"></i></a>
						</div>
						</div>						
					</div>
			   	</div>
			</div>		
		</div>
		<div class="col-lg-12" align="center">
			<input type="button" class="btn themeBtn" value="테마여행 더보기" onclick="location.href='${contextPath}/themeMain'">
		</div>
		
		<!-- <script>
		
			function btnGood(){
				var contentId = $(this).parent().children("input").val();
				console.log(contentId);
			}
		
			$(function(){
				$.ajax({
					url:"mainThemeShopping.tm",
					type:"GET",
					dataType:"json",
					success:function(data){
						console.log(data);
						var themeData = data.response.body.items.item;
						var containerArea = $("#subContainer1");
						containerArea.html("");
						var output = "";
						output += "<div class='tm-home-box-3-img-container'>";
						output += "<img src="+themeData.firstimage+" alt='image' class='img-responsive1'>";
						output += "</div>";
						output += "<div class='tm-home-box-3-info'>";
						if(themeData.overview.length > 1){
							var overviewText = "";
							overviewText = themeData.overview.substring(0, 110) + "...";
							output += "<p class='tm-home-box-3-description' id='themeText'>"+overviewText+"</p>";
						}
						output += "<div class='tm-home-box-2-container'>";
						output += "<input type='hidden' id='contentidValue' value="+themeData.contentid+">";
						output += "<a onclick='btnGood();' class='tm-home-box-2-link'><i class='fa fa-heart tm-home-box-2-icon border-right'></i></a>";
						output += "<a href='#' class='tm-home-box-2-link'><span class='tm-home-box-2-description box-3' style='width:244px;'>"+themeData.title+"</span>";
						output += "</div></div>";
						containerArea.html(output);
						console.log("컨텐츠아이디 : " + $("#contentidValue").val());
					},
					error:function(data){
						console.log("fail..");
						console.log(data);
					}
				});
				$.ajax({
					url:"mainThemeShopping2.tm",
					type:"GET",
					dataType:"json",
					success:function(data){
						console.log(data);
						var themeData = data.response.body.items.item;
						var containerArea = $("#subContainer2");
						containerArea.html("");
						var output = "";
						output += "<div class='tm-home-box-3-img-container'>";
						output += "<img src="+themeData.firstimage+" alt='image' class='img-responsive1'>";
						output += "</div>";
						output += "<div class='tm-home-box-3-info'>";
						if(themeData.overview.length > 1){
							var overviewText = "";
							overviewText = themeData.overview.substring(0, 110) + "...";
							output += "<p class='tm-home-box-3-description' id='themeText'>"+overviewText+"</p>";
						}
						output += "<div class='tm-home-box-2-container'>";
						output += "<a href='#' class='tm-home-box-2-link'><i class='fa fa-heart tm-home-box-2-icon border-right'></i></a>";
						output += "<a href='#' class='tm-home-box-2-link'><span class='tm-home-box-2-description box-3' style='width:244px;'>"+themeData.title+"</span>";
						output += "</div></div>";
						containerArea.html(output);
					},
					error:function(data){
						console.log(data);
					}
				});
				$.ajax({
					url:"mainThemeShopping3.tm",
					type:"GET",
					dataType:"json",
					success:function(data){
						console.log(data);
						var themeData = data.response.body.items.item;
						var containerArea = $("#subContainer3");
						containerArea.html("");
						var output = "";
						output += "<div class='tm-home-box-3-img-container'>";
						output += "<img src="+themeData.firstimage+" alt='image' class='img-responsive1'>";
						output += "</div>";
						output += "<div class='tm-home-box-3-info'>";
						if(themeData.overview.length > 1){
							var overviewText = "";
							overviewText = themeData.overview.substring(0, 110) + "...";
							output += "<p class='tm-home-box-3-description' id='themeText'>"+overviewText+"</p>";
						}
						output += "<div class='tm-home-box-2-container'>";
						output += "<a href='#' class='tm-home-box-2-link'><i class='fa fa-heart tm-home-box-2-icon border-right'></i></a>";
						output += "<a href='#' class='tm-home-box-2-link'><span class='tm-home-box-2-description box-3' style='width:244px;'>"+themeData.title+"</span>";
						output += "</div></div>";
						containerArea.html(output);
					},
					error:function(data){
						console.log(data);
					}
				});
				$.ajax({
					url:"mainThemeShopping4.tm",
					type:"GET",
					dataType:"json",
					success:function(data){
						console.log(data);
						var themeData = data.response.body.items.item;
						var containerArea = $("#subContainer4");
						containerArea.html("");
						var output = "";
						output += "<div class='tm-home-box-3-img-container'>";
						output += "<img src="+themeData.firstimage+" alt='image' class='img-responsive1'>";
						output += "</div>";
						output += "<div class='tm-home-box-3-info'>";
						if(themeData.overview.length > 1){
							var overviewText = "";
							overviewText = themeData.overview.substring(0, 110) + "...";
							output += "<p class='tm-home-box-3-description' id='themeText'>"+overviewText+"</p>";
						}
						output += "<div class='tm-home-box-2-container'>";
						output += "<a href='#' class='tm-home-box-2-link'><i class='fa fa-heart tm-home-box-2-icon border-right'></i></a>";
						output += "<a href='#' class='tm-home-box-2-link'><span class='tm-home-box-2-description box-3' style='width:244px;'>"+themeData.title+"</span>";
						output += "</div></div>";
						containerArea.html(output);
					},
					error:function(data){
						console.log(data);
					}
				});
				
			});
			
			function shoppingTheme(){
				$.ajax({
					url:"mainThemeShopping.tm",
					type:"GET",
					dataType:"json",
					success:function(data){
						console.log(data);
						var themeData = data.response.body.items.item;
						var containerArea = $("#subContainer1");
						containerArea.html("");
						var output = "";
						output += "<div class='tm-home-box-3-img-container'>";
						output += "<img src="+themeData.firstimage+" alt='image' class='img-responsive1'>";
						output += "</div>";
						output += "<div class='tm-home-box-3-info'>";
						if(themeData.overview.length > 1){
							var overviewText = "";
							overviewText = themeData.overview.substring(0, 110) + "...";
							output += "<p class='tm-home-box-3-description' id='themeText'>"+overviewText+"</p>";
						}
						output += "<div class='tm-home-box-2-container'>";
						output += "<a href='#' class='tm-home-box-2-link'><i class='fa fa-heart tm-home-box-2-icon border-right'></i></a>";
						output += "<a href='#' class='tm-home-box-2-link'><span class='tm-home-box-2-description box-3' style='width:244px;'>"+themeData.title+"</span>";
						output += "</div></div>";
						containerArea.html(output);
					},
					error:function(data){
						console.log("fail..");
						console.log(data);
					}
				});
				$.ajax({
					url:"mainThemeShopping2.tm",
					type:"GET",
					dataType:"json",
					success:function(data){
						console.log(data);
						var themeData = data.response.body.items.item;
						var containerArea = $("#subContainer2");
						containerArea.html("");
						var output = "";
						output += "<div class='tm-home-box-3-img-container'>";
						output += "<img src="+themeData.firstimage+" alt='image' class='img-responsive1'>";
						output += "</div>";
						output += "<div class='tm-home-box-3-info'>";
						if(themeData.overview.length > 1){
							var overviewText = "";
							overviewText = themeData.overview.substring(0, 110) + "...";
							output += "<p class='tm-home-box-3-description' id='themeText'>"+overviewText+"</p>";
						}
						output += "<div class='tm-home-box-2-container'>";
						output += "<a href='#' class='tm-home-box-2-link'><i class='fa fa-heart tm-home-box-2-icon border-right'></i></a>";
						output += "<a href='#' class='tm-home-box-2-link'><span class='tm-home-box-2-description box-3' style='width:244px;'>"+themeData.title+"</span>";
						output += "</div></div>";
						containerArea.html(output);
					},
					error:function(data){
						console.log(data);
					}
				});
				$.ajax({
					url:"mainThemeShopping3.tm",
					type:"GET",
					dataType:"json",
					success:function(data){
						console.log(data);
						var themeData = data.response.body.items.item;
						var containerArea = $("#subContainer3");
						containerArea.html("");
						var output = "";
						output += "<div class='tm-home-box-3-img-container'>";
						output += "<img src="+themeData.firstimage+" alt='image' class='img-responsive1'>";
						output += "</div>";
						output += "<div class='tm-home-box-3-info'>";
						if(themeData.overview.length > 1){
							var overviewText = "";
							overviewText = themeData.overview.substring(0, 110) + "...";
							output += "<p class='tm-home-box-3-description' id='themeText'>"+overviewText+"</p>";
						}
						output += "<div class='tm-home-box-2-container'>";
						output += "<a href='#' class='tm-home-box-2-link'><i class='fa fa-heart tm-home-box-2-icon border-right'></i></a>";
						output += "<a href='#' class='tm-home-box-2-link'><span class='tm-home-box-2-description box-3' style='width:244px;'>"+themeData.title+"</span>";
						output += "</div></div>";
						containerArea.html(output);
					},
					error:function(data){
						console.log(data);
					}
				});
				$.ajax({
					url:"mainThemeShopping4.tm",
					type:"GET",
					dataType:"json",
					success:function(data){
						console.log(data);
						var themeData = data.response.body.items.item;
						var containerArea = $("#subContainer4");
						containerArea.html("");
						var output = "";
						output += "<div class='tm-home-box-3-img-container'>";
						output += "<img src="+themeData.firstimage+" alt='image' class='img-responsive1'>";
						output += "</div>";
						output += "<div class='tm-home-box-3-info'>";
						if(themeData.overview.length > 1){
							var overviewText = "";
							overviewText = themeData.overview.substring(0, 110) + "...";
							output += "<p class='tm-home-box-3-description' id='themeText'>"+overviewText+"</p>";
						}
						output += "<div class='tm-home-box-2-container'>";
						output += "<a href='#' class='tm-home-box-2-link'><i class='fa fa-heart tm-home-box-2-icon border-right'></i></a>";
						output += "<a href='#' class='tm-home-box-2-link'><span class='tm-home-box-2-description box-3' style='width:244px;'>"+themeData.title+"</span>";
						output += "</div></div>";
						containerArea.html(output);
					},
					error:function(data){
						console.log(data);
					}
				});
			}
			
			function beautyTheme(){
				$.ajax({
					url:"mainThemeBeauty.tm",
					type:"GET",
					dataType:"json",
					success:function(data){
						console.log(data);
						var themeData = data.response.body.items.item;
						var containerArea = $("#subContainer1");
						containerArea.html("");
						var output = "";
						output += "<div class='tm-home-box-3-img-container'>";
						output += "<img src="+themeData.firstimage+" alt='image' class='img-responsive1'>";
						output += "</div>";
						output += "<div class='tm-home-box-3-info'>";
						if(themeData.overview.length > 1){
							var overviewText = "";
							overviewText = themeData.overview.substring(0, 110) + "...";
							output += "<p class='tm-home-box-3-description' id='themeText'>"+overviewText+"</p>";
						}
						output += "<div class='tm-home-box-2-container'>";
						output += "<a href='#' class='tm-home-box-2-link'><i class='fa fa-heart tm-home-box-2-icon border-right'></i></a>";
						output += "<a href='#' class='tm-home-box-2-link'><span class='tm-home-box-2-description box-3' style='width:244px;'>"+themeData.title+"</span>";
						output += "</div></div>";
						containerArea.html(output);
					},
					error:function(data){
						console.log("fail..");
						console.log(data);
					}
				});
				$.ajax({
					url:"mainThemeBeauty2.tm",
					type:"GET",
					dataType:"json",
					success:function(data){
						console.log(data);
						var themeData = data.response.body.items.item;
						var containerArea = $("#subContainer2");
						containerArea.html("");
						var output = "";
						output += "<div class='tm-home-box-3-img-container'>";
						output += "<img src="+themeData.firstimage+" alt='image' class='img-responsive1'>";
						output += "</div>";
						output += "<div class='tm-home-box-3-info'>";
						if(themeData.overview.length > 1){
							var overviewText = "";
							overviewText = themeData.overview.substring(0, 110) + "...";
							output += "<p class='tm-home-box-3-description' id='themeText'>"+overviewText+"</p>";
						}
						output += "<div class='tm-home-box-2-container'>";
						output += "<a href='#' class='tm-home-box-2-link'><i class='fa fa-heart tm-home-box-2-icon border-right'></i></a>";
						output += "<a href='#' class='tm-home-box-2-link'><span class='tm-home-box-2-description box-3' style='width:244px;'>"+themeData.title+"</span>";
						output += "</div></div>";
						containerArea.html(output);
					},
					error:function(data){
						console.log(data);
					}
				});
				$.ajax({
					url:"mainThemeBeauty3.tm",
					type:"GET",
					dataType:"json",
					success:function(data){
						console.log(data);
						var themeData = data.response.body.items.item;
						var containerArea = $("#subContainer3");
						containerArea.html("");
						var output = "";
						output += "<div class='tm-home-box-3-img-container'>";
						output += "<img src="+themeData.firstimage+" alt='image' class='img-responsive1'>";
						output += "</div>";
						output += "<div class='tm-home-box-3-info'>";
						if(themeData.overview.length > 1){
							var overviewText = "";
							overviewText = themeData.overview.substring(0, 110) + "...";
							output += "<p class='tm-home-box-3-description' id='themeText'>"+overviewText+"</p>";
						}
						output += "<div class='tm-home-box-2-container'>";
						output += "<a href='#' class='tm-home-box-2-link'><i class='fa fa-heart tm-home-box-2-icon border-right'></i></a>";
						output += "<a href='#' class='tm-home-box-2-link'><span class='tm-home-box-2-description box-3' style='width:244px;'>"+themeData.title+"</span>";
						output += "</div></div>";
						containerArea.html(output);
					},
					error:function(data){
						console.log(data);
					}
				});
				$.ajax({
					url:"mainThemeBeauty4.tm",
					type:"GET",
					dataType:"json",
					success:function(data){
						console.log(data);
						var themeData = data.response.body.items.item;
						var containerArea = $("#subContainer4");
						containerArea.html("");
						var output = "";
						output += "<div class='tm-home-box-3-img-container'>";
						output += "<img src="+themeData.firstimage+" alt='image' class='img-responsive1'>";
						output += "</div>";
						output += "<div class='tm-home-box-3-info'>";
						if(themeData.overview.length > 1){
							var overviewText = "";
							overviewText = themeData.overview.substring(0, 110) + "...";
							output += "<p class='tm-home-box-3-description' id='themeText'>"+overviewText+"</p>";
						}
						output += "<div class='tm-home-box-2-container'>";
						output += "<a href='#' class='tm-home-box-2-link'><i class='fa fa-heart tm-home-box-2-icon border-right'></i></a>";
						output += "<a href='#' class='tm-home-box-2-link'><span class='tm-home-box-2-description box-3' style='width:244px;'>"+themeData.title+"</span>";
						output += "</div></div>";
						containerArea.html(output);
					},
					error:function(data){
						console.log(data);
					}
				});
			}
			
			function classicTheme(){
				$.ajax({
					url:"mainThemeClassic.tm",
					type:"GET",
					dataType:"json",
					success:function(data){
						console.log(data);
						var themeData = data.response.body.items.item;
						var containerArea = $("#subContainer1");
						containerArea.html("");
						var output = "";
						output += "<div class='tm-home-box-3-img-container'>";
						output += "<img src="+themeData.firstimage+" alt='image' class='img-responsive1'>";
						output += "</div>";
						output += "<div class='tm-home-box-3-info'>";
						if(themeData.overview.length > 1){
							var overviewText = "";
							overviewText = themeData.overview.substring(0, 110) + "...";
							output += "<p class='tm-home-box-3-description' id='themeText'>"+overviewText+"</p>";
						}
						output += "<div class='tm-home-box-2-container'>";
						output += "<a href='#' class='tm-home-box-2-link'><i class='fa fa-heart tm-home-box-2-icon border-right'></i></a>";
						output += "<a href='#' class='tm-home-box-2-link'><span class='tm-home-box-2-description box-3' style='width:244px;'>"+themeData.title+"</span>";
						output += "</div></div>";
						containerArea.html(output);
					},
					error:function(data){
						console.log("fail..");
						console.log(data);
					}
				});
				$.ajax({
					url:"mainThemeClassic2.tm",
					type:"GET",
					dataType:"json",
					success:function(data){
						console.log(data);
						var themeData = data.response.body.items.item;
						var containerArea = $("#subContainer2");
						containerArea.html("");
						var output = "";
						output += "<div class='tm-home-box-3-img-container'>";
						output += "<img src="+themeData.firstimage+" alt='image' class='img-responsive1'>";
						output += "</div>";
						output += "<div class='tm-home-box-3-info'>";
						if(themeData.overview.length > 1){
							var overviewText = "";
							overviewText = themeData.overview.substring(0, 110) + "...";
							output += "<p class='tm-home-box-3-description' id='themeText'>"+overviewText+"</p>";
						}
						output += "<div class='tm-home-box-2-container'>";
						output += "<a href='#' class='tm-home-box-2-link'><i class='fa fa-heart tm-home-box-2-icon border-right'></i></a>";
						output += "<a href='#' class='tm-home-box-2-link'><span class='tm-home-box-2-description box-3' style='width:244px;'>"+themeData.title+"</span>";
						output += "</div></div>";
						containerArea.html(output);
					},
					error:function(data){
						console.log(data);
					}
				});
				$.ajax({
					url:"mainThemeClassic3.tm",
					type:"GET",
					dataType:"json",
					success:function(data){
						console.log(data);
						var themeData = data.response.body.items.item;
						var containerArea = $("#subContainer3");
						containerArea.html("");
						var output = "";
						output += "<div class='tm-home-box-3-img-container'>";
						output += "<img src="+themeData.firstimage+" alt='image' class='img-responsive1'>";
						output += "</div>";
						output += "<div class='tm-home-box-3-info'>";
						if(themeData.overview.length > 1){
							var overviewText = "";
							overviewText = themeData.overview.substring(0, 110) + "...";
							output += "<p class='tm-home-box-3-description' id='themeText'>"+overviewText+"</p>";
						}
						output += "<div class='tm-home-box-2-container'>";
						output += "<a href='#' class='tm-home-box-2-link'><i class='fa fa-heart tm-home-box-2-icon border-right'></i></a>";
						output += "<a href='#' class='tm-home-box-2-link'><span class='tm-home-box-2-description box-3' style='width:244px;'>"+themeData.title+"</span>";
						output += "</div></div>";
						containerArea.html(output);
					},
					error:function(data){
						console.log(data);
					}
				});
				$.ajax({
					url:"mainThemeClassic4.tm",
					type:"GET",
					dataType:"json",
					success:function(data){
						console.log(data);
						var themeData = data.response.body.items.item;
						var containerArea = $("#subContainer4");
						containerArea.html("");
						var output = "";
						output += "<div class='tm-home-box-3-img-container'>";
						output += "<img src="+themeData.firstimage+" alt='image' class='img-responsive1'>";
						output += "</div>";
						output += "<div class='tm-home-box-3-info'>";
						if(themeData.overview.length > 1){
							var overviewText = "";
							overviewText = themeData.overview.substring(0, 110) + "...";
							output += "<p class='tm-home-box-3-description' id='themeText'>"+overviewText+"</p>";
						}
						output += "<div class='tm-home-box-2-container'>";
						output += "<a href='#' class='tm-home-box-2-link'><i class='fa fa-heart tm-home-box-2-icon border-right'></i></a>";
						output += "<a href='#' class='tm-home-box-2-link'><span class='tm-home-box-2-description box-3' style='width:244px;'>"+themeData.title+"</span>";
						output += "</div></div>";
						containerArea.html(output);
					},
					error:function(data){
						console.log(data);
					}
				});
			}
			
			function leisureTheme(){
				$.ajax({
					url:"mainThemeLeisure.tm",
					type:"GET",
					dataType:"json",
					success:function(data){
						console.log(data);
						var themeData = data.response.body.items.item;
						var containerArea = $("#subContainer1");
						containerArea.html("");
						var output = "";
						output += "<div class='tm-home-box-3-img-container'>";
						output += "<img src="+themeData.firstimage+" alt='image' class='img-responsive1'>";
						output += "</div>";
						output += "<div class='tm-home-box-3-info'>";
						if(themeData.overview.length > 1){
							var overviewText = "";
							overviewText = themeData.overview.substring(0, 110) + "...";
							output += "<p class='tm-home-box-3-description' id='themeText'>"+overviewText+"</p>";
						}
						output += "<div class='tm-home-box-2-container'>";
						output += "<a href='#' class='tm-home-box-2-link'><i class='fa fa-heart tm-home-box-2-icon border-right'></i></a>";
						output += "<a href='#' class='tm-home-box-2-link'><span class='tm-home-box-2-description box-3' style='width:244px;'>"+themeData.title+"</span>";
						output += "</div></div>";
						containerArea.html(output);
					},
					error:function(data){
						console.log(data);
					}
				});
				$.ajax({
					url:"mainThemeLeisure2.tm",
					type:"GET",
					dataType:"json",
					success:function(data){
						console.log(data);
						var themeData = data.response.body.items.item;
						var containerArea = $("#subContainer2");
						containerArea.html("");
						var output = "";
						output += "<div class='tm-home-box-3-img-container'>";
						output += "<img src="+themeData.firstimage+" alt='image' class='img-responsive1'>";
						output += "</div>";
						output += "<div class='tm-home-box-3-info'>";
						if(themeData.overview.length > 1){
							var overviewText = "";
							overviewText = themeData.overview.substring(0, 110) + "...";
							output += "<p class='tm-home-box-3-description' id='themeText'>"+overviewText+"</p>";
						}
						output += "<div class='tm-home-box-2-container'>";
						output += "<a href='#' class='tm-home-box-2-link'><i class='fa fa-heart tm-home-box-2-icon border-right'></i></a>";
						output += "<a href='#' class='tm-home-box-2-link'><span class='tm-home-box-2-description box-3' style='width:244px;'>"+themeData.title+"</span>";
						output += "</div></div>";
						containerArea.html(output);
					},
					error:function(data){
						console.log(data);
					}
				});
				$.ajax({
					url:"mainThemeLeisure3.tm",
					type:"GET",
					dataType:"json",
					success:function(data){
						console.log(data);
						var themeData = data.response.body.items.item;
						var containerArea = $("#subContainer3");
						containerArea.html("");
						var output = "";
						output += "<div class='tm-home-box-3-img-container'>";
						output += "<img src="+themeData.firstimage+" alt='image' class='img-responsive1'>";
						output += "</div>";
						output += "<div class='tm-home-box-3-info'>";
						if(themeData.overview.length > 1){
							var overviewText = "";
							overviewText = themeData.overview.substring(0, 110) + "...";
							output += "<p class='tm-home-box-3-description' id='themeText'>"+overviewText+"</p>";
						}
						output += "<div class='tm-home-box-2-container'>";
						output += "<a href='#' class='tm-home-box-2-link'><i class='fa fa-heart tm-home-box-2-icon border-right'></i></a>";
						output += "<a href='#' class='tm-home-box-2-link'><span class='tm-home-box-2-description box-3' style='width:244px;'>"+themeData.title+"</span>";
						output += "</div></div>";
						containerArea.html(output);
					},
					error:function(data){
						console.log(data);
					}
				});
				$.ajax({
					url:"mainThemeLeisure4.tm",
					type:"GET",
					dataType:"json",
					success:function(data){
						console.log(data);
						var themeData = data.response.body.items.item;
						var containerArea = $("#subContainer4");
						containerArea.html("");
						var output = "";
						output += "<div class='tm-home-box-3-img-container'>";
						output += "<img src="+themeData.firstimage+" alt='image' class='img-responsive1'>";
						output += "</div>";
						output += "<div class='tm-home-box-3-info'>";
						if(themeData.overview.length > 1){
							var overviewText = "";
							overviewText = themeData.overview.substring(0, 110) + "...";
							output += "<p class='tm-home-box-3-description' id='themeText'>"+overviewText+"</p>";
						}
						output += "<div class='tm-home-box-2-container'>";
						output += "<a href='#' class='tm-home-box-2-link'><i class='fa fa-heart tm-home-box-2-icon border-right'></i></a>";
						output += "<a href='#' class='tm-home-box-2-link'><span class='tm-home-box-2-description box-3' style='width:244px;'>"+themeData.title+"</span>";
						output += "</div></div>";
						containerArea.html(output);
					},
					error:function(data){
						console.log(data);
					}
				});
			}
			
			
		</script> -->
	</section>		
	
	<!-- white bg -->
	<section class="tm-white-bg section-padding-bottom">
		<div class="container">
			<div class="row">
				<div class="tm-section-header section-margin-top">
					<div class="col-lg-4 col-md-3 col-sm-3"><hr></div>
					<div class="col-lg-4 col-md-6 col-sm-6"><h2 class="tm-section-title">내용미정(커스터마이징 뷰 예정)</h2></div>
					<div class="col-lg-4 col-md-3 col-sm-3"><hr></div>	
				</div>
				<div class="row">
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 col-xxs-12">
					<div class="tm-home-box-2">						
						<img src="${ contextPath }/resources/img/index-03.jpg" alt="image" class="img-responsive2">
						<h3>Proin Gravida Nibhvel Lorem Quis Bind</h3>
						<p class="tm-date">28 March 2016</p>
						<div class="tm-home-box-2-container">
							<a href="#" class="tm-home-box-2-link"><i class="fa fa-heart tm-home-box-2-icon border-right"></i></a>
							<a href="#" class="tm-home-box-2-link"><span class="tm-home-box-2-description">Travel</span></a>
							<a href="#" class="tm-home-box-2-link"><i class="fa fa-edit tm-home-box-2-icon border-left"></i></a>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 col-xxs-12">
					<div class="tm-home-box-2">						
					    <img src="${ contextPath }/resources/img/index-04.jpg" alt="image" class="img-responsive2">
						<h3>Proin Gravida Nibhvel Lorem Quis Bind</h3>
						<p class="tm-date">26 March 2016</p>
						<div class="tm-home-box-2-container">
							<a href="#" class="tm-home-box-2-link"><i class="fa fa-heart tm-home-box-2-icon border-right"></i></a>
							<a href="#" class="tm-home-box-2-link"><span class="tm-home-box-2-description">Travel</span></a>
							<a href="#" class="tm-home-box-2-link"><i class="fa fa-edit tm-home-box-2-icon border-left"></i></a>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 col-xxs-12">
					<div class="tm-home-box-2">						
					    <img src="${ contextPath }/resources/img/index-05.jpg" alt="image" class="img-responsive2">
						<h3>Proin Gravida Nibhvel Lorem Quis Bind</h3>
						<p class="tm-date">24 March 2016</p>
						<div class="tm-home-box-2-container">
							<a href="#" class="tm-home-box-2-link"><i class="fa fa-heart tm-home-box-2-icon border-right"></i></a>
							<a href="#" class="tm-home-box-2-link"><span class="tm-home-box-2-description">Travel</span></a>
							<a href="#" class="tm-home-box-2-link"><i class="fa fa-edit tm-home-box-2-icon border-left"></i></a>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 col-xxs-12">
					<div class="tm-home-box-2 tm-home-box-2-right">						
					    <img src="${ contextPath }/resources/img/index-06.jpg" alt="image" class="img-responsive2">
						<h3>Proin Gravida Nibhvel Lorem Quis Bind</h3>
						<p class="tm-date">22 March 2016</p>
						<div class="tm-home-box-2-container">
							<a href="#" class="tm-home-box-2-link"><i class="fa fa-heart tm-home-box-2-icon border-right"></i></a>
							<a href="#" class="tm-home-box-2-link"><span class="tm-home-box-2-description">Travel</span></a>
							<a href="#" class="tm-home-box-2-link"><i class="fa fa-edit tm-home-box-2-icon border-left"></i></a>
						</div>
					</div>
				</div>
			</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<p class="home-description">Holiday is free Bootstrap v3.3.5 responsive template for tour and travel websites. You can download and use this layout for any purpose. You do not need to provide a credit link to us. If you have any question, feel free to <a href="http://www.facebook.com/templatemo" target="_parent">contact us</a>. Credit goes to <a rel="nofollow" href="http://unsplash.com" target="_parent">Unspash</a> for images used in this template.</p>					
				</div>
			</div>		
		</div>
	</section>
	
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
		// HTML document is loaded. DOM is ready.
		$(function() {

			$('#hotelCarTabs a').click(function (e) {
			  e.preventDefault()
			  $(this).tab('show')
			})

        	$('.date').datetimepicker({
            	format: 'MM/DD/YYYY'
            });
            $('.date-time').datetimepicker();

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
		
		// Load Flexslider when everything is loaded.
		$(window).load(function() {	  		
			// Vimeo API nonsense

/*
			  var player = document.getElementById('player_1');
			  $f(player).addEvent('ready', ready);
			 
			  function addEvent(element, eventName, callback) {
			    if (element.addEventListener) {
			      element.addEventListener(eventName, callback, false)
			    } else {
			      element.attachEvent(eventName, callback, false);
			    }
			  }
			 
			  function ready(player_id) {
			    var froogaloop = $f(player_id);
			    froogaloop.addEvent('play', function(data) {
			      $('.flexslider').flexslider("pause");
			    });
			    froogaloop.addEvent('pause', function(data) {
			      $('.flexslider').flexslider("play");
			    });
			  }
*/

			 
			 
			  // Call fitVid before FlexSlider initializes, so the proper initial height can be retrieved.
/*

			  $(".flexslider")
			    .fitVids()
			    .flexslider({
			      animation: "slide",
			      useCSS: false,
			      animationLoop: false,
			      smoothHeight: true,
			      controlNav: false,
			      before: function(slider){
			        $f(player).api('pause');
			      }
			  });
*/


			  

//	For images only
		    $('.flexslider').flexslider({
			    controlNav: false
		    });


	  	});
	</script>
</body>
</html>