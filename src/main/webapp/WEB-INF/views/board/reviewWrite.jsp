<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	textarea{
		resize:none;
		width:100%;
	}
	input[type=text] {
   	 	 width: 100%;
   		 padding: 8px 5px;
   		 margin: 8px 0px;
  	 	 box-sizing: border-box;
	}
</style>
<meta charset="UTF-8">
<title>Hello Korea</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<style>
  
</style>
</head>
<body>

   <jsp:include page="../common/menubar.jsp"/>
   
   
   <section class="container tm-home-section-1" id="more" style = "width:80%; padding:100px">
      <div class="row">
         
      </div> 

      <div class="tm-section-header section-margin-top" >
					<div class="col-lg-4 col-md-3 col-sm-3"><hr></div>
					<div class="col-lg-4 col-md-6 col-sm-6"><h2 class="tm-section-title">R E V I E W</h2></div>
					<div class="col-lg-4 col-md-3 col-sm-3"><hr></div>	
	  </div>	
      <div id="google-map" style = "text-align:center; width:100%; height:1000px">
         	<div class="col-lg-6" style = "align:center">
              	 <img src="${ contextPath }/resources/img/about-1.jpg" alt="image" style = "width:350px; height:270px" />
            </div>
         	<div class="col-lg-6" style = "display:table; padding-bottom:50px">
         		<div style = "vertical-align:middle; display:table-cell; height:270px">
         			<span><h1>바이스로이 발리</h1></span>
         			<br>
         			<div style = "padding-top:50px">
         				<span>Jln. Lanyahan, Br. Nagi, Ubud 80571, Indonesia</span>
         			</div>
         		</div>
        	</div>
        	
        	<div class="col-lg-12 col-md-12 col-sm-12"><hr>
           	 	<div style = "text-align:left; padding-bottom:20px; height:500px">
        			<span style = "margin-top:20px"><h3>이 시설에 대한 평가</h3></span>
        			<br>
        			<span class="StarBar">
            		<i class="fa fa-star" style = "font-size:30px"></i>
            		<i class="fa fa-star" style = "font-size:30px"></i>
            		<i class="fa fa-star" style = "font-size:30px"></i>
            		<i class="fa fa-star" style = "font-size:30px"></i>
            		<i class="fa fa-star" style = "font-size:30px"></i>
            		</span>
            		<br>
            		<br>
            		<br>
            		<div>
            		<span>리뷰제목</span><br>
            			<input type="text" placeholder="방문 목적이나 인상 깊었던 점에 대해 언급하세요." width = "80%">
            		</div>
            		<br>
            		<br>
            		<br>
            		<div>
            		<span>리뷰내용</span><br>
            			<textarea placeholder="객실 위치, 편의시설등에 대한 고객님의 경험을 공유하세요." rows="10" cols="50"></textarea>
            		</div>
            		<br>
            		<br>
            		<br>
            		<div>
            		<span>여행시기는 언제였나요?</span><br><br>
            			<i class="fa fa-calendar" style = "font-size:50px"></i>
            		</div>
        		</div>
        	</div>
        	
        	
      </div>
        	<div class="col-lg-12 col-md-12 col-sm-12"><hr>
        		<span>공유하실 추억은 무엇인가요? (선택사항)</span><br><br>
            	<button type="button" class="btn btn-secondary">사진첨부</button>
        	</div>
        	<div class="col-lg-12 col-md-12 col-sm-12"><hr>
        		<button type="button" class="btn btn-secondary">확인</button>
        		<button type="button" class="btn btn-secondary">취소</button>
        	</div>
   </section>
   
   <!-- white bg -->
   <section class="tm-white-bg section-padding-bottom">
     
   </section>
   
   <jsp:include page="../common/footer.jsp"/>

</body>
</html>