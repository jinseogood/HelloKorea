<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
 #mainDiv{
 
 	width:500px;
 	height:350px;
 	margin-left:auto;
 	margin-right:auto;
 	background:#FAFAFA;
 }

input[type='text']{
	width:300px;
	height:50px;
}
 #insertTable{
 	margin-left:auto;
 	margin-right:auto;
 	margin-top:30px;
 }
 #topDiv{
 margin-top:40px;
 	margin-left:auto;
 	margin-right:auto;
 }
button {
	width: 300px;
	height: 50px;
	margin-top: 10px;
	border: none;
	}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<h4 align="center">You can get more information by entering additional information!</h4>
	<div id="mainDiv">
		<form action="addUser.me" method="post">
			<table id="insertTable">
				<tr>
					<th>NickName</th>
				</tr>
				<tr>
					<td><input type="text" name="nickname"></td>
				</tr>
				<tr>
				
					<th>National</th>
				</tr>
				<tr>
					<td><input type="text" name="national"></td>
				</tr>
				<tr>
					<th>Interest</th>
				</tr>
				<tr>
					<td><input type="text" name="interest"></td>
				</tr>
			</table>
				<div align="center">
					<button>JOIN</button>
				</div>
		</form>
	</div>

</body>
</html>