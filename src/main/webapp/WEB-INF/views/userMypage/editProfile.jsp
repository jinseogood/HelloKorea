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
	}
	#profileDiv{
		margin-left:auto;
		margin-right:auto;
	}
	#profileTable{
		margin-left:auto;
		margin-right:auto;
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

</style>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<div class="mainDiv">
		<jsp:include page="../common/userMenubar.jsp"/>
		
		<div id="profileDiv">
			<div img=""></div>
			<form>
				<table id="profileTable">
					<tr>
						<th>Email</th>
						<td><input type="email" readonly=""  value="${sessionScope.loginUser.email }"></td>
					</tr>	
					<tr>
						<th>Nickname</th>
						<td><input type="text" placeholder="${sessionScope.loginUser.nickname }"></td>
					</tr>	
					<tr>
						<th>National</th>
						<td><input type="text" placeholder="${sessionScope.loginUser.national }"></td>
					</tr>
					<tr>
						<th>Interest</th>
						<td><input type="text" placeholder="${sessionScope.loginUser.interest }"></td>
					</tr>	
					<tr>
						<th>profile photo</th>
						<td><input type="file"></td>
					</tr>	
				</table>			
			</form>		
		</div>		
	</div>
</body>
</html>