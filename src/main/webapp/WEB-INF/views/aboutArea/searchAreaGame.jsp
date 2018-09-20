<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Hello Korea</title>
<style>
	#more{margin-top:5%;}
	.detailHover:hover{cursor:pointer}
	.gameSearchText{font-size:20px;}
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
					<div class="col-lg-5 col-md-6 col-sm-6"><h2 class="tm-section-title">서울 오락거리</h2></div>
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
					<div class="col-lg-5 col-md-6 col-sm-6"></div>
					<div class="col-lg-3 col-md-3 col-sm-3" align="right">
						<span class="tm-section-title" style="font-size:20px;">정렬 : <a href="#">이름</a> <a href="#">평점</a></span>
					</div>	
					<br><br>
				<div class="col-lg-4" align="left">
					
					
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
						<input type="radio" class="gameSearch" id="amusmenetPark" name="festivalgroup" style="width:15px; height:15px;"/>
						<label for="amusmentPark" class="gameSearchText">&nbsp;&nbsp;놀이공원</label><br>
						<input type="radio" class="gameSearch" id="spar" name="festivalgroup" style="width:15px; height:15px;"/>
						<label for="spar" class="gameSearchText">&nbsp;&nbsp;스파</label><br>
						<input type="radio" class="gameSearch" id="zoo" name="festivalgroup" style="width:15px; height:15px;"/>
						<label for="zoo" class="gameSearchText">&nbsp;&nbsp;동물원/아쿠아리움</label><br>
					</div>
					
					<br><br>
					<!-- 축제 선택시에만 일자 고르는 select-option 나오도록 -->
					<script>
						$(function(){
							$(".festivalSearchArea").hide();
							
							$("input[name=festivalgroup]").click(function(){
								if($("#festival").is(":checked") == true){
									$(".festivalSearchArea").show();
								}else{
									$(".festivalSearchArea").hide();
								}
							});
						});
					</script>
					
				</div>
				<div class="col-lg-8" align="center">
					
				    <div class="tm-home-box-3 detailHover" onclick="location.href='${contextPath}/detailGame'">
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
					<div class="tm-home-box-3">
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
					<div class="tm-home-box-3">
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
					<div class="tm-home-box-3">
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