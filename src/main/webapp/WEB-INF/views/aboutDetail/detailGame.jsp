<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAf5xrmNMwmRYe-jdx4N3ItbdKDOJryoj4&callback=initialize" async defer></script>
<title>Hello Korea</title>
<style>
	#more{margin-top:5%;}
	/* .firstImgArea{display:inline-block;} */
	.imgArea{display:block;}
	.secondImgArea{display:inline-block;}
	.firstImg{width:528px; height:435px;}
	.secondImg{width:262.5px; height:217px; display:inline-block;}
	.contentArea{display:block;}
	.detailHead{text-align:center; width:280px; height:40px; background-color:lightgray;}
	.detailContent{height:350px; text-align:center;}
	.detailBottom{height:50px;}
	.tm-about-box-1{padding:10px 10px;}
</style>
</head>
<body>
	<!-- 지역의 숙박상세 Page. -->
	<jsp:include page="../common/searchMenubar.jsp"/>
	<jsp:include page="../common/searchSubmenubar.jsp"/>
	

	<!-- gray bg -->	
	<section class="container tm-home-section-1" id="more">
		<div class="row">
		</div>
		<div class="tm-section-header section-margin-top">
			<div class="col-lg-5 col-md-4 col-sm-4"><h2 class="tm-section-title" id="gameTitleText">관광지 이름 or 행사 이름</h2></div>
			<div class="col-lg-6 col-md-8 col-sm-8"><hr></div>	
		</div>
		
		<div class="tm-section-header section-margin-top">
			<div class="col-lg-7">
				<div class="imgArea">
				<div class="firstImgArea">
					<img src="${ contextPath }/resources/img/about-1.jpg" alt="image" class="firstImg"/>
				</div>
				<div class="secondImgArea">
					<img src="${ contextPath }/resources/img/about-1.jpg" class="secondImg" alt="image" />
					<img src="${ contextPath }/resources/img/about-1.jpg" class="secondImg" alt="image" />
				</div>
				</div>
			</div>
			<div class="col-lg-5">
				<div class="contentArea">
					관광지 정보 / 축제(행사) 정보 영역입니다.<br>
					관광지 정보 / 축제(행사) 정보 영역입니다.<br>
					관광지 정보 / 축제(행사) 정보 영역입니다.<br>
				</div>
				<hr>
				<div class="gInfoArea">
					관광지 정보/ 축제(행사) 정보 영역입니다.
				</div>
			</div>
		</div>
		
		<div class="col-lg-12 col-md-12">
		<div class="tm-section-header section-margin-top">
			<div class="col-lg-4 col-md-4 col-sm-4"><h2 class="tm-section-title">인근정보</h2></div>
			<div class="col-lg-8 col-md-8 col-sm-8"><hr></div>	
		</div>
		</div>
		<div class="col-lg-7 col-md-6">
			<div id="google-map"></div>
		</div>
		<div class="col-lg-5 col-md-6">
			<div class="weatherMap" id="weatherArea">
				날씨정보닷<br>
				날씨정보닷<br>
				날씨정보닷<br>
				날씨정보닷<br>
				날씨정보닷<br>
				날씨정보닷<br>
				날씨정보닷<br>
				날씨정보닷<br>
				날씨정보닷<br>
			</div>
		</div>
	</section>
		<script>
		var contentid = ${param.contentid};
		var contenttypeid = ${param.contenttypeid};
		
		function detailGameInfo(){
			console.log("contenttypeid : " + contenttypeid);
			console.log("contentid : " + contentid);
			$.ajax({
				url:"detailGameInformation.sub",
				type:"GET",
				data:{contenttypeid:contenttypeid, contentid:contentid},
				dataType:"json",
				success:function(data){
					console.log(data);
					var myData = data.response.body.items.item;
					var output = "";
					var overviewText = myData.overview.split(". ");
					$("#gameTitleText").text(myData.title);
					for(var i in overviewText){
						output += overviewText[i] + ".<br>";
					}
					$(".contentArea").html(output);
					if(myData.firstimage == null){
						output = "<img src='${contextPath}/resources/img/noImage.gif' alt='image' class='firstImg' />";
					}else{
						output = "<img src="+myData.firstimage+" alt='image' class='firstImg' />";
					}
					$(".firstImgArea").html(output);
					if(typeof(myData.mapy === String)){
						myData.mapy = parseFloat(myData.mapy);
					}
					if(typeof(myData.mapx === String)){
						myData.mapx = parseFloat(myData.mapx);
					}
					initialize(myData.mapy, myData.mapx, myData.title);
					//weatherMap(myData.mapy, myData.mapx);
				},
				error:function(data){
					console.log(data);
				}
			});
		}
		
		function detailGameImage(){
			$.ajax({
				url:"detailGameImage.sub",
				type:"GET",
				data:{contenttypeid:contenttypeid, contentid:contentid},
				dataType:"json",
				success:function(data){
					console.log(data);
					var myData = data.response.body.items.item;
					var count = 0;
					var output = "";
					if(data.response.body.items = ""){
						output += "<img src='${contextPath}/resources/img/noImage.gif' alt='image' class='secondImg' />";
						output += "<img src='${contextPath}/resources/img/noImage.gif' alt='image' class='secondImg' />";
					}else if(data.response.body.totalCount == 1){
						output += "<img src="+myData.originimgurl+" alt='image' class='secondImg' />";
						output += "<img src="+myData.originimgurl+" alt='image' class='secondImg' />";
					}else{
						for(var i in myData){
							count++;
							output += "<img src="+myData[i].originimgurl+" alt='image' class='secondImg' />";
							if(count == 2){break;}
						}
					}
					$(".secondImgArea").html(output);
				},
				error:function(data){
					console.log(data);
				}
			});
		}
		
		function detailGameIntro(){
			$.ajax({
				url:"detailGameIntro.sub",
				type:"GET",
				data:{contenttypeid:contenttypeid, contentid:contentid},
				dataType:"json",
				success:function(data){
					console.log(data);
					var myData = data.response.body.items.item;
					var output = "";
					var gInfo = $(".gInfoArea");
					gInfo.html("");
					if(myData.contenttypeid == 12){
						output += "<h3>관광지</h3><br>";
						output += "ㆍ <b>문의 및 안내</b> : "+myData.infocenter+"<br>";
						output += "ㆍ <b>쉬는날</b> : "+myData.restdate+"<br>";
						output += "ㆍ <b>주차시설</b> : "+myData.parking+"<br>";
						output += "ㆍ <b>유모차 대여 여부</b> : "+myData.chkbabycarriage+"<br>";
						output += "ㆍ <b>애완동물 동반 가능 여부</b> : "+myData.chkpet+"<br>";
						output += "ㆍ <b>신용카드 가능 여부</b> : "+myData.chkcreditcard+"<br>";
						gInfo.html(output);
					}else if(myData.contenttypeid == 14){
						output += "<h3>문화시설</h3><br>";
						output += "ㆍ <b>문의 및 안내</b> : "+myData.infocenterculture+"<br>";
						output += "ㆍ <b>규모</b> : "+myData.scale+"<br>";
						output += "ㆍ <b>이용시간</b> : "+myData.usetimeculture+"<br>";
						output += "ㆍ <b>쉬는날</b> : "+myData.restdateculture+"<br>";
						output += "ㆍ <b>이용요금</b> : "+myData.usefee+"<br>";
						output += "ㆍ <b>주차시설</b> : "+myData.parkingculture+"<br>";
						output += "ㆍ <b>유모차 대여 여부</b> : "+myData.chkbabycarriageculture+"<br>";
						output += "ㆍ <b>애완동물 동반 가능 여부</b> : "+myData.chkpetculture+"<br>";
						output += "ㆍ <b>신용카드 가능 여부</b> : "+myData.chkcreditcardculture+"<br>";
						gInfo.html(output);
					}else if(myData.contenttypeid == 15){
						output += "<h3>행사</h3><br>";
						output += "ㆍ <b>주최자 정보</b> : "+myData.sponsor1+"<br>";
						output += "ㆍ <b>주최자 연락처</b> : "+myData.sponsor1tel+"<br>";
						output += "ㆍ <b>주관사 연락처</b> : "+myData.sponsor2tel+"<br>";
						output += "ㆍ <b>행사시작일</b> : "+myData.eventstartdate+"<br>";
						output += "ㆍ <b>행사종료일</b> : "+myData.eventenddate+"<br>";
						output += "ㆍ <b>공연시간</b> : "+myData.playtime+"<br>";
						output += "ㆍ <b>행사장소</b> : "+myData.eventplace+"<br>";
						output += "ㆍ <b>이용요금</b> : "+myData.usetimefestival+"<br>";
						output += "ㆍ <b>부대행사</b> : "+myData.subevent+"<br>";
						gInfo.html(output);
					}else if(myData.contenttypeid == 38){
						output += "<h3>쇼핑</h3><br>";
						output += "ㆍ <b>문의 및 안내</b> : "+myData.infocentershopping+"<br>";
						output += "ㆍ <b>규모</b> : "+myData.scaleshopping+"<br>";
						//output += "ㆍ <b>개장기간</b> : "+myData.openperiod+"<br>";
						output += "ㆍ <b>영업시간</b> : "+myData.opentime+"<br>";
						output += "ㆍ <b>쉬는날</b> : "+myData.opendateshopping+"<br>";
						output += "ㆍ <b>매장안내</b> : "+myData.shopguide+"<br>";
						output += "ㆍ <b>주차시설</b> : "+myData.parkingshopping+"<br>";
						output += "ㆍ <b>유모차대여여부</b> : "+myData.chkbabycarriageshopping+"<br>";
						output += "ㆍ <b>애완동물 동반 가능 여부</b> : "+myData.chkpetshopping+"<br>";
						gInfo.html(output);
					}else{
						output += "<h3>레포츠</h3><br>";
						output += "ㆍ <b>문의 및 안내</b> : "+myData.infocenterleports+"<br>";
						output += "ㆍ <b>규모</b> : "+myData.scaleleports+"<br>";
						//output += "ㆍ <b>개장기간</b> : "+myData.openperiod+"<br>";
						output += "ㆍ <b>이용시간</b> : "+myData.usetimeleports+"<br>";
						output += "ㆍ <b>예약안내</b> : "+myData.reservation+"<br>";
						output += "ㆍ <b>주차시설</b> : "+myData.parkingleports+"<br>";
						output += "ㆍ <b>유모차 대여 여부</b> : "+myData.chkbabycarriageleports+"<br>";
						output += "ㆍ <b>애완동물 동반 가능 여부</b> : "+myData.chkpetleports+"<br>";
						output += "ㆍ <b>신용카드 가능 여부</b> : "+myData.chkcreditcardleports+"<br>";
						gInfo.html(output);
					}
				},
				error:function(data){
					console.log(data);
				}
			});
		}
		
		var mapy = ${param.mapy};
		var mapx = ${param.mapx};
		console.log("mapy : " + mapy);
		console.log("mapx : " + mapx);
		
		function weatherMap(mapy, mapx){
			console.log("펑션y : " + mapy);
			console.log("펑션x : " + mapx);
			$.ajax({
				url:"weatherMap.sub",
				type:"GET",
				data:{mapy:mapy, mapx:mapx},
				dataType:"json",
				success:function(data){
					console.log('날씨성공');
					console.log(data);
				},error:function(data){console.log("날씨에러");console.log(data);}
			});
		}
		
		/* function weatherMap(mapy, mapx){
			var url = "http://api.openweathermap.org/data/2.5/weather?lat="+mapy+"&lon="+mapx+"&appid=49736052d2b9402c5764e0f24834cf25";
			var request = new XMLHttpRequest();
			request.overrideMimeType("application/json");
			request.open('GET', url, true);
			
			request.onreadystatechagne = runction(){
				if(request.readyState == 4 && request.status == "200"){
					callback(request.responseText);
				}
			};
			request.send(null);
			window.onload = function(){
				parseWeather();
			}
		}
		function parseWeather(){
			loadJSON(function(response){
				var jsonData = JSON.parse(response);
				document.getElementById("weatherArea").innerHTML = jsonData;
			});
		} */
		
		$(function(){//output += "ㆍ <b></b> : ""<br>";
			weatherMap();
			detailGameInfo();
			detailGameImage();
			detailGameIntro();
			
		});
		
		
		/* Google map
      	------------------------------------------------*/
      	var map;
    	 
       function initialize(mapy, mapx, title) {
   
        	var mapLocation = {lat:mapy, lng:mapx};
          var mapOptions = { //구글 맵 옵션 설정
              zoom : 16, //기본 확대율
              center : mapLocation, //new google.maps.LatLng(mapy, mapx), // 지도 중앙 위치
              scrollwheel : false, //마우스 휠로 확대 축소 사용 여부
              mapTypeControl : false //맵 타입 컨트롤 사용 여부
          };
   
          map = new google.maps.Map(document.getElementById('google-map'), mapOptions); //구글 맵을 사용할 타겟
          var size_x = 60;
          var size_y = 60;
          var image = new google.maps.MarkerImage('https://www.weicherthallmark.com/wp-content/themes/realty/lib/images/map-marker/map-marker-gold-fat.png', //마커 이미지 설정
        		  		new google.maps.Size(size_x, size_y),
        		  		'',
        		  		'',
        		  		new google.maps.Size(size_x, size_y));
          				
          var marker = new google.maps.Marker({ //마커 설정
              map : map,
              position : mapLocation, //마커 위치
              //icon : image,//마커 이미지
              title : title//가게이름..
          });
          /* var marker = new google.maps.Marker({
        	  position:uluru,
        	  map:map
          }); */
   
          google.maps.event.addDomListener(window, "resize", function() { //리사이즈에 따른 마커 위치
              var center = map.getCenter();
              google.maps.event.trigger(map, "resize");
              map.setCenter(center); 
          });
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
	</section>
	
	<section class="container tm-home-section-1" id="more">
   
      <div class="section-margin-top about-section">
         <div class="row">   
         </div>         
         <div class="tm-section-header section-margin-top">
       		   <div class="col-lg-4 col-md-4 col-sm-4"><h2 class="tm-section-title">R E V I E W (1,123)</h2></div>
      		   <div class="col-lg-8 col-md-8 col-sm-8"><hr></div>
	      	   <div style = "height:200px; width:100%; position:relative">
	      	   		<button type="button" class="btn btn-secondary" 
	      	   			style = "position:absolute; right:10px; bottom:10px"
	      	   			onclick="review()">리뷰 쓰기</button>
	      	   </div>	   

      	 </div>
      </div>
     
         <div class="row line_b" >
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" style = "height:220px">
               <div class="tm-about-box-1" style = "height:220px; padding:10px 10px">
                  <a href="#"><img src="${ contextPath }/resources/img/about-4.jpg" alt="img" class="tm-about-box-1-img" style = "margin:0 auto 10px"></a>
                  <h3 class="tm-about-box-1-title" style = "margin-bottom:5px">Songs <span>( GOD )</span></h3>
                  <!-- <p class="margin-bottom-15 gray-text">Proin gravida nibhvell aliquet. Aenean sollicitudin bibum auctor nisi elit.</p> -->
                  <div class="gray-text">
                     <a href="#" class="tm-social-icon"><i class="fa fa-twitter"></i></a>
                     <a href="#" class="tm-social-icon"><i class="fa fa-facebook"></i></a>
                     <a href="#" class="tm-social-icon"><i class="fa fa-pinterest"></i></a>
                     <a href="#" class="tm-social-icon"><i class="fa fa-google-plus"></i></a>
                  </div>
               </div>
            </div>
            <div class="col-lg-9 col-md-9 col-sm-6 col-xs-12 line_l" style = "height:220px; padding-bottom:10px" >	
            	<br>
            	<div>
            	<span class="StarBar" >
            		<i class="fa fa-star"></i>
            		<i class="fa fa-star"></i>
            		<i class="fa fa-star"></i>
            		<i class="fa fa-star"></i>
            		<i class="fa fa-star"></i>
            	</span>
            	&nbsp;&nbsp;
            	<span class="ReviewUpDate">
            		리뷰 게시 날짜 : 2018년 09월 19일
            	</span>
            	</div>
            	<div class="ReviewTitle" style = "font-size:20px; cursor:pointer; padding-top:10px">
            		<a href="#"><span>여기 너무 멋져요우~</span></a>
            	</div>
            	<div class="summary" style = "padding-top:10px">
            		방과 수영장이 매우 좋았습니다. 다만 영어 못하는 택시기사가 바가지 씌울때 호텔에...
            		방과 수영장이 매우 좋았습니다. 다만 영어 못하는 택시기사가 바가지 씌울때 호텔에...
            		방과 수영장이 매우 좋았습니다. 다만 영어 못하는 택시기사가 바가지 씌울때 호텔에...
            		방과 수영장이 매우 좋았습니다. 다만 영어 못하는 택시기사가 바가지 씌울때 호텔에...
            		<span><a href="#">더 보기</a></span>
            	</div>
            	<div style = "padding-top:20px;" >
            		<div class="fa" style = "width:100%">
            			<i class="fa fa-thumbs-o-up" style = "font-size:20px; padding-top:10px"> 0 </i>
            			<i class="fa fa-comment" style = "font-size:20px; padding-top:10px"> 0 </i>
            			<i class="fa fa-flag" style = "font-size:20px; padding-top:10px; float:right;"> 신고하기 </i>
            		
            		</div>
            	</div>
            </div>
            
         </div> 
         <br>
         <div class="row line_b" >
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" style = "height:220px">
               <div class="tm-about-box-1" style = "height:220px; padding:10px 10px">
                  <a href="#"><img src="${ contextPath }/resources/img/about-4.jpg" alt="img" class="tm-about-box-1-img" style = "margin:0 auto 10px"></a>
                  <h3 class="tm-about-box-1-title" style = "margin-bottom:5px">Songs <span>( GOD )</span></h3>
                  <!-- <p class="margin-bottom-15 gray-text">Proin gravida nibhvell aliquet. Aenean sollicitudin bibum auctor nisi elit.</p> -->
                  <div class="gray-text">
                     <a href="#" class="tm-social-icon"><i class="fa fa-twitter"></i></a>
                     <a href="#" class="tm-social-icon"><i class="fa fa-facebook"></i></a>
                     <a href="#" class="tm-social-icon"><i class="fa fa-pinterest"></i></a>
                     <a href="#" class="tm-social-icon"><i class="fa fa-google-plus"></i></a>
                  </div>
               </div>
            </div>
            <div class="col-lg-9 col-md-9 col-sm-6 col-xs-12 line_l" style = "height:220px">
          	    <br>
            	<span class="StarBar">
            		<i class="fa fa-star"></i>
            		<i class="fa fa-star"></i>
            		<i class="fa fa-star"></i>
            		<i class="fa fa-star"></i>
            		<i class="fa fa-star"></i>
            	</span>
            	&nbsp;&nbsp;
            	<span class="ReviewUpDate">
            		리뷰 게시 날짜 : 2018년 09월 19일
            	</span>
            	<div class="ReviewTitle" style = "font-size:20px; cursor:pointer; padding-top:10px">
            		<a href="#"><span>여기 너무 멋져요우~</span></a>
            	</div>
            	<div class="summary" style = "padding-top:10px">
            		방과 수영장이 매우 좋았습니다. 다만 영어 못하는 택시기사가 바가지 씌울때 호텔에...
            		방과 수영장이 매우 좋았습니다. 다만 영어 못하는 택시기사가 바가지 씌울때 호텔에...
            		방과 수영장이 매우 좋았습니다. 다만 영어 못하는 택시기사가 바가지 씌울때 호텔에...
            		방과 수영장이 매우 좋았습니다. 다만 영어 못하는 택시기사가 바가지 씌울때 호텔에...
            		<span><a href="#">더 보기</a></span>
            	</div>
            	<div style = "padding-top:20px" >
            		<div class="fa" style = "width:100%">
            			<i class="fa fa-thumbs-o-up" style = "font-size:20px; padding-top:10px"> 0 </i>
            			<i class="fa fa-comment" style = "font-size:20px; padding-top:10px"> 0 </i>
            			<i class="fa fa-flag" style = "font-size:20px; padding-top:10px; float:right;"> 신고하기 </i>
            		
            		</div>
            	</div>
            </div>
            
         </div>   
         <br>
         <div class="row line_b" >
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" style = "height:220px">
               <div class="tm-about-box-1" style = "height:220px; padding:10px 10px">
                  <a href="#"><img src="${ contextPath }/resources/img/about-4.jpg" alt="img" class="tm-about-box-1-img" style = "margin:0 auto 10px"></a>
                  <h3 class="tm-about-box-1-title" style = "margin-bottom:5px">Songs <span>( GOD )</span></h3>
                  <!-- <p class="margin-bottom-15 gray-text">Proin gravida nibhvell aliquet. Aenean sollicitudin bibum auctor nisi elit.</p> -->
                  <div class="gray-text">
                     <a href="#" class="tm-social-icon"><i class="fa fa-twitter"></i></a>
                     <a href="#" class="tm-social-icon"><i class="fa fa-facebook"></i></a>
                     <a href="#" class="tm-social-icon"><i class="fa fa-pinterest"></i></a>
                     <a href="#" class="tm-social-icon"><i class="fa fa-google-plus"></i></a>
                  </div>
               </div>
            </div>
            <div class="col-lg-9 col-md-9 col-sm-6 col-xs-12 line_l" style = "height:220px">
            	<br>
            	<span class="StarBar">
            		<i class="fa fa-star"></i>
            		<i class="fa fa-star"></i>
            		<i class="fa fa-star"></i>
            		<i class="fa fa-star"></i>
            		<i class="fa fa-star"></i>
            	</span>
            	&nbsp;&nbsp;
            	<span class="ReviewUpDate">
            		리뷰 게시 날짜 : 2018년 09월 19일
            	</span>
            	<div class="ReviewTitle" style = "font-size:20px; cursor:pointer; padding-top:10px">
            		<a href="#"><span>여기 너무 멋져요우~</span></a>
            	</div>
            	<div class="summary" style = "padding-top:10px">
            		방과 수영장이 매우 좋았습니다. 다만 영어 못하는 택시기사가 바가지 씌울때 호텔에...
            		방과 수영장이 매우 좋았습니다. 다만 영어 못하는 택시기사가 바가지 씌울때 호텔에...
            		방과 수영장이 매우 좋았습니다. 다만 영어 못하는 택시기사가 바가지 씌울때 호텔에...
            		방과 수영장이 매우 좋았습니다. 다만 영어 못하는 택시기사가 바가지 씌울때 호텔에...
            		<span><a href="#">더 보기</a></span>
            	</div>
            	<div style = "padding-top:20px" >
            		<div class="fa" style = "width:100%">
            			<i class="fa fa-thumbs-o-up" style = "font-size:20px; padding-top:10px"> 0 </i>
            			<i class="fa fa-comment" style = "font-size:20px; padding-top:10px"> 0 </i>
            			<i class="fa fa-flag" style = "font-size:20px; padding-top:10px; float:right;"> 신고하기 </i>
            		
            		</div>
            	</div>
            </div>
            
         </div>        
 
   </section> 
   
   <section class="container tm-home-section-1" id="more">
   
      <div class="section-margin-top about-section">
         <div class="row">   
         </div>         
         <div class="tm-section-header section-margin-top">
       		   <div class="col-lg-4 col-md-4 col-sm-4"><h2 class="tm-section-title">Q & A (6,143)</h2></div>
      		   <div class="col-lg-8 col-md-8 col-sm-8"><hr></div>
	      	   <div style = "height:200px; width:100%; position:relative">
	      	   		<button type="button" class="btn btn-secondary" style = "position:absolute; right:10px; bottom:10px">Q&A 쓰기</button>
	      	   </div>	   

      	 </div>
      </div>
         <div class="row line_b" >
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" style = "height:220px">
               <div class="tm-about-box-1" style = "height:220px; padding:10px 10px">
                  <a href="#"><img src="${ contextPath }/resources/img/about-4.jpg" alt="img" class="tm-about-box-1-img" style = "margin:0 auto 10px"></a>
                  <h3 class="tm-about-box-1-title" style = "margin-bottom:5px">Songs <span>( GOD )</span></h3>
                  <!-- <p class="margin-bottom-15 gray-text">Proin gravida nibhvell aliquet. Aenean sollicitudin bibum auctor nisi elit.</p> -->
                  <div class="gray-text">
                     <a href="#" class="tm-social-icon"><i class="fa fa-twitter"></i></a>
                     <a href="#" class="tm-social-icon"><i class="fa fa-facebook"></i></a>
                     <a href="#" class="tm-social-icon"><i class="fa fa-pinterest"></i></a>
                     <a href="#" class="tm-social-icon"><i class="fa fa-google-plus"></i></a>
                  </div>
               </div>
            </div>
            <div class="col-lg-9 col-md-9 col-sm-6 col-xs-12 line_l" style = "height:220px">	
            	<br>
            	<div class="summary" style = "padding-top:10px; font-size:18px">
            		I am staying 5 nights in October for my wife's 50th birthday. We are staying in The Oberoi hotel in Bali for 5nights previous. Can you advise approximately how long between hotels when travelling around midday? Seondly, is there anything you can do to wish my wife a Happy Birthday when she arrives?
            		<span><a href="#">더 보기</a></span>
            	</div>
            	<br>
            	
            	<div style = "padding-top:1px" >
            		<div class="fa" style = "width:100%">
            			<span class="ReviewUpDate" style = "padding-top:5px">
            				질문 날짜 : 2018년 09월 19일
            			</span>
            			<span>|</span>
            			<span class="ReviewUpDate" style = "padding-top:5px">
            				<i class="fa fa-thumbs-o-up" style = "font-size:14px; padding-top:5px"> 0 </i>
            				<i class="fa fa-flag" style = "font-size:14px; padding-top:5px; float:right; cursor:pointer"><a onclick="reportWrite()"> 신고하기</a></i>
            			</span>	
            		</div>
            	</div>
            	<div style = "margin-top:5px">
            		<button type="button" class="btn btn-secondary">답변</button>
            		<button type="button" class="btn btn-secondary">모든 답변보기</button>
            	</div>
            </div>
            
         </div> 
         <br>
         <div class="row line_b" >
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" style = "height:220px">
               <div class="tm-about-box-1" style = "height:220px; padding:10px 10px">
                  <a href="#"><img src="${ contextPath }/resources/img/about-4.jpg" alt="img" class="tm-about-box-1-img" style = "margin:0 auto 10px"></a>
                  <h3 class="tm-about-box-1-title" style = "margin-bottom:5px">Songs <span>( GOD )</span></h3>
                  <!-- <p class="margin-bottom-15 gray-text">Proin gravida nibhvell aliquet. Aenean sollicitudin bibum auctor nisi elit.</p> -->
                  <div class="gray-text">
                     <a href="#" class="tm-social-icon"><i class="fa fa-twitter"></i></a>
                     <a href="#" class="tm-social-icon"><i class="fa fa-facebook"></i></a>
                     <a href="#" class="tm-social-icon"><i class="fa fa-pinterest"></i></a>
                     <a href="#" class="tm-social-icon"><i class="fa fa-google-plus"></i></a>
                  </div>
               </div>
            </div>
            <div class="col-lg-9 col-md-9 col-sm-6 col-xs-12 line_l" style = "height:220px">	
            	<br>
            	<div class="summary" style = "padding-top:10px; font-size:18px">
            		I am staying 5 nights in October for my wife's 50th birthday. We are staying in The Oberoi hotel in Bali for 5nights previous. Can you advise approximately how long between hotels when travelling around midday? Seondly, is there anything you can do to wish my wife a Happy Birthday when she arrives?
            		<span><a href="#">더 보기</a></span>
            	</div>
            	<br>
            	
            	<div style = "padding-top:1px" >
            		<div class="fa" style = "width:100%">
            			<span class="ReviewUpDate" style = "padding-top:5px">
            				질문 날짜 : 2018년 09월 19일
            			</span>
            			<span>|</span>
            			<span class="ReviewUpDate" style = "padding-top:5px">
            				<i class="fa fa-thumbs-o-up" style = "font-size:14px; padding-top:5px"> 0 </i>
            				<i class="fa fa-flag" style = "font-size:14px; padding-top:5px; float:right; cursor:pointer"><a onclick="reportWrite()"> 신고하기</a></i>
            			</span>	
            		</div>
            	</div>
            	<div style = "margin-top:5px">
            		<button type="button" class="btn btn-secondary">답변</button>
            		<button type="button" class="btn btn-secondary">모든 답변보기</button>
            	</div>
            </div>
            
         </div> 
         <br>
         
                
      </div>
   </section>
	
	<!-- white bg -->
	<section class="tm-white-bg section-padding-bottom"></section>
	
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