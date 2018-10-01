<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	.mainDiv{
		margin-left:auto;
		margin-right:auto;
		background:yellow;
	}
	#profileDiv{
		margin-left:auto;
		margin-right:auto;
		background:blue;
		width:500px;
	}
	#profileTable tr{
		height:40px;
		border-top:1px solid lightgray;
		border-bottom:1px solid lightgray;
	}
	#profileTable th{
		width:200px;
		text-align:center;
	}
	#photoDiv{
	margin-left:auto;
	margin-right:auto;
	background:red;	
	width:128px;
	height:128px;
	}
	

</style>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<div class="mainDiv">
		<jsp:include page="../common/userMenubar.jsp"/>
		
		<div id="profileDiv">
			<div id="photoDiv">
				<img src="${contextPath}/resources/img/user.png" id="myPhoto">
			</div>
			<form action="editProfile.me" method="post">
				<table id="profileTable">
					<input type="hidden" value="${sessionScope.loginUser.mId}"name="mId">
					
					<tr>
						<th>Email</th>
						<td><input type="email" readonly=""  value="${sessionScope.loginUser.email }"></td>
					</tr>	
					<tr>
						<th>Nickname</th>
						<td><input type="text" name="nickname"></td>
					</tr>	
					<tr>
						<th>National</th>
						<td><input type="text" name="national"></td>
					</tr>
					<tr>
						<th>Interest</th>
						<td><input type="text" name="interest"></td>
					</tr>	
					<tr>
						<th>profile photo</th>
						<td><input type="file" name="photo"></td>
					</tr>	
				</table>	
				<div align="center">
					<button>완료</button>
				</div>		
			</form>		
		</div>		
	</div>
</body>
</html>