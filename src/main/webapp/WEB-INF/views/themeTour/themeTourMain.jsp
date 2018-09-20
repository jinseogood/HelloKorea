<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello Korea</title>
<style>
	#more{margin-top:5%;}
	.detailHover:hover{cursor:pointer}
	.themeText{font-size:20px;}
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
					<div class="col-lg-5 col-md-6 col-sm-6"><h2 class="tm-section-title">테마여행</h2></div>
					<div class="col-lg-3 col-md-3 col-sm-3"><hr></div>	
				</div>
				<div class="tm-section-header col-lg-12">
					<div class="col-lg-4 col-md-3 col-sm-3">
						<span class="tm-section-title" style="font-size:25px;"><b>테마 선택</b></span>
					</div>
					<div class="col-lg-8 col-md-6 col-sm-6" align="center">
						<span class="tm-section-title" style="font-size:25px;"><b>추천 장소 Best</b></span>
					</div>	
				</div>
				
				
					
				<!-- 테마 선택 버튼 영역 -->
				<div class="col-lg-4" align="left">
					
					<div class="col-lg-12 col-md-12 col-sm-12" align="left">
						<span class="tm-section-title" style="font-size:25px; border-bottom:1px solid #ccc;"><b>분류</b></span>
						<br><br>
						<input type="radio" id="themeShopping" name="themeSelect" style="width:17px; height:17px;" />
						<label for="themeShopping" class="themeText">&nbsp;&nbsp;쇼핑</label><br>
						<input type="radio" id="themeBeauty" name="themeSelect" style="width:17px; height:17px;" />
						<label for="themeBeauty" class="themeText">&nbsp;&nbsp;뷰티</label><br>
						<input type="radio" id="themeClassic" name="themeSelect" style="width:17px; height:17px;"/>
						<label for="themeClassic" class="themeText">&nbsp;&nbsp;전통</label><br>
						<input type="radio" id="themeLeisure" name="themeSelect" style="width:17px; height:17px;" />
						<label for="themeLeisure" class="themeText">&nbsp;&nbsp;레져</label><br>
						<input type="radio" id="themeKoreaWave" name="themeSelect" style="width:17px; height:17px;" />
						<label for="themeKoreaWave" class="themeText">&nbsp;&nbsp;한류</label><br>
						
					</div>
					
					
					
				</div>
				<div class="col-lg-8" align="center">
					
				    <div class="tm-home-box-3 detailHover" onclick="location.href='${contextPath}/detailHotel'">
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