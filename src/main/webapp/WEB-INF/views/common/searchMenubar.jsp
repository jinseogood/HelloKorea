<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,600,700' rel='stylesheet' type='text/css'>
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
		float:right;
	}
	#menuIconArea img{
		width:20px;
		height:20px;
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
				  		<div id="menuIconArea">
				  			<c:if test="${ sessionScope.loginUser != null && sessionScope.loginUser.mType.equals('admin') }">
								<a href="myPageView.ad"><img src="${ contextPath }/resources/img/myPageIcon.png"></a>
							</c:if>
							<c:if test="${ sessionScope.loginUser != null && sessionScope.loginUser.mType.equals('1') }">
							    <a class="myPage" href="userMypage.um">mypage(일반)</a>
							</c:if>
							<c:if test="${ sessionScope.loginUser != null && sessionScope.loginUser.mType.equals('2') }">		
								<a href="myPageView.sell"><img src="${ contextPath }/resources/img/myPageIcon.png"></a>
							</c:if>
							<c:if test="${ sessionScope.loginUser == null }">
					  			<a class="fas fa-angry" id="loginOpen" data-toggle="modal" data-target="#loginDiv">Login</a>
							</c:if>
							<c:if test="${! empty sessionScope.loginUser }">
							    <input type="hidden" id="msgBtn" value="${ sessionScope.loginUser.mId }">
							    <a onclick="openMsg()"><img src="${ contextPath }/resources/img/msgIcon.png"></a>
								<a class="logout" href="logout.me">Logout</a>
								<br>
								<span>${ sessionScope.loginUser.nickname } 님</span>
							</c:if>
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