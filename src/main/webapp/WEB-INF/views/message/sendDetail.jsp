<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<title>Message</title>
<style>


.msgTable{
   width:80%;
   margin-left:auto;
   margin-right:auto;
   font-size:11px;
}
th, td {
    text-align:center;
}
.pagination-sm>li>a, .pagination-sm>li>span{
    font-size:9px;
}
.header{
    font-size:12px;
    padding:3%;
}
 .outline{
    width:90%;
    margin-top:5%;
    margin-bottom:5%;
    margin-left:auto;
    margin-right:auto;
    border:1px solid lightgray;
    border-style:dotted;
    border-radius: 10px;
} 

.title{
    width:100%;
    height:45px;
    background-color:#00aef0;
    color:white;
}
</style>
</head>
<body>
<div class="title">
<h2>&nbsp;&nbsp;&nbsp;Message</h2>
</div>
<div class="outline">
<div class="header">

<header class="panel-heading tab-bg-dark-navy-blue">
                                <ul class="nav nav-tabs">
                                    
                                    <li class="">
                                        <a data-toggle="tab" onclick="receiveMsg()">
                                            <i class="fa fa-envelope-o"></i>
                                                                                                 받은 메세지
                                        </a>
                                    </li>
                                    <li class="active">
                                        <a data-toggle="tab" onclick="sendMsg()">
                                            <i class="fa fa-envelope-o"></i>
                                                                                                 보낸 메세지
                                        </a>
                                    </li>
                                    <li class="">
                                        <a data-toggle="tab" onclick="sendQuestion()">
                                            <i class="fa fa-user"></i>
                                                                                                  문의하기
                                        </a>
                                    </li>
                                </ul>
                            </header>


</div>
<br>
<div class="msgTable">
<div class="form-group">
							<input type="text" id="contact_subject" class="form-control" placeholder="${m.title}" readonly/>
						</div>
						<div class="form-group">
							<input type="text" id="contact_subject" class="form-control" placeholder="${m.nickname}" readonly/>
						</div>
						<div class="form-group">
							<input type="text" id="contact_subject" class="form-control" placeholder="${m.sendDate}" readonly/>
						</div>
						<div class="form-group">
							<textarea id="contact_message" class="form-control" rows="6" placeholder="${m.content}" readonly></textarea>
						</div>
						<div class="form-group" align="center">
						    <input type="hidden" id="mId" value="${m.sendId}">
						    <button class="btn btn-success" onclick="sendMsg()">&nbsp;목록&nbsp;</button>
						</div> 
</div>
<br>

 </div>
                                    
      <script>
          function sendMsg(){
        	 var mId = $("#mId").val();
             location.href="sendMessageView?mId="+mId;
          }
          function recieveMsg(){
        	 var mId = $("#mId").val();
             location.href="recieveMessageView?mId="+mId;
          }
          function sendQuestion(){
         	 var mId = $("#mId").val();
              location.href="sendQuestionView?mId="+mId;
           }
       </script>
</body>
</html>