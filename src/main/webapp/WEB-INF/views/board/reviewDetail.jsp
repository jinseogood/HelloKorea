<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link href="${ contextPath }/resources/css/jquery-ui.css" rel="stylesheet" type="text/css">

<meta charset="UTF-8">
<title>Hello Korea</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
  <link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>



<style>
img.ui-datepicker-trigger {
	width: 20px;
	margin-left: 5px;
	vertical-align: middle;
	cursor: pointer;
}

.web-font {
	font-family: 'Jua', sans-serif;
	font-size: 18px;
	margin-right: 5px;
}

input {
	box-sizing: border-box;
}

#fromDate, #toDate {
	width: 100px;
}

.ui-datepicker-header {
	background: rgb(241, 196, 15);
}

.ui-datepicker-calendar {
	font-family: 'Jua', sans-serif;
}

#monthpicker {
	width: 15%;
}

textarea {
	width: 100%;
}

#review_title {
	width: 100%;
	padding: 8px 5px;
	margin: 8px 0px;
	box-sizing: border-box;
}

.rate-base-layer {
	color: #aaa;
}

.rate-hover-layer {
	color: orange;
}

.rate2 {
	font-size: 35px;
}

.rate2 .rate-hover-layer {
	/* color: pink; */
	color: #aaa;
}

.rate2 .rate-select-layer {
	/* color: red; */
	color: orange;
}
body{ margin:50px 0px; }
        .thumbnail{ padding:0px; }
        .stageParent{ background:#fff; border:3px dashed #444; border-radius:5px; padding:10px; }
        .stage{ min-height:220px; max-height:400px; overflow-y:auto; }
</style>
</head>
<body>

   <jsp:include page="../common/menubar.jsp"/>
   
   <section class="container tm-home-section-1" id="more" style = "width:100%; padding:100px">
   <c:set var = "b" value = "${ b }" scope = "request"/>
      <div class="row">
         
      </div> 

      <div class="tm-section-header section-margin-top" >
					<div class="col-lg-4 col-md-3 col-sm-3"><hr></div>
					<div class="col-lg-4 col-md-6 col-sm-6"><h2 class="tm-section-title">REVIEW DETAIL</h2></div>
					<div class="col-lg-4 col-md-3 col-sm-3"><hr></div>	
	  </div>	
      <div id="google-map" style = "text-align:center; width:100%; height:300px">
      

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
            <div class="col-lg-9 col-md-9 col-sm-6 col-xs-12 line_l" style = "height:auto; text-align:left">	
            	<br>
            	<h1 style = "padding-bottom:10px;">${ b.title }</h1>
            	<div class="summary" style = "padding-top:10px; font-size:18px">
					${ b.text }
            	</div>
            	<br>
            	
            	<div style = "padding-top:1px" >
            		<div class="fa" style = "width:100%">
            			<span class="ReviewUpDate" style = "padding-top:5px">
							리뷰 게시 날짜 : ${ b.modify_date }
            			</span>
            			&nbsp;
            			<span>|</span>
            			&nbsp;
            			<span class="ReviewUpDate" style = "padding-top:5px">
            				<i class="fa fa-thumbs-o-up" style = "font-size:14px; padding-top:5px">&nbsp;${ b.likey }</i>
            				<i class="fa fa-flag" style = "font-size:14px; padding-top:5px; float:right; cursor:pointer"><a onclick="reportWrite()"> 신고하기</a></i>
            			</span>	
            		</div>
            		<div class = "tripDate">
            			<br>
            			<span style = "font-weight:bold">숙박시기:</span>와우우우년와우우월
            		</div>
            	</div>
            	
            </div>
            
         </div>
         <!-- 여기사진넣고 그아래에 댓글 넣을거임 -->
         <div>
         	
         </div>
        	
        	</div> 
          	
   </section>
   
   <!-- white bg -->
   <section class="tm-white-bg section-padding-bottom">
     
   </section>
   <jsp:include page="../common/footer.jsp"/>

<script>
	/* function test(){
		location.href="starTest.bo";
	} */
</script>
</body>
</html>