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
	.firstImg{width:528px; height:435px;}
	.secondImgArea{display:inline-block;}
	.secondImg{width:262.5px; height:217px; display:inline-block;}
	.contentArea{display:block;}
	.detailHead{text-align:center; width:1120px; height:40px; background-color:lightgray;}
	.detailContent{height:350px; text-align:center; display:inline-block;}
	.detailBottom{height:50px;}
	.tm-about-box-1{padding:10px 10px;}
	.foodImgTd{width:260px; height:300px;}
	#foodInfoArea{margin:0 auto;}
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
			<div class="col-lg-4 col-md-4 col-sm-4"><h2 class="tm-section-title" id="foodTitleText">아무개 식당</h2></div>
			<div class="col-lg-8 col-md-8 col-sm-8"><hr></div>	
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
					음식점 소개영역입니다.<br>
					음식점 소개영역입니다.<br>
					음식점 소개영역입니다.<br>
				</div>
				<hr>
				<div class="fInfoArea">
					음식점 소개영역입니다.<br>
				</div>
			</div>
		</div>
		
		<div class="col-lg-12 col-md-12">
		<div class="tm-section-header section-margin-top">
			<div class="col-lg-4 col-md-4 col-sm-4"><h2 class="tm-section-title">인근정보</h2></div>
			<div class="col-lg-8 col-md-8 col-sm-8"><hr></div>	
		</div>
			<div id="google-map"></div>
		</div>
	</section>
		<script>
		var contenttypeid = ${param.contenttypeid};
		var contentid = ${param.contentid};
		
		function detailFoodInfo(){
			console.log("detailFoodInfo : " + contenttypeid);
			console.log("detailFoodInfo : " + contentid);
			$.ajax({
				url:"detailFoodInformation.sub",
				type:"GET",
				data:{contenttypeid:contenttypeid, contentid:contentid},
				dataType:"json",
				success:function(data){
					console.log(data);
					var myData = data.response.body.items.item;
					var output = "";
					var overviewText = myData.overview.split(". ");
					$("#foodTitleText").text(myData.title);
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
					initialize(myData.mapy, myData.mapx, myData.title);
				},
				error:function(data){
					console.log(data);
				}
			});
		}
		
		function detailFoodImage(){
			console.log("detailFoodImage : " + contentid);
			$.ajax({
				url:"detailFoodImage.sub",
				type:"get",
				data:{contenttypeid:contenttypeid, contentid:contentid},
				dataType:"json",
				success:function(data){
					console.log(data);
					var myData = data.response.body.items.item;
					var count = 0;
					var output = "";
					if(data.response.body.items == ""){
						output += "<img src='${contextPath}/resources/img/noImage.gif' alt='image' class='secondImg' />";
						output += "<img src='${contextPath}/resources/img/noImage.gif' alt='image' class='secondImg' />";
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
		
		function detailFoodIntro(){
			console.log("detailFoodIntro : " + contenttypeid);
			console.log("detailFoodIntro : " + contentid);
			$.ajax({
				url:"detailFoodIntro.sub",
				type:"get",
				data:{contenttypeid:contenttypeid, contentid:contentid},
				dataType:"json",
				success:function(data){
					console.log(data);
					var myData = data.response.body.items.item;
					var output = "";
					var fInfo = $(".fInfoArea");
					fInfo.html("");
					output += "<h3>음식점</h3><br>";
					output += "ㆍ <b>주차 시설</b> : "+myData.parkingfood+"<br>";
					output += "ㆍ <b>개업일</b> : "+myData.opendatefood+"<br>";
					output += "ㆍ <b>영업 시간</b> : "+myData.opentimefood+"<br>";
					output += "ㆍ <b>쉬는 날</b> : "+myData.restdatefood+"<br>";
					output += "ㆍ <b>대표 메뉴</b> : "+myData.firstmenu+"<br>";
					output += "ㆍ <b>취급 메뉴</b> : "+myData.treatmenu+"<br>";
					output += "ㆍ <b>금연/흡연</b> : "+myData.smoking+"<br>";
					output += "ㆍ <b>신용 카드 정보</b> : "+myData.chkcreditcardfood+"<br>";
					output += "ㆍ <b>포장 가능</b> : "+myData.packing+"<br>";
					output += "ㆍ <b>예약 안내</b> : "+myData.reservationfood+"<br>";
					fInfo.html(output);
				},
				error:function(data){
					console.log(data);
				}
			});
		}
		
		function detailMenuInfo(){
			console.log("detailMenuInfo : " + contenttypeid);
			console.log("detailMenuInfo : " + contentid);
			$.ajax({
				url:"detailMenuInfo.sub",
				type:"GET",
				data:{contenttypeid:contenttypeid, contentid:contentid},
				dataType:"json",
				success:function(data){
					console.log(data);
					var myData = data.response.body.items.item;
					var output = "";
					var foodInfo = $("#foodInfoArea");
					foodInfo.html("");
					foodInfo.html("<h3 align='center'>메뉴 이미지</h3><hr>");
					if(data.response.body.totalCount == 0){
						output += "<h3 align='center'>정보가 없습니다.</h3>";
						document.getElementById("foodInfoArea").innerHTML += output;
					}else{
						for(var i in myData){
							output = "";
							output += "<div class='col-lg-3 detailContent'><img src="+myData[i].originimgurl+" class='foodImgTd' /></div>";
							document.getElementById("foodInfoArea").innerHTML += output;
						}
					}
				},
				error:function(data){
					console.log(data);
				}
			});
		}
		
		$(function(){
			detailFoodInfo();//공통정보
			detailFoodImage();//메인,서브이미지
			detailFoodIntro();//음식점소개
			detailMenuInfo();//메뉴이미지
			
		});
		/* Google map
      	------------------------------------------------*/
      	var map;
      	 
        function initialize(mapy, mapx, title) {
   
        	var mapLocation = {lat:mapy, lng:mapx};
          var mapOptions = { //구글 맵 옵션 설정
              zoom : 16, //기본 확대율
              center : new google.maps.LatLng(mapy, mapx), // 지도 중앙 위치
              scrollwheel : false, //마우스 휠로 확대 축소 사용 여부
              mapTypeControl : false //맵 타입 컨트롤 사용 여부
          };
   
          map = new google.maps.Map(document.getElementById('google-map'), mapOptions); //구글 맵을 사용할 타겟
          var size_x = 60;
          var size_y = 60;
          var image = new google.maps.MarkerImage('http://www.weicherthallmark.com/wp-content/themes/realty/lib/images/map-marker/map-marker-gold-fat.png', //마커 이미지 설정
        		  		new google.maps.Size(size_x, size_y),
        		  		'',
        		  		'',
        		  		new google.maps.Size(size_x, size_y));
          				
          var marker = new google.maps.Marker({ //마커 설정
              map : map,
              position : mapLocation, //마커 위치
              icon : image,//마커 이미지
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
		<div class="col-lg-12" id="foodInfoArea">
				<div class="col-lg-3 detailContent"></div>
				<div class="col-lg-3 detailContent"></div>
				<div class="col-lg-3 detailContent"></div>
				<div class="col-lg-3 detailContent"></div>
		</div>
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