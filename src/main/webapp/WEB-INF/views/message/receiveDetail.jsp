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
                                    
                                    <li class="active">
                                        <a data-toggle="tab" onclick="receiveMsg()">
                                            <i class="fa fa-envelope-o"></i>
                                                                                                 받은 메세지
                                        </a>
                                    </li>
                                    <li class="">
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
<div align="right"><a onclick="report()"><i class="fa fa-flag"> 신고하기 </i></a></div>
<div class="form-group">
							<input type="text" id="title" class="form-control" placeholder="${m.title}" readonly/>
						</div>
						<div class="form-group">
							<input type="text" id="nickname" class="form-control" placeholder="${m.nickname}" readonly/>
						</div>
						<div class="form-group">
							<input type="text" id="sendDate" class="form-control" placeholder="${m.sendDate}" readonly/>
						</div>
						<div class="form-group">
							<textarea id="content" class="form-control" rows="6" placeholder="${m.content}" readonly></textarea>
						</div>
						<div class="form-group" align="center">
						    <form action="sendView" method="post">
						    <input type="hidden" id="mId" name="mId" value="${m.receiveId}">
						    <button class="btn btn-success" onclick="receiveMsg()">&nbsp;&nbsp;목록&nbsp;&nbsp;</button>
							&nbsp;&nbsp;&nbsp;&nbsp;
							
							<input type="hidden" id="receiveId" name="receiveId" value="${m.sendId}">
							<input type="hidden" id="nickname" name="nickname" value="${m.nickname}">
							<button class="btn btn-info" onclick="send()">&nbsp;&nbsp;답장&nbsp;&nbsp;</button>
							
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="hidden" id="msgId" value="${m.msgId}">
							<button class="btn btn-flat" onclick="deleteMsg()">&nbsp;&nbsp;삭제&nbsp;&nbsp;</button>
							</form> 
						</div> 


</div>


 </div>

	<script>
      function receiveMsg(){
    	 var mId = $("#mId").val();
    	 console.log(mId);
         location.href="receiveMessageView?mId="+mId;
      }
      function sendMsg(){
         location.href="sendMessageView";
      }
      function sendQuestion(){
         location.href="sendQuestionView";
      }
     /*  function send(){
    	 var receiveId = $("#sendId").val();
    	 var nickname = $("#nickname").val();
         location.href="sendView?receiveId="+receiveId+"&nickname="+nickname;
      } */
      function report(){
         confirm('정말 신고하시겠습니까?');
      }
      function deleteMsg(){
    	  if (confirm('정말 삭제하시겠습니까?')) {
    		  var mId = $("#mId").val();
    		  var msgId = $("#msgId").val();
    		  location.href="deleteMessage?msgId="+msgId+"&mId="+mId;
    		}
      }
  </script>
</body>
</html>