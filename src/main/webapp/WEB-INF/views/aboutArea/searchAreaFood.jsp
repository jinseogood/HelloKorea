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
	.foodSearchText{font-size:20px;}
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
					<div class="col-lg-5 col-md-6 col-sm-6"><h2 class="tm-section-title">서울 음식점</h2></div>
					<div class="col-lg-3 col-md-3 col-sm-3"><hr></div>	
				</div>
					<div class="col-lg-3 col-md-3 col-sm-3">
						<span class="tm-section-title" style="font-size:25px;"></span>
					</div>
					<div class="col-lg-5 col-md-6 col-sm-6"></div>
					<div class="col-lg-3 col-md-3 col-sm-3" align="right">
						<span class="tm-section-title" style="font-size:20px;">정렬 : <a href="#">이름</a> <a href="#">평점</a></span>
					</div>	
					<br><br>
				<div class="col-lg-4" align="left">
					
					<div class="col-lg-12 col-md-12 col-sm-12" align="left">
						<span class="tm-section-title" style="font-size:25px; border-bottom:1px solid #ccc;"><b>음식점 유형</b></span>
						<br>
						<input type="checkbox" class="foodSearch" id="foodStore" name="foodStore" style="width:15px; height:15px;"/>　<label for="foodStore">음식점</label><br>
						<input type="checkbox" class="foodSearch" id="dessert" name="dessert" style="width:15px; height:15px;"/>　<label for="dessert">디저트</label><br>
						<input type="checkbox" class="foodSearch" id="coffee" name="coffee" style="width:15px; height:15px;"/>　<label for="coffee">커피/차</label><br>
						<input type="checkbox" class="foodSearch" id="bakery" name="bakery" style="width:15px; height:15px;"/>　<label for="bakery">베이커리</label><br><br>
					</div>
					
					<br><br>
					
					<div class="col-lg-12 col-md-12 col-sm-12" align="left">
						<span class="tm-section-title" style="font-size:25px; border-bottom:1px solid #ccc;"><b>요리유형</b></span>
						<br>
						<input type="checkbox" class="foodSearch" id="koreaFood" name="koreaFood" style="width:15px; height:15px;"/>　<label for="koreaFood">한식</label><br>
						<input type="checkbox" class="foodSearch" id="japanFood" name="japanFood" style="width:15px; height:15px;"/>　<label for="japanFood">일식</label><br>
						<input type="checkbox" class="foodSearch" id="chinaFood" name="chinaFood" style="width:15px; height:15px;"/>　<label for="chinaFood">중식</label><br>
						<input type="checkbox" class="foodSearch" id="americanFood" name="americanFood" style="width:15px; height:15px;"/>　<label for="americanFood">양식</label><br><br>
					</div>
					
					<br>
					<div class="col-lg-12 col-md-12 col-sm-12" align="left">
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
				<div class="col-lg-8" align="center">
					
				    <div class="tm-home-box-3 detailHover" onclick="location.href='${contextPath}/detailFood'">
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