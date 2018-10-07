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
	.roomImgTd{width:260px; height:300px;}
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
		
			//var contentid = ${param.contentid};
			//var contenttypeid = ${param.contenttypeid};
			
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
						//if(myData.infocenter)
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
						for(var i in myData){
							output = "";
							output += "<tr>";
							// if(myData[i].rooming1 == null){
							//	output += "<td class='detailContent'><img src='${contextPath}/resources/img/noImage.gif' class='roomIngTd' /></td>";
							//}else{ 
							output += "<td class='detailContent'><img src="+myData[i].roomimg1+" class='roomImgTd' /></td>";
							//}
							output += "<td>";
							output += "<h4><b>객실명 : "+myData[i].roomtitle+"</b></h4>";
							output += "ㆍ 객실크기 : "+myData[i].roomsize1+" 평<br>";
							output += "ㆍ 객실수 : "+myData[i].roomcount+"<br>";
							output += "ㆍ 기준인원 : "+myData[i].roombasecount+" (최대인원 : "+myData[i].roommaxcount+")<br>";
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
							output += "ㆍ 비수기 주중최소 : "+myData[i].roomoffseasonminfee1+" (성수기 : "+myData[i].roompeakseasonminfee1+")<br>";
							output += "ㆍ 비수기 주말최소 : "+myData[i].roomoffseasonminfee2+" (성수기 : "+myData[i].roompeakseasonminfee2+")<br>";
							output += "</td>";
							output += "</tr>"
							document.getElementById("roomInfoArea").innerHTML += output;
						}
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
		  	loadGoogleMap();
		  });
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
					<tr>
						<td class="detailBottom"></td>
						<td class="detailBottom"></td>
						<td class="detailBottom"></td>
						<td class="detailBottom"></td>
					</tr>
				</tbody>
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
            		<a href="#"><span>${ list.title }</span></a>
            	</div>
            	<div class="summary" style = "padding-top:10px">
            		${ list.text }
            		<span><a href="#">더 보기</a></span>
            	</div>
            	<div style = "padding-top:20px;" >
            		<div class="fa" style = "width:100%">
            			<i class="fa fa-thumbs-o-up" style = "font-size:20px; padding-top:10px"> ${ list.likey } </i>
            			<i class="fa fa-comment" style = "font-size:20px; padding-top:10px"> 0 </i>
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
            		${ list2.text }
            		<span><a href="#">더 보기</a></span>
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
					
					if(Q.length > 0){
						for(var i = 0 ; i < Q.length; i++){
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
							output += "<div class='col-lg-9 col-md-9 col-sm-6 col-xs-12 line_l' style = 'height:220px;' ><br>";
							output += "<div class='summary' style = 'padding-top:10px; font-size:18px'>";
							output += Q[i].text+"<span><a href="#">더 보기</a></span></div><br>";
							output += "<div style = 'padding-top:1px' >";
							output += "<div class='fa' style = 'width:100%'>";
							output += "<span class='ReviewUpDate' style = 'padding-top:5px'>";
							output += Q[i].modify_date"</span>";
							output += "<span>|</span>";
							output += "<span class='ReviewUpDate' style = 'padding-top:5px'><i class='fa fa-thumbs-o-up' style = 'font-size:14px; padding-top:5px'>"+Q[i].likey+"</i><i class='fa fa-flag' style = 'font-size:14px; padding-top:5px; float:right; cursor:pointer'><a onclick='reportWrite()'> 신고하기</a></i></span>";
							output += "</div></div>";
							output += "<div style = 'margin-top:5px'><button type='button' class='btn btn-secondary'>답변</button><button type='button' class='btn btn-secondary'>모든 답변보기</button></div></div>";
							
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
							if(a != p.currentPage){
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
							output += "<i class='fa fa-star'></i>";
							output += "<i class='fa fa-star'></i>";
							output += "<i class='fa fa-star'></i>";
							output += "<i class='fa fa-star'></i>";
							output += "<i class='fa fa-star'></i>";
							output += "</span>&nbsp;&nbsp;";
							output += "<span class='ReviewUpDate'>리뷰 게시 날짜 : "+review[i].regist_date+"</span></div>";
							output += "<div class='ReviewTitle' style = 'font-size:20px; cursor:pointer; padding-top:10px;'><a href='#'><span>"+review[i].title+"</span></a></div>";
							output += "<div class='summary' style = 'padding-top:10px;'>"+review[i].text+"<span><a href='#'>더 보기</a></span></div>";
							output += "<div style = 'padding-top:20px;'><div class='fa' style = 'width:100%;'><i class='fa fa-thumbs-o-up' style = 'font-size:20px; padding-top:10px;'> "+review[i].likey+" </i><i class='fa fa-comment' style = 'font-size:20px; padding-top:10px;'> 0 </i><i class='fa fa-flag' style = 'font-size:20px; padding-top:10px; float:right;'> 신고하기 </i></div></div></div></div>";
							
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
	
		function review(){
			if(${ sessionScope.loginUser != null && sessionScope.loginUser.mType.equals('2')})
 				location.href="reviewWrite.bo";
			else{
				alert("로그인이 필요한 서비스 입니다.");
			}
 		}
		
		function qa(){
			if(${ sessionScope.loginUser != null && sessionScope.loginUser.mType.equals('2')})
				location.href="QAWrite.bo";
			else{
				alert("로그인이 필요한 서비스 입니다.");
			}
		}
 	  
    	function reportWrite(){
    		window.open('reportWrite.bo', 'reportWrite', 'height=580, width=480, top=80, left=400 resizable=none, scrollbars=no')
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