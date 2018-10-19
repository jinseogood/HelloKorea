<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
	body {
    background-color: #e9ebee;
}

.card {
    margin-top: 1em;
  
}

/* IMG displaying */
.person-card {
    margin-top: 5em;
    padding-top: 5em; 
 
}

.person-card .card-title{
    text-align: center;
}
.person-card .person-img{
    width: 10em;
    position: absolute;
    top: 12em;
    left: 50%;
    margin-left: -5em;
    border-radius: 100%;
    overflow: hidden;
    background-color: white;
}
.container{
	width:1400px !important;
	margin-left: 0px  !important;
	padding-left:0px  !important;
	
}
#insertDiv{
	margin-left:auto;
	margin-right:auto;
	width:500px;
	height:400px;
	margin-top:3em;
}


</style>
<body>
	<div class="container">
	<jsp:include page="../common/menubar.jsp"/>
    <!-- Sign up form -->
    <jsp:include page="../common/userMenubar.jsp"/>
   
    <form action="editProfile.um" method="post" encType="multipart/form-data" id="">
        <!-- Sign up card -->
        <div class="card person-card">
     	
            <div class="card-body">
                <!-- Sex image -->
               <c:if test="${a eq null }">  
                <img id="img_sex" class="person-img"
                    src="https://visualpharm.com/assets/217/Life%20Cycle-595b40b75ba036ed117d9ef0.svg">
                </c:if>
                <c:if test="${a ne null }">
                 <img id="img_sex" class="person-img"
                    src="${contextPath}/resources/uploadFiles/member/${changeName}">
               	</c:if>
                <!-- First row (on medium screen) -->
            </div>
        </div>
        <div id="insertDiv">
        <label align="center">개인정보를 수정 하실 수 있습니다 !</label>
        <input type="hidden" value="${sessionScope.loginUser.mId}"name="mId">
        	<div class="form-group">
                 <label for="email" class="col-form-label">Email</label>
                 <input type="email" class="form-control" id="email" placeholder="example@gmail.com" required>
            </div>
            <div class="form-group">
                  <label for="tel" class="col-form-label">Phone number</label>
                  <input type="text" class="form-control" id="tel" placeholder="+33 6 99 99 99 99" required>
             </div>
       		 <div class="form-group">
                  <label for="tel" class="col-form-label">Phone number</label>
                  <input type="text" class="form-control" id="tel" placeholder="+33 6 99 99 99 99" required>
             </div>
             <div class="form-group">
                  <label for="tel" class="col-form-label">Phone number</label>
                  <input type="text" class="form-control" id="tel" placeholder="+33 6 99 99 99 99" required>
             </div>
             <div class="form-group">
                  <label for="tel" class="col-form-label">Phone number</label>
                  <input type="text" class="form-control" id="tel" placeholder="+33 6 99 99 99 99" required>
             </div>
        </div>
        <div style="margin-top: 1em;">
            <button type="button" class="btn btn-primary btn-lg btn-block">Sign up !</button>
        </div>
        </form>
</div>
	
</body>
</html>