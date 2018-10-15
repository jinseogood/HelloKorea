<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAf5xrmNMwmRYe-jdx4N3ItbdKDOJryoj4&callback=initialize" async defer></script>
<title>Hello Korea</title>
<style>
	#more{margin-top:5%;}
	.img-responsive2{width:254px; height:185px;}
</style>
</head>
<body>
	<!-- 지역의 모든것 Page. -->
	<jsp:include page="../common/searchMenubar.jsp"/>
	<jsp:include page="../common/searchSubmenubar.jsp"/>
	
	<!-- gray bg -->	
	<section class="container tm-home-section-1" id="more">
		<div class="row">
			<!-- slider -->
			<div class="flexslider flexslider-about effect2">
			  <ul class="slides">
			    <li>
			      <img src="${ contextPath }/resources/img/about-1.jpg" alt="image" />
			      <div class="flex-caption">
			      	<h2 class="slider-title"> </h2>
			      	<h3 class="slider-subtitle"></h3>
			      	<p class="slider-description">서울 소개입니다. 얄리얄리 얄라셩 얄라리 얄라</p>
			      </div>			      
			    </li>
			  </ul>
			</div>
		</div>
		<div class="tm-section-header section-margin-top">
			<div class="col-lg-4 col-md-3 col-sm-3"><hr></div>
			<div class="col-lg-4 col-md-6 col-sm-6"><h2 class="tm-section-title">여행지보기</h2></div>
			<div class="col-lg-4 col-md-3 col-sm-3"><hr></div>	
		</div>
		
		<div class="col-lg-12 col-md-12">
			<div id="google-map"></div>
		</div>
	</section>
		<script>
			var areaCode = ${param.areaCode};
			console.log("지역메인 areaCode : " + areaCode);
			
			if(areaCode == 1){
				$(".flex-caption .slider-title").text("서울");
			}else if(areaCode == 2){
				$(".flex-caption .slider-title").text("인천");
			}else if(areaCode == 3){
				$(".flex-caption .slider-title").text("대전");
			}else if(areaCode == 4){
				$(".flex-caption .slider-title").text("대구");
			}else if(areaCode == 5){
				$(".flex-caption .slider-title").text("광주");
			}else if(areaCode == 6){
				$(".flex-caption .slider-title").text("부산");
			}else if(areaCode == 7){
				$(".flex-caption .slider-title").text("울산");
			}else if(areaCode == 8){
				$(".flex-caption .slider-title").text("세종특별자치시");
			}else if(areaCode == 31){
				$(".flex-caption .slider-title").text("경기도");
			}else if(areaCode == 32){
				$(".flex-caption .slider-title").text("강원도");
			}else if(areaCode == 33){
				$(".flex-caption .slider-title").text("충청북도");
			}else if(areaCode == 34){
				$(".flex-caption .slider-title").text("충청남도");
			}else if(areaCode == 35){
				$(".flex-caption .slider-title").text("경상북도");
			}else if(areaCode == 36){
				$(".flex-caption .slider-title").text("경상남도");
			}else if(areaCode == 37){
				$(".flex-caption .slider-title").text("전라북도");
			}else if(areaCode == 38){
				$(".flex-caption .slider-title").text("전라남도");
			}else if(areaCode == 39){
				$(".flex-caption .slider-title").text("제주도");
			}
			
			$(function(){
				var sigunguCode = 1;
				aboutMainHotel(sigunguCode);
				aboutMainFood(sigunguCode);
				aboutMainGame(sigunguCode);
			});
			
			function aboutMainHotel(sigunguCode){
				$.ajax({
					url:"aboutMainSeoulHotel.sub",
					type:"GET",
					data:{areaCode:areaCode, sigunguCode:sigunguCode},
					dataType:"json",
					success:function(data){
						if(data.response.body.totalCount == 0){
							sigunguCode++;
							aboutMainHotel(sigunguCode);
						}else{
							console.log(data);
							var myData = data.response.body.items.item;
							var rowHotelArea = $("#rowHotelArea");
							rowHotelArea.html("");
							var output = "";
							var count = 0;
							for(var i = 0; i < myData.length; i++){
								count++;
								output = "";
								output += "<div class='col-lg-3 col-md-3 col-sm-6 col-xs-6 col-xxs-12'>";
								output += "<div class='tm-home-box-2'>";
								if(myData[i].firstimage == null){
									output += "<img src='${contextPath}/resources/img/noImage.gif' alt='image' class='img-responsive2'>";
								}else{
									output += "<img src="+myData[i].firstimage+" alt='image' class='img-responsive2'>";
								}
								output += "<h3>"+myData[i].title+"</h3>";
								output += "</div></div>";
								document.getElementById("rowHotelArea").innerHTML += output;
								if(count == 4){
									return;
								}
							}
						}
						
					},
					error:function(data){
						console.log(data);
					}
				});
			}
			
			function aboutMainFood(){
				$.ajax({
					url:"aboutMainSeoulFood.sub",
					type:"GET",
					data:{areaCode:areaCode},
					dataType:"json",
					success:function(data){
						console.log(data);
						var myData = data.response.body.items.item;
						var rowFoodArea = $("#rowFoodArea");
						rowFoodArea.html("");
						var output = "";
						var count = 0;
						for(var i = 0; i < myData.length; i++){
							count++;
							output = "";
							output += "<div class='col-lg-3 col-md-3 col-sm-6 col-xs-6 col-xxs-12'>";
							output += "<div class='tm-home-box-2'>";
							if(myData[i].firstimage == null){
								output += "<img src='${contextPath}/resources/img/noImage.gif' alt='image' class='img-responsive2'>";
							}else{
								output += "<img src="+myData[i].firstimage+" alt='image' class='img-responsive2'>";
							}
							output += "<h3>"+myData[i].title+"</h3>";
							output += "</div></div>";
							document.getElementById("rowFoodArea").innerHTML += output;
							if(count == 4){
								return;
							}
						}
					},
					error:function(data){
						console.log(data);
					}
				});
			}
			
			function aboutMainGame(){
				$.ajax({
					url:"aboutMainSeoulGame.sub",
					type:"GET",
					data:{areaCode:areaCode},
					dataType:"json",
					success:function(data){
						console.log(data);
						var myData = data.response.body.items.item;
						var rowGameArea = $("#rowGameArea");
						rowGameArea.html("");
						var output = "";
						var count = 0;
						for (var i = 0; i < myData.length; i++){
							count++;
							output = "";
							output += "<div class='col-lg-3 col-md-3 col-sm-6 col-xs-6 col-xxs-12'>";
							output += "<div class='tm-home-box-2'>";
							if(myData[i].firstimage == null){
								output += "<img src='${contextPath}/resources/img/noImage.gif' alt='image' class='img-responsive2'>";
							}else{
								output += "<img src="+myData[i].firstimage+" alt='image' class='img-responsive2'>";
							}
							output += "<h3>"+myData[i].title+"</h3>";
							output += "</div></div>";
							document.getElementById("rowGameArea").innerHTML += output;
							if(count == 4){
								return;
							}
						}
					},
					error:function(data){
						console.log(data);
					}
				});
			}
			
		
		/* Google map
      	------------------------------------------------*/
      	var map = '';
      	var center;

      	function initialize() {
	        var mapOptions = {
	          	zoom: 14,
	          	center: new google.maps.LatLng(37.769725, -122.462154),
	          	scrollwheel: false
        	};
        
	        map = new google.maps.Map(document.getElementById('google-map'),  mapOptions);

	        google.maps.event.addDomListener(map, 'idle', function() {
	          calculateCenter();
	        });
        
	        google.maps.event.addDomListener(window, 'resize', function() {
	          map.setCenter(center);
	        });
      	}

	    function calculateCenter() {
	        center = map.getCenter();
	    }

	    function loadGoogleMap(){
	        var script = document.createElement('script');
	        script.type = 'text/javascript';
	        script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&' + 'callback=initialize';
	        document.body.appendChild(script);
	    }
	
      	// DOM is ready
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

		  	// Flexslider
		  	$('.flexslider').flexslider({
		  		controlNav: false,
		  		directionNav: false
		  	});

		  	// Google Map
		  	//loadGoogleMap();
		  });
	</script>
	
	<section class="container tm-home-section-1" id="more">
		<div class="container">
			<div class="row">
				<div class="tm-section-header section-margin-top">
					<div class="col-lg-4 col-md-3 col-sm-3"><hr></div>
					<div class="col-lg-4 col-md-6 col-sm-6"><h2 class="tm-section-title">추천 호텔</h2></div>
					<div class="col-lg-4 col-md-3 col-sm-3"><hr></div>	
				</div>
				<div class="row" id="rowHotelArea">
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 col-xxs-12">
					<div class="tm-home-box-2">						
						<img src="${ contextPath }/resources/img/index-03.jpg" alt="image" class="img-responsive2">
						<h3>Proin Gravida Nibhvel Lorem Quis Bind</h3>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 col-xxs-12">
					<div class="tm-home-box-2">						
					    <img src="${ contextPath }/resources/img/index-04.jpg" alt="image" class="img-responsive2">
						<h3>Proin Gravida Nibhvel Lorem Quis Bind</h3>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 col-xxs-12">
					<div class="tm-home-box-2">						
					    <img src="${ contextPath }/resources/img/index-05.jpg" alt="image" class="img-responsive2">
						<h3>Proin Gravida Nibhvel Lorem Quis Bind</h3>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 col-xxs-12">
					<div class="tm-home-box-2 tm-home-box-2-right">						
					    <img src="${ contextPath }/resources/img/index-06.jpg" alt="image" class="img-responsive2">
						<h3>Proin Gravida Nibhvel Lorem Quis Bind</h3>
					</div>
				</div>
			</div>
		</div>
			
					
		</div>
		
		<div class="container">
			<div class="row">
				<div class="tm-section-header section-margin-top">
					<div class="col-lg-4 col-md-3 col-sm-3"><hr></div>
					<div class="col-lg-4 col-md-6 col-sm-6"><h2 class="tm-section-title">추천 음식점</h2></div>
					<div class="col-lg-4 col-md-3 col-sm-3"><hr></div>	
				</div>
				<div class="row" id="rowFoodArea">
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 col-xxs-12">
					<div class="tm-home-box-2">						
						<img src="${ contextPath }/resources/img/index-03.jpg" alt="image" class="img-responsive2">
						<h3>Proin Gravida Nibhvel Lorem Quis Bind</h3>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 col-xxs-12">
					<div class="tm-home-box-2">						
					    <img src="${ contextPath }/resources/img/index-04.jpg" alt="image" class="img-responsive2">
						<h3>Proin Gravida Nibhvel Lorem Quis Bind</h3>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 col-xxs-12">
					<div class="tm-home-box-2">						
					    <img src="${ contextPath }/resources/img/index-05.jpg" alt="image" class="img-responsive2">
						<h3>Proin Gravida Nibhvel Lorem Quis Bind</h3>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 col-xxs-12">
					<div class="tm-home-box-2 tm-home-box-2-right">						
					    <img src="${ contextPath }/resources/img/index-06.jpg" alt="image" class="img-responsive2">
						<h3>Proin Gravida Nibhvel Lorem Quis Bind</h3>
					</div>
				</div>
			</div>
		</div>
			
			
				
		</div>
		
		<div class="container">
			<div class="row">
				<div class="tm-section-header section-margin-top">
					<div class="col-lg-4 col-md-3 col-sm-3"><hr></div>
					<div class="col-lg-4 col-md-6 col-sm-6"><h2 class="tm-section-title">추천 오락거리</h2></div>
					<div class="col-lg-4 col-md-3 col-sm-3"><hr></div>	
				</div>
				<div class="row" id="rowGameArea">
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 col-xxs-12">
					<div class="tm-home-box-2">						
						<img src="${ contextPath }/resources/img/index-03.jpg" alt="image" class="img-responsive2">
						<h3>Proin Gravida Nibhvel Lorem Quis Bind</h3>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 col-xxs-12">
					<div class="tm-home-box-2">						
					    <img src="${ contextPath }/resources/img/index-04.jpg" alt="image" class="img-responsive2">
						<h3>Proin Gravida Nibhvel Lorem Quis Bind</h3>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 col-xxs-12">
					<div class="tm-home-box-2">						
					    <img src="${ contextPath }/resources/img/index-05.jpg" alt="image" class="img-responsive2">
						<h3>Proin Gravida Nibhvel Lorem Quis Bind</h3>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 col-xxs-12">
					<div class="tm-home-box-2 tm-home-box-2-right">						
					    <img src="${ contextPath }/resources/img/index-06.jpg" alt="image" class="img-responsive2">
						<h3>Proin Gravida Nibhvel Lorem Quis Bind</h3>
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