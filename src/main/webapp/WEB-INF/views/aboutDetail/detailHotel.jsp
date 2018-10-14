<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link href="${ contextPath }/resources/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
<script type="text/javascript" src="${ contextPath }/resources/js/bootstrap-datetimepicker.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAf5xrmNMwmRYe-jdx4N3ItbdKDOJryoj4&callback=initialize" async defer></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
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
	.detailBottom{height:50px; text-align:center;}
	.tm-about-box-1{padding:10px 10px;}
	.roomImgTd{width:260px; height:300px;}
	.QAV{display:none;}
	.allQAV{display:none;}
	.selectRoom{width:150px; height:45px;}
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
			<div class="col-lg-4 col-md-4 col-sm-4"><h2 class="tm-section-title" id="hotelTitleText">아무개호텔</h2></div>
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
					호텔정보 영역입니다.<br>
					호텔정보 영역입니다.<br>
					호텔정보 영역입니다.<br>
					<input type="button" class="btn" id="payment" value="결제하기"/>
				</div>
				<hr>
				<div class="hInfoArea">
					호텔정보 영역입니다.<br>
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
		
			var contentid = ${param.contentid};
			var contenttypeid = ${param.contenttypeid};
			var cid = ${param.cid};
			
			function detailHotelInfo(){
				console.log("deatilHotel : " + contenttypeid);
				console.log("detailHotel : " + contentid);
				$.ajax({
					url:"detailHotelInformation.sub",
					type:"GET",
					data:{contenttypeid:contenttypeid, contentid:contentid},
					dataType:"json",
					success:function(data){
						console.log(data);
						var myData = data.response.body.items.item;
						var output = "";
						var overviewText = myData.overview.split(". ");
						$("#hotelTitleText").text(myData.title);
						for(var i = 0; i < overviewText.length; i++){
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
					},
					error:function(data){
						console.log(data);
					}
				});
			}
			
			function detailHotelImage(){
				console.log("detailHotelImage : " + contentid);
				$.ajax({
					url:"detailHotelImage.sub",
					type:"GET",
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
							for(var i = 0; i < myData.length; i++){
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
			
			function detailHotelIntro(){
				console.log("detailHotelIntro : " + contenttypeid);
				console.log("detailHotelIntro : " + contentid);
				$.ajax({
					url:"detailHotelIntro.sub",
					type:"GET",
					data:{contenttypeid:contenttypeid, contentid:contentid},
					dataType:"json",
					success:function(data){
						console.log(data);
						var myData = data.response.body.items.item;
						var output = "";
						var hInfo = $(".hInfoArea");
						hInfo.html("");
						output += "<h3>숙박정보</h3><br>";
						output += "ㆍ <b>문의 및 안내</b> : "+myData.infocenterlodging+"<br>";
						output += "ㆍ <b>규 모</b> : "+myData.scalelodging+"<br>";
						output += "ㆍ <b>객실 수</b> : "+myData.roomcount+"<br>";
						output += "ㆍ <b>객실 유형</b> : "+myData.roomtype+"<br>";
						output += "ㆍ <b>주차 가능</b> : "+myData.parkinglodging+"<br>";
						output += "ㆍ <b>조리 가능</b> : "+myData.chkcooking+"<br>";
						output += "ㆍ <b>체크인</b> : "+myData.checkintime+"<br>";
						output += "ㆍ <b>체크아웃</b> : "+myData.checkouttime+"<br>";
						output += "ㆍ <b>예약 안내</b> : "+myData.reservationlodging+"<br>";
						output += "ㆍ <b>예약안내 홈페이지</b> : "+myData.reservationurl+"<br>";
						hInfo.html(output);
					},
					error:function(data){
						console.log(data);
					}
				});
			}
			
			function detailRoomInfo(){
				console.log("detailRoomInfo : " + contenttypeid);
				console.log("detailRoomInfo : " + contentid);
				$.ajax({
					url:"detailRoomInfo.sub",
					type:"GET",
					data:{contenttypeid:contenttypeid, contentid:contentid},
					dataType:"json",
					success:function(data){
						console.log(data);
						var myData = data.response.body.items.item;
						var output = "";
						var roomInfo = $("#roomInfoArea");
						roomInfo.html("");
						var rid = 0;
						var price = 0;
						var rType = "";
						$.ajax({
							url:"detailRoom.com",
							type:"GET",
							data:{contentid:contentid, cid:cid},
							dataType:"json",
							success:function(result){
								console.log("여기와?");
								console.log(result);
								for(var i in myData){
									rid = result[i].rid;
									price = result[i].rPrice;
									rType = result[i].rType;
									output = "";
									output += "<tr>";
									if(myData[i].roomimg1 == null){
										output += "<td class='detailContent'><img src='${contextPath}/resources/img/noImage.gif' class='roomIngTd' /></td>";
									}else{ 
									output += "<td class='detailContent'><img src="+myData[i].roomimg1+" class='roomImgTd' /></td>";
									}
									output += "<td>";
									output += "<h4><b>객실명 : "+result[i].rType+"</b></h4>";
									output += "ㆍ 객실크기 : "+myData[i].roomsize1+" 평<br>";
									output += "ㆍ 객실수 : "+myData[i].roomcount+"<br>";
									//output += "ㆍ 기준인원 : "+myData[i].roombasecount+" (최대인원 : "+myData[i].roommaxcount+")<br>";
									output += "ㆍ 목욕시설 : "+myData[i].roombathfacility+"<br>";
									output += "ㆍ 욕조 : "+myData[i].roombath+"<br>";
									output += "ㆍ 에어컨 : "+myData[i].roomaircondition+"<br>";
									output += "ㆍ TV : "+myData[i].roomtv+"<br>";
									output += "ㆍ 케이블설치 : "+myData[i].roomcable+"<br>";
									output += "ㆍ 인터넷 : "+myData[i].roominternet+"<br>";
									output += "ㆍ 냉장고 : "+myData[i].roomrefrigerator+"<br>";
									output += "ㆍ 세면도구 : "+myData[i].roomtoiletries+"<br>";
									output += "ㆍ 드라이기 : "+myData[i].roomhairdryer+"<br>";
									output += "</td>"
									output += "<td>";
									output += "ㆍ 정원 : "+myData[i].roombasecount+"명<br>";
									output += "ㆍ 최대인원 : "+result[i].rLimit+"명<br>";
									output += "ㆍ 가격 : "+result[i].rPrice+"원<br>";
									//output += "ㆍ 비수기 주중최소 : "+myData[i].roomoffseasonminfee1+" (성수기 : "+myData[i].roompeakseasonminfee1+")<br>";
									//output += "ㆍ 비수기 주말최소 : "+myData[i].roomoffseasonminfee2+" (성수기 : "+myData[i].roompeakseasonminfee2+")<br>";
									output += "</td>";
									output += "<td class='detailContent'>";
									output += "<input type='hidden' name='roomRid' value="+rid+">";
									output += "<input type='hidden' name='roomPrice' value="+price+">";
									output += "<input type='hidden' name='rType' value="+rType+">";
									output += "<select class='selectRoom' name='selectRoom'>";
									output += "<option>선택</option>";
									if(result[i].rCount > 1){
										for(var r = 0; r < result[i].rCount; r++){
											output += "<option value="+r+">"+r+"</option>";
										}
									}else{
										output += "<option value='1'>1</option>";
									}
									output += "</select>"
									output += "</td>";
									output += "</tr>"
									document.getElementById("roomInfoArea").innerHTML += output;
								}
							},error:function(result){console.log(data);}
						});
						
					},
					error:function(data){
						console.log(data);
					}
				});//output += "ㆍ ";
			}
			
			$(function(){
				detailHotelInfo();
				detailHotelImage();
				detailHotelIntro();
				detailRoomInfo();
				console.log("cid : "+ cid);
				
				
				$("#paymentBtn").click(function(){
					var values = [];
					var value ;
					$(".selectRoom").each(function(){
						value = $("select[name=selectRoom] option:selected").text();
						values += value;
					});
					console.log(values);
				});
				/* $('.date').datetimepicker({
	            	format: 'MM/DD/YYYY'
	            });
	            $('.date-time').datetimepicker(); */
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
          var image = new google.maps.MarkerImage('http://www.weicherthallmark.com/wp-content/themes/realty/lib/images/map-marker/map-marker-gold-fat.png', //마커 이미지 설정
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
			/* $('a[href*=#]:not([href=#])').click(function() {
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
			}); */

		  	// Flexslider
		  	$('.flexslider').flexslider({
		  		controlNav: false,
		  		directionNav: false
		  	});

		  	// Google Map
		  	//loadGoogleMap();
		  })(jQuery);
	</script>
	
	<section class="container tm-home-section-1" id="more">
		<div class="col-lg-12" >
			<table border="1">
				<thead>
					<tr>
						<th class="detailHead">객실유형</th>
						<th class="detailHead">정보</th>
						<th class="detailHead">가격</th>
						<th class="detailHead">객실선택</th>
					</tr>
				</thead>
				<tbody id="roomInfoArea">
					<tr>
						<td class="detailContent">정보오오오오오오오오</td>
						<td class="detailContent">정보오오오오오오오오</td>
						<td class="detailContent">정보오오오오오오오오</td>
						<td class="detailContent">정보오오오오오오오오</td>
					</tr>
					
				</tbody>
				<tfoot>
					<tr>
						<td class="detailBottom"></td>
						<td class="detailBottom">
						<div class="form-group">
							<div class='input-group date' id='datetimepicker1'>
								<input type='text' class="form-control" placeholder="Check-in Date" />
									<span class="input-group-addon">
										<span class="fa fa-calendar"></span>
									</span>
							</div>
						</div>
						</td>
						<td class="detailBottom">
						<div class="form-group">
							<div class='input-group date' id='datetimepicker2'>
								<input type='text' class="form-control" placeholder="Check-out Date" />
									<span class="input-group-addon">
										<span class="fa fa-calendar"></span>
									</span>
							</div>
						</div>
						</td>
						<td class="detailBottom"><input type="button" class="btn" id="paymentBtn" value="결제하기" style="background-color:#00aef0; color:white; width:200px; height:45px;"/></td>
					</tr>
				</tfoot>
			</table>
			
					
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
      <div class = "new_line">
		 <c:forEach var = "list" items = "${ list }"> 
      
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
            		<c:if test = "${ list.grade eq 0.0 }">
            			<span class="StarBar">
            				<i class="far fa-star" style = "font-size:20px"></i>
            				<i class="far fa-star" style = "font-size:20px"></i>
            				<i class="far fa-star" style = "font-size:20px"></i>
            				<i class="far fa-star" style = "font-size:20px"></i>
            				<i class="far fa-star" style = "font-size:20px"></i>
            			</span>
            		</c:if>
            		<c:if test = "${ list.grade eq 0.5 }">
            			<span class="StarBar">
            				<i class="fas fa-star-half-alt" style = "font-size:20px"></i>
            				<i class="far fa-star" style = "font-size:20px"></i>
            				<i class="far fa-star" style = "font-size:20px"></i>
            				<i class="far fa-star" style = "font-size:20px"></i>
            				<i class="far fa-star" style = "font-size:20px"></i>
            			</span>
            		</c:if>
            		<c:if test = "${ list.grade eq 1.0 }">
            			<span class="StarBar">
            				<i class="fas fa-star" style = "font-size:20px"></i>
            				<i class="far fa-star" style = "font-size:20px"></i>
            				<i class="far fa-star" style = "font-size:20px"></i>
            				<i class="far fa-star" style = "font-size:20px"></i>
            				<i class="far fa-star" style = "font-size:20px"></i>
            			</span>
            		</c:if>
            		<c:if test = "${ list.grade eq 1.5 }">
            			<span class="StarBar">
            				<i class="fas fa-star" style = "font-size:20px"></i>
            				<i class="fas fa-star-half-alt" style = "font-size:20px"></i>
            				<i class="far fa-star" style = "font-size:20px"></i>
            				<i class="far fa-star" style = "font-size:20px"></i>
            				<i class="far fa-star" style = "font-size:20px"></i>
            			</span>
            		</c:if>
            		<c:if test = "${ list.grade eq 2.0 }">
            			<span class="StarBar">
            				<i class="fas fa-star" style = "font-size:20px"></i>
            				<i class="fas fa-star" style = "font-size:20px"></i>
            				<i class="far fa-star" style = "font-size:20px"></i>
            				<i class="far fa-star" style = "font-size:20px"></i>
            				<i class="far fa-star" style = "font-size:20px"></i>
            			</span>
            		</c:if>
            		<c:if test = "${ list.grade eq 2.5 }">
            			<span class="StarBar">
            				<i class="fas fa-star" style = "font-size:20px"></i>
            				<i class="fas fa-star" style = "font-size:20px"></i>
            				<i class="fas fa-star-half-alt" style = "font-size:20px"></i>
            				<i class="far fa-star" style = "font-size:20px"></i>
            				<i class="far fa-star" style = "font-size:20px"></i>
            			</span>
            		</c:if>
            		<c:if test = "${ list.grade eq 3.0 }">
            			<span class="StarBar">
            				<i class="fas fa-star" style = "font-size:20px"></i>
            				<i class="fas fa-star" style = "font-size:20px"></i>
            				<i class="fas fa-star" style = "font-size:20px"></i>
            				<i class="far fa-star" style = "font-size:20px"></i>
            				<i class="far fa-star" style = "font-size:20px"></i>
            			</span>
            		</c:if>
            		<c:if test = "${ list.grade eq 3.5 }">
            			<span class="StarBar">
            				<i class="fas fa-star" style = "font-size:20px"></i>
            				<i class="fas fa-star" style = "font-size:20px"></i>
            				<i class="fas fa-star" style = "font-size:20px"></i>
            				<i class="fas fa-star-half-alt" style = "font-size:20px"></i>
            				<i class="far fa-star" style = "font-size:20px"></i>
            			</span>
            		</c:if>
            		<c:if test = "${ list.grade eq 4.0 }">
            			<span class="StarBar">
            				<i class="fas fa-star" style = "font-size:20px"></i>
            				<i class="fas fa-star" style = "font-size:20px"></i>
            				<i class="fas fa-star" style = "font-size:20px"></i>
            				<i class="fas fa-star" style = "font-size:20px"></i>
            				<i class="far fa-star" style = "font-size:20px"></i>
            			</span>
            		</c:if>
            		<c:if test = "${ list.grade eq 4.5 }">
            			<span class="StarBar">
            				<i class="fas fa-star" style = "font-size:20px"></i>
            				<i class="fas fa-star" style = "font-size:20px"></i>
            				<i class="fas fa-star" style = "font-size:20px"></i>
            				<i class="fas fa-star" style = "font-size:20px"></i>
            				<i class="fas fa-star-half-alt" style = "font-size:20px"></i>
            			</span>
            		</c:if>
            		<c:if test = "${ list.grade eq 5.0 }">
            			<span class="StarBar">
            				<i class="fas fa-star" style = "font-size:20px"></i>
            				<i class="fas fa-star" style = "font-size:20px"></i>
            				<i class="fas fa-star" style = "font-size:20px"></i>
            				<i class="fas fa-star" style = "font-size:20px"></i>
            				<i class="fas fa-star" style = "font-size:20px"></i>
            			</span>
            		</c:if>
            	
            	&nbsp;&nbsp;
            	<span class="ReviewUpDate">
            		리뷰 게시 날짜 : ${ list.modify_date }
            	</span>
            	</div>
            	<div class="ReviewTitle" style = "font-size:20px; cursor:pointer; padding-top:10px">
            		<a href="#"><span>${ list.title }</span></a>
            	</div>
            	<div class="summary" style = "padding-top:10px">
            		${ list.text }
            		<span><a onclick = "goDetail(${ list.bid })">더 보기</a></span>
            	</div>
            	<div style = "padding-top:20px;" >
            		<div class="fa" style = "width:100%">
            			<i class="fa fa-thumbs-o-up" style = "font-size:20px; padding-top:10px"> ${ list.likey } </i>
            			<i class="far fa-comment-dots" style = "font-size:20px; padding-top:10px"> 0 </i>
            			<i class="fa fa-flag" style = "font-size:20px; padding-top:10px; float:right;"> 신고하기 </i>
            		
            		</div>
            	</div>
            </div>
            
         </div> 
         </c:forEach>
         </div>
         <div class="paging" align="center">
<ul class="pagination pagination-sm">
<c:if test="${ pi.currentPage <= 1 }">
<li><a>&laquo;</a></li>
            </c:if>
            <c:if test="${ pi.currentPage > 1 }">
                <li><a onclick="goPrev();">&laquo;</a></li>
            </c:if>
            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                <c:if test="${ p eq pi.currentPage }">
                <li><a style="background-color:#ddd;">${ p }</a></li>               
                </c:if>
                <c:if test="${ p ne pi.currentPage }">
                    <li><a onclick="goPage(${ p });">${ p }</a></li>  
                </c:if>
            </c:forEach>
            <c:if test="${ pi.currentPage >= pi.maxPage }">
                <li><a>&raquo;</a></li>
            </c:if>
            <c:if test="${ pi.currentPage < pi.maxPage }">
                <li><a onclick="goNext(${ pi.currentPage });">&raquo;</a></li>
            </c:if>
            </ul>
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
	      	   		<button type="button" class="btn btn-secondary" style = "position:absolute; right:10px; bottom:10px" onclick="qa()">Q&A 쓰기</button>
	      	   </div>	   

      	 </div>
      </div>
      <div class = "new_line2">
      	<c:forEach var = "list2" items = "${ list2 }">
         <div class="row line_b" >
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" style = "height:auto">
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
            <div class="col-lg-9 col-md-9 col-sm-6 col-xs-12 line_l" style = "height:auto">	
            	<br>
            	<div class="summary" style = "padding-top:10px; font-size:18px">
            		${ list2.text }
            	</div>
            	<br>
            	
            	<div style = "padding-top:1px" >
            		<div class="fa" style = "width:100%">
            			<span class="ReviewUpDate" style = "padding-top:5px">
            				${ list2.modify_date }
            			</span>
            			<span>|</span>
            			<span class="ReviewUpDate" style = "padding-top:5px">
            				<i class="fa fa-thumbs-o-up" style = "font-size:14px; padding-top:5px"> ${ list2.likey } </i>
            				<i class="fa fa-flag" style = "font-size:14px; padding-top:5px; float:right; cursor:pointer"><a onclick="reportWrite(this)"> 신고하기</a></i>
            				<input type = "hidden" value="${ list2.m_id }">
            				<input type = "hidden" value="${ list2.bid }">
            			</span>	
            		</div>
            	</div>
            	<div style = "margin-top:5px">
            		<button type="button" class="btn btn-secondary" onclick = "QA('${ list2.bid }');">답변</button>
            		<button type="button" class="btn btn-secondary" onclick = "allQA('${ list2.bid }');">모든 답변보기</button>
            		<div id = "allQAV${ list2.bid }" class = "QAV" style = "padding-top:5px;">
            		<c:forEach var="listQAnswer" items="${ listQAnswer }">
            		<c:if test="${ list2.bid eq listQAnswer.bid }">
            			<div class="summary" style = "padding-top:10px; font-size:18px">
            				${ listQAnswer.content }
            			</div>
            			<span class="ReviewUpDate" style = "padding-top:5px">
            				${ listQAnswer.modify_date }
            			</span>
            			<span>|</span> ${ listQAnswer.bid }님의 답변
            		</c:if>
            		</c:forEach>
            		</div>
            		<div id = "${ list2.bid }" class = "QAV" Style ="padding-top:10px">
            			<input type = "hidden" value = "${ list2.bid }">
            			<textarea style="resize: none;" name = "text" rows="3" cols="110"></textarea>
            			<button type="button" class="btn btn-secondary" onclick = "insertA(this);">확인</button>
            		</div>
            	</div>
            	
            </div>
            
         </div> 
         <br><br><br>
         <div></div>
         </c:forEach>
      </div>    
         <br>              
      <div class="paging2" align="center">
<ul class="pagination pagination-sm">
<c:if test="${ pi2.currentPage <= 1 }">
<li><a>&laquo;</a></li>
            </c:if>
            <c:if test="${ pi2.currentPage > 1 }">
                <li><a onclick="goPrev2();">&laquo;</a></li>
            </c:if>
            <c:forEach var="p" begin="${ pi2.startPage }" end="${ pi2.endPage }">
                <c:if test="${ p eq pi2.currentPage }">
                <li><a style="background-color:#ddd;">${ p }</a></li>               
                </c:if>
                <c:if test="${ p ne pi2.currentPage }">
                    <li><a onclick="goPage2(${ p });">${ p }</a></li>  
                </c:if>
            </c:forEach>
            <c:if test="${ pi2.currentPage >= pi2.maxPage }">
                <li><a>&raquo;</a></li>
            </c:if>
            <c:if test="${ pi2.currentPage < pi2.maxPage }">
                <li><a onclick="goNext2(${ pi2.currentPage });">&raquo;</a></li>
            </c:if>
            </ul>
    </div>  
   </section>
	
	<!-- white bg -->
	<section class="tm-white-bg section-padding-bottom"></section>
	
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
	
	
		function QPaging(page){
			console.log("page : " + page);
			
			$.ajax({ 
				url:"QPaging.bo",
				type:"post",
				data:{page:page},
				dataType:"json",
				success:function(data){
					console.log("오나");
					console.log(data);
					
					$divBody = $(".new_line2");
					$divBody.html('');
					
					$pageBody = $(".paging2 ul");
					$pageBody.html('');
					
					console.log(data.list2);
					console.log(data.list2[0].bid);
					console.log(data.pi2);
					
					var Q = data.list2;
					console.log(Q.length);
					var p2 = data.pi2;
					var QAnswer = data.listQAnswer;
					console.log(data.listQAnswer);
					
					if(Q.length > 0){
						for(var i = 0 ; i < Q.length; i++){
							var output="";
							output += "<br><br><br>";
							output += "<div class='row line_b'>";
							output += "<div class='col-lg-3 col-md-3 col-sm-6 col-xs-12' style = 'height:auto'>";
							output += "<div class='tm-about-box-1' style = 'height:220px; padding:10px 10px;'>";
							output += "<a href='#'><img src='${ contextPath }/resources/img/about-4.jpg' alt='img' class='tm-about-box-1-img' style = 'margin:0 auto 10px;'></a>";
							output += "<h3 class='tm-about-box-1-title' style = 'margin-bottom:5px;'>Songs <span>( GOD )</span></h3>";
							output += "<div class='gray-text'>";
							output += "<a href='#' class='tm-social-icon'><i class='fa fa-twitter'></i></a>";
							output += "<a href='#' class='tm-social-icon'><i class='fa fa-facebook'></i></a>";
							output += "<a href='#' class='tm-social-icon'><i class='fa fa-pinterest'></i></a>";
							output += "<a href='#' class='tm-social-icon'><i class='fa fa-google-plus'></i></a>";
							output += "</div>";
							output += "</div>";
							output += "</div>";	
							output += "<div class='col-lg-9 col-md-9 col-sm-6 col-xs-12 line_l' style = 'height:auto;' ><br>";
							output += "<div class='summary' style = 'padding-top:10px; font-size:18px'>";
							output += Q[i].text+"<span></div><br>";
							output += "<div style = 'padding-top:1px' >";
							output += "<div class='fa' style = 'width:100%'>";
							output += "<span class='ReviewUpDate' style = 'padding-top:5px'>";
							output += Q[i].modify_date+"</span>";
							output += "<span>&nbsp;|&nbsp;</span>";
							output += "<span class='ReviewUpDate' style = 'padding-top:5px'><i class='fa fa-thumbs-o-up' style = 'font-size:14px; padding-top:5px'>&nbsp;"+Q[i].likey+"</i><i class='fa fa-flag' style = 'font-size:14px; padding-top:5px; float:right; cursor:pointer'><a onclick='reportWrite(this);'> 신고하기</a></i></span>";
							output += "</div></div>";
							output += "<div style = 'margin-top:5px'><button type='button' class='btn btn-secondary' onclick = 'QA("+Q[i].bid+");'>답변</button>&nbsp;<button type='button' class='btn btn-secondary' onclick = 'allQA("+Q[i].bid+");'>모든 답변보기</button></div>";
							output += "<div id = 'allQAV"+Q[i].bid+"' class = 'QAV' style = 'padding-top:5px;''>";
		            		for(var j = 0 ; j < QAnswer.length ; j++){		            			
		            			if(Q[i].bid == QAnswer[j].bid){
		            				output += "<div class='summary' style = 'padding-top:10px; font-size:18px'>";
		            				output += QAnswer[j].content+"</div>";
		            				output += "<span class='ReviewUpDate' style = 'padding-top:5px'>"+QAnswer[j].modify_date+"</span>";
		            				output += "<span>|</span> "+QAnswer[j].bid+"님의 답변";
		            			}
		            		}
		            		output += "</div>";
							output += "<div id = "+Q[i].bid+" class = 'QAV' Style ='padding-top:10px'><input type = 'hidden' value = "+Q[i].bid+"><textarea style='resize: none;' name = 'text' rows='3' cols='110'></textarea><button type='button' class='btn btn-secondary' onclick = 'insertA(this);'>확인</button></div></div>";
							
							$divBody.append(output);
						}
						var num = p2.maxPage;
						var pOutput = "";
						if(p2.currentPage <= 1){
							pOutput += "<li><a>&laquo;</a></li>";
						}
						if(p2.currentPage > 1){
							pOutput += "<li><a onclick='goPrev2("+p2.currentPage+");'>&laquo;</a></li>";
						}
						for(var a = p2.startPage ; a <= p2.endPage ; a++){
							if(a == p2.currentPage){
								pOutput += "<li><a style='background-color:#ddd;''>"+a+"</a></li>";
							}
							if(a != p2.currentPage){
								pOutput += "<li><a onclick='goPage2("+a+");'>"+a+"</a></li>";
							}
						}
						if(p2.currentPage >= p2.maxPage){
							pOutput += "<li><a>&raquo;</a></li>";
						}
						if(p2.currentPage < p2.maxPage){
							pOutput += "<li><a onclick='goNext2("+p2.currentPage+");'>&raquo;</a></li>";
						}

						$pageBody.append(pOutput);
					}
				}, error:function(data){
					console.log(data);
				}
			});
		}
		
		function reviewPaging(page){
			console.log("page : " + page);
			
			$.ajax({ 
				url:"reviewPaging.bo",
				type:"post",
				data:{page:page},
				dataType:"json",
				success:function(data){
					console.log("오나");
					console.log(data);
					
					$divBody = $(".new_line");
					$divBody.html('');
					
					$pageBody = $(".paging ul");
					$pageBody.html('');
					
					console.log(data.list);
					console.log(data.list[0].bid);
					console.log(data.pi);
					
					var review = data.list;
					console.log(review.length);
					var p = data.pi;
					
					if(review.length > 0){
						for(var i = 0 ; i < review.length; i++){
							var output="";
							output += "<div class='row line_b'>";
							output += "<div class='col-lg-3 col-md-3 col-sm-6 col-xs-12' style = 'height:220px'>";
							output += "<div class='tm-about-box-1' style = 'height:220px; padding:10px 10px;'>";
							output += "<a href='#'><img src='${ contextPath }/resources/img/about-4.jpg' alt='img' class='tm-about-box-1-img' style = 'margin:0 auto 10px;'></a>";
							output += "<h3 class='tm-about-box-1-title' style = 'margin-bottom:5px;'>Songs <span>( GOD )</span></h3>";
							output += "<div class='gray-text'>";
							output += "<a href='#' class='tm-social-icon'><i class='fa fa-twitter'></i></a>";
							output += "<a href='#' class='tm-social-icon'><i class='fa fa-facebook'></i></a>";
							output += "<a href='#' class='tm-social-icon'><i class='fa fa-pinterest'></i></a>";
							output += "<a href='#' class='tm-social-icon'><i class='fa fa-google-plus'></i></a>";
							output += "</div>";
							output += "</div>";
							output += "</div>";
							output += "<div class='col-lg-9 col-md-9 col-sm-6 col-xs-12 line_l' style = 'height:220px; padding-bottom:10px;' ><br>";
							output += "<div><span class='StarBar'>";
							
							if(review[i].grade == 0.0){
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
							}
							
							if(review[i].grade == 0.5){
								output += "<i class='fas fa-star-half-alt' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
							}
							
							if(review[i].grade == 1.0){
								output += "<i class='fa fa-star' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
							}
							
							if(review[i].grade == 1.5){
								output += "<i class='fa fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star-half-alt' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
							}
							
							if(review[i].grade == 2.0){
								output += "<i class='fa fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fa fa-star' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
							}
							
							if(review[i].grade == 2.5){
								output += "<i class='fa fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fa fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star-half-alt' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
							}
							
							if(review[i].grade == 3.0){
								output += "<i class='fa fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fa fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fa fa-star' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
							}
							
							if(review[i].grade == 3.5){
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star-half-alt' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
							}
							
							if(review[i].grade== 4.0){
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='far fa-star' style = 'font-size:20px'></i>";
							}
							
							if(review[i].grade == 4.5){
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star-half-alt' style = 'font-size:20px'></i>";
							}
							
							if(review[i].grade == 5.0){
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
								output += "<i class='fas fa-star' style = 'font-size:20px'></i>";
							}
							output += "</span>&nbsp;&nbsp;";
							output += "<span class='ReviewUpDate'>리뷰 게시 날짜 : "+review[i].regist_date+"</span></div>";
							output += "<div class='ReviewTitle' style = 'font-size:20px; cursor:pointer; padding-top:10px;'><a href='#'><span>"+review[i].title+"</span></a></div>";
							output += "<div class='summary' style = 'padding-top:10px;'>"+review[i].text+"<span><a onclick = 'goDetail("+review[i].bid+")'>더 보기</a></span></div>";
							output += "<div style = 'padding-top:20px;'><div class='fa' style = 'width:100%;'><i class='fa fa-thumbs-o-up' style = 'font-size:20px; padding-top:10px;'> "+review[i].likey+" </i>&nbsp;<i class='far fa-comment-dots' style = 'font-size:20px; padding-top:10px;'> 0 </i><i class='fa fa-flag' style = 'font-size:20px; padding-top:10px; float:right;'> 신고하기 </i></div></div></div></div>";
							
							$divBody.append(output);
						}
						var num = p.maxPage;
						var pOutput = "";
						if(p.currentPage <= 1){
							pOutput += "<li><a>&laquo;</a></li>";
						}
						if(p.currentPage > 1){
							pOutput += "<li><a onclick='goPrev("+p.currentPage+");'>&laquo;</a></li>";
						}
						for(var a = p.startPage ; a <= p.endPage ; a++){
							if(a == p.currentPage){
								pOutput += "<li><a style='background-color:#ddd;''>"+a+"</a></li>";
							}
							if(a != p.currentPage){
								pOutput += "<li><a onclick='goPage("+a+");'>"+a+"</a></li>";
							}
						}
						if(p.currentPage >= p.maxPage){
							pOutput += "<li><a>&raquo;</a></li>";
						}
						if(p.currentPage < p.maxPage){
							pOutput += "<li><a onclick='goNext("+p.currentPage+");'>&raquo;</a></li>";
						}

						$pageBody.append(pOutput);
					}
				}, error:function(data){
					console.log(data);
				}
			});
		}
		
		function goPrev(page){
			page=page-1;
			reviewPaging(page);
		}
		
		function goPage(page){
			page=page;
			reviewPaging(page);
		}
		
		function goNext(page){
			page=page+1;
			reviewPaging(page);
		}
		
		function goPrev2(page){
			page=page-1;
			QPaging(page);
		}
		
		function goPage2(page){
			page=page;
			QPaging(page);
		}
		
		function goNext2(page){
			page=page+1;
			QPaging(page);
		}
		
		function QA(element){
			var a = document.getElementById(element);
			//a.style.display = "block";
			if(a.style.display == "block"){
				a.style.display = "none";
			}else{
				a.style.display = "block";
			}
		}
		
		function allQA(element){
			var a = document.getElementById("allQAV"+element);
			if(a.style.display == "block"){
				a.style.display = "none";
			}else{
				a.style.display = "block";
			}
			
			$.ajax({
				url:"selectA.bo",
				type:"post",
				dataType:"json",
				success:function(data){
					$ABody = $('#allQAV'+element);
					$ABody.html('');
					
					var QAns = data.listQAnswer;
					var output = "";
					console.log(QAns);
					
					//output += "<div id = 'allQAV"+element+"' class = 'QAV' style = 'padding-top:5px;''>";
            		for(var j = 0 ; j < QAns.length ; j++){		            			
            			if(element == QAns[j].bid){
            				output += "<div class='summary' style = 'padding-top:10px; font-size:18px'>";
            				output += QAns[j].content+"</div>";
            				output += "<span class='ReviewUpDate' style = 'padding-top:5px'>"+QAns[j].modify_date+"</span>";
            				output += "<span>|</span> "+QAns[j].bid+"님의 답변";
            			}
            		}
            		//output += "</div>";
    				
            		$ABody.append(output);
				},error:function(data){
					
				}
			})
		}
		
		function insertA(element){
			var a = $(element).parent().children().eq(1).val();
			var b = $(element).parent().children().eq(0).val();
			
			console.log(b);
			console.log(a);
			$.ajax({
					url:"insertA.bo",
					type:"post",
					data:{text:a, bid:b},
					dataType:"json",
					success:function(data){
						QA(b);
						$(element).parent().children().eq(1).val("");
						//location.href = "https://127.0.0.1:8443/hello/detailHotel?contentid=142861&contenttypeid=32#";
						
					},error:function(data){
						console.log(data);
					}
			})
		}
	
		function review(){
			if(${ sessionScope.loginUser != null && sessionScope.loginUser.mType.equals('1')})
 				location.href="reviewWrite.bo";
			else{
				alert("로그인이 필요한 서비스 입니다.");
			}
 		}
		
		function qa(){
			if(${ sessionScope.loginUser != null && sessionScope.loginUser.mType.equals('1')})
				location.href="QAWrite.bo";
			else{
				alert("로그인이 필요한 서비스 입니다.");
			}
		}
 	  
		function reportWrite(element){
    		var m_id = $(element).parent().parent().children().eq(2).val();
    		var ref_id = $(element).parent().parent().children().eq(3).val();
    		
    		console.log(m_id);
    		console.log(ref_id);

    		window.open('reportWrite.bo?m_id='+m_id+'&ref_id='+ref_id, 'reportWrite', 'height=380, width=450, top=80, left=400 resizable=none, scrollbars=no')
   		}
    	
    	function goDetail(bid){
    		location.href = "reviewDetail.bo?bid="+ bid;
    	}
    	
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