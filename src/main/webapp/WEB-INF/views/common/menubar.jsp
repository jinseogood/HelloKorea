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
		float:left;
	}
	#menuIconArea img{
		width:20px;
		height:20px;
	}
	#loginDiv { /* 팝업창 css */
		top: 0px;
		
		position: absolute;
		width: 450px;
		height: 420px;
		display: none;
		background: white;
		border: none;
	}
	
	.loginBtn1 {
		width: 300px;
		height: 50px;
		margin-top: 10px;
		border: none;
	}
	#snsBtn {
		margin-left: auto;
		margin-right: auto;
		width: 300px;
		height: 150px;
		margin-top: 15px;
	}
	
	#email {
		margin-left: auto;
		margin-right: auto;
		width: 300px;
		height: 100px;
	}
	

	
	#topDiv {
		width: 450px;
		height: 90px;
		margin-top: 0px;
	}
	
	#closeBtn {
		width: 30px;
		height: 30px;
		margin-left: 390px;
		margin-top: 10px;
		background: none;
		border: none;
	}
	
	#closeBtn1 {
		width: 30px;
		height: 30px;
		margin-left: 390px;
		margin-top: 10px;
		background: none;
		border: none;
	}
	#closeBtn2 {
		width: 30px;
		height: 30px;
		margin-left: 390px;
		margin-top: 10px;
	 	background: none;
		border: none;
	}
	#closeBtn3 {
		width: 30px;
		height: 30px;
		margin-left: 390px;
		margin-top: 10px;
		background: none;
		border: none;
	}
	#closeBtn4 {
		width: 30px;
		height: 30px;
		margin-left: 390px;
		margin-top: 10px;
		background: none;
		border: none;
	}
	#emailBtn {
		width: 300px;
		height: 50px;
		margin-top: 10px;
		border: none;
	}
	
	#emailDiv {
		top: 0px;
		position: absolute;
		width: 450px;
		height: 420px;
		display: none;
		background: white;
		border: none;
	}
	#sellerDiv{
		top: 0px;
		position: absolute;
		width: 450px;
		height: 420px;
		display: none;
		background: white;
		border: none;
	}
	
	#emailTable {
		margin-left: auto;
		margin-right: auto;
		margin-top: 30px;
	}
	
	.inputStyle{
		width: 300px;
		height: 40px;
		margin-top: 5px;
		margin-bottom: 5px;
	}
		
	#joinBtn1 {
	   width: 100px;
	   margin-left: 15px;
	   height: 30px;
	}
	#joinBtn {
		width: 100px;
		margin-left: 15px;
		height: 30px;
		border:none;
	}
	
	#joinDiv {
		top: 0px;
		position: absolute;
		width: 450px;
		height: 420px;
		display: none;
		background: white;
		border: none;
	}
	#joinInsert{
		margin-top:30px;
		margin-right:auto;
		margin-left:auto;	
	}
	#loginBtn{
		width: 100px;
		margin-left: 15px;
		height: 30px;
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
							<li><a href="hotelView">숙박</a></li>
							<li><a href="foodView">음식점</a></li>
							<li><a href="toursView">오락거리</a></li>
							<li><a href="contactView">Contact</a></li>
						</ul>
				  		<div id="menuIconArea">
				  			<c:if test="${ sessionScope.loginUser != null && sessionScope.loginUser.mType.equals('admin') }">
								<a href="myPageView.ad"><img src="${ contextPath }/resources/img/myPageIcon.png"></a>
								<a onclick="openMsg()"><img src="${ contextPath }/resources/img/msgIcon.png"></a>
							</c:if>
							<c:if test="${ sessionScope.loginUser != null && sessionScope.loginUser.mType.equals('1') }">
					  			<a onclick="openMsg()"><img src="${ contextPath }/resources/img/msgIcon.png"></a>
							</c:if>
							<c:if test="${ sessionScope.loginUser != null && sessionScope.loginUser.mType.equals('2') }">
								<a onclick="openMsg()"><img src="${ contextPath }/resources/img/msgIcon.png"></a>
								<a href="myPageView.sell"><img src="${ contextPath }/resources/img/myPageIcon.png"></a>
							</c:if>
							<c:if test="${ sessionScope.loginUser == null }">
					  			<a class="fas fa-angry" id="loginOpen" data-toggle="modal" data-target="#loginDiv">Login</a>
							</c:if>
							<c:if test="${! empty sessionScope.loginUser }">
								<a class="logout" href="logout.me">Logout</a>
								<a class="myPage" href="userMypage.me">mypage</a>
							</c:if>
								<a href="reviewWrite.bo">reviewW</a>
								<a href="QAWrite.bo">QW</a>
								<div id="google_translate_element"></div>
				  		</div>
					</nav>		
	  			</div>				
  			</div>
  		</div>
  	</div>

	<!--모달  -->
	<div id="loginDiv" class="modal fade" role="dialog">
		<div id="topDiv">
			<button id="closeBtn">X</button>
			<label style="width: 180px; font-size: 30px;">Hello Korea</label>
		</div>
		<div id="snsBtn">
			<button  id="btnJoinFacebook"class="btn btn-primary btn-round" style="width: 100%"><i class="fa fa-facebook" aria-hidden="true"></i>Facebook Login</button>
			<button id="btnJoinGoogle" class="btn btn-primary btn-round" style="width: 100%"><i class="fa fa-google" aria-hidden="true"></i>Google Login</button>
		</div>
		<hr style="	width: 400px;
		border: solid #D8D8D8 1px;">
		<div id="email">
			<button id="emailBtn" data-toggle="modal" data-target="#emailDiv">이메일로계속하기</button>
		</div>
	</div>
	<div id="emailDiv" class="modal fade" role="dialog">
		<div id="topDiv">
			<button id="closeBtn1">X</button>
			<label style="width: 50px; font-size: 30px;">LOGIN</label>
		</div>
		<form action="login.me" method="post">
			<table id="emailTable">
				<tr>
					<th>Email</th>
				</tr>
				<tr>
					<td><input type="text" id="userId" name="email" class="inputStyle"></td>
				</tr>
				<tr>
					<th>Password</th>
				</tr>
				<tr>
					<td><input type="password" id="userPwd" name="password" class="inputStyle"></td>
				</tr>
			</table>
			<hr style="	width: 400px;border: solid #D8D8D8 1px;">
			<div align="center">
				<button class="loginBtn1">로그인</button>
			</div>
		</form>
		<div align="center">
		<label>계정이 없으신 가요?
			<button id="joinBtn" data-toggle="modal" data-target="#joinDiv"class="loginBtn">회원가입</button>
		</label>
		
		</div>
	</div>

	<div id="joinDiv" class="modal fade" role="dialog">
		<div id="topDiv">
			<button id="closeBtn2">X</button>
			<label style="width: 50px; font-size: 30px;">JOIN</label> <br> <label
				style="width: 200px; hegiht: 30px; font-size: 15px;">Membership
				is free!</label>
		</div>
		<div id="joinInsert">
			<form action="insertUser.me" method="post" id="insertForm">
				<table align="center">
					<tr>
						<th>Email</th>
					</tr>
					<tr>
						<td><input type="email" name="email" id="userEmail" class="inputStyle"></td>
					</tr>
					<tr>
						<th>Password</th>
					</tr>
					<tr>
						<td><input type="password" name="password" id="userPassword" class="inputStyle"></td>
					</tr>
				</table>
				<div align="center">
					<button class="loginBtn1">회원가입하기</button>
				</div>
			</form>
			
			<div align="center">
				<label>판매자등록은 여기로
					<button class="loginBtn" id="joinBtn1" data-toggle="modal" data-target="#sellerDiv">판매자등록</button>
				</label>
			</div>
		</div>
	</div>
	<div id="sellerDiv" class="modal fade" role="dialog">
		<div id="topDiv">
			<button id="closeBtn3">X</button>
			<label style="width: 50px; font-size: 30px;">SELLERJOIN</label>
		</div>
		<form action="insertSeller.me" method="post">
			<table align="center">
				<tr>
					<th>Email</th>
				</tr>
				<tr>
					<td><input type="email" name="email" class="inputStyle"></td>
				</tr>
				<tr>
					<th>Password</th>
				</tr>
				<tr>
					<td><input type="password" name="password" class="inputStyle"></td>
				</tr>
			</table>
			<div align="center">
				<button class="loginBtn1">판매자회원가입</button>
			</div>
		</form>
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
  		
  		$("#loginOpen").click(function(event){
  	    	console.log('작동');
  	    	$("#loginDiv").css({
				"top": (($(window).height()-$("#loginDiv").outerHeight())/1.5+$(window).scrollTop())+"px",
				"left": (($(window).width()-$("#loginDiv").outerWidth())/2+$(window).scrollLeft())+"px"
			});
  	             
			$("body").css("overflow","hidden");
		});
  		
  	    $("#closeBtn").click(function(event){
			/*  $("#popup_mask").hide(); */
			$("#loginDiv").hide(); 
			$(".modal-backdrop").hide();
			$("body").css("overflow","auto");
  	      
		});
  	    
		$("#emailBtn").click(function(event){
			$("#loginDiv").hide();
			$(".modal-backdrop").hide();
			$("#emailDiv").show();
		  	        
		  	         
			$("#emailDiv").css({
				"top": (($(window).height()-$("#emailDiv").outerHeight())/1.5+$(window).scrollTop())+"px",
				"left": (($(window).width()-$("#emailDiv").outerWidth())/2+$(window).scrollLeft())+"px"
			});
			$("body").css("overflow","hidden");
		
			$("#closeBtn1").click(function(event){
				$("#loginDiv").hide();
				$("#emailDiv").hide(); 
				$(".modal-backdrop").hide();
				$("body").css("overflow","auto");
		  	       
			});
		});
		  	  
		$("#joinBtn").click(function(event){
		        
			$("#emailDiv").hide();
			$(".modal-backdrop").hide();
			$("#joinDiv").show();
			$("#joinDiv").css({
				"top": (($(window).height()-$("#loginDiv").outerHeight())/1.5+$(window).scrollTop())+"px",
				"left": (($(window).width()-$("#loginDiv").outerWidth())/2+$(window).scrollLeft())+"px"
			});
			$("body").css("overflow","hidden");
		     
			$("#closeBtn2").click(function(event){
				$("#joinDiv").hide();
				$("#emailDiv").hide(); 
				$(".modal-backdrop").hide();
				$("body").css("overflow","auto");
			});
		});
		  	
		$("#joinBtn1").click(function(){
			$("#joinDiv").hide();
			$(".modal-backdrop").hide();
			$("#sellerDiv").show();
			$("#sellerDiv").css({
				"top": (($(window).height()-$("#loginDiv").outerHeight())/1.5+$(window).scrollTop())+"px",
				"left": (($(window).width()-$("#loginDiv").outerWidth())/2+$(window).scrollLeft())+"px"
			});
		         
			$("body").css("overflow","hidden");
			$("#closeBtn3").click(function(event){
				$("#joinDiv").hide();
				$("#sellerDiv").hide(); 
				$(".modal-backdrop").hide();
				$("body").css("overflow","auto");
			});
		});
  		
  	</script>
	 <script>
		$("#loginOpen").click(function(){
			$.ajax({
				url:"facebook.me",
				type:"post",
				data:{},
				success:function(data){
					console.log(data);
					$("#btnJoinFacebook").attr("onclick", "location.href =" + data);
					
					
				},
				errror:function(){
					console.log("에러");	
				}
			})
		});
		
	
	</script>
  <!-- 	<script>
		(function(d, s, id) {
		  var js, fjs = d.getElementsByTagName(s)[0];
		  if (d.getElementById(id)) return;
		  js = d.createElement(s); js.id = id;
		  js.src = 'https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v3.1&appId=2078468609042330&autoLogAppEvents=1';
		  fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
		
		function fbLogin() {
			// 로그인 여부 체크
			FB.getLoginStatus(function(response) {

				if (response.status === 'connected') {
					FB.api('/me', function(res) {
						// 제일 마지막에 실행
						console.log("Success Login : " + response.name);
						// alert("Success Login : " + response.name);
					});
				} else if (response.status === 'not_authorized') {
					// 사람은 Facebook에 로그인했지만 앱에는 로그인하지 않았습니다.
					alert('앱에 로그인해야 이용가능한 기능입니다.');
				} else {
					// 그 사람은 Facebook에 로그인하지 않았으므로이 앱에 로그인했는지 여부는 확실하지 않습니다.
					alert('페이스북에 로그인해야 이용가능한 기능입니다.');
				}
			}, true); // 중복실행방지
		}

		window.fbAsyncInit = function() {
			FB.init({
				appId   : '2078468609042330',
				cookie  : true,
				xfbml   : true,
				version : 'v3.1'
			});
		};

		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id)) return;
			js = d.createElement(s); js.id = id;
			// ko_KR 을 en_US 로 바꾸면 영문으로 로그인버튼을 사용할 수 있어요.
			js.src = "//connect.facebook.net/ko_KR/sdk.js";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
		</script>-->
 		
 		
 		<script> 
 		$("#loginOpen").click(function(){
			$.ajax({
				url:"google.me",
				type:"post",
				data:{},
				success:function(data){
				console.log(data);
					$("#btnJoinGoogle").attr("onclick", "location.href =" + data);
					
				},
				error:function(){
					console.log("에러");	
				}
			})
		});
 		
 		</script>
  		
</body>
</html>