<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
<script type="text/javascript" src="${ contextPath }/resources/js/jquery-1.11.2.min.js"></script>      		<!-- jQuery -->
<script type="text/javascript" src="${ contextPath }/resources/js/bootstrap.min.js"></script>					<!-- bootstrap js -->
<script type="text/javascript" src="${ contextPath }/resources/js/jquery.flexslider-min.js"></script>			<!-- flexslider js -->
<script type="text/javascript" src="${ contextPath }/resources/js/templatemo-script.js"></script>      		<!-- Templatemo Script -->
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,600,700' rel='stylesheet' type='text/css'>
<link href="${ contextPath }/resources/css/font-awesome.min.css" rel="stylesheet">
<link href="${ contextPath }/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${ contextPath }/resources/css/bootstrap-datetimepicker.min.css" rel="stylesheet">  
<link href="${ contextPath }/resources/css/flexslider.css" rel="stylesheet">
<link href="${ contextPath }/resources/css/templatemo-style.css" rel="stylesheet">
<title>Insert title here</title>
<style>
	#menuIconArea{
		width:135px;
		height:80px;
		float:left;
	}
</style>
</head>
<body>
	<!-- Header -->
  	<div class="tm-header">
  		<div class="container">
  			<div class="row">
  				<div class="col-lg-5 col-md-4 col-sm-3 tm-site-name-container">
  					<a href="index.jsp" class="tm-site-name">Hello Korea</a>	
  				</div>
	  			<div class="col-lg-7 col-md-8 col-sm-9">
	  				<div class="mobile-menu-icon">
		              <i class="fa fa-bars"></i>
		            </div>
	  				<nav class="tm-nav">
						<ul>
							<li><a href="mainView">Home</a></li>
							<li><a href="aboutView">About</a></li>
							<li><a href="toursView">Our Tours</a></li>
							<li><a href="contactView">Contact</a></li>
						</ul>
				  		<div id="menuIconArea">
				  			<a onclick="openMsg()">Msg</a>
				  			<a href="helpView">Help</a>
							<a href="myPageView.sell">MyPage</a>
							<a href="myPageView.ad">ADMIN MyPage</a>
							<div id="google_translate_element"></div>
				  		</div>
					</nav>		
	  			</div>				
  			</div>
  		</div>
  	</div>
  	<script>
  		function googleTranslateElementInit() {
  	  		new google.translate.TranslateElement({pageLanguage: 'ko'}, 'google_translate_element');
  	  		jQuery('.goog-logo-link').css('display', 'none');
        	jQuery('.goog-te-gadget').css('font-size', '0');
  		}
  		function openMsg(){
  	    	window.open('recieveMessageView', 'Hello', 'width=480px, height=580px, top=80px, left=400px');
  	    }
  	</script>
</body>
</html>