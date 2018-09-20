<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	input{
		border-radius:5px;
	}
	#comSearchTable{
		width:330px;
		height:380px;
		border:1px solid lightgray;
	}
</style>
</head>
<body>
	<div class="content">
		<table id="comSearchTable" border="1">
			<tr height="30px">
				<td colspan="2">
					<select style="width:155px; height:30px;">
						<option>지역</option>
						<option>서울</option>
						<option>대전</option>
						<option>대구</option>
						<option>부산</option>
					</select>
					<select style="width:155px; height:30px;">
						<option>숙박유형</option>
						<option>호텔</option>
						<option>한옥</option>
						<option>베네키아</option>
					</select>
				</td>
			</tr>
			<tr height="30px">
				<td><input type="text" name="comName" size="34"></td>
				<td><button>검색</button></td>
			</tr>
			<tr>
				<td colspan="2" height="300px"></td>
			</tr>
		</table>
	</div>
</body>
</html>