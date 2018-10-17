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
@font-face { font-family: 'BMJUA'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff') format('woff'); font-weight: normal; font-style: normal; }
	
	body, div, p, a, h1,h2,h3,h4, input, select {
		font-family: BMJUA,meiryo,BMJUA !important
	}
	
	#menuIconArea{
		width:135px;
		height:80px;
		float:right;
	}
	#loginDiv { /* 팝업창 css */
		top: 0px;
		position: absolute;
		width: 430px;
		height: 600px; 
		display: none;
		border: none;
		background:#FAFAFA;
		border-radius:10px;
	}
	
	#snsBtn {
		margin-left: auto;
		margin-right: auto;
		width: 300px;
		height: 150px;
		margin-top: 15px;
	}

 	#emailBtn {
		width: 300px;
		height: 50px;
		margin-top: 10px;
		border: none;
	} 
	
	 #emailLoginDiv {
		top: 0px;
		position: absolute;
		width: 430px;
		height: 600px; 
		display: none;
		border: none;
		background:#FAFAFA;
		border-radius:10px;
	} 
	.col-md-3{
	 width: 361.5px;
	 height: 464px;
	 margin-left:30px;
	
	}
	#sllerJoinDiv{
		top: 0px;
		position: absolute;
		width: 430px;
		height: 600px; 
		display: none;
		border: none;
		background:#FAFAFA;
		border-radius:10px;
	}
	
	#userJoinDiv {
		top: 0px;
		position: absolute;
		width: 430px;
		height: 600px; 
		display: none;
		border: none;
		background:#FAFAFA;
		border-radius:10px;
	}

	#loginBtn{
		width: 100px;
		margin-left: 15px;
		height: 30px;
	}
	#btnJoinFacebook{
		height:50px;
		border:solid 1px #2E64FE;
		background:#FAFAFA;
		color:#2E64FE
	}
	#btnJoinGoogle{
		height:50px;
		margin-top:10px;
		border:solid 1px #DF0101;
		background:#FAFAFA;
		color:#DF0101;
		
	}

</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
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
						</ul>
				  		<div id="menuIconArea">
				  			<c:if test="${ sessionScope.loginUser != null && sessionScope.loginUser.mType.equals('admin') }">
								<a href="myPageView.ad"><img src="${ contextPath }/resources/img/myPageIcon.png" style="width:35px;height:35px;"></a>
							</c:if>
							<c:if test="${ sessionScope.loginUser != null && sessionScope.loginUser.mType.equals('1') }">
							    <a class="myPage" href="userMypage.um"><img src="${ contextPath }/resources/img/myPageIcon.png" style="width:35px;height:35px;"></a>
							</c:if>
							<c:if test="${ sessionScope.loginUser != null && sessionScope.loginUser.mType.equals('2') }">		
								<a href="myPageView.sell"><img src="${ contextPath }/resources/img/myPageIcon.png" style="width:35px;height:35px;"></a>
							</c:if>
							<c:if test="${ sessionScope.loginUser == null }">
					  			<a class="fas fa-angry" id="loginOpen" data-toggle="modal" data-target="#loginDiv"><img src="${ contextPath }/resources/img/loginIcon.png" style="width:32px;height:32px;margin-top:2%;"></a>
							</c:if>
							<c:if test="${! empty sessionScope.loginUser }">
							    <input type="hidden" id="msgBtn" value="${ sessionScope.loginUser.mId }">
							    <a onclick="openMsg()" id="noMsg"><img src="${ contextPath }/resources/img/msgIcon.png" style="width:38px;height:38px;"></a>
							    <a onclick="openMsg()" id="newMsg"><img src="${ contextPath }/resources/img/msgIcon2.png" style="width:38px;height:38px;"></a>
								<a class="logout" href="logout.me"><img src="${ contextPath }/resources/img/logoutIcon.png" style="width:30px;height:30px;margin-left:1%;"></a>
							</c:if>
								<div id="google_translate_element"></div>
				  		</div>
					</nav>		
	  			</div>				
  			</div>
  		</div>
  	</div>

		<!-- 모달 -->
	  <div id="loginDiv" class="modal fade" role="dialog">
        <div class="page-header">
         <h3 align="center">Welcom HelloKorea</h3>
        </div>
        <div class="col-md-3">
         	<div class="login-box well">
         	<div id="snsBtn">
			<button  id="btnJoinFacebook"class="btn btn-primary btn-round" style="width: 100%;"><i class="fa fa-facebook" aria-hidden="true"></i>Facebook Login</button>
			<button id="btnJoinGoogle" class="btn btn-primary btn-round" style="width: 100%;"> <i class="fa fa-google" aria-hidden="true"></i>Google Login</button>
			</div>
			<hr/>
			<div id="email">
			<button id="emailBtn" data-toggle="modal" data-target="#emailLoginDiv">이메일로계속하기</button>
		</div>
		 </div>
        </div>
      </div>
	
	<!--자회원 로그인 폼  -->
	  <div id="emailLoginDiv" class="modal fade" role="dialog">
        <div class="page-header" align="center">
          <h3>회원가입하기 </h3>
          <label>더 많은 정보를 확인하세요 !</label>
        </div>
        <div class="col-md-3">
          <div class="login-box well">
        	<form action="login.me" method="post">
            <legend>로그인</legend>
            <div class="form-group">
                <label for="username-email">이메일 or 아이디</label>
                <input name="email" value='' id="email" placeholder="E-mail" type="text" class="form-control" />
            </div>
            <div class="form-group">
                <label for="password">비밀번호</label>
                <input name="password" id="password" value='' placeholder="Password" type="password" class="form-control" />
            </div>
            <div class="form-group">
                <input type="submit" class="btn btn-default btn-login-submit btn-block m-t-md" value="Login" />
            </div>
            <span class='text-center'><a href="/bbs/index.php?mid=index&act=dispMemberFindAccount" class="text-sm">비밀번호 찾기</a></span>
            <hr />
        </form>
            <div class="form-group">
            	<label>회원가입을 안 하셨나요?</label>
                <a class="userJoinBtn" data-toggle="modal" data-target="#userJoinDiv">회원가입</a>
            </div>
          </div>
        </div>
      </div>

		<!-- 유저회원가입 -->
	  <div id="userJoinDiv" class="modal fade" role="dialog">
        <div class="page-header" align="center">
          <h2>회원가입</h2>
        </div>
        <div class="col-md-3">
          <div class="login-box well">
        	<form action="insertUser.me" method="post">
            <legend>로그인</legend>
            <div class="form-group">
                <label for="username-email">이메일 or 아이디</label>
                <input name="email" value='' id="email" placeholder="E-mail" type="text" class="form-control" />
            </div>
            <div class="form-group">
                <label for="password">비밀번호</label>
                <input name="password" id="password" value='' placeholder="Password" type="password" class="form-control" />
            </div>
            <hr />
            <div class="form-group">
                <input type="submit" class="btn btn-default btn-login-submit btn-block m-t-md" />
            </div>
        </form>
            <div class="form-group">
            	<label>판매자 등록은 여기로 </label>
                <a id="sellerJoinBtn" data-toggle="modal" data-target="#sllerJoinDiv">판매자 회원가입</a>
            </div>
          </div>
        </div>
      </div>
	<!-- seller -->
	  <div id="sllerJoinDiv" class="modal fade" role="dialog">
        <div class="page-header" align="center">
          <h2>판매자 가입</h2>
        </div>
        <div class="col-md-3">
          <div class="login-box well">
        	<form action="insertSeller.me" method="post">
            <legend>로그인</legend>
            <div class="form-group">
                <label for="email">이메일 </label>
                <input name="email" value='' id="email" placeholder="E-mail" type="text" class="form-control" />
            </div>
            <div class="form-group">
                <label for="password">비밀번호</label>
                <input name="password" id="password" value='' placeholder="Password" type="password" class="form-control" />
            </div>
            <hr />
            <div class="form-group">
                <input type="submit" class="btn btn-default btn-login-submit btn-block m-t-md" />
            </div>
        </form>
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
  			var mId = $("#msgBtn").val(); 
  	    	window.open('receiveMessageView?mId='+mId, 'Hello', 'width=480px, height=580px, top=80px, left=400px');
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
			$("#emailLoginDiv").show();
			$("#emailLoginDiv").css({
				"top": (($(window).height()-$("#emailLoginDiv").outerHeight())/1.5+$(window).scrollTop())+"px",
				"left": (($(window).width()-$("#emailLoginDiv").outerWidth())/2+$(window).scrollLeft())+"px"
			});
			$("body").css("overflow","hidden");
		
		});
		  	  
		$(".userJoinBtn").click(function(event){
			$("#emailLoginDiv").hide();
			 $(".modal-backdrop").hide(); 
			$("#userJoinDiv").show();
			$("#userJoinDiv").css({
				"top": (($(window).height()-$("#userJoinDiv").outerHeight())/1.5+$(window).scrollTop())+"px",
				"left": (($(window).width()-$("#userJoinDiv").outerWidth())/2+$(window).scrollLeft())+"px"
			});
			$("body").css("overflow","hidden");
		
		});
		  	
		$("#sellerJoinBtn").click(function(){
			$("#userJoinDiv").hide();
			$(".modal-backdrop").hide();
			$("#sllerJoinDiv").show();
			$("#sllerJoinDiv").css({
				"top": (($(window).height()-$("#sllerJoinDiv").outerHeight())/1.5+$(window).scrollTop())+"px",
				"left": (($(window).width()-$("#sllerJoinDiv").outerWidth())/2+$(window).scrollLeft())+"px"
			});
		         
			$("body").css("overflow","hidden"); 
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
		
		//메세지 알림 이미지
		$(function(){
			$("#newMsg").hide();
			$("#noMsg").hide();
			var mId = $("#msgBtn").val(); 
			
			$.ajax({
				url:"checkNewMessage",
				type:"post",
				data:{mId:mId},
				success:function(data){
					console.log(data);
					if(data.newMessage == 'Y'){
						$("#newMsg").show();
						$("#noMsg").hide();
					}else{
						$("#newMsg").hide();
						$("#noMsg").show();
					}
				},
				errror:function(){
					console.log("에러");	
				}
			});
		});
		
	
	</script>
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